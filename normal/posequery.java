import java.sql.*;

public class posequery {

    //sql connector information
    private static String driver ="com.microsoft.sqlserver.jdbc.SQLServerDriver" ;
    private static String server
            ="jdbc:mysql://localhost/EECS341_cxt240_Project1;password=;";
    private static Connection con=null;

    private static String currentquery;

    /**
     * attempts to coneect to the server with a query
     * outputs either the error message or the mysql output
     */
    public static void connect(){
        System.out.println(currentquery);
        try{
            DriverManager.registerDriver((new com.mysql.jdbc.Driver()));
            System.out.println("Driver done");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/EECS341_cxt240_Project1","root","");
            System.out.println("Connection set");
            Statement instruction = con.createStatement();
            //Execute query
            System.out.println("Executing");
            ResultSet resultat = instruction.executeQuery(currentquery);

            ResultSetMetaData answer = resultat.getMetaData();
            int columns = answer.getColumnCount();
            //Output the first columns of returned records through a while loop.
            while(resultat.next()){

                for(int i = 1; i <= columns; i++) {

                    System.out.print(resultat.getString(i) + " ");
                }
                System.out.print("\n");
            }//end loop
            con.close();
        }
        catch(Exception e){
            System.out.println(e.toString());
        }
        finally{}
    }

    /**
     * main statement of the posequery class
     * @param args argument in the form of query number and the field in a single string
     */
    public static void main(String args[]){

        execute("3");
     //   execute(args[0]);

    }

    /**
     * filters the queries into static (2, 4, 5) or dynamic (1, 3) queries
     * @param argument the query number to be executed and variable input if it's a dynamic query
     */
    public static void execute (String argument) {

        int number = Character.getNumericValue(argument.charAt(0));
        if(number == 2 || number == 4 || number == 5) {

            staticQuery(number);
        }
        else {

            String field = new String(" ");
            try{
                field = argument.substring(2);
            }
            catch(Exception e) {}
            dynamicQuery(number, field);
        }

    }

    /**
     * static query call, just checks the number
     * @param number query number 2, 4, or 5, which should be executed
     */
    public static void staticQuery(int number) {

        System.out.println("Static");
        if(number == 2) {

            currentquery = "SELECT P.pname FROM PRODUCTS P WHERE P.price = (SELECT MIN(P1.price) FROM PRODUCTS P1 WHERE P.city = P1.city)";
            connect();
        }
        else if(number == 4) {

            currentquery = "SELECT C.cname FROM CUSTOMERS C WHERE C.cid NOT IN (SELECT C1.cid FROM ORDERS O, PRODUCTS P, CUSTOMERS C1 WHERE O.pid = P.pid AND O.cid = C1.cid AND P.price < 1000000)";
            connect();
        }
        else if (number == 5) {

            currentquery = "SELECT P.pname FROM PRODUCTS P WHERE NOT EXISTS ( SELECT * FROM AGENTS A, CUSTOMERS C WHERE NOT EXISTS ( SELECT * FROM ORDERS O WHERE P.pid = O.pid AND O.aid = A.aid AND O.cid = C.cid))";
            connect();
        }
    }

    /**
     * dynamic query to be executed
     * @param number query numbers 1 or 3
     * @param replacement field to replace the default field with
     */
    public static void dynamicQuery(int number, String replacement) {

        String field = new String();
        System.out.println(replacement + "hell");
        if(number == 1) {

            if(!replacement.equals(" ")) {

                System.out.println("here");
                field = replacement;
            }
            else {
                System.out.println("there");
                field = "Jenny Doe";
            }

            currentquery = "SELECT P.pname FROM PRODUCTS P, ORDERS O, AGENTS A WHERE P.pid=O.pid AND O.aid = A.aid AND A.aname = \"" + field + "\"2";
            connect();
        }
        else if(number == 3) {

            if(!replacement.equals(" ")) {

                field = replacement;
            }
            else {
                field = "2015";
            }

            currentquery = "SELECT DISTINCT O.month, P.pname FROM ORDERS O, PRODUCTS P WHERE O.pid = P.pid AND O.YEAR = " + field + " AND P.price = ( SELECT MAX(P1.price) FROM ORDERS O1, PRODUCTS P1 WHERE O1.pid = P1.pid AND O1.month = O.month)";
            connect();
        }
    }
}
