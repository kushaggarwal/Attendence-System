-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: college
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department_it`
--

DROP TABLE IF EXISTS `department_it`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department_it` (
  `Teacher_ID` int(11) NOT NULL,
  `Teacher_Name` varchar(20) DEFAULT NULL,
  `Section` varchar(10) DEFAULT NULL,
  `Subject` varchar(40) DEFAULT NULL,
  `total_lectures` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_it`
--

LOCK TABLES `department_it` WRITE;
/*!40000 ALTER TABLE `department_it` DISABLE KEYS */;
INSERT INTO `department_it` VALUES (1,'hod','s10','oops',14),(2,'DBMS_mam','s10','DBMS',2),(3,'TOC_mam','s10','TOC',2);
/*!40000 ALTER TABLE `department_it` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_s10`
--

DROP TABLE IF EXISTS `section_s10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `section_s10` (
  `studentRollNo` varchar(12) NOT NULL,
  `studentName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`studentRollNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_s10`
--

LOCK TABLES `section_s10` WRITE;
/*!40000 ALTER TABLE `section_s10` DISABLE KEYS */;
INSERT INTO `section_s10` VALUES ('1','a'),('10','i'),('2','b'),('3','c'),('4','d'),('452156031','Mohit'),('5','e'),('6','f'),('7','g'),('8','g'),('9','h');
/*!40000 ALTER TABLE `section_s10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_s10_attendance`
--

DROP TABLE IF EXISTS `section_s10_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `section_s10_attendance` (
  `SNo` int(11) NOT NULL AUTO_INCREMENT,
  `lecture` varchar(40) NOT NULL,
  `a1` varchar(10) DEFAULT NULL,
  `a2` varchar(10) DEFAULT NULL,
  `a3` varchar(10) DEFAULT NULL,
  `a4` varchar(10) DEFAULT NULL,
  `a5` varchar(10) DEFAULT NULL,
  `a6` varchar(10) DEFAULT NULL,
  `a7` varchar(10) DEFAULT NULL,
  `a8` varchar(10) DEFAULT NULL,
  `a9` varchar(10) DEFAULT NULL,
  `a10` varchar(10) DEFAULT NULL,
  `a452156031` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_s10_attendance`
--

LOCK TABLES `section_s10_attendance` WRITE;
/*!40000 ALTER TABLE `section_s10_attendance` DISABLE KEYS */;
INSERT INTO `section_s10_attendance` VALUES (1,'oopsMar_25_2019','Present','Absent','Present','Absent','Present','Absent','Present','Absent','Present','Absent','Present'),(2,'oopsMar_26_2019','Absent','Present','Absent','Present','Absent','Present','Absent','Present','Absent','Present','Absent'),(3,'DBMSMar_26_2019','Present','Present','Present','Present','Present','Present','Present','Present','Present','Present','Absent'),(4,'TOCMar_26_2019','Absent','Absent','Present','Present','Absent','Absent','Absent','Present','Present','Present','Absent'),(5,'oopsMar_27_2019','Present','Absent','Present','Absent','Absent','Absent','Absent','Present','Present','Absent','Present'),(6,'DBMSMar_27_2019','Present','Present','Present','Present','Present','Present','Present','Present','Present','Present','Absent'),(7,'TOCMar_27_2019','Absent','Absent','Present','Present','Absent','Absent','Absent','Present','Present','Present','Absent'),(8,'oopsMar_26_2019','Present','Present','Present','Absent','Absent','Absent','Absent','Absent','Present','Present','Present'),(9,'oopsMar_26_2019','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Absent'),(12,'oopsMar_27_2019','Present','Absent','Absent','Absent','Present','Absent','Absent','Absent','Absent','Absent','Absent'),(17,'oopsMar_28_2019','Absent','Present','Absent','Present','Absent','Present','Absent','Present','Absent','Present','Absent'),(18,'oopsMar_28_2019','Present','Absent','Present','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Absent'),(19,'oopsApr_23_2019','Present','Present','Absent','Present','Absent','Absent','Absent','Absent','Absent','Absent','Present'),(21,'oops_May_24_2019_lec1','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Present'),(22,'oops_May_26_2019_lec1','Present','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Present','Absent','Present'),(23,'oops_May_28_2019_lec1','Absent','Absent','Absent','Present','Absent','Absent','Absent','Absent','Absent','Absent','Absent'),(24,'oops_May_29_2019_lec1','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Present','Absent','Absent'),(25,'oops_Jul_16_2019_lec1','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Absent','Present','Absent','Absent');
/*!40000 ALTER TABLE `section_s10_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_1`
--

DROP TABLE IF EXISTS `teacher_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacher_1` (
  `day` varchar(10) DEFAULT NULL,
  `lec1` varchar(20) DEFAULT NULL,
  `lec2` varchar(20) DEFAULT NULL,
  `lec3` varchar(20) DEFAULT NULL,
  `lec4` varchar(20) DEFAULT NULL,
  `lec5` varchar(20) DEFAULT NULL,
  `lec6` varchar(20) DEFAULT NULL,
  `lec7` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_1`
--

LOCK TABLES `teacher_1` WRITE;
/*!40000 ALTER TABLE `teacher_1` DISABLE KEYS */;
INSERT INTO `teacher_1` VALUES ('Monday','s10','N','O','P','Q','R','S'),('Tuesday','s9','A','s10','C','S19','E','F'),('Wednesday','N','s10','O','s19','P','s9','Q'),('Thursday','A','s19','B','s9','C','s10','D'),('Friday','s9','N','s10','O','s19','P','Q');
/*!40000 ALTER TABLE `teacher_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'hod','oops');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `userID` varchar(20) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `userType` varchar(10) DEFAULT NULL,
  `department` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','123','Teacher','IT'),('2','456','Teacher','IT');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-16 12:31:05
