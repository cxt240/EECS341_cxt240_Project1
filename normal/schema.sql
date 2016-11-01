-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: EECS341_cxt240_Project1
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AGENTS`
--

DROP TABLE IF EXISTS `AGENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AGENTS` (
  `aid` int(11) NOT NULL,
  `aname` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `percent` float DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AGENTS`
--

LOCK TABLES `AGENTS` WRITE;
/*!40000 ALTER TABLE `AGENTS` DISABLE KEYS */;
INSERT INTO `AGENTS` VALUES (1,'Jenny Doe','Houston',0.03),(2,'Kavan','Pittsburg',0.1),(3,'Jerray','Austin',0.05),(4,'Sharon','Baltimore',0.01);
/*!40000 ALTER TABLE `AGENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMERS`
--

DROP TABLE IF EXISTS `CUSTOMERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMERS` (
  `cid` int(11) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `discnt` float DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMERS`
--

LOCK TABLES `CUSTOMERS` WRITE;
/*!40000 ALTER TABLE `CUSTOMERS` DISABLE KEYS */;
INSERT INTO `CUSTOMERS` VALUES (1,'Chris','Westlake',0),(2,'Bob','Chicago',0.05),(3,'Charlie','Cincinnati',0.1),(4,'Lisa','New York',1);
/*!40000 ALTER TABLE `CUSTOMERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERS`
--

DROP TABLE IF EXISTS `ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDERS` (
  `ordno` int(11) NOT NULL,
  `year` decimal(4,0) DEFAULT NULL,
  `month` decimal(2,0) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `dollars` float DEFAULT NULL,
  PRIMARY KEY (`ordno`),
  KEY `cid` (`cid`),
  KEY `aid` (`aid`),
  KEY `pid` (`pid`),
  CONSTRAINT `ORDERS_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `CUSTOMERS` (`cid`),
  CONSTRAINT `ORDERS_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `AGENTS` (`aid`),
  CONSTRAINT `ORDERS_ibfk_3` FOREIGN KEY (`pid`) REFERENCES `PRODUCTS` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERS`
--

LOCK TABLES `ORDERS` WRITE;
/*!40000 ALTER TABLE `ORDERS` DISABLE KEYS */;
INSERT INTO `ORDERS` VALUES (1,2015,1,1,1,9,5,3),(2,2015,2,1,2,9,4,5),(3,2015,3,1,3,9,2,6),(4,2015,4,1,4,9,4,5),(5,2015,5,2,1,9,14,200),(6,2015,6,2,2,9,7,23),(7,2015,7,2,3,9,1,12),(8,2015,8,2,4,9,4,13),(9,2015,9,3,1,9,6,9),(10,2015,10,3,2,9,13,59),(11,2015,11,3,3,9,23,68),(12,2015,12,3,4,9,29,56),(13,2015,7,4,1,9,14,289),(14,2010,1,4,2,9,13,278),(15,2009,6,4,3,9,12,478),(16,2004,8,4,4,9,12,400),(17,2011,7,1,3,4,15,200),(18,2009,3,3,2,5,16,39),(19,2012,4,4,3,2,2,12),(20,2006,3,1,1,1,2,24),(21,2009,5,3,1,4,3,72);
/*!40000 ALTER TABLE `ORDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTS`
--

DROP TABLE IF EXISTS `PRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTS` (
  `pid` int(11) NOT NULL,
  `pname` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTS`
--

LOCK TABLES `PRODUCTS` WRITE;
/*!40000 ALTER TABLE `PRODUCTS` DISABLE KEYS */;
INSERT INTO `PRODUCTS` VALUES (0,'Red','Tokyo',5500,20.5),(1,'Blue','Nagasaki',5500,20.5),(2,'Crystal','Beijing',10500,25.87),(3,'Saphire','Moscow',15000,30.75),(4,'Black','Kyoto',25000,39.99),(5,'Black 2','Hiroshima',35000,42.99),(6,'Alpha Saphire','Chiba',50000,45.65),(7,'Pokemon Go','Los Angeles',1000000,5),(8,'Sun','Tokyo',500,15.25),(9,'Uranium','Chiba',20,31415900);
/*!40000 ALTER TABLE `PRODUCTS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-30 23:11:55
