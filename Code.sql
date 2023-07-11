CREATE DATABASE  IF NOT EXISTS `dfussympatia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dfussympatia`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dfussympatia
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `cityID` int NOT NULL,
  `CityName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Ashkelon'),(2,'Tel Aviv'),(3,'Jerusalem'),(4,'Haifa'),(5,'Bat Yam'),(6,'Beit Sheaan'),(7,'Netanya'),(8,'Eilat'),(9,'Raanana'),(10,'Ashdod'),(11,'Herzliya'),(12,'Beersheba');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL,
  `CustomerType` int NOT NULL,
  `CustomerName` varchar(20) NOT NULL,
  `LongTimeCustomer` tinyint(1) DEFAULT NULL,
  `CityID` int DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  `Email` varchar(35) DEFAULT NULL,
  `postalCode` varchar(10) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `HouseNumber` int DEFAULT NULL,
  `Phone` varchar(25) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `CustomerTypeFK` (`CustomerType`),
  KEY `CitiesFK_idx` (`CityID`),
  CONSTRAINT `CitiesFK` FOREIGN KEY (`CityID`) REFERENCES `cities` (`cityID`),
  CONSTRAINT `CustomerTypeFK` FOREIGN KEY (`CustomerType`) REFERENCES `customertype` (`CustTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,1,'Cafe cafe',0,3,'Israel','cafecafe@coffee.com','7046247','Yafo Street',9,'43324243'),(2,1,'Makif h',1,1,'Israel','makif.h@gmail.com','7446221','Palmahim Street',11,'77987654'),(3,2,'Moshe Fabrikant',0,1,'Israel','lilmoses@gmail.com','7446221','Kineret Street',14,'545557591'),(4,1,'Tel Aviv Company',0,2,'Israel','telavivcompany@gmail.com','6100001','Dizengoff Street',45,'984931592'),(5,2,'Roni Cohen',1,4,'Israel','ronico@gmail.com','3100003','Herzl Street',12,'259250216'),(6,1,'Jerusalem Industries',1,5,'Israel','jindustries@yahoo.com','9100015','King David Street',8,'242941401'),(7,2,'Avi Levy',0,6,'Israel','avi.levy@hotmail.com','6200036','Ben Yehuda Street',52,'262461166'),(8,1,'Yossi & Sons',1,7,'Israel','yossiandsons@gmail.com','4220514','Hertzel Street',21,'634578792'),(9,2,'Michal Cohen',0,7,'Israel','michalc@outlook.com','9371036','Jaffa Road',77,'297252407'),(10,1,'David & Co.',1,1,'Israel','davidandco@gmail.com','3100002','HaNeviim Street',5,'214335624'),(11,2,'Lea Green',1,11,'Israel','lea.green@gmail.com','6249638','Rothschild Boulevard',15,'857237954'),(12,1,'Gefen Technologies',0,10,'Israel','gefentech@hotmail.com','3100101','Gefen Street',7,'432156426'),(13,2,'Ori Levy',0,9,'Israel','orilevy@gmail.com','6210102','Ibn Gabirol Street',29,'136757467'),(14,1,'Gals Store',1,7,'Israel','galstore@gmail.com','4229914','Ahad Haam Street',12,'574949384'),(15,2,'Eli Cohen',1,6,'Israel','eli.cohen@yahoo.com','9348321','HaRav Kook Street',3,'685049568'),(16,1,'Levinsky Printing',0,3,'Israel','levinskyprint@gmail.com','3100103','Levinsky Street',41,'053243757'),(17,2,'Maya Levy',0,4,'Israel','mayalevy@hotmail.com','6230204','Shenkin Street',7,'785000006'),(18,1,'Shmueli & Co.',1,9,'Israel','shmueliandco@yahoo.com','4210012','Herzl Street',37,'555875855'),(19,2,'Yael Cohen',1,7,'Israel','yaelcohen@gmail.com','9358412','HaNeviim Street',18,'686959686'),(20,1,'Paz Hardware',0,8,'Israel','pazhardware@hotmail.com','3100000','HaGefen Street',3,'555444645'),(21,2,'Daniel Levi',0,2,'Israel','daniellevi@yahoo.com','6240000','Rabin Square',2,'887656543'),(22,2,'Eitan Baruch',0,10,'Israel','eitanb@gmail.com','4223103','HaMaayan Street',12,'647484848'),(23,2,'Lea Bitton',0,7,'Israel','leab@gmail.com','8420102','HaShalom Street',6,'468468645'),(24,1,'Yossi the Plumber',0,3,'Israel','yossitheplumber@hotmail.com','7758784','HaKfir Street',25,'636454778'),(25,2,'Nira Aharoni',1,6,'Israel','niraaharoni@yahoo.com','7543365','HaTikva Street',8,'346738482'),(26,1,'Avi Cohen Builders',1,4,'Israel','avicohenbuilders@gmail.com','4536221','HaZayit Street',17,'648286589'),(27,2,'Maya Levy',0,1,'Israel','mayalevy@hotmail.com','8800011','HaYam Street',3,'878793578');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customertype`
--

DROP TABLE IF EXISTS `customertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customertype` (
  `CustTypeID` int NOT NULL,
  `Descrption` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customertype`
--

LOCK TABLES `customertype` WRITE;
/*!40000 ALTER TABLE `customertype` DISABLE KEYS */;
INSERT INTO `customertype` VALUES (1,'Business'),(2,'Independent'),(3,'Municipality');
/*!40000 ALTER TABLE `customertype` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DepartmentID` int NOT NULL,
  `DepName` varchar(20) DEFAULT NULL,
  `shortDescrpt` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Graphics','Graphics and design'),(2,'Printing','All the print work'),(3,'Office','Office work'),(4,'Production','Assembling the output'),(5,'Signs','Signs and billboards ');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL,
  `SubOrdinateID` int DEFAULT NULL,
  `TZ` int DEFAULT NULL,
  `FirstName` varchar(15) NOT NULL,
  `LastName` varchar(15) NOT NULL,
  `GENDER` varchar(2) DEFAULT NULL,
  `DepID` int NOT NULL,
  `ReportsTo` int DEFAULT NULL,
  `Experience` int DEFAULT NULL,
  `RoleID` int DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `LeavageDate` date DEFAULT NULL,
  `CityID` int DEFAULT NULL,
  `Email` varchar(35) DEFAULT NULL,
  `postalCode` varchar(10) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `HouseNumber` int DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY ` FK_employees_reports_to_idx` (`ReportsTo`),
  KEY `employees_ibfk_2` (`RoleID`),
  KEY `employees_ibfk_1` (`DepID`),
  KEY `CityFkID_idx` (`CityID`),
  CONSTRAINT `CityFkID` FOREIGN KEY (`CityID`) REFERENCES `cities` (`cityID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DepID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`),
  CONSTRAINT `FK_employees_reports_to` FOREIGN KEY (`ReportsTo`) REFERENCES `employees` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,NULL,214567534,'Meir','Alster','M',3,NULL,30,1,'1993-01-01',NULL,1,'meir.alster@gmail.com','78965','Halchama',4,'934456841'),(2,NULL,215672119,'Doron','Miran','M',4,1,20,2,'1995-02-02',NULL,5,'mran55@gmail.com','32456','Calanit',3,'823456789'),(3,NULL,346790286,'Ben','Haim','M',4,2,10,3,'1998-03-03',NULL,6,'haimtheking@outlook.com','12345','Bar Kochvah',6,'712456737'),(4,NULL,477908453,'Chang','Lui','M',2,5,3,3,'2020-08-08','2022-08-08',9,'luichung@yahoo.com','72345','kong fu',17,'601456685'),(5,NULL,609026620,'Dan','Cohen','M',2,1,12,2,'1999-07-07',NULL,7,'cohenben@gmail.com','12457','levi',9,'490456633'),(6,NULL,740144787,'Yael','Cohen','W',3,1,8,2,'2000-07-07',NULL,2,'mrscohen@gmail.com','12457','levi',9,'379456581'),(7,NULL,169807060,'Rivka','Rivki','W',3,6,7,3,'2001-09-09','2023-01-01',11,'rivki@gmail.com','62385','levi',10,'268456529'),(8,NULL,189807860,'Noa','Naim','W',1,1,6,2,'2015-01-10',NULL,10,'naimli@walla.com','82395','Sinai',12,'157456477'),(9,523,269547060,'Yuri','Blahovich','M',5,10,15,3,'2022-09-20','2022-09-30',1,'iamyuri@gmail.com','77745','Baklazan',1,'467456425'),(10,NULL,369802560,'Vlad','Jadekovich','M',5,1,10,2,'2021-12-12','2022-12-12',3,'vladik@gmail.com','99655','Smarandi',121,'545557591');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderprocess`
--

DROP TABLE IF EXISTS `orderprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderprocess` (
  `ID` int NOT NULL,
  `OrderID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  `ServiceID` int NOT NULL,
  `descrpt` varchar(40) DEFAULT NULL,
  `ServiceAmount` double NOT NULL,
  `SellingPrice` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `EmpFK_idx` (`EmployeeID`),
  KEY `OrderFk_idx` (`OrderID`),
  KEY `ServiceFK_idx` (`ServiceID`),
  CONSTRAINT `EmpFK` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `OrderFk` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `ServiceFK` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderprocess`
--

LOCK TABLES `orderprocess` WRITE;
/*!40000 ALTER TABLE `orderprocess` DISABLE KEYS */;
INSERT INTO `orderprocess` VALUES (1,12,8,9,'NONE',20,2500),(2,12,8,2,'NONE',20,2200),(3,16,5,1,'NONE',50,2000),(4,6,5,6,'NONE',10,200),(5,1,9,11,'NONE',10,2877),(6,1,9,7,'NONE',20,2781),(7,2,10,8,'NONE',20,338),(8,2,8,2,'NONE',200,2462),(9,3,3,1,'NONE',100,1607),(10,3,3,2,'NONE',10,377),(11,4,6,6,'NONE',50,2292),(12,4,4,9,'NONE',50,1470),(13,5,9,4,'NONE',50,2014),(14,5,6,5,'NONE',50,2096),(15,6,4,5,'NONE',10,3179),(16,6,2,4,'NONE',400,543),(17,7,9,9,'NONE',100,2444),(18,7,9,7,'NONE',100,2130),(19,8,9,10,'NONE',100,2047),(20,8,7,7,'NONE',100,515),(21,9,9,11,'Flags for Yossi',100,3490),(22,9,6,5,'Pens',20,3325),(23,10,7,9,'Cups',5,2480),(24,10,10,2,'Invitations',1,693),(25,11,4,7,'NONE',300,444),(26,11,2,3,'NONE',100,1706),(27,12,5,8,'NONE',100,288),(28,12,3,5,'NONE',150,2203),(29,13,2,4,'Flags for Yossi',1000,274),(30,13,10,7,'Pens',200,3156),(31,14,9,5,'Cups',1500,293),(32,14,2,9,'Invitations',10,3694),(33,15,7,5,'NONE',15,3076),(34,16,3,1,'NONE',20,2912),(35,17,7,6,'NONE',30,853),(36,18,2,8,'NONE',40,3591),(37,18,3,8,'Flags for Yossi',50,3634),(38,18,10,8,'Pens',60,2611),(39,19,6,5,'Cups',70,3340),(40,20,5,4,'Invitations',80,3022),(41,22,8,7,'NONE',250,997),(42,22,7,1,'NONE',250,3321),(43,21,10,5,'NONE',250,412),(44,21,3,11,'NONE',250,2131),(45,23,10,10,'Flags for Yossi',250,220),(46,23,8,10,'Pens',250,1224),(47,24,4,6,'Cups',250,2859),(48,24,10,7,'Invitations',250,1131),(49,25,2,11,'NONE',250,298),(50,26,10,2,'NONE',600,1420),(51,27,5,6,'NONE',500,208),(52,27,3,11,'NONE',180,839),(53,28,4,6,'Flags for Yossi',200,314),(54,28,5,6,'Pens',100,563),(55,28,6,6,'Cups',105,3545),(56,29,6,1,'Invitations',110,3689),(57,30,9,4,'NONE',115,3787),(58,30,10,6,'NONE',120,743),(59,30,4,11,'NONE',125,1575),(60,31,4,7,'NONE',130,427),(61,32,2,7,'Flags for Yossi',135,3670),(62,32,3,6,'Pens',140,3774),(63,32,2,11,'Cups',145,2977),(64,33,6,7,'Invitations',150,1017),(65,33,9,6,'NONE',155,499),(66,34,4,7,'NONE',160,2183),(67,34,8,3,'NONE',165,1876),(68,35,2,4,'NONE',170,1073),(69,35,10,8,'Flags for Yossi',175,3927),(70,36,3,4,'Pens',180,2040),(71,36,8,7,'Cups',185,1845),(72,37,10,5,'Invitations',190,3545),(73,37,7,4,'NONE',195,1257),(74,38,5,1,'NONE',200,1683),(75,38,6,9,'NONE',205,1246),(76,39,8,1,'NONE',210,1837),(77,39,8,9,'Flags for Yossi',215,769),(78,40,10,3,'Pens',220,2141),(79,40,4,11,'Cups',225,1234),(80,41,8,1,'Invitations',230,1471),(81,42,8,9,'NONE',235,3730),(82,42,3,10,'NONE',240,485),(83,43,3,5,'NONE',245,3968),(84,43,3,1,'NONE',250,1683),(85,43,9,4,'Flags for Yossi',255,3508),(86,44,5,3,'Pens',260,2306),(87,44,10,1,'Cups',265,1706),(88,45,5,4,'Invitations',270,1132),(89,45,10,8,'NONE',275,3472),(90,46,4,3,'NONE',40,723),(91,47,10,2,'NONE',45,2024),(92,47,9,10,'NONE',50,2282),(93,48,7,11,'Flags for Yossi',55,3691),(94,48,5,11,'Pens',60,2208),(95,49,4,3,'Cups',65,1310),(96,49,4,10,'Invitations',70,3025),(97,50,9,9,'NONE',75,3140),(98,51,7,2,'NONE',80,1627),(99,52,2,5,'NONE',85,2643),(100,52,6,1,'NONE',90,2781),(101,52,7,3,'Flags for Yossi',95,1024),(102,53,7,2,'Pens',100,3133),(103,53,9,7,'Cups',105,2759),(104,54,2,6,'Invitations',110,1859),(105,54,6,1,'NONE',115,2260),(106,55,5,2,'NONE',120,862),(107,55,4,10,'NONE',125,2207),(108,56,6,6,'NONE',130,1098),(109,56,3,5,'Flags for Yossi',135,2816),(110,57,4,6,'Pens',140,733),(111,57,9,11,'Cups',145,3086),(112,58,6,1,'Invitations',150,1521),(113,58,5,5,'NONE',155,3068),(114,59,4,5,'NONE',160,1892),(115,59,6,4,'NONE',165,2650),(116,60,8,9,'NONE',170,568),(117,60,3,7,'Flags for Yossi',175,3939),(118,61,5,11,'Pens',180,285),(119,61,3,10,'Cups',185,3694),(120,62,4,4,'Invitations',190,2111),(121,62,7,4,'NONE',195,3145),(122,63,4,8,'NONE',200,1082),(123,63,7,10,'NONE',205,1839),(124,64,5,3,'NONE',210,763),(125,64,10,6,'Flags for Yossi',215,960),(126,65,6,8,'Pens',220,3356),(127,65,3,10,'Cups',225,2062),(128,66,2,8,'Invitations',230,2965),(129,66,8,4,'NONE',235,1501),(130,67,2,10,'NONE',240,3239),(131,67,2,10,'NONE',245,936),(132,68,10,6,'NONE',250,2766),(133,68,4,8,'Flags for Yossi',255,608),(134,69,6,9,'Pens',260,756),(135,69,6,8,'Cups',265,3528),(136,70,8,8,'Invitations',270,654),(137,70,8,4,'NONE',275,1630),(138,71,8,4,'NONE',280,2715),(139,71,4,11,'NONE',285,2385),(140,72,2,10,'NONE',290,1976),(141,72,3,4,'Flags for Yossi',295,2159),(142,73,8,8,'Pens',300,368),(143,73,3,6,'Cups',305,1955),(144,74,3,4,'Invitations',310,3218),(145,74,7,5,'NONE',315,405),(146,75,7,11,'NONE',320,3473),(147,75,4,8,'NONE',325,938),(148,76,5,3,'NONE',330,538),(149,76,7,6,'Flags for Yossi',335,2090),(150,77,9,10,'Pens',340,3424),(151,77,10,5,'Cups',345,3248),(152,78,7,4,'Invitations',350,1831),(153,78,9,3,'NONE',75,1963),(154,79,9,9,'NONE',85,1813),(155,79,10,11,'NONE',95,3856),(156,80,2,2,'NONE',105,1197),(157,81,6,6,'Flags for Yossi',115,228),(158,82,9,9,'Pens',125,1014),(159,82,8,4,'Cups',135,2166),(160,82,10,10,'Invitations',145,477),(161,83,5,7,'NONE',155,2374),(162,83,5,5,'NONE',165,3229),(163,84,9,6,'NONE',175,471),(164,84,5,3,'NONE',185,959),(165,85,8,2,'Flags for Yossi',195,3029),(166,85,6,4,'Pens',205,254),(167,86,2,4,'Cups',215,1364),(168,86,5,10,'Invitations',225,2439),(169,87,5,10,'NONE',235,1895),(170,87,7,5,'NONE',245,1561),(171,88,10,5,'NONE',255,3825),(172,88,5,2,'NONE',265,2941),(173,89,2,4,'Flags for Yossi',275,2476),(174,89,7,11,'Pens',285,466),(175,90,5,9,'Cups',295,2385),(176,90,10,8,'Invitations',305,3648),(177,90,9,5,'NONE',315,1882),(178,91,3,8,'NONE',325,1992),(179,92,7,2,'NONE',335,618),(180,92,3,3,'NONE',345,1396),(181,93,4,8,'Flags for Yossi',355,2366),(182,93,7,1,'Pens',365,2748),(183,94,10,10,'Cups',375,3413),(184,94,5,7,'Invitations',385,3916),(185,95,5,6,'NONE',395,2079),(186,95,8,9,'NONE',405,1929),(187,96,6,3,'NONE',415,1110),(188,96,4,10,'NONE',425,3152),(189,97,8,9,'Flags for Yossi',435,3224),(190,97,9,10,'Pens',445,1831),(191,98,9,3,'Cups',455,2269),(192,98,7,1,'Invitations',465,1296),(193,99,3,3,'NONE',475,2368),(194,99,8,9,'NONE',485,1065),(195,100,9,10,'NONE',495,1550),(196,100,4,9,'NONE',505,3025),(197,101,5,11,'Flags for Yossi',515,566),(198,101,6,6,'Pens',525,3272),(199,102,10,9,'Cups',535,2790),(200,102,6,7,'Invitations',545,1396),(201,103,2,5,'NONE',555,1155),(202,103,6,11,'NONE',565,3166),(203,104,6,10,'NONE',575,1668),(204,104,3,4,'NONE',585,2146),(205,104,5,3,'Flags for Yossi',595,3680),(206,105,8,11,'Pens',605,1686),(207,105,7,3,'Cups',615,3982),(208,106,6,1,'Invitations',625,2568),(209,106,10,10,'NONE',635,799),(210,108,7,2,'NONE',645,209),(211,107,7,5,'NONE',655,2545),(212,107,8,9,'NONE',665,1575),(213,109,8,9,'Flags for Yossi',675,2221),(214,110,10,3,'Pens',685,3454),(215,110,6,10,'Cups',695,378),(216,110,9,8,'Invitations',705,3894);
/*!40000 ALTER TABLE `orderprocess` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orderprocess_AFTER_INSERT` AFTER INSERT ON `orderprocess` FOR EACH ROW BEGIN
	CALL OrderProccessStockProcedure(NEW.ServiceAmount, NEW.ID, NEW.ServiceID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;


--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `EmployeeID` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `DeliveredDate` date DEFAULT NULL,
  `ShipperID` int DEFAULT NULL,
  `ShipPostalCode` varchar(15) DEFAULT NULL,
  `ShipCityID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CFK_idx` (`CustomerID`),
  KEY `EFk_idx` (`EmployeeID`),
  KEY `SFK_idx` (`ShipperID`),
  KEY `CitFK_idx` (`ShipCityID`),
  CONSTRAINT `CitiesFKey` FOREIGN KEY (`ShipCityID`) REFERENCES `cities` (`cityID`),
  CONSTRAINT `CustomFork` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `EmployeeFke` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `ShipperFoK` FOREIGN KEY (`ShipperID`) REFERENCES `shippers` (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,22,9,'2022-02-27','2022-04-22','2022-05-03',3,'62219',11),(2,24,7,'2022-04-10','2022-04-27','2022-05-06',5,'62675',9),(3,9,10,'2022-04-03','2022-04-27','2022-05-11',2,'79893',11),(4,2,6,'2022-03-08','2022-04-23','2022-05-17',3,'65620',8),(5,23,6,'2022-03-13','2022-04-27','2022-05-04',3,'73596',4),(6,23,5,'2022-03-01','2022-04-26','2022-05-25',5,'46054',3),(7,4,3,'2022-03-31','2022-05-01','2022-05-15',4,'96228',7),(8,23,9,'2022-03-01','2022-04-26','2022-05-24',3,'40903',12),(9,13,9,'2022-04-03','2022-04-27','2022-05-23',4,'18152',6),(10,1,6,'2022-03-10','2022-04-29','2022-05-21',5,'18341',1),(11,4,3,'2022-03-10','2022-04-20','2022-05-15',2,'62045',12),(12,9,4,'2022-03-03','2022-04-29','2022-05-23',3,'85731',6),(13,11,9,'2022-03-08','2022-04-29','2022-05-06',5,'95313',11),(14,18,3,'2022-03-15','2022-04-20','2022-05-17',5,'17512',11),(15,11,8,'2022-03-14','2022-04-27','2022-05-25',4,'59579',11),(16,21,2,'2022-03-01','2022-04-22','2022-05-10',2,'20095',5),(17,23,6,'2022-03-14','2022-04-29','2022-05-03',5,'83416',4),(18,27,9,'2022-04-03','2022-04-30','2022-05-22',5,'22361',1),(19,11,9,'2022-03-19','2022-04-29','2022-05-07',2,'52841',4),(20,12,7,'2022-04-02','2022-04-23','2022-05-13',4,'76628',3),(21,2,5,'2022-03-21','2022-04-25','2022-05-04',4,'55649',4),(22,9,9,'2022-04-08','2022-04-28','2022-05-20',5,'35679',2),(23,1,2,'2022-04-05','2022-04-24','2022-05-09',5,'33356',8),(24,22,3,'2022-03-05','2022-04-21','2022-05-14',2,'88228',9),(25,14,3,'2022-03-23','2022-04-24','2022-05-15',4,'57122',6),(26,21,6,'2022-03-27','2022-04-26','2022-05-27',2,'63560',9),(27,26,10,'2022-03-20','2022-04-26','2022-05-08',2,'85424',7),(28,8,2,'2022-04-02','2022-04-23','2022-05-03',1,'96837',8),(29,6,7,'2022-04-01','2022-04-20','2022-05-10',5,'99360',5),(30,17,2,'2022-03-20','2022-04-30','2022-05-02',4,'20564',1),(31,9,8,'2022-03-29','2022-04-24','2022-05-11',1,'38177',4),(32,3,10,'2022-03-26','2022-04-23','2022-05-29',5,'38870',10),(33,21,4,'2022-03-05','2022-04-28','2022-05-27',4,'16891',10),(34,3,7,'2022-03-11','2022-04-22','2022-05-07',2,'87166',11),(35,20,4,'2022-03-13','2022-04-30','2022-05-26',1,'97561',10),(36,18,6,'2022-03-27','2022-04-30','2022-05-26',4,'56873',7),(37,26,5,'2022-03-02','2022-04-26','2022-05-25',5,'30579',8),(38,3,5,'2022-03-01','2022-04-25','2022-05-27',5,'74981',9),(39,4,8,'2022-04-10','2022-04-29','2022-05-12',3,'49221',1),(40,22,6,'2022-03-31','2022-04-29','2022-05-22',1,'23813',3),(41,6,3,'2022-04-03','2022-04-29','2022-05-13',5,'17369',6),(42,21,4,'2022-03-23','2022-04-30','2022-05-06',4,'19076',2),(43,17,10,'2022-03-14','2022-04-23','2022-05-06',1,'32398',8),(44,19,4,'2022-03-30','2022-04-27','2022-05-25',2,'87466',10),(45,27,6,'2022-03-26','2022-04-21','2022-05-18',1,'43489',2),(46,8,8,'2022-03-15','2022-04-20','2022-05-17',2,'36154',6),(47,9,6,'2022-03-25','2022-05-01','2022-05-08',2,'71674',1),(48,21,2,'2022-03-22','2022-04-27','2022-05-18',5,'30165',7),(49,15,7,'2022-03-13','2022-04-24','2022-05-27',3,'93167',12),(50,3,9,'2022-03-27','2022-04-21','2022-05-05',1,'66987',10),(51,2,4,'2022-03-10','2022-04-30','2022-05-11',2,'16173',10),(52,12,2,'2022-03-20','2022-04-21','2022-05-24',5,'93833',11),(53,3,3,'2022-03-24','2022-04-25','2022-05-05',4,'41437',9),(54,19,6,'2022-03-16','2022-04-26','2022-05-28',5,'73478',6),(55,4,10,'2022-03-03','2022-04-22','2022-05-04',4,'64676',4),(56,12,6,'2022-03-02','2022-04-28','2022-05-29',4,'46353',3),(57,23,5,'2022-04-09','2022-04-29','2022-05-15',5,'91708',11),(58,8,9,'2022-03-18','2022-04-29','2022-05-06',5,'97645',11),(59,23,2,'2022-04-10','2022-04-24','2022-05-05',1,'47575',9),(60,25,8,'2022-03-03','2022-04-25','2022-05-13',5,'93398',5),(61,11,8,'2022-04-06','2022-04-22','2022-05-17',3,'49895',4),(62,4,3,'2022-04-04','2022-04-20','2022-05-25',2,'13279',8),(63,10,5,'2022-03-20','2022-04-24','2022-05-09',3,'53808',5),(64,21,6,'2022-03-11','2022-04-29','2022-05-04',4,'78544',12),(65,14,10,'2022-04-03','2022-04-27','2022-05-29',3,'50238',12),(66,14,3,'2022-03-21','2022-04-21','2022-05-08',3,'65376',7),(67,17,7,'2022-03-11','2022-04-28','2022-05-14',4,'39871',11),(68,3,7,'2022-04-02','2022-04-23','2022-05-17',4,'17871',11),(69,22,8,'2022-04-09','2022-04-29','2022-05-20',1,'80901',5),(70,2,4,'2022-03-14','2022-04-29','2022-05-25',1,'43398',5),(71,11,10,'2022-03-16','2022-04-28','2022-05-18',3,'40387',2),(72,26,2,'2022-03-27','2022-04-30','2022-05-28',5,'20906',3),(73,11,10,'2022-03-19','2022-04-26','2022-05-09',2,'84447',9),(74,3,5,'2022-04-02','2022-04-26','2022-05-09',2,'14137',4),(75,25,8,'2022-03-12','2022-04-23','2022-05-07',3,'76507',5),(76,9,6,'2022-04-08','2022-04-27','2022-05-23',2,'19348',4),(77,19,7,'2022-03-17','2022-04-28','2022-05-26',4,'33810',5),(78,14,2,'2022-04-09','2022-04-25','2022-05-03',4,'46413',4),(79,9,8,'2022-03-30','2022-04-30','2022-05-21',5,'76807',3),(80,16,7,'2022-04-05','2022-04-24','2022-05-03',4,'51600',11),(81,2,6,'2022-04-01','2022-04-24','2022-05-29',3,'16522',5),(82,13,6,'2022-03-22','2022-04-24','2022-05-12',3,'19039',5),(83,5,2,'2022-03-25','2022-04-23','2022-05-13',3,'43043',3),(84,16,2,'2022-03-22','2022-04-23','2022-05-17',4,'69839',6),(85,25,7,'2022-03-26','2022-04-20','2022-05-26',2,'67721',6),(86,26,4,'2022-04-09','2022-04-26','2022-05-13',1,'21349',4),(87,16,8,'2022-03-07','2022-04-27','2022-05-18',4,'34610',6),(88,21,4,'2022-03-18','2022-04-20','2022-05-23',3,'38997',3),(89,16,5,'2022-03-28','2022-04-26','2022-05-21',1,'46758',7),(90,15,10,'2022-04-07','2022-04-26','2022-05-25',3,'40510',1),(91,7,9,'2022-03-16','2022-04-22','2022-05-09',2,'27526',9),(92,25,9,'2022-03-14','2022-04-25','2022-05-05',3,'24286',4),(93,12,8,'2022-03-13','2022-04-28','2022-05-19',1,'62718',4),(94,1,3,'2022-03-12','2022-04-27','2022-05-29',5,'87554',9),(95,24,2,'2022-03-04','2022-04-21','2022-05-28',3,'27584',7),(96,7,4,'2022-03-16','2022-04-26','2022-05-09',4,'24582',4),(97,8,4,'2022-03-24','2022-04-25','2022-05-22',5,'66926',10),(98,9,10,'2022-04-02','2022-04-27','2022-05-20',4,'19355',8),(99,5,4,'2022-04-03','2022-04-20','2022-05-03',1,'19168',12),(100,11,9,'2022-04-03','2022-04-29','2022-05-09',1,'68823',3),(101,21,10,'2022-03-10','2022-04-23','2022-05-18',3,'96877',2),(102,13,4,'2022-03-07','2022-04-24','2022-05-10',3,'74908',6),(103,16,5,'2022-03-09','2022-04-25','2022-05-28',3,'92986',1),(104,10,6,'2022-03-17','2022-04-23','2022-05-05',2,'65173',3),(105,27,5,'2022-04-04','2022-04-30','2022-05-16',2,'25061',6),(106,22,6,'2022-03-26','2022-04-23','2022-05-23',5,'27629',4),(107,22,2,'2022-03-19','2022-04-30','2022-05-20',4,'70206',3),(108,18,8,'2022-03-09','2022-04-23','2022-05-11',1,'39606',1),(109,4,6,'2022-03-11','2022-04-30','2022-05-12',4,'20946',8),(110,5,10,'2022-03-17','2022-04-25','2022-05-12',3,'26411',9);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductID` int NOT NULL,
  `ProdCatID` int DEFAULT NULL,
  `ProductName` varchar(55) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `QuantityPerUnit` double DEFAULT NULL,
  `PricePerUnit` double NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `ProdCatID` (`ProdCatID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`ProdCatID`) REFERENCES `productscategories` (`CatID`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,2,'Printing Paper - A4',1000,500,5.99),(2,2,'Printing Paper - Letter',1002,500,6.99),(3,2,'Ink Cartridge - Black',1004,1,14.99),(4,2,'Ink Cartridge - Color',1002,1,12.99),(5,1,'Mechanical Pencils - 0.7',1006,12,9.99),(6,1,'Black Pens',1000,12,9.99),(7,2,'Canvas - 16\" x 20\"\"\"\"\"\"\"',1002,1,7.99),(8,2,'Canvas - 18\" x 24\"\"\"\"\"\"\"',1000,1,9.99),(9,2,'Printer Toner - Black',1004,1,79.99),(10,2,'Printer Toner - Color',1006,1,69.99),(11,1,'Sticky Notes - 3\" x 3\"\"\"\"\"\"\"',1006,100,1.99),(12,1,'Sticky Notes - 4\" x 6\"\"\"\"\"\"\"',1004,100,3.99),(13,3,'Colored Pencils',1002,24,14.99),(14,3,'Sketchbooks',1002,100,12.99),(15,3,'Index Cards - 3\" x 5\"\"\"\"\"\"\"',1006,100,2.99),(16,4,'White Envelopes',1004,100,9.99),(17,4,'Silk Paper',1002,1000,99.99),(18,2,'Small Magnets',1004,2000,299.99),(19,2,'Big Magnets',1004,200,149.99),(20,5,'Billboards',1004,10,19999.99),(21,5,'Flag Sheets',1004,400,50),(22,1,'Ink For Ceramics',1000,1,19.99),(23,3,'Cups for printing',1000,10,10);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `products_AFTER_INSERT` AFTER INSERT ON `products` FOR EACH ROW BEGIN 
	INSERT INTO stock (ProductID,UnitsInStock, CurrentTimeDate) 
			VALUES (NEW.ProductID,0, current_date());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productscategories`
--

DROP TABLE IF EXISTS `productscategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productscategories` (
  `CatID` int NOT NULL,
  `CategoryName` varchar(20) DEFAULT NULL,
  `shortDescrpt` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productscategories`
--

LOCK TABLES `productscategories` WRITE;
/*!40000 ALTER TABLE `productscategories` DISABLE KEYS */;
INSERT INTO `productscategories` VALUES (1,'Office','Office products'),(2,'Printing','Printing related stuff'),(3,'Graphics','Graphic design tools '),(4,'Events','Flayers and envelopes'),(5,'Advertise','Ads');
/*!40000 ALTER TABLE `productscategories` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `RoleID` int NOT NULL,
  `RoleName` varchar(20) DEFAULT NULL,
  `shortDescrpt` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Owner','Owner and CEO'),(2,'Manager','Manages a department'),(3,'Worker','Simple worker');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dfussympatia'
--
/*!50003 DROP FUNCTION IF EXISTS `GetTotalFreight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalFreight`(SUPPID INT) RETURNS int
    DETERMINISTIC
BEGIN

DECLARE totalFreight INT;
    SELECT SUM(Freight) INTO totalFreight
    FROM storageorders
    WHERE SUPPID = storageorders.supplierID;
    RETURN totalFreight;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Decrease_Stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Decrease_Stock`(ProductID INT)
BEGIN
	DECLARE TOTAL REAL ;
    SET TOTAL = (SELECT sum(dfussympatia.stock.ChangeOfProdUnits) FROM dfussympatia.stock
    WHERE dfussympatia.stock.ProductID = ProductID);
    
    update dfussympatia.stock SET dfussympatia.stock.UnitsInStock = TOTAL WHERE dfussympatia.stock.ProductID = ProductID;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrderProccessStockProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrderProccessStockProcedure`(quantity INT, order_detail_id INT, ServiceID INT)
BEGIN
    DECLARE X INT;
    DECLARE startRows INT;
    DECLARE current_product INT;
    DECLARE current_amount REAL;
    SET startRows = 0;
    SET X = (SELECT COUNT(*) FROM dfussympatia.servprodhelper WHERE dfussympatia.servprodhelper.serviceID = ServiceID);
    SET SQL_SAFE_UPDATES = 0;
    
    WHILE startRows < X DO
        SET current_product = (SELECT ProductID FROM dfussympatia.servprodhelper WHERE dfussympatia.servprodhelper.serviceID = ServiceID LIMIT startRows, 1);
        SET current_amount = (SELECT DecreaseAmount FROM dfussympatia.servprodhelper WHERE dfussympatia.servprodhelper.serviceID = ServiceID LIMIT startRows, 1);
        INSERT INTO dfussympatia.stock (ProductID, OrderProcID, ChangeOfProdUnits, CurrentTimeDate) 
            VALUES (current_product, order_detail_id,  -1 * quantity * current_amount, CURRENT_DATE());

        CALL dfussympatia.Decrease_Stock(current_product);

        SET startRows = startRows + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_Stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_Stock`(ProductID INT)
BEGIN
	DECLARE TOTAL REAL ;
    
    SET TOTAL = (SELECT sum(dfussympatia.stock.ChangeOfProdUnits) FROM dfussympatia.stock
    WHERE dfussympatia.stock.ProductID = ProductID);
    SET TOTAL = TOTAL + (SELECT dfussympatia.stock.UnitsInStock FROM dfussympatia.stock WHERE dfussympatia.stock.ProductID = ProductID LIMIT 1);
    update dfussympatia.stock SET dfussympatia.stock.UnitsInStock = TOTAL WHERE dfussympatia.stock.ProductID = ProductID;
    
    
END ;;
DELIMITER ;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `servicecategories`
--

DROP TABLE IF EXISTS `servicecategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicecategories` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(20) DEFAULT NULL,
  `shortDescrpt` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicecategories`
--

LOCK TABLES `servicecategories` WRITE;
/*!40000 ALTER TABLE `servicecategories` DISABLE KEYS */;
INSERT INTO `servicecategories` VALUES (1,'Gifts','Gifts with printing'),(2,'Printing','Basic printing'),(3,'Events','Wedding invitations ect'),(4,'Publicizing','Flayers,Signs'),(5,'For the Bussiness','Services for companies');
/*!40000 ALTER TABLE `servicecategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `ServiceID` int NOT NULL,
  `ServCatID` int DEFAULT NULL,
  `ServiceName` varchar(25) DEFAULT NULL,
  `depID` int DEFAULT NULL,
  `PricePerService` double NOT NULL,
  `QuantityPerService` double DEFAULT NULL,
  PRIMARY KEY (`ServiceID`),
  KEY `depID` (`depID`),
  KEY `services_ibfk_2_idx` (`ServCatID`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`depID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `services_ibfk_2` FOREIGN KEY (`ServCatID`) REFERENCES `servicecategories` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,3,'Invitations',1,40,500),(2,4,'Small Magnet Ad',4,399.99,2000),(3,4,'Flyers',2,59.99,500),(4,4,'Flags',1,40,200),(5,4,'Billboard sign',5,5000,1),(6,5,'Cups printing',1,10,5),(7,5,'Pens Printing',3,5,6),(8,1,'Dedication On Book',1,9.99,1),(9,4,'Big Magnet Ad',4,50,10),(10,1,'Printing A4 - Black',1,100,5.99),(11,1,'Printing A4 - Color',1,100,7.99);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servprodhelper`
--

DROP TABLE IF EXISTS `servprodhelper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servprodhelper` (
  `ID` int NOT NULL,
  `serviceID` int NOT NULL,
  `ProductID` int NOT NULL,
  `DecreaseAmount` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `servprodhelper_ibfk_2` (`serviceID`),
  KEY `ProdForke_idx` (`ProductID`),
  CONSTRAINT `ProdForke` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  CONSTRAINT `servprodhelper_ibfk_2` FOREIGN KEY (`serviceID`) REFERENCES `services` (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servprodhelper`
--

LOCK TABLES `servprodhelper` WRITE;
/*!40000 ALTER TABLE `servprodhelper` DISABLE KEYS */;
INSERT INTO `servprodhelper` VALUES (1,1,2,1),(2,1,3,0.25),(3,1,17,5),(4,2,18,1),(5,3,4,0.25),(6,3,17,0.5),(7,4,21,0.5),(8,4,4,0.25),(9,5,20,0.1),(10,6,22,0.125),(11,6,23,0.5),(12,7,6,0.5),(13,7,3,0.1),(15,8,1,0.1),(16,8,3,0.05),(17,8,4,0.05),(18,9,19,0.25),(19,10,1,0.2),(20,10,3,0.4),(21,11,1,0.2),(22,11,4,0.4),(23,10,9,0.5),(24,11,10,0.5);
/*!40000 ALTER TABLE `servprodhelper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippers` (
  `ShipperID` int NOT NULL,
  `CompanyType` int DEFAULT NULL,
  `CompanyName` varchar(25) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`),
  KEY `CompanyType` (`CompanyType`),
  CONSTRAINT `shippers_ibfk_1` FOREIGN KEY (`CompanyType`) REFERENCES `shippingtype` (`ShipTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
INSERT INTO `shippers` VALUES (1,1,'Fedex','867117100'),(2,1,'Cheetah deliveries','778675430'),(3,1,'Wolt','234567890'),(4,1,'Jadek\'s deliveries','528699750'),(5,2,'El - Al','987695950');
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;

UNLOCK TABLES;
--
-- Table structure for table `shippingtype`
--

DROP TABLE IF EXISTS `shippingtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippingtype` (
  `ShipTypeID` int NOT NULL,
  `TypeOfDelivery` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ShipTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippingtype`
--

LOCK TABLES `shippingtype` WRITE;
/*!40000 ALTER TABLE `shippingtype` DISABLE KEYS */;
INSERT INTO `shippingtype` VALUES (1,'Taxi'),(2,'Aerial'),(3,'Self delivery');
/*!40000 ALTER TABLE `shippingtype` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int DEFAULT NULL,
  `StorOrderDetailID` int DEFAULT NULL,
  `ChangeOfProdUnits` double DEFAULT NULL,
  `OrderProcID` int DEFAULT NULL,
  `UnitsInStock` double DEFAULT NULL,
  `CurrentTimeDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ProductForKey_idx` (`ProductID`),
  KEY `StorDetailFk_idx` (`StorOrderDetailID`),
  KEY `oProcessFk_idx` (`OrderProcID`),
  CONSTRAINT `oProcessFk` FOREIGN KEY (`OrderProcID`) REFERENCES `orderprocess` (`ID`),
  CONSTRAINT `ProductForKey` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  CONSTRAINT `StorDetailFk` FOREIGN KEY (`StorOrderDetailID`) REFERENCES `storageorderdetails` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1516 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (900,1,NULL,NULL,NULL,13534.5,'2023-04-14'),(901,2,NULL,NULL,NULL,13105,'2023-04-14'),(902,3,NULL,NULL,NULL,3083,'2023-04-14'),(903,4,NULL,NULL,NULL,5267.5,'2023-04-14'),(904,5,NULL,NULL,NULL,54556,'2023-04-14'),(905,6,NULL,NULL,NULL,4984.5,'2023-04-14'),(906,7,NULL,NULL,NULL,86472,'2023-04-14'),(907,8,NULL,NULL,NULL,58856,'2023-04-14'),(908,9,NULL,NULL,NULL,8931.5,'2023-04-14'),(909,10,NULL,NULL,NULL,15058.5,'2023-04-14'),(910,11,NULL,NULL,NULL,70834,'2023-04-14'),(911,12,NULL,NULL,NULL,32295,'2023-04-14'),(912,13,NULL,NULL,NULL,110778,'2023-04-14'),(913,14,NULL,NULL,NULL,41291,'2023-04-14'),(914,15,NULL,NULL,NULL,36574,'2023-04-14'),(915,16,NULL,NULL,NULL,32029,'2023-04-14'),(916,17,NULL,NULL,NULL,-4571,'2023-04-14'),(917,18,NULL,NULL,NULL,21308,'2023-04-14'),(918,19,NULL,NULL,NULL,9770.25,'2023-04-14'),(919,20,NULL,NULL,NULL,20915.5,'2023-04-14'),(920,21,NULL,NULL,NULL,21340.5,'2023-04-14'),(921,22,NULL,NULL,NULL,15580.625,'2023-04-14'),(922,23,NULL,NULL,NULL,-2177.5,'2023-04-14'),(923,10,1,1,NULL,15058.5,'2023-04-14'),(924,14,2,2,NULL,41291,'2023-04-14'),(925,5,3,4,NULL,54556,'2023-04-14'),(926,9,4,3,NULL,8931.5,'2023-04-14'),(927,10,5,3,NULL,15058.5,'2023-04-14'),(928,22,6,4,NULL,15580.625,'2023-04-14'),(929,17,7,1,NULL,-4571,'2023-04-14'),(930,20,8,4937,NULL,20915.5,'2023-04-14'),(931,21,9,4221,NULL,21340.5,'2023-04-14'),(932,1,10,2720,NULL,13534.5,'2023-04-14'),(933,8,11,3643,NULL,58856,'2023-04-14'),(934,19,12,3784,NULL,9770.25,'2023-04-14'),(935,18,13,2708,NULL,21308,'2023-04-14'),(936,5,14,4114,NULL,54556,'2023-04-14'),(937,13,15,1066,NULL,110778,'2023-04-14'),(938,22,16,134,NULL,15580.625,'2023-04-14'),(939,13,17,3378,NULL,110778,'2023-04-14'),(940,10,18,4530,NULL,15058.5,'2023-04-14'),(941,10,19,107,NULL,15058.5,'2023-04-14'),(942,17,20,4234,NULL,-4571,'2023-04-14'),(943,10,21,548,NULL,15058.5,'2023-04-14'),(944,15,22,3674,NULL,36574,'2023-04-14'),(945,21,23,3735,NULL,21340.5,'2023-04-14'),(946,2,24,3498,NULL,13105,'2023-04-14'),(947,14,25,4827,NULL,41291,'2023-04-14'),(948,18,26,3541,NULL,21308,'2023-04-14'),(949,20,27,2998,NULL,20915.5,'2023-04-14'),(950,22,28,4871,NULL,15580.625,'2023-04-14'),(951,13,29,1293,NULL,110778,'2023-04-14'),(952,16,30,3209,NULL,32029,'2023-04-14'),(953,7,31,2002,NULL,86472,'2023-04-14'),(954,3,32,1380,NULL,3083,'2023-04-14'),(955,11,33,3408,NULL,70834,'2023-04-14'),(956,1,34,1155,NULL,13534.5,'2023-04-14'),(957,6,35,978,NULL,4984.5,'2023-04-14'),(958,22,36,268,NULL,15580.625,'2023-04-14'),(959,4,37,1426,NULL,5267.5,'2023-04-14'),(960,11,38,4125,NULL,70834,'2023-04-14'),(961,16,39,804,NULL,32029,'2023-04-14'),(962,7,40,4811,NULL,86472,'2023-04-14'),(963,17,41,2905,NULL,-4571,'2023-04-14'),(964,9,42,1524,NULL,8931.5,'2023-04-14'),(965,6,43,1837,NULL,4984.5,'2023-04-14'),(966,11,44,2760,NULL,70834,'2023-04-14'),(967,20,45,4207,NULL,20915.5,'2023-04-14'),(968,21,46,3722,NULL,21340.5,'2023-04-14'),(969,7,47,4297,NULL,86472,'2023-04-14'),(970,11,48,3885,NULL,70834,'2023-04-14'),(971,11,49,2478,NULL,70834,'2023-04-14'),(972,10,50,2246,NULL,15058.5,'2023-04-14'),(973,4,51,4934,NULL,5267.5,'2023-04-14'),(974,17,52,2984,NULL,-4571,'2023-04-14'),(975,7,53,1548,NULL,86472,'2023-04-14'),(976,12,54,1584,NULL,32295,'2023-04-14'),(977,12,55,2427,NULL,32295,'2023-04-14'),(978,20,56,2574,NULL,20915.5,'2023-04-14'),(979,5,57,177,NULL,54556,'2023-04-14'),(980,5,58,4549,NULL,54556,'2023-04-14'),(981,22,59,3296,NULL,15580.625,'2023-04-14'),(982,19,60,724,NULL,9770.25,'2023-04-14'),(983,16,61,835,NULL,32029,'2023-04-14'),(984,5,62,1114,NULL,54556,'2023-04-14'),(985,10,63,3242,NULL,15058.5,'2023-04-14'),(986,7,64,1401,NULL,86472,'2023-04-14'),(987,20,65,1103,NULL,20915.5,'2023-04-14'),(988,17,66,236,NULL,-4571,'2023-04-14'),(989,17,67,1079,NULL,-4571,'2023-04-14'),(990,15,68,1452,NULL,36574,'2023-04-14'),(991,11,69,2110,NULL,70834,'2023-04-14'),(992,10,70,238,NULL,15058.5,'2023-04-14'),(993,22,71,3590,NULL,15580.625,'2023-04-14'),(994,6,72,875,NULL,4984.5,'2023-04-14'),(995,9,73,4512,NULL,8931.5,'2023-04-14'),(996,14,74,851,NULL,41291,'2023-04-14'),(997,13,75,3583,NULL,110778,'2023-04-14'),(998,19,76,4370,NULL,9770.25,'2023-04-14'),(999,3,77,4493,NULL,3083,'2023-04-14'),(1000,14,78,2572,NULL,41291,'2023-04-14'),(1001,4,79,2346,NULL,5267.5,'2023-04-14'),(1002,10,80,3088,NULL,15058.5,'2023-04-14'),(1003,14,81,2354,NULL,41291,'2023-04-14'),(1004,8,82,4996,NULL,58856,'2023-04-14'),(1005,13,83,2404,NULL,110778,'2023-04-14'),(1006,12,84,2536,NULL,32295,'2023-04-14'),(1007,8,85,4480,NULL,58856,'2023-04-14'),(1008,13,86,2886,NULL,110778,'2023-04-14'),(1009,8,87,1699,NULL,58856,'2023-04-14'),(1010,1,88,422,NULL,13534.5,'2023-04-14'),(1011,15,89,1054,NULL,36574,'2023-04-14'),(1012,20,90,1456,NULL,20915.5,'2023-04-14'),(1013,18,91,3401,NULL,21308,'2023-04-14'),(1014,1,92,1450,NULL,13534.5,'2023-04-14'),(1015,9,93,1645,NULL,8931.5,'2023-04-14'),(1016,1,94,4398,NULL,13534.5,'2023-04-14'),(1017,18,95,3342,NULL,21308,'2023-04-14'),(1018,13,96,4441,NULL,110778,'2023-04-14'),(1019,21,97,3454,NULL,21340.5,'2023-04-14'),(1020,13,98,2465,NULL,110778,'2023-04-14'),(1021,12,99,3075,NULL,32295,'2023-04-14'),(1022,7,100,4670,NULL,86472,'2023-04-14'),(1023,20,101,888,NULL,20915.5,'2023-04-14'),(1024,19,102,952,NULL,9770.25,'2023-04-14'),(1025,9,103,4780,NULL,8931.5,'2023-04-14'),(1026,12,104,909,NULL,32295,'2023-04-14'),(1027,22,105,3962,NULL,15580.625,'2023-04-14'),(1028,16,106,2804,NULL,32029,'2023-04-14'),(1029,2,107,4192,NULL,13105,'2023-04-14'),(1030,17,108,975,NULL,-4571,'2023-04-14'),(1031,19,109,762,NULL,9770.25,'2023-04-14'),(1032,1,110,933,NULL,13534.5,'2023-04-14'),(1033,20,111,3341,NULL,20915.5,'2023-04-14'),(1034,15,112,2791,NULL,36574,'2023-04-14'),(1035,16,113,4655,NULL,32029,'2023-04-14'),(1036,10,114,3253,NULL,15058.5,'2023-04-14'),(1037,5,115,2726,NULL,54556,'2023-04-14'),(1038,2,116,3030,NULL,13105,'2023-04-14'),(1039,19,117,567,NULL,9770.25,'2023-04-14'),(1040,13,118,1794,NULL,110778,'2023-04-14'),(1041,21,119,3459,NULL,21340.5,'2023-04-14'),(1042,2,120,965,NULL,13105,'2023-04-14'),(1043,8,121,3819,NULL,58856,'2023-04-14'),(1044,17,122,1387,NULL,-4571,'2023-04-14'),(1045,18,123,4270,NULL,21308,'2023-04-14'),(1046,17,124,1768,NULL,-4571,'2023-04-14'),(1047,5,125,1969,NULL,54556,'2023-04-14'),(1048,3,126,1468,NULL,3083,'2023-04-14'),(1049,18,127,1955,NULL,21308,'2023-04-14'),(1050,15,128,3652,NULL,36574,'2023-04-14'),(1051,2,129,4915,NULL,13105,'2023-04-14'),(1052,1,130,746,NULL,13534.5,'2023-04-14'),(1053,4,131,888,NULL,5267.5,'2023-04-14'),(1054,7,132,2372,NULL,86472,'2023-04-14'),(1055,14,133,1316,NULL,41291,'2023-04-14'),(1056,18,134,4812,NULL,21308,'2023-04-14'),(1057,1,135,2491,NULL,13534.5,'2023-04-14'),(1058,6,136,2967,NULL,4984.5,'2023-04-14'),(1059,4,137,594,NULL,5267.5,'2023-04-14'),(1060,21,138,3251,NULL,21340.5,'2023-04-14'),(1061,21,139,2711,NULL,21340.5,'2023-04-14'),(1062,1,140,1959,NULL,13534.5,'2023-04-14'),(1063,19,NULL,-5,1,9770.25,'2023-04-14'),(1064,18,NULL,-20,2,21308,'2023-04-14'),(1065,2,NULL,-50,3,13105,'2023-04-14'),(1066,3,NULL,-12.5,3,3083,'2023-04-14'),(1067,17,NULL,-250,3,-4571,'2023-04-14'),(1068,22,NULL,-1.25,4,15580.625,'2023-04-14'),(1069,23,NULL,-5,4,-2177.5,'2023-04-14'),(1070,1,NULL,-2,5,13534.5,'2023-04-14'),(1071,4,NULL,-4,5,5267.5,'2023-04-14'),(1072,10,NULL,-5,5,15058.5,'2023-04-14'),(1073,6,NULL,-10,6,4984.5,'2023-04-14'),(1074,3,NULL,-2,6,3083,'2023-04-14'),(1075,1,NULL,-2,7,13534.5,'2023-04-14'),(1076,3,NULL,-1,7,3083,'2023-04-14'),(1077,4,NULL,-1,7,5267.5,'2023-04-14'),(1078,18,NULL,-200,8,21308,'2023-04-14'),(1079,2,NULL,-100,9,13105,'2023-04-14'),(1080,3,NULL,-25,9,3083,'2023-04-14'),(1081,17,NULL,-500,9,-4571,'2023-04-14'),(1082,18,NULL,-10,10,21308,'2023-04-14'),(1083,22,NULL,-6.25,11,15580.625,'2023-04-14'),(1084,23,NULL,-25,11,-2177.5,'2023-04-14'),(1085,19,NULL,-12.5,12,9770.25,'2023-04-14'),(1086,21,NULL,-25,13,21340.5,'2023-04-14'),(1087,4,NULL,-12.5,13,5267.5,'2023-04-14'),(1088,20,NULL,-5,14,20915.5,'2023-04-14'),(1089,20,NULL,-1,15,20915.5,'2023-04-14'),(1090,21,NULL,-200,16,21340.5,'2023-04-14'),(1091,4,NULL,-100,16,5267.5,'2023-04-14'),(1092,19,NULL,-25,17,9770.25,'2023-04-14'),(1093,6,NULL,-50,18,4984.5,'2023-04-14'),(1094,3,NULL,-10,18,3083,'2023-04-14'),(1095,1,NULL,-20,19,13534.5,'2023-04-14'),(1096,3,NULL,-40,19,3083,'2023-04-14'),(1097,9,NULL,-50,19,8931.5,'2023-04-14'),(1098,6,NULL,-50,20,4984.5,'2023-04-14'),(1099,3,NULL,-10,20,3083,'2023-04-14'),(1100,1,NULL,-20,21,13534.5,'2023-04-14'),(1101,4,NULL,-40,21,5267.5,'2023-04-14'),(1102,10,NULL,-50,21,15058.5,'2023-04-14'),(1103,20,NULL,-2,22,20915.5,'2023-04-14'),(1104,19,NULL,-1.25,23,9770.25,'2023-04-14'),(1105,18,NULL,-1,24,21308,'2023-04-14'),(1106,6,NULL,-150,25,4984.5,'2023-04-14'),(1107,3,NULL,-30,25,3083,'2023-04-14'),(1108,4,NULL,-25,26,5267.5,'2023-04-14'),(1109,17,NULL,-50,26,-4571,'2023-04-14'),(1110,1,NULL,-10,27,13534.5,'2023-04-14'),(1111,3,NULL,-5,27,3083,'2023-04-14'),(1112,4,NULL,-5,27,5267.5,'2023-04-14'),(1113,20,NULL,-15,28,20915.5,'2023-04-14'),(1114,21,NULL,-500,29,21340.5,'2023-04-14'),(1115,4,NULL,-250,29,5267.5,'2023-04-14'),(1116,6,NULL,-100,30,4984.5,'2023-04-14'),(1117,3,NULL,-20,30,3083,'2023-04-14'),(1118,20,NULL,-150,31,20915.5,'2023-04-14'),(1119,19,NULL,-2.5,32,9770.25,'2023-04-14'),(1120,20,NULL,-1.5,33,20915.5,'2023-04-14'),(1121,2,NULL,-20,34,13105,'2023-04-14'),(1122,3,NULL,-5,34,3083,'2023-04-14'),(1123,17,NULL,-100,34,-4571,'2023-04-14'),(1124,22,NULL,-3.75,35,15580.625,'2023-04-14'),(1125,23,NULL,-15,35,-2177.5,'2023-04-14'),(1126,1,NULL,-4,36,13534.5,'2023-04-14'),(1127,3,NULL,-2,36,3083,'2023-04-14'),(1128,4,NULL,-2,36,5267.5,'2023-04-14'),(1129,1,NULL,-5,37,13534.5,'2023-04-14'),(1130,3,NULL,-2.5,37,3083,'2023-04-14'),(1131,4,NULL,-2.5,37,5267.5,'2023-04-14'),(1132,1,NULL,-6,38,13534.5,'2023-04-14'),(1133,3,NULL,-3,38,3083,'2023-04-14'),(1134,4,NULL,-3,38,5267.5,'2023-04-14'),(1135,20,NULL,-7,39,20915.5,'2023-04-14'),(1136,21,NULL,-40,40,21340.5,'2023-04-14'),(1137,4,NULL,-20,40,5267.5,'2023-04-14'),(1138,6,NULL,-125,41,4984.5,'2023-04-14'),(1139,3,NULL,-25,41,3083,'2023-04-14'),(1140,2,NULL,-250,42,13105,'2023-04-14'),(1141,3,NULL,-62.5,42,3083,'2023-04-14'),(1142,17,NULL,-1250,42,-4571,'2023-04-14'),(1143,20,NULL,-25,43,20915.5,'2023-04-14'),(1144,1,NULL,-50,44,13534.5,'2023-04-14'),(1145,4,NULL,-100,44,5267.5,'2023-04-14'),(1146,10,NULL,-125,44,15058.5,'2023-04-14'),(1147,1,NULL,-50,45,13534.5,'2023-04-14'),(1148,3,NULL,-100,45,3083,'2023-04-14'),(1149,9,NULL,-125,45,8931.5,'2023-04-14'),(1150,1,NULL,-50,46,13534.5,'2023-04-14'),(1151,3,NULL,-100,46,3083,'2023-04-14'),(1152,9,NULL,-125,46,8931.5,'2023-04-14'),(1153,22,NULL,-31.25,47,15580.625,'2023-04-14'),(1154,23,NULL,-125,47,-2177.5,'2023-04-14'),(1155,6,NULL,-125,48,4984.5,'2023-04-14'),(1156,3,NULL,-25,48,3083,'2023-04-14'),(1157,1,NULL,-50,49,13534.5,'2023-04-14'),(1158,4,NULL,-100,49,5267.5,'2023-04-14'),(1159,10,NULL,-125,49,15058.5,'2023-04-14'),(1160,18,NULL,-600,50,21308,'2023-04-14'),(1161,22,NULL,-62.5,51,15580.625,'2023-04-14'),(1162,23,NULL,-250,51,-2177.5,'2023-04-14'),(1163,1,NULL,-36,52,13534.5,'2023-04-14'),(1164,4,NULL,-72,52,5267.5,'2023-04-14'),(1165,10,NULL,-90,52,15058.5,'2023-04-14'),(1166,22,NULL,-25,53,15580.625,'2023-04-14'),(1167,23,NULL,-100,53,-2177.5,'2023-04-14'),(1168,22,NULL,-12.5,54,15580.625,'2023-04-14'),(1169,23,NULL,-50,54,-2177.5,'2023-04-14'),(1170,22,NULL,-13.125,55,15580.625,'2023-04-14'),(1171,23,NULL,-52.5,55,-2177.5,'2023-04-14'),(1172,2,NULL,-110,56,13105,'2023-04-14'),(1173,3,NULL,-27.5,56,3083,'2023-04-14'),(1174,17,NULL,-550,56,-4571,'2023-04-14'),(1175,21,NULL,-57.5,57,21340.5,'2023-04-14'),(1176,4,NULL,-28.75,57,5267.5,'2023-04-14'),(1177,22,NULL,-15,58,15580.625,'2023-04-14'),(1178,23,NULL,-60,58,-2177.5,'2023-04-14'),(1179,1,NULL,-25,59,13534.5,'2023-04-14'),(1180,4,NULL,-50,59,5267.5,'2023-04-14'),(1181,10,NULL,-62.5,59,15058.5,'2023-04-14'),(1182,6,NULL,-65,60,4984.5,'2023-04-14'),(1183,3,NULL,-13,60,3083,'2023-04-14'),(1184,6,NULL,-67.5,61,4984.5,'2023-04-14'),(1185,3,NULL,-13.5,61,3083,'2023-04-14'),(1186,22,NULL,-17.5,62,15580.625,'2023-04-14'),(1187,23,NULL,-70,62,-2177.5,'2023-04-14'),(1188,1,NULL,-29,63,13534.5,'2023-04-14'),(1189,4,NULL,-58,63,5267.5,'2023-04-14'),(1190,10,NULL,-72.5,63,15058.5,'2023-04-14'),(1191,6,NULL,-75,64,4984.5,'2023-04-14'),(1192,3,NULL,-15,64,3083,'2023-04-14'),(1193,22,NULL,-19.375,65,15580.625,'2023-04-14'),(1194,23,NULL,-77.5,65,-2177.5,'2023-04-14'),(1195,6,NULL,-80,66,4984.5,'2023-04-14'),(1196,3,NULL,-16,66,3083,'2023-04-14'),(1197,4,NULL,-41.25,67,5267.5,'2023-04-14'),(1198,17,NULL,-82.5,67,-4571,'2023-04-14'),(1199,21,NULL,-85,68,21340.5,'2023-04-14'),(1200,4,NULL,-42.5,68,5267.5,'2023-04-14'),(1201,1,NULL,-17.5,69,13534.5,'2023-04-14'),(1202,3,NULL,-8.75,69,3083,'2023-04-14'),(1203,4,NULL,-8.75,69,5267.5,'2023-04-14'),(1204,21,NULL,-90,70,21340.5,'2023-04-14'),(1205,4,NULL,-45,70,5267.5,'2023-04-14'),(1206,6,NULL,-92.5,71,4984.5,'2023-04-14'),(1207,3,NULL,-18.5,71,3083,'2023-04-14'),(1208,20,NULL,-19,72,20915.5,'2023-04-14'),(1209,21,NULL,-97.5,73,21340.5,'2023-04-14'),(1210,4,NULL,-48.75,73,5267.5,'2023-04-14'),(1211,2,NULL,-200,74,13105,'2023-04-14'),(1212,3,NULL,-50,74,3083,'2023-04-14'),(1213,17,NULL,-1000,74,-4571,'2023-04-14'),(1214,19,NULL,-51.25,75,9770.25,'2023-04-14'),(1215,2,NULL,-210,76,13105,'2023-04-14'),(1216,3,NULL,-52.5,76,3083,'2023-04-14'),(1217,17,NULL,-1050,76,-4571,'2023-04-14'),(1218,19,NULL,-53.75,77,9770.25,'2023-04-14'),(1219,4,NULL,-55,78,5267.5,'2023-04-14'),(1220,17,NULL,-110,78,-4571,'2023-04-14'),(1221,1,NULL,-45,79,13534.5,'2023-04-14'),(1222,4,NULL,-90,79,5267.5,'2023-04-14'),(1223,10,NULL,-112.5,79,15058.5,'2023-04-14'),(1224,2,NULL,-230,80,13105,'2023-04-14'),(1225,3,NULL,-57.5,80,3083,'2023-04-14'),(1226,17,NULL,-1150,80,-4571,'2023-04-14'),(1227,19,NULL,-58.75,81,9770.25,'2023-04-14'),(1228,1,NULL,-48,82,13534.5,'2023-04-14'),(1229,3,NULL,-96,82,3083,'2023-04-14'),(1230,9,NULL,-120,82,8931.5,'2023-04-14'),(1231,20,NULL,-24.5,83,20915.5,'2023-04-14'),(1232,2,NULL,-250,84,13105,'2023-04-14'),(1233,3,NULL,-62.5,84,3083,'2023-04-14'),(1234,17,NULL,-1250,84,-4571,'2023-04-14'),(1235,21,NULL,-127.5,85,21340.5,'2023-04-14'),(1236,4,NULL,-63.75,85,5267.5,'2023-04-14'),(1237,4,NULL,-65,86,5267.5,'2023-04-14'),(1238,17,NULL,-130,86,-4571,'2023-04-14'),(1239,2,NULL,-265,87,13105,'2023-04-14'),(1240,3,NULL,-66.25,87,3083,'2023-04-14'),(1241,17,NULL,-1325,87,-4571,'2023-04-14'),(1242,21,NULL,-135,88,21340.5,'2023-04-14'),(1243,4,NULL,-67.5,88,5267.5,'2023-04-14'),(1244,1,NULL,-27.5,89,13534.5,'2023-04-14'),(1245,3,NULL,-13.75,89,3083,'2023-04-14'),(1246,4,NULL,-13.75,89,5267.5,'2023-04-14'),(1247,4,NULL,-10,90,5267.5,'2023-04-14'),(1248,17,NULL,-20,90,-4571,'2023-04-14'),(1249,18,NULL,-45,91,21308,'2023-04-14'),(1250,1,NULL,-10,92,13534.5,'2023-04-14'),(1251,3,NULL,-20,92,3083,'2023-04-14'),(1252,9,NULL,-25,92,8931.5,'2023-04-14'),(1253,1,NULL,-11,93,13534.5,'2023-04-14'),(1254,4,NULL,-22,93,5267.5,'2023-04-14'),(1255,10,NULL,-27.5,93,15058.5,'2023-04-14'),(1256,1,NULL,-12,94,13534.5,'2023-04-14'),(1257,4,NULL,-24,94,5267.5,'2023-04-14'),(1258,10,NULL,-30,94,15058.5,'2023-04-14'),(1259,4,NULL,-16.25,95,5267.5,'2023-04-14'),(1260,17,NULL,-32.5,95,-4571,'2023-04-14'),(1261,1,NULL,-14,96,13534.5,'2023-04-14'),(1262,3,NULL,-28,96,3083,'2023-04-14'),(1263,9,NULL,-35,96,8931.5,'2023-04-14'),(1264,19,NULL,-18.75,97,9770.25,'2023-04-14'),(1265,18,NULL,-80,98,21308,'2023-04-14'),(1266,20,NULL,-8.5,99,20915.5,'2023-04-14'),(1267,2,NULL,-90,100,13105,'2023-04-14'),(1268,3,NULL,-22.5,100,3083,'2023-04-14'),(1269,17,NULL,-450,100,-4571,'2023-04-14'),(1270,4,NULL,-23.75,101,5267.5,'2023-04-14'),(1271,17,NULL,-47.5,101,-4571,'2023-04-14'),(1272,18,NULL,-100,102,21308,'2023-04-14'),(1273,6,NULL,-52.5,103,4984.5,'2023-04-14'),(1274,3,NULL,-10.5,103,3083,'2023-04-14'),(1275,22,NULL,-13.75,104,15580.625,'2023-04-14'),(1276,23,NULL,-55,104,-2177.5,'2023-04-14'),(1277,2,NULL,-115,105,13105,'2023-04-14'),(1278,3,NULL,-28.75,105,3083,'2023-04-14'),(1279,17,NULL,-575,105,-4571,'2023-04-14'),(1280,18,NULL,-120,106,21308,'2023-04-14'),(1281,1,NULL,-25,107,13534.5,'2023-04-14'),(1282,3,NULL,-50,107,3083,'2023-04-14'),(1283,9,NULL,-62.5,107,8931.5,'2023-04-14'),(1284,22,NULL,-16.25,108,15580.625,'2023-04-14'),(1285,23,NULL,-65,108,-2177.5,'2023-04-14'),(1286,20,NULL,-13.5,109,20915.5,'2023-04-14'),(1287,22,NULL,-17.5,110,15580.625,'2023-04-14'),(1288,23,NULL,-70,110,-2177.5,'2023-04-14'),(1289,1,NULL,-29,111,13534.5,'2023-04-14'),(1290,4,NULL,-58,111,5267.5,'2023-04-14'),(1291,10,NULL,-72.5,111,15058.5,'2023-04-14'),(1292,2,NULL,-150,112,13105,'2023-04-14'),(1293,3,NULL,-37.5,112,3083,'2023-04-14'),(1294,17,NULL,-750,112,-4571,'2023-04-14'),(1295,20,NULL,-15.5,113,20915.5,'2023-04-14'),(1296,20,NULL,-16,114,20915.5,'2023-04-14'),(1297,21,NULL,-82.5,115,21340.5,'2023-04-14'),(1298,4,NULL,-41.25,115,5267.5,'2023-04-14'),(1299,19,NULL,-42.5,116,9770.25,'2023-04-14'),(1300,6,NULL,-87.5,117,4984.5,'2023-04-14'),(1301,3,NULL,-17.5,117,3083,'2023-04-14'),(1302,1,NULL,-36,118,13534.5,'2023-04-14'),(1303,4,NULL,-72,118,5267.5,'2023-04-14'),(1304,10,NULL,-90,118,15058.5,'2023-04-14'),(1305,1,NULL,-37,119,13534.5,'2023-04-14'),(1306,3,NULL,-74,119,3083,'2023-04-14'),(1307,9,NULL,-92.5,119,8931.5,'2023-04-14'),(1308,21,NULL,-95,120,21340.5,'2023-04-14'),(1309,4,NULL,-47.5,120,5267.5,'2023-04-14'),(1310,21,NULL,-97.5,121,21340.5,'2023-04-14'),(1311,4,NULL,-48.75,121,5267.5,'2023-04-14'),(1312,1,NULL,-20,122,13534.5,'2023-04-14'),(1313,3,NULL,-10,122,3083,'2023-04-14'),(1314,4,NULL,-10,122,5267.5,'2023-04-14'),(1315,1,NULL,-41,123,13534.5,'2023-04-14'),(1316,3,NULL,-82,123,3083,'2023-04-14'),(1317,9,NULL,-102.5,123,8931.5,'2023-04-14'),(1318,4,NULL,-52.5,124,5267.5,'2023-04-14'),(1319,17,NULL,-105,124,-4571,'2023-04-14'),(1320,22,NULL,-26.875,125,15580.625,'2023-04-14'),(1321,23,NULL,-107.5,125,-2177.5,'2023-04-14'),(1322,1,NULL,-22,126,13534.5,'2023-04-14'),(1323,3,NULL,-11,126,3083,'2023-04-14'),(1324,4,NULL,-11,126,5267.5,'2023-04-14'),(1325,1,NULL,-45,127,13534.5,'2023-04-14'),(1326,3,NULL,-90,127,3083,'2023-04-14'),(1327,9,NULL,-112.5,127,8931.5,'2023-04-14'),(1328,1,NULL,-23,128,13534.5,'2023-04-14'),(1329,3,NULL,-11.5,128,3083,'2023-04-14'),(1330,4,NULL,-11.5,128,5267.5,'2023-04-14'),(1331,21,NULL,-117.5,129,21340.5,'2023-04-14'),(1332,4,NULL,-58.75,129,5267.5,'2023-04-14'),(1333,1,NULL,-48,130,13534.5,'2023-04-14'),(1334,3,NULL,-96,130,3083,'2023-04-14'),(1335,9,NULL,-120,130,8931.5,'2023-04-14'),(1336,1,NULL,-49,131,13534.5,'2023-04-14'),(1337,3,NULL,-98,131,3083,'2023-04-14'),(1338,9,NULL,-122.5,131,8931.5,'2023-04-14'),(1339,22,NULL,-31.25,132,15580.625,'2023-04-14'),(1340,23,NULL,-125,132,-2177.5,'2023-04-14'),(1341,1,NULL,-25.5,133,13534.5,'2023-04-14'),(1342,3,NULL,-12.75,133,3083,'2023-04-14'),(1343,4,NULL,-12.75,133,5267.5,'2023-04-14'),(1344,19,NULL,-65,134,9770.25,'2023-04-14'),(1345,1,NULL,-26.5,135,13534.5,'2023-04-14'),(1346,3,NULL,-13.25,135,3083,'2023-04-14'),(1347,4,NULL,-13.25,135,5267.5,'2023-04-14'),(1348,1,NULL,-27,136,13534.5,'2023-04-14'),(1349,3,NULL,-13.5,136,3083,'2023-04-14'),(1350,4,NULL,-13.5,136,5267.5,'2023-04-14'),(1351,21,NULL,-137.5,137,21340.5,'2023-04-14'),(1352,4,NULL,-68.75,137,5267.5,'2023-04-14'),(1353,21,NULL,-140,138,21340.5,'2023-04-14'),(1354,4,NULL,-70,138,5267.5,'2023-04-14'),(1355,1,NULL,-57,139,13534.5,'2023-04-14'),(1356,4,NULL,-114,139,5267.5,'2023-04-14'),(1357,10,NULL,-142.5,139,15058.5,'2023-04-14'),(1358,1,NULL,-58,140,13534.5,'2023-04-14'),(1359,3,NULL,-116,140,3083,'2023-04-14'),(1360,9,NULL,-145,140,8931.5,'2023-04-14'),(1361,21,NULL,-147.5,141,21340.5,'2023-04-14'),(1362,4,NULL,-73.75,141,5267.5,'2023-04-14'),(1363,1,NULL,-30,142,13534.5,'2023-04-14'),(1364,3,NULL,-15,142,3083,'2023-04-14'),(1365,4,NULL,-15,142,5267.5,'2023-04-14'),(1366,22,NULL,-38.125,143,15580.625,'2023-04-14'),(1367,23,NULL,-152.5,143,-2177.5,'2023-04-14'),(1368,21,NULL,-155,144,21340.5,'2023-04-14'),(1369,4,NULL,-77.5,144,5267.5,'2023-04-14'),(1370,20,NULL,-31.5,145,20915.5,'2023-04-14'),(1371,1,NULL,-64,146,13534.5,'2023-04-14'),(1372,4,NULL,-128,146,5267.5,'2023-04-14'),(1373,10,NULL,-160,146,15058.5,'2023-04-14'),(1374,1,NULL,-32.5,147,13534.5,'2023-04-14'),(1375,3,NULL,-16.25,147,3083,'2023-04-14'),(1376,4,NULL,-16.25,147,5267.5,'2023-04-14'),(1377,4,NULL,-82.5,148,5267.5,'2023-04-14'),(1378,17,NULL,-165,148,-4571,'2023-04-14'),(1379,22,NULL,-41.875,149,15580.625,'2023-04-14'),(1380,23,NULL,-167.5,149,-2177.5,'2023-04-14'),(1381,1,NULL,-68,150,13534.5,'2023-04-14'),(1382,3,NULL,-136,150,3083,'2023-04-14'),(1383,9,NULL,-170,150,8931.5,'2023-04-14'),(1384,20,NULL,-34.5,151,20915.5,'2023-04-14'),(1385,21,NULL,-175,152,21340.5,'2023-04-14'),(1386,4,NULL,-87.5,152,5267.5,'2023-04-14'),(1387,4,NULL,-18.75,153,5267.5,'2023-04-14'),(1388,17,NULL,-37.5,153,-4571,'2023-04-14'),(1389,19,NULL,-21.25,154,9770.25,'2023-04-14'),(1390,1,NULL,-19,155,13534.5,'2023-04-14'),(1391,4,NULL,-38,155,5267.5,'2023-04-14'),(1392,10,NULL,-47.5,155,15058.5,'2023-04-14'),(1393,18,NULL,-105,156,21308,'2023-04-14'),(1394,22,NULL,-14.375,157,15580.625,'2023-04-14'),(1395,23,NULL,-57.5,157,-2177.5,'2023-04-14'),(1396,19,NULL,-31.25,158,9770.25,'2023-04-14'),(1397,21,NULL,-67.5,159,21340.5,'2023-04-14'),(1398,4,NULL,-33.75,159,5267.5,'2023-04-14'),(1399,1,NULL,-29,160,13534.5,'2023-04-14'),(1400,3,NULL,-58,160,3083,'2023-04-14'),(1401,9,NULL,-72.5,160,8931.5,'2023-04-14'),(1402,6,NULL,-77.5,161,4984.5,'2023-04-14'),(1403,3,NULL,-15.5,161,3083,'2023-04-14'),(1404,20,NULL,-16.5,162,20915.5,'2023-04-14'),(1405,22,NULL,-21.875,163,15580.625,'2023-04-14'),(1406,23,NULL,-87.5,163,-2177.5,'2023-04-14'),(1407,4,NULL,-46.25,164,5267.5,'2023-04-14'),(1408,17,NULL,-92.5,164,-4571,'2023-04-14'),(1409,18,NULL,-195,165,21308,'2023-04-14'),(1410,21,NULL,-102.5,166,21340.5,'2023-04-14'),(1411,4,NULL,-51.25,166,5267.5,'2023-04-14'),(1412,21,NULL,-107.5,167,21340.5,'2023-04-14'),(1413,4,NULL,-53.75,167,5267.5,'2023-04-14'),(1414,1,NULL,-45,168,13534.5,'2023-04-14'),(1415,3,NULL,-90,168,3083,'2023-04-14'),(1416,9,NULL,-112.5,168,8931.5,'2023-04-14'),(1417,1,NULL,-47,169,13534.5,'2023-04-14'),(1418,3,NULL,-94,169,3083,'2023-04-14'),(1419,9,NULL,-117.5,169,8931.5,'2023-04-14'),(1420,20,NULL,-24.5,170,20915.5,'2023-04-14'),(1421,20,NULL,-25.5,171,20915.5,'2023-04-14'),(1422,18,NULL,-265,172,21308,'2023-04-14'),(1423,21,NULL,-137.5,173,21340.5,'2023-04-14'),(1424,4,NULL,-68.75,173,5267.5,'2023-04-14'),(1425,1,NULL,-57,174,13534.5,'2023-04-14'),(1426,4,NULL,-114,174,5267.5,'2023-04-14'),(1427,10,NULL,-142.5,174,15058.5,'2023-04-14'),(1428,19,NULL,-73.75,175,9770.25,'2023-04-14'),(1429,1,NULL,-30.5,176,13534.5,'2023-04-14'),(1430,3,NULL,-15.25,176,3083,'2023-04-14'),(1431,4,NULL,-15.25,176,5267.5,'2023-04-14'),(1432,20,NULL,-31.5,177,20915.5,'2023-04-14'),(1433,1,NULL,-32.5,178,13534.5,'2023-04-14'),(1434,3,NULL,-16.25,178,3083,'2023-04-14'),(1435,4,NULL,-16.25,178,5267.5,'2023-04-14'),(1436,18,NULL,-335,179,21308,'2023-04-14'),(1437,4,NULL,-86.25,180,5267.5,'2023-04-14'),(1438,17,NULL,-172.5,180,-4571,'2023-04-14'),(1439,1,NULL,-35.5,181,13534.5,'2023-04-14'),(1440,3,NULL,-17.75,181,3083,'2023-04-14'),(1441,4,NULL,-17.75,181,5267.5,'2023-04-14'),(1442,2,NULL,-365,182,13105,'2023-04-14'),(1443,3,NULL,-91.25,182,3083,'2023-04-14'),(1444,17,NULL,-1825,182,-4571,'2023-04-14'),(1445,1,NULL,-75,183,13534.5,'2023-04-14'),(1446,3,NULL,-150,183,3083,'2023-04-14'),(1447,9,NULL,-187.5,183,8931.5,'2023-04-14'),(1448,6,NULL,-192.5,184,4984.5,'2023-04-14'),(1449,3,NULL,-38.5,184,3083,'2023-04-14'),(1450,22,NULL,-49.375,185,15580.625,'2023-04-14'),(1451,23,NULL,-197.5,185,-2177.5,'2023-04-14'),(1452,19,NULL,-101.25,186,9770.25,'2023-04-14'),(1453,4,NULL,-103.75,187,5267.5,'2023-04-14'),(1454,17,NULL,-207.5,187,-4571,'2023-04-14'),(1455,1,NULL,-85,188,13534.5,'2023-04-14'),(1456,3,NULL,-170,188,3083,'2023-04-14'),(1457,9,NULL,-212.5,188,8931.5,'2023-04-14'),(1458,19,NULL,-108.75,189,9770.25,'2023-04-14'),(1459,1,NULL,-89,190,13534.5,'2023-04-14'),(1460,3,NULL,-178,190,3083,'2023-04-14'),(1461,9,NULL,-222.5,190,8931.5,'2023-04-14'),(1462,4,NULL,-113.75,191,5267.5,'2023-04-14'),(1463,17,NULL,-227.5,191,-4571,'2023-04-14'),(1464,2,NULL,-465,192,13105,'2023-04-14'),(1465,3,NULL,-116.25,192,3083,'2023-04-14'),(1466,17,NULL,-2325,192,-4571,'2023-04-14'),(1467,4,NULL,-118.75,193,5267.5,'2023-04-14'),(1468,17,NULL,-237.5,193,-4571,'2023-04-14'),(1469,19,NULL,-121.25,194,9770.25,'2023-04-14'),(1470,1,NULL,-99,195,13534.5,'2023-04-14'),(1471,3,NULL,-198,195,3083,'2023-04-14'),(1472,9,NULL,-247.5,195,8931.5,'2023-04-14'),(1473,19,NULL,-126.25,196,9770.25,'2023-04-14'),(1474,1,NULL,-103,197,13534.5,'2023-04-14'),(1475,4,NULL,-206,197,5267.5,'2023-04-14'),(1476,10,NULL,-257.5,197,15058.5,'2023-04-14'),(1477,22,NULL,-65.625,198,15580.625,'2023-04-14'),(1478,23,NULL,-262.5,198,-2177.5,'2023-04-14'),(1479,19,NULL,-133.75,199,9770.25,'2023-04-14'),(1480,6,NULL,-272.5,200,4984.5,'2023-04-14'),(1481,3,NULL,-54.5,200,3083,'2023-04-14'),(1482,20,NULL,-55.5,201,20915.5,'2023-04-14'),(1483,1,NULL,-113,202,13534.5,'2023-04-14'),(1484,4,NULL,-226,202,5267.5,'2023-04-14'),(1485,10,NULL,-282.5,202,15058.5,'2023-04-14'),(1486,1,NULL,-115,203,13534.5,'2023-04-14'),(1487,3,NULL,-230,203,3083,'2023-04-14'),(1488,9,NULL,-287.5,203,8931.5,'2023-04-14'),(1489,21,NULL,-292.5,204,21340.5,'2023-04-14'),(1490,4,NULL,-146.25,204,5267.5,'2023-04-14'),(1491,4,NULL,-148.75,205,5267.5,'2023-04-14'),(1492,17,NULL,-297.5,205,-4571,'2023-04-14'),(1493,1,NULL,-121,206,13534.5,'2023-04-14'),(1494,4,NULL,-242,206,5267.5,'2023-04-14'),(1495,10,NULL,-302.5,206,15058.5,'2023-04-14'),(1496,4,NULL,-153.75,207,5267.5,'2023-04-14'),(1497,17,NULL,-307.5,207,-4571,'2023-04-14'),(1498,2,NULL,-625,208,13105,'2023-04-14'),(1499,3,NULL,-156.25,208,3083,'2023-04-14'),(1500,17,NULL,-3125,208,-4571,'2023-04-14'),(1501,1,NULL,-127,209,13534.5,'2023-04-14'),(1502,3,NULL,-254,209,3083,'2023-04-14'),(1503,9,NULL,-317.5,209,8931.5,'2023-04-14'),(1504,18,NULL,-645,210,21308,'2023-04-14'),(1505,20,NULL,-65.5,211,20915.5,'2023-04-14'),(1506,19,NULL,-166.25,212,9770.25,'2023-04-14'),(1507,19,NULL,-168.75,213,9770.25,'2023-04-14'),(1508,4,NULL,-171.25,214,5267.5,'2023-04-14'),(1509,17,NULL,-342.5,214,-4571,'2023-04-14'),(1510,1,NULL,-139,215,13534.5,'2023-04-14'),(1511,3,NULL,-278,215,3083,'2023-04-14'),(1512,9,NULL,-347.5,215,8931.5,'2023-04-14'),(1513,1,NULL,-70.5,216,13534.5,'2023-04-14'),(1514,3,NULL,-35.25,216,3083,'2023-04-14'),(1515,4,NULL,-35.25,216,5267.5,'2023-04-14');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `storageorderdetails`
--

DROP TABLE IF EXISTS `storageorderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storageorderdetails` (
  `ID` int NOT NULL,
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `BuyingPrice` double NOT NULL,
  `Quantity` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `storageorderdetails_ibfk_1` (`OrderID`),
  KEY `ProIDFk_idx` (`ProductID`),
  CONSTRAINT `ProIDFk` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  CONSTRAINT `storageorderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `storageorders` (`OrderID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storageorderdetails`
--

LOCK TABLES `storageorderdetails` WRITE;
/*!40000 ALTER TABLE `storageorderdetails` DISABLE KEYS */;
INSERT INTO `storageorderdetails` VALUES (1,2,10,5999.99,1),(2,5,14,12.99,2),(3,1,5,6.99,4),(4,4,9,49.99,3),(5,4,10,29.99,3),(6,3,22,9.99,4),(7,3,17,50,1),(8,6,20,1556,4937),(9,7,21,1720,4221),(10,7,1,315,2720),(11,7,8,770,3643),(12,7,19,418,3784),(13,8,18,788,2708),(14,9,5,1597,4114),(15,9,13,311,1066),(16,9,22,1434,134),(17,10,13,265,3378),(18,10,10,580,4530),(19,11,10,1513,107),(20,12,17,390,4234),(21,13,10,1178,548),(22,14,15,121,3674),(23,14,21,1175,3735),(24,14,2,1950,3498),(25,14,14,1587,4827),(26,15,18,511,3541),(27,15,20,1730,2998),(28,16,22,1904,4871),(29,16,13,881,1293),(30,16,16,660,3209),(31,17,7,749,2002),(32,17,3,1044,1380),(33,18,11,1496,3408),(34,19,1,230,1155),(35,20,6,215,978),(36,21,22,1272,268),(37,22,4,1189,1426),(38,23,11,1866,4125),(39,23,16,287,804),(40,23,7,1595,4811),(41,23,17,468,2905),(42,24,9,1700,1524),(43,24,6,753,1837),(44,24,11,150,2760),(45,25,20,1151,4207),(46,25,21,1576,3722),(47,26,7,1863,4297),(48,27,11,357,3885),(49,27,11,765,2478),(50,27,10,844,2246),(51,28,4,932,4934),(52,29,17,1334,2984),(53,30,7,1360,1548),(54,31,12,748,1584),(55,31,12,1849,2427),(56,32,20,338,2574),(57,32,5,180,177),(58,32,5,1663,4549),(59,32,22,701,3296),(60,33,19,628,724),(61,33,16,1607,835),(62,34,5,1665,1114),(63,35,10,148,3242),(64,36,7,463,1401),(65,37,20,1364,1103),(66,38,17,513,236),(67,39,17,1175,1079),(68,40,15,610,1452),(69,41,11,1720,2110),(70,42,10,1824,238),(71,43,22,1236,3590),(72,44,6,44,875),(73,45,9,1489,4512),(74,46,14,1589,851),(75,47,13,719,3583),(76,48,19,404,4370),(77,49,3,529,4493),(78,50,14,304,2572),(79,51,4,664,2346),(80,52,10,1219,3088),(81,53,14,1864,2354),(82,54,8,102,4996),(83,55,13,1776,2404),(84,56,12,924,2536),(85,57,8,846,4480),(86,58,13,515,2886),(87,59,8,1445,1699),(88,60,1,1389,422),(89,61,15,1719,1054),(90,62,20,706,1456),(91,63,18,957,3401),(92,64,1,274,1450),(93,65,9,1355,1645),(94,66,1,127,4398),(95,67,18,242,3342),(96,68,13,711,4441),(97,69,21,1179,3454),(98,70,13,440,2465),(99,71,12,1408,3075),(100,72,7,261,4670),(101,73,20,741,888),(102,74,19,567,952),(103,75,9,1967,4780),(104,76,12,1584,909),(105,77,22,417,3962),(106,78,16,1792,2804),(107,79,2,774,4192),(108,80,17,1604,975),(109,81,19,1971,762),(110,82,1,1768,933),(111,83,20,462,3341),(112,84,15,1533,2791),(113,85,16,628,4655),(114,85,10,1938,3253),(115,86,5,797,2726),(116,86,2,207,3030),(117,86,19,1191,567),(118,87,13,1893,1794),(119,87,21,1286,3459),(120,88,2,1848,965),(121,89,8,714,3819),(122,89,17,1008,1387),(123,89,18,1274,4270),(124,89,17,1073,1768),(125,90,5,24,1969),(126,90,3,357,1468),(127,91,18,957,1955),(128,91,15,1135,3652),(129,92,2,1599,4915),(130,93,1,308,746),(131,94,4,547,888),(132,95,7,1510,2372),(133,96,14,196,1316),(134,97,18,502,4812),(135,97,1,634,2491),(136,98,6,371,2967),(137,98,4,1191,594),(138,99,21,1227,3251),(139,100,21,686,2711),(140,100,1,1955,1959);
/*!40000 ALTER TABLE `storageorderdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `storageorderdetails_AFTER_INSERT` AFTER INSERT ON `storageorderdetails` FOR EACH ROW BEGIN
		DECLARE prodi int;
        SET prodi = new.ProductID;
        INSERT INTO dfussympatia.stock (ProductID,StorOrderDetailID,ChangeOfProdUnits, CurrentTimeDate) 
			VALUES (prodi,NEW.ID,NEW.Quantity, current_date());
		CALL dfussympatia.Update_Stock(prodi);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `storageorders`
--

DROP TABLE IF EXISTS `storageorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storageorders` (
  `OrderID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `SupplierID` int NOT NULL,
  `Freight` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `storageorders_ibfk_1` (`EmployeeID`),
  KEY `storageorders_ibfk_2` (`SupplierID`),
  CONSTRAINT `storageorders_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `storageorders_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storageorders`
--

LOCK TABLES `storageorders` WRITE;
/*!40000 ALTER TABLE `storageorders` DISABLE KEYS */;
INSERT INTO `storageorders` VALUES (1,8,'2022-04-06','2022-05-22',1000,20),(2,9,'2022-02-18','2022-05-18',1002,35),(3,3,'2022-04-14','2022-05-21',1004,15),(4,4,'2022-04-24','2022-05-24',1002,25),(5,6,'2022-04-22','2022-05-29',1000,10),(6,2,'2022-02-03','2022-05-26',1004,5),(7,7,'2022-02-04','2022-05-23',1000,15),(8,6,'2022-03-05','2022-06-03',1002,30),(9,10,'2022-04-06','2022-05-03',1004,40),(10,6,'2022-03-11','2022-06-09',1000,20),(11,4,'2022-02-06','2022-05-06',1004,25),(12,5,'2022-02-15','2022-05-26',1002,35),(13,8,'2022-02-01','2022-05-08',1000,10),(14,2,'2022-03-03','2022-06-09',1004,15),(15,8,'2022-02-21','2022-05-17',1002,20),(16,3,'2022-04-18','2022-05-12',1000,30),(17,9,'2022-04-03','2022-05-20',1004,40),(18,6,'2022-03-28','2022-05-24',1002,5),(19,9,'2022-03-02','2022-05-06',1000,25),(20,4,'2022-02-11','2022-05-11',1004,35),(21,3,'2022-04-09','2022-05-22',1000,15),(22,5,'2022-03-18','2022-05-07',1004,10),(23,7,'2022-03-12','2022-05-09',1002,20),(24,5,'2022-03-11','2022-06-01',1000,30),(25,3,'2022-03-24','2022-05-31',1004,25),(26,6,'2022-04-11','2022-05-03',1002,15),(27,7,'2022-04-07','2022-05-20',1000,40),(28,7,'2022-03-02','2022-05-23',1004,20),(29,8,'2022-04-08','2022-05-18',1004,8),(30,5,'2022-02-14','2022-06-07',1002,26),(31,6,'2022-05-01','2022-05-30',1000,28),(32,10,'2022-04-22','2022-05-05',1002,29),(33,3,'2022-03-27','2022-05-07',1002,25),(34,2,'2022-04-05','2022-05-04',1002,29),(35,10,'2022-02-07','2022-05-18',1002,30),(36,6,'2022-04-24','2022-06-02',1000,25),(37,8,'2022-04-16','2022-05-17',1000,37),(38,4,'2022-04-21','2022-06-05',1000,30),(39,8,'2022-03-29','2022-05-22',1000,9),(40,8,'2022-04-30','2022-05-29',1000,24),(41,6,'2022-03-18','2022-05-23',1000,36),(42,8,'2022-03-11','2022-06-05',1000,20),(43,5,'2022-03-17','2022-06-06',1000,11),(44,6,'2022-02-27','2022-05-09',1000,16),(45,4,'2022-02-09','2022-05-13',1004,7),(46,2,'2022-03-20','2022-05-12',1002,19),(47,2,'2022-03-18','2022-05-10',1004,26),(48,3,'2022-04-16','2022-05-07',1002,13),(49,3,'2022-04-23','2022-06-02',1002,9),(50,3,'2022-02-13','2022-05-11',1002,39),(51,2,'2022-02-10','2022-05-21',1002,40),(52,7,'2022-03-30','2022-05-29',1002,21),(53,5,'2022-03-02','2022-05-08',1002,17),(54,8,'2022-03-27','2022-05-14',1002,24),(55,4,'2022-04-14','2022-05-20',1002,42),(56,9,'2022-02-07','2022-06-07',1002,40),(57,6,'2022-03-27','2022-06-01',1002,20),(58,2,'2022-04-05','2022-05-28',1002,35),(59,6,'2022-03-04','2022-05-24',1002,9),(60,6,'2022-03-22','2022-06-05',1002,22),(61,10,'2022-03-18','2022-05-21',1002,21),(62,10,'2022-02-11','2022-05-14',1002,14),(63,4,'2022-02-25','2022-05-13',1002,30),(64,4,'2022-03-16','2022-05-28',1002,5),(65,6,'2022-04-23','2022-05-30',1002,40),(66,10,'2022-02-15','2022-05-05',1002,7),(67,6,'2022-02-10','2022-05-06',1002,35),(68,5,'2022-04-16','2022-05-03',1002,16),(69,2,'2022-02-27','2022-06-05',1002,31),(70,10,'2022-04-03','2022-05-11',1002,8),(71,7,'2022-03-11','2022-05-16',1004,39),(72,7,'2022-04-27','2022-05-22',1004,44),(73,2,'2022-03-25','2022-05-30',1004,23),(74,6,'2022-02-15','2022-06-07',1004,43),(75,4,'2022-03-05','2022-05-22',1004,20),(76,2,'2022-03-03','2022-05-18',1004,38),(77,4,'2022-04-19','2022-06-01',1002,10),(78,10,'2022-03-21','2022-06-07',1000,18),(79,10,'2022-02-04','2022-06-05',1000,14),(80,2,'2022-04-21','2022-05-05',1000,17),(81,7,'2022-04-27','2022-05-11',1000,16),(82,10,'2022-03-07','2022-05-28',1002,36),(83,6,'2022-03-18','2022-05-30',1000,43),(84,3,'2022-04-18','2022-05-21',1000,29),(85,6,'2022-05-01','2022-05-23',1000,34),(86,5,'2022-02-17','2022-05-12',1000,39),(87,10,'2022-03-22','2022-06-05',1000,7),(88,5,'2022-03-13','2022-05-22',1004,15),(89,2,'2022-03-27','2022-05-24',1002,24),(90,4,'2022-02-15','2022-05-20',1002,25),(91,4,'2022-03-03','2022-05-12',1004,38),(92,4,'2022-02-25','2022-05-17',1000,19),(93,7,'2022-04-06','2022-05-15',1004,24),(94,7,'2022-02-12','2022-05-26',1004,35),(95,2,'2022-03-10','2022-05-25',1004,11),(96,7,'2022-03-04','2022-05-12',1004,24),(97,5,'2022-03-27','2022-05-09',1004,13),(98,2,'2022-04-25','2022-05-07',1004,30),(99,7,'2022-02-07','2022-06-04',1004,16),(100,4,'2022-03-11','2022-06-07',1002,25);
/*!40000 ALTER TABLE `storageorders` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `SupplierID` int NOT NULL,
  `SupplierTypeCode` int DEFAULT NULL,
  `SupplierName` varchar(20) DEFAULT NULL,
  `City` int DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  `Email` varchar(35) DEFAULT NULL,
  `Contact` varchar(20) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`),
  KEY `SupplierTypeCode` (`SupplierTypeCode`),
  KEY `CityIbFk_idx` (`City`),
  CONSTRAINT `CityIbFk` FOREIGN KEY (`City`) REFERENCES `cities` (`cityID`),
  CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`SupplierTypeCode`) REFERENCES `suppliertype` (`SupplierTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1000,111,'Uber',1,'Israel','uber.israel@ub.com','Rafael','9874321762'),(1002,222,'Wizzair',3,'Israel','Wizzair@wizz.com','Sebastian','1845621489'),(1004,333,'Dana ships',4,'Israel','dana@gmail.com','Dana','1925692187'),(1006,222,'Ferrari Yacht',5,'Israel','conor@ufc.com','Conor','8764543212');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `suppliertype`
--

DROP TABLE IF EXISTS `suppliertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliertype` (
  `SupplierTypeID` int NOT NULL,
  `SupplyingVia` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SupplierTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliertype`
--

LOCK TABLES `suppliertype` WRITE;
/*!40000 ALTER TABLE `suppliertype` DISABLE KEYS */;
INSERT INTO `suppliertype` VALUES (111,'Uber'),(222,'Flight'),(333,'Overseas');
/*!40000 ALTER TABLE `suppliertype` ENABLE KEYS */;
UNLOCK TABLES;



-- --------------------------------------------------------------
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


