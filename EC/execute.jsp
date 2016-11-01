<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
	<head> <title>EECS 341 Project 1 EC</title></head>
	
<body>
	
	<jsp:scriptlet><![CDATA[

	    String query = request.getParameter("call1");;
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/EECS341_cxt240_Project1","root","");
            Statement instruction = con.createStatement();

            ResultSet resultat = instruction.executeQuery(query);

            ResultSetMetaData answer = resultat.getMetaData();
            int columns = answer.getColumnCount();
            StringBuilder result = new StringBuilder();

            while(resultat.next()){

                for(int i = 1; i <= columns; i++) {

                   result.append(resultat.getString(i) + " ");
                }
                result.append("\n");
            }
            con.close();
            String output = result.toString();
	    out.println(output);

	]]></jsp:scriptlet>
</body>
</html>

