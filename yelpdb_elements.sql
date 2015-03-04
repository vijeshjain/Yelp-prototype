CREATE DATABASE  IF NOT EXISTS `yelpdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yelpdb`;
-- MySQL dump 10.13  Distrib 5.6.19, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: yelpdb
-- ------------------------------------------------------
-- Server version	5.6.20-enterprise-commercial-advanced

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
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `element_name` varchar(1000) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `rating` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `cid` (`cid`),
  CONSTRAINT `elements_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,'Maya\'s Cafe',1,'Latin American','4.5'),(2,'Back A Yard',1,'Caribbean, American (Traditional)','4.0'),(3,'Jubba Restaurant',1,' African, Ethnic Food','3.5'),(4,'Punjab Cafe',1,'Indian Restaurant','5.0'),(5,'Swaad Indian Cuisine',1,'Indian Restaurant','4.0'),(6,'The Usuals',2,'Fashion','3.7'),(7,'Target',2,'Department Stores, Drugstores, Grocery','4.6'),(8,'Sleep Train Mattress Centers',2,'Mattresses, Furniture Stores','4.7'),(9,'Athletic Performance II',2,'Sports Wear, Shoe Stores','3.9'),(10,'The Levis Store',2,'Apparels','4.1'),(11,'Michael J\'s Body Shop',3,'Body Shops','3.4'),(12,'BMW AutoRepair',3,'BMW Spare parts & repair','4.1'),(13,'Akin\'s Auto Repair',3,'Akin’s Auto Repair','3.6'),(14,'Merc A to Z BodyShop',3,'All kinds of repair of Merc models!','4.3'),(15,'Dent Discount Mobile',3,'Body Shops, Auto Repair, Auto Customization','3.9'),(16,'Cambrian Park Disco',4,'Party Animal Get 2 Gather','4.4'),(17,'Single Barrel',4,'Dance Club','4.0'),(18,'55 South',4,'Night life fun with music','4.5'),(19,'Ngu Long',4,'Enjoy! Bar & Disc','3.0'),(20,'Red Room Hookah Lounge',4,'Hookah Bars','3.1'),(21,'Pet Food Express',5,'Pet Stores, Pet Groomers','4.4'),(22,'Biscuits Dog Boutique',5,'Pet Stores','3.5'),(23,'Pet\'s Choice',5,'Pet Food & Care','3.9'),(24,'Andy\'s Pet Shop',5,'Complete Pet Care Shop','4.1'),(25,'Sam\'s Downtown Feed & Pet Supply',5,'A to Z Pet Care Shop 24x7','5.0'),(26,'Cheese Cake Factory',1,'All deliclious cheese products !!!','4.8');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-12 21:11:00
