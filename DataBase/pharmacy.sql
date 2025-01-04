-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: updated_pharamcy
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `user_role` varchar(15) DEFAULT 'admin',
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sallary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Admin','Ahmed','ahmed.tarek.naga3@gmail.com','01096973116','Tarek','1234',15000.00);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `medicine_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `buying_price` decimal(10,2) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `about` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'panadol',20.00,100.00,260,'preseption'),(2,'adol',100.00,120.00,200,'zkcxlvjkldsjlkdj'),(3,'tramadol',100.00,1000.00,140,'prescription'),(4,'odadol',220.00,400.00,100,'prescription'),(5,'phosdok',22.00,200.00,100,'prescription'),(10,'klsdafjs',120.00,150.00,95,'dskjfhsd'),(12,'dsflksdf',150.00,200.00,15,'gljsklgjdfgjkhgjkadfhkjsdhkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjkhsdfjksdhfjksfdhjkasdfhjsdkfhjdsfhjskdfhsjdkafhjksadfhjskadhfjksfdhjkashfjk\niosfduiosaudifuasidfusidaofuisadofuiosdfauoiuaoisdfuiosdfusdfoiu\nasoidfuoisdfuiosdafuoisdf]\n\n\n\noisdfuoisdf\nsdopfiosdfi\nsodfiosdfi'),(14,'ahm',180.00,200.00,122,'jkrlktj'),(15,'kdfjs',100.00,120.00,93,'xclkvjksldjflksf'),(17,'badwy',100.00,120.00,140,'askldjalksdhj'),(19,'qqqqqqqqqqq',120.00,150.00,100,'jksfnjdsfkjlsdakflj'),(20,'ahmed',200.00,210.00,128,'ldkasjfkdfhkjdsf'),(100,'askdlj',100.00,120.00,100,'skdlfjklsdfj'),(101,'ahhhhhhhhhhhhhhhhhhhhh',80.00,100.00,100,'sdklfjasdifsad'),(120,'wwwwwwwwwwwwwwwwwwwwwwwwwwwww',190.00,200.00,170,'sdajkfllasdkffds'),(122,'slkgj',200.00,234.00,244,'l;kdsf'),(123,'sdflk',123.00,231.00,31,';lek;kfd'),(213,'dksljf',120.00,123.00,231,'dklfjlsdkfj');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacist`
--

DROP TABLE IF EXISTS `pharmacist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacist` (
  `pharma_id` int NOT NULL AUTO_INCREMENT,
  `user_role` varchar(15) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pharma_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacist`
--

LOCK TABLES `pharmacist` WRITE;
/*!40000 ALTER TABLE `pharmacist` DISABLE KEYS */;
INSERT INTO `pharmacist` VALUES (1,'Pharmacist','Ahmed Sherief','Elfager@programmer.com','01910101011',10000.00,'Sherief','1234'),(2,'Pharmacist','Ahmed Badwy','aalhfdgfsdsf','123908434',12000.00,'Badawy','1234'),(3,'Pharmacist','Ibrahim Osman','elmetarham@gmail.com','012398238912',10000.00,'Osman','1234'),(4,'pharmacist','Ibrahim Hetlar','kjashdkj@gmail.com','0123762236737',10000.00,'Hetlar','1234');
/*!40000 ALTER TABLE `pharmacist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseinvoices`
--

DROP TABLE IF EXISTS `purchaseinvoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseinvoices` (
  `parchase_id` int DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `medicine_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  KEY `admin_id` (`admin_id`),
  KEY `medicine_id` (`medicine_id`),
  CONSTRAINT `purchaseinvoices_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `purchaseinvoices_ibfk_3` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseinvoices`
--

LOCK TABLES `purchaseinvoices` WRITE;
/*!40000 ALTER TABLE `purchaseinvoices` DISABLE KEYS */;
INSERT INTO `purchaseinvoices` VALUES (1,1,1,10,20.00,200.00,'2024-12-18 17:32:06'),(1,1,20,10,200.00,2000.00,'2024-12-18 17:32:06'),(2,1,1,100,20.00,2000.00,'2024-12-18 17:59:55'),(2,1,14,120,180.00,21600.00,'2024-12-18 17:59:55'),(3,1,3,10,100.00,1000.00,'2024-12-19 00:38:43'),(4,1,1,50,20.00,1000.00,'2024-12-22 10:32:34'),(4,1,3,10,100.00,1000.00,'2024-12-22 10:32:34'),(5,1,1,10,20.00,200.00,'2024-12-22 16:14:06');
/*!40000 ALTER TABLE `purchaseinvoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellsinvoices`
--

DROP TABLE IF EXISTS `sellsinvoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellsinvoices` (
  `sells_id` int DEFAULT NULL,
  `pharmacist_id` int DEFAULT NULL,
  `medicine_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `total` decimal(6,2) DEFAULT NULL,
  `sells_date` datetime DEFAULT NULL,
  KEY `pharmacist_id` (`pharmacist_id`),
  KEY `medicine_id` (`medicine_id`),
  CONSTRAINT `sellsinvoices_ibfk_1` FOREIGN KEY (`pharmacist_id`) REFERENCES `pharmacist` (`pharma_id`),
  CONSTRAINT `sellsinvoices_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellsinvoices`
--

LOCK TABLES `sellsinvoices` WRITE;
/*!40000 ALTER TABLE `sellsinvoices` DISABLE KEYS */;
INSERT INTO `sellsinvoices` VALUES (1,1,1,5,50.00,250.00,'2024-12-15 23:42:33'),(1,1,3,2,1000.00,2000.00,'2024-12-15 23:42:33'),(1,1,5,2,200.00,400.00,'2024-12-15 23:42:33'),(2,1,1,20,50.00,1000.00,'2024-12-16 00:59:46'),(2,1,5,10,200.00,2000.00,'2024-12-16 00:59:46'),(3,1,1,10,50.00,500.00,'2024-12-16 03:08:42'),(4,1,1,20,50.00,1000.00,'2024-12-16 19:47:52'),(5,1,1,20,50.00,1000.00,'2024-12-16 23:30:04'),(5,1,4,2,400.00,800.00,'2024-12-16 23:30:04'),(5,1,4,2,400.00,800.00,'2024-12-16 23:30:04'),(5,1,14,3,200.00,600.00,'2024-12-16 23:30:04');
/*!40000 ALTER TABLE `sellsinvoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-04 13:50:27
