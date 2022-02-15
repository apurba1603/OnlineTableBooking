-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: onlinetablebookingsystem
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservationId` int NOT NULL AUTO_INCREMENT,
  `restaurantId` int NOT NULL,
  `restaurantName` varchar(45) NOT NULL,
  `customerId` varchar(10) DEFAULT NULL,
  `customerName` varchar(45) DEFAULT NULL,
  `bookingDate` varchar(25) DEFAULT NULL,
  `bookedTable` int DEFAULT NULL,
  `person` int DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`reservationId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,6,'West Wind','apu','Apurba','2022-02-14T12:30',1,2,1,'apurba16@gmail.com','7584869090',0),(2,3,'FLURYS','xyz100','Amal','2022-02-22T14:00',1,4,3,'test@gmail.com','9087654321',1),(3,3,'FLURYS','apu','Apurba','2022-02-19T12:30',1,2,4,'apurba16@gmail.com','7584869090',0),(4,3,'FLURYS','apu','Apurba','2022-02-14T12:30',1,2,0,'apurba16@gmail.com','7584869090',0),(5,6,'West Wind','apu','Apurba','2022-02-14T19:00',1,2,5,'apurba16@gmail.com','8820011390',1),(6,2,'6 Ballygunge Place','apu','Apurba','2022-02-14T17:00',1,2,6,'apurba16@gmail.com','8820011390',1),(7,3,'FLURYS','apu','Apurba','2022-02-14T17:29',1,2,7,'apurba16@gmail.com','8820011390',1),(8,3,'FLURYS','apu','Apurba','',0,0,12,'apurba16@gmail.com','8820011390',0),(9,3,'FLURYS','apu','Apurba','',0,0,13,'apurba16@gmail.com','8820011390',0),(10,3,'FLURYS','apu','Apurba','',0,0,14,'apurba16@gmail.com','8820011390',0),(11,3,'FLURYS','apu','Apurba','',0,0,15,'apurba16@gmail.com','8820011390',0),(12,3,'FLURYS','apu','Apurba','',0,0,16,'apurba16@gmail.com','8820011390',0),(13,3,'FLURYS','apu','Apurba','',0,0,17,'apurba16@gmail.com','8820011390',0),(14,3,'FLURYS','apu','Apurba','',0,0,18,'apurba16@gmail.com','8820011390',0),(15,3,'FLURYS','apu','Apurba','',0,0,19,'apurba16@gmail.com','8820011390',0),(16,3,'FLURYS','apu','Apurba','',0,0,20,'apurba16@gmail.com','8820011390',0),(17,5,'Dada Boudi Restaurant','apu','Apurba Bhattacharjee','2022-02-14T20:11',1,2,22,'apurba16@gmail.com','8820011390',1),(18,4,'Mouchak','ladybird','Shankhapriya','2022-02-14T20:30',1,2,23,'test@gmail.com','6290584521',1),(19,2,'6 Ballygunge Place','Aman','Aman Kumar','2022-02-15T01:31',1,2,24,'abc@gmail.com','9087654321',0),(20,1,'Peter Cat','Aman','Aman','2022-02-15T04:02',1,2,25,'abc@gmail.com','9087654321',1),(21,7,'Aminia','Aman','Aman','2022-02-15T13:28',1,2,26,'abc@gmail.com','9087654321',1),(22,7,'Aminia','Aman','Aman','2022-02-15T13:31',1,2,28,'abc@gmail.com','9087654321',1),(23,8,'Nizam\'s','Aman','Aman','',0,0,29,'abc@gmail.com','9087654321',1),(24,2,'6 Ballygunge Place','Aman','Aman','',0,0,30,'abc@gmail.com','9087654321',1),(25,3,'FLURYS','Aman','Aman','',0,0,31,'abc@gmail.com','9087654321',1);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-15 16:06:33
