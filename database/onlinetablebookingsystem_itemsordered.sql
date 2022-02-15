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
-- Table structure for table `itemsordered`
--

DROP TABLE IF EXISTS `itemsordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemsordered` (
  `orderId` int NOT NULL,
  `productId` int NOT NULL,
  `foodItems` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemsordered`
--

LOCK TABLES `itemsordered` WRITE;
/*!40000 ALTER TABLE `itemsordered` DISABLE KEYS */;
INSERT INTO `itemsordered` VALUES (1,1,'Kung Pao Chicken'),(1,2,'Mixed Fried Rice'),(1,3,'Schezwan Hakka Noodles'),(3,1,'Kung Pao Chicken'),(3,2,'Mixed Fried Rice'),(3,3,'Schezwan Hakka Noodles'),(4,2,'Mixed Fried Rice'),(5,1,'Kung Pao Chicken'),(5,2,'Mixed Fried Rice'),(5,3,'Schezwan Hakka Noodles'),(6,1,'Kung Pao Chicken'),(6,2,'Mixed Fried Rice'),(6,3,'Schezwan Hakka Noodles'),(7,1,'Kung Pao Chicken'),(12,1,'Kung Pao Chicken'),(13,1,'Kung Pao Chicken'),(14,1,'Kung Pao Chicken'),(15,1,'Kung Pao Chicken'),(16,1,'Kung Pao Chicken'),(17,1,'Kung Pao Chicken'),(18,1,'Kung Pao Chicken'),(19,1,'Kung Pao Chicken'),(20,1,'Kung Pao Chicken'),(20,2,'Mixed Fried Rice'),(20,3,'Schezwan Hakka Noodles'),(22,1,'Kung Pao Chicken'),(22,2,'Mixed Fried Rice'),(22,3,'Schezwan Hakka Noodles'),(23,1,'Kung Pao Chicken'),(24,1,'Kung Pao Chicken'),(24,2,'Mixed Fried Rice'),(24,3,'Schezwan Hakka Noodles'),(25,1,'Chelo Kebab'),(25,2,'Chicken Steak'),(26,20,'Mutton Biriyani'),(26,22,'Chicken Seekh Kebab'),(28,20,'Mutton Biriyani'),(28,21,'Chicken Tandoori Butter Masala'),(29,23,'Double Chicken Kathi Kabab'),(30,4,'Dab Chingri'),(30,5,'Bhetki Paturi'),(30,6,'Pabda /jhal'),(31,7,'Chicken Sausage'),(31,8,'Bacon'),(31,9,'Cappuccino ');
/*!40000 ALTER TABLE `itemsordered` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-15 16:06:32
