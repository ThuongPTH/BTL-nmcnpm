CREATE DATABASE  IF NOT EXISTS `quanlygiaidau` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quanlygiaidau`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlygiaidau
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `bxhvongdau_82`
--

DROP TABLE IF EXISTS `bxhvongdau_82`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bxhvongdau_82` (
  `maBXH` int NOT NULL AUTO_INCREMENT,
  `maVongDau` int DEFAULT NULL,
  `maCoThu` int DEFAULT NULL,
  `tongDiem` float DEFAULT NULL,
  `heSoElo` float DEFAULT NULL,
  `tongDiemDoiThu` float DEFAULT NULL,
  PRIMARY KEY (`maBXH`),
  KEY `maVongDau` (`maVongDau`),
  KEY `maCoThu` (`maCoThu`),
  CONSTRAINT `bxhvongdau_82_ibfk_1` FOREIGN KEY (`maVongDau`) REFERENCES `vongdau_82` (`maVongDau`),
  CONSTRAINT `bxhvongdau_82_ibfk_2` FOREIGN KEY (`maCoThu`) REFERENCES `cothu_82` (`maCoThu`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bxhvongdau_82`
--

LOCK TABLES `bxhvongdau_82` WRITE;
/*!40000 ALTER TABLE `bxhvongdau_82` DISABLE KEYS */;
INSERT INTO `bxhvongdau_82` VALUES (1,1,1,0,1500,0),(2,1,2,0,1600,0),(3,1,3,0,1550,0),(4,1,4,0,1700,0),(5,1,5,0,1450,0),(6,1,6,0,1650,0),(7,1,7,0,1580,0),(8,1,8,0,1620,0),(9,1,9,0,1680,0),(10,1,10,0,1550,0),(11,2,1,1,1500,0),(12,2,2,0.5,1600,0),(13,2,3,1,1550,0),(14,2,4,0.5,1700,0),(15,2,5,1,1450,0),(16,2,6,0.5,1650,0),(17,2,7,1,1580,0),(18,2,8,0.5,1620,0),(19,2,9,1,1680,0),(20,2,10,0.5,1550,0),(41,3,1,1.5,1500,0),(42,3,2,1.5,1600,0),(43,3,3,1.5,1550,0),(44,3,4,0.5,1700,0),(45,3,5,1,1450,0),(46,3,6,1.5,1650,0),(47,3,7,1,1580,0),(48,3,8,0.5,1620,0),(49,3,9,1.5,1680,0),(50,3,10,1.5,1550,0);
/*!40000 ALTER TABLE `bxhvongdau_82` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cothu_82`
--

DROP TABLE IF EXISTS `cothu_82`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cothu_82` (
  `maCoThu` int NOT NULL AUTO_INCREMENT,
  `tenCoThu` varchar(255) DEFAULT NULL,
  `namSinh` year DEFAULT NULL,
  `quocTich` varchar(50) DEFAULT NULL,
  `heSoElo` int DEFAULT NULL,
  `ghiChu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`maCoThu`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cothu_82`
--

LOCK TABLES `cothu_82` WRITE;
/*!40000 ALTER TABLE `cothu_82` DISABLE KEYS */;
INSERT INTO `cothu_82` VALUES (1,'Player 1',1990,'Vietnam',1500,'Good player'),(2,'Player 2',1985,'USA',1600,'Beginner'),(3,'Player 3',1992,'France',1550,'Intermediate'),(4,'Player 4',1988,'Germany',1700,'Advanced'),(5,'Player 5',1995,'Japan',1450,'Casual player'),(6,'Player 6',1993,'Brazil',1650,'Competitive player'),(7,'Player 7',1991,'Spain',1580,'Chess enthusiast'),(8,'Player 8',1987,'Italy',1620,'Chess master'),(9,'Player 9',1989,'Russia',1680,'Professional player'),(10,'Player 10',1994,'Canada',1550,'Tournament winner');
/*!40000 ALTER TABLE `cothu_82` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cothugiaidau_82`
--

DROP TABLE IF EXISTS `cothugiaidau_82`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cothugiaidau_82` (
  `maCoThuGiaiDau` int NOT NULL AUTO_INCREMENT,
  `maCoThu` int DEFAULT NULL,
  `maGiaiDau` int DEFAULT NULL,
  `maTranDau` int DEFAULT NULL,
  `thayDoiElo` float DEFAULT NULL,
  PRIMARY KEY (`maCoThuGiaiDau`),
  KEY `maCoThu` (`maCoThu`),
  KEY `maGiaiDau` (`maGiaiDau`),
  CONSTRAINT `cothugiaidau_82_ibfk_1` FOREIGN KEY (`maCoThu`) REFERENCES `cothu_82` (`maCoThu`),
  CONSTRAINT `cothugiaidau_82_ibfk_2` FOREIGN KEY (`maGiaiDau`) REFERENCES `giaidau_82` (`maGiaiDau`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cothugiaidau_82`
--

LOCK TABLES `cothugiaidau_82` WRITE;
/*!40000 ALTER TABLE `cothugiaidau_82` DISABLE KEYS */;
INSERT INTO `cothugiaidau_82` VALUES (1,1,1,NULL,NULL),(2,2,1,NULL,NULL),(3,3,1,NULL,NULL),(4,4,1,NULL,NULL),(5,5,1,NULL,NULL),(6,6,1,NULL,NULL),(7,7,1,NULL,NULL),(8,8,1,NULL,NULL),(9,9,1,NULL,NULL),(10,10,1,NULL,NULL);
/*!40000 ALTER TABLE `cothugiaidau_82` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giaidau_82`
--

DROP TABLE IF EXISTS `giaidau_82`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giaidau_82` (
  `maGiaiDau` int NOT NULL AUTO_INCREMENT,
  `tenGiaiDau` varchar(255) DEFAULT NULL,
  `nam` year DEFAULT NULL,
  `lanToChuc` int DEFAULT NULL,
  `diaDiem` varchar(255) DEFAULT NULL,
  `moTa` text,
  PRIMARY KEY (`maGiaiDau`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giaidau_82`
--

LOCK TABLES `giaidau_82` WRITE;
/*!40000 ALTER TABLE `giaidau_82` DISABLE KEYS */;
INSERT INTO `giaidau_82` VALUES (1,'Giai vo dich 2024',2024,3,'VietNam',NULL);
/*!40000 ALTER TABLE `giaidau_82` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vongdau_82`
--

DROP TABLE IF EXISTS `vongdau_82`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vongdau_82` (
  `maVongDau` int NOT NULL AUTO_INCREMENT,
  `soVong` int DEFAULT NULL,
  `thoiGian` datetime DEFAULT NULL,
  `maGiaiDau` int DEFAULT NULL,
  PRIMARY KEY (`maVongDau`),
  KEY `maGiaiDau` (`maGiaiDau`),
  CONSTRAINT `vongdau_82_ibfk_1` FOREIGN KEY (`maGiaiDau`) REFERENCES `giaidau_82` (`maGiaiDau`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vongdau_82`
--

LOCK TABLES `vongdau_82` WRITE;
/*!40000 ALTER TABLE `vongdau_82` DISABLE KEYS */;
INSERT INTO `vongdau_82` VALUES (1,1,'2024-05-24 00:00:00',1),(2,2,'2024-06-25 00:00:00',1),(3,3,'2024-07-06 00:00:00',1);
/*!40000 ALTER TABLE `vongdau_82` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-09 16:02:55
