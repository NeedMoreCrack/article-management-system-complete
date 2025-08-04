-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 172.20.195.253    Database: big_event
-- ------------------------------------------------------
-- Server version	8.4.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `big_event`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `big_event` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `big_event`;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `cover_img` varchar(500) NOT NULL,
  `state` varchar(1) DEFAULT 'D' COMMENT 'D = Draft,P = Published',
  `category_id` int unsigned DEFAULT NULL,
  `create_user` int unsigned NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_category` (`category_id`),
  KEY `fk_article_user` (`create_user`),
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_article_user` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'關於藝術','<p>The book of art ...</p>','https://res.cloudinary.com/dsfmt4qaq/image/authenticated/s--n4CT8MN4--/v1754291712/rlxlp50tei8rsr3izwt2.jpg','P',1,1,'2025-07-14 23:30:18','2025-08-04 15:15:37'),(2,'測試','<p>This test title</p>','https://res.cloudinary.com/dsfmt4qaq/image/authenticated/s--eG4V31xZ--/v1754290394/f3ydpws19y06emmi4qoa.jpg','D',2,1,'2025-07-31 08:08:52','2025-08-04 14:53:22'),(3,'測試文章','<p>123+321</p>','https://res.cloudinary.com/dsfmt4qaq/image/authenticated/s--PVShZFye--/v1754291917/udmf2lunfv0b1ckhj2hq.jpg','D',3,1,'2025-08-02 20:25:09','2025-08-04 15:18:45'),(6,'adArticle','<p>admin test article</p>','https://res.cloudinary.com/dsfmt4qaq/image/authenticated/s--VOuTsNYA--/v1754275699/step4sbfbpxmrdintqpn.jpg','D',7,9,'2025-08-04 02:46:27','2025-08-04 10:48:20');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `category_alias` varchar(50) NOT NULL,
  `create_user` int unsigned NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_user` (`create_user`),
  CONSTRAINT `fk_category_user` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'人文','rw',1,'2025-07-13 15:53:29','2025-07-31 12:36:52'),(2,'教育','edu',1,'2025-07-13 17:23:10','2025-07-13 17:23:10'),(3,'數學','math',1,'2025-07-30 01:51:13','2025-07-30 01:51:13'),(4,'電腦科學','CS',1,'2025-07-30 01:53:27','2025-07-30 01:53:27'),(7,'admin','ad',9,'2025-08-04 10:22:43','2025-08-04 10:22:43');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(64) NOT NULL,
  `nickname` varchar(10) DEFAULT '',
  `email` varchar(128) DEFAULT '',
  `user_pic` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'testuser','2DC0269FA54D269A87536810EC453CB095B4B92F45E63826A21DFF1C2E76F169','TS','testuser@gmail.com','https://res.cloudinary.com/dsfmt4qaq/image/authenticated/s--SSemhTpz--/v1754203855/bmy0fhe8x7l0qucwgx7e.png','2025-07-12 01:33:39','2025-08-03 16:23:32'),(9,'admintest','8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92','','',NULL,'2025-07-28 04:26:10','2025-07-28 04:26:10'),(11,'qwerasdf','8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92','','',NULL,'2025-07-28 04:45:49','2025-07-28 04:45:49');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-04 15:33:36
