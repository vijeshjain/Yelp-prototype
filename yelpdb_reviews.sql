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
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(5000) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `elements` (`eid`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'The jerk chicken is perfectly spicy and oh so flavorful.',1,1),(2,'I also love the corn festivals they are great to dip in the oxtail sauce.',1,2),(3,'I love plantains and am so happy each dinner plate comes with plantains and rice & peas!',2,1),(4,'I also love the corn festivals they are great to dip in the oxtail sauce.',2,3),(5,'Awesome authentic Jamaican food.  I had the oxtails just like I always do (I am a regular at their Menlo Park location) and it was just as good.  Loved the jerk chicken, and yes it is spicy so just stop trippin\',  if you want your food bland go somewhere else and don\'t mess it up for the rest of us.',3,3),(6,'Just had lunch...white meat jerk chicken, red beans and rice, plantains, salad, macaroni and cheese, and chicken pumpkin soup. So much flavor! The chicken was relatively moist and seasoned perfectly. Everyone really enjoyed all of their food! I will definitely return! Yum!',3,2),(7,'This place is the bomb. Haven\'t had jerk chicken like this since Jamaica.  Side dishes are great as well, well seasoned dirty rice and caramelized fried plantains. I\'ll be dreaming about this food!',4,4),(8,'The food is outstanding.   Great flavor and oh so tender.  Authentic Jamaica spices.  The ginger beer was fantastic. I might go back tonight.',4,5),(9,'I love the atmosphere of this place... my oxtail plate was very good and so was the jerk chicken. This place seemed a little more on the American Jamaican side... but it was still very good. Definitely not like my place Graces Cafe in Houston.  I would go here again. The staff was also really nice and welcoming.',5,2),(10,'What\'s with all the hype about this place? It\'s okay at best...',5,3),(11,'Super hip, fun boutique style store with something for everyone.',6,2),(12,'I love that they promote local artists, and that they try to keep their prices reasonable.',6,4),(13,'Unique clothing and accessories highlight the cool setting not commonly seen in San Jose.',7,1),(14,'The Usuals always has fresh, new inventory of clothing for men, women and even children.',7,3),(15,'Screw the mall.  Support local businesses. ',8,5),(16,'This is just what The Alameda needs! A GREAT shop where you can run in because you need a last minute outfit and they will have something PERFECT for you and you can walk out with gorgeous cloths without breaking your bank account. Their prices are AMAZINGLY LOW and their quality does not reflect it. Great quality, great selection, great service, oh, and an amazing selection of jewelry and accessories! ',8,1),(17,'Friendly service.  I went in to get a I HEART SJ (Sharks T Shirt) for a homie and proceeded to get it for my friend and myself.  The sales associate was super nice, kept talking to us the whole time and there was a sale going on too with jewelry.',9,2),(18,'I love this place!  Great selection of small production tees, fun and well priced accessories, excellent rotation of local artwork - and really friendly staff.',9,3),(19,'The flavor in the City of San Jose respective to other major cities is severely lacking.  That\'s why when a shop like The Usuals comes around, it\'s a breath of fresh air from the usual stupidity of MMA fight shops, strip malls and general suck.',10,2),(20,'Cool shirts, and great employees. They made me feel very welcome on my first visit today.',10,4),(21,'Thanh is very pleasant and his service is excellent. His prices are also great. Definitely highly recommended!',11,2),(22,'I was looking on Yelp for a trustworthy and solid Auto mechanic and I came across Thanh.  So far i have taken my car here about 3 times.  His rates are really reasonable, he tells you the honest truth and does quality work.  If you are looking for a quality mechanic in San Jose, come check out Thanh.',11,4),(23,'The warning light in my car showed up so I decided to bring it to an Auto Shop but I just moved here in San Jose I don\'t have any idea where will I get my car fixed until i found this place here on Yelp. I read the reviews before I stopped by. ',12,1),(24,'I was quoted $300 for my rear brakes at other places. I decided to give this place a try thanks to other yelp reviews. I paid $168 total. ',12,3),(25,'Thanh is a very trustworthy man. He cares about your service, not the price. Highly recommend!',13,2),(26,'E320 maintenance service and gasket leak repair',13,5),(27,'Nice, friendly, and honest service.:)',14,2),(28,'Had Thanh worked on my Toyota Tacoma-4 wheelers on the shocks/struts and front brake pads. It has been about 2 weeks now and so far so good.',14,1),(29,'Had my Acura Integra (3rd generation) timing belt done in 2011.  The car had under 100k miles on it - so I am very particular.',15,3),(30,'These guys have been my family\'s mechanics for the longest time. They do a good job at a great price!',15,4),(31,'More importantly, the staff is friendly, including the security.',16,2),(32,'It is a speakeasy so it has a very laid-back classy vibe to it.',16,5),(33,'We tried the Little Chef Counter and Pizza Bocca Lupo.',17,1),(34,'Been to a few hookah lounges, but this one is one of my favorites.',17,3),(35,'Me) Moscow Mule ~ $10 ~ 5 stars: I love a good Moscow Mule.',18,4),(36,'Also, there is a slight retro flair to it since it\'s replicating a speakeasy - very cool',18,5),(37,'My other favorite was the English Cosmo and again, a total winner with a light, sweet, cucumber flavor.',19,2),(38,'Single Barrel recreated this prohibition era bar motif and I instantly fell in love with it.',19,1),(39,'No lines on a Tuesday night. Enjoyed a classic sidecar (cognac with orange liqueur) and a birds and bees (lavender bitters, honey vodka and blood orange liqueur). Really mellow atmosphere that is great for two or even one to sip drinks with grown-up flavors.',20,3),(40,'Pretentious prickville.  They think they recreated a speakeasy, but speakeasies were fun.',20,4),(41,'Dog Grooming and Pet Supplies',21,5),(42,'This is by far the best pet store around! I\'ve always had great customer service when coming here. One time they even gave me a free can of wet food because I had never bought the brand before for my cats. ',21,1),(43,'Really nice and patient, stopped twice, find everything I need. Just visited even the store closed, they found the lamb milk for me! Will come back!',22,2),(44,'I stopped by for a pet adoption right outside the store. Everyone was very friendly. I decided since I was there, to check out and see if I needed anything else. Staff was helpful, even though I didn\'t find anything I needed.',22,3),(45,'Check-out girl who helped me was super nice. She helped me pick out the perfect dog treats for my new pup and gave me a lot of great information about using the treats to train him. There\'s nothing more impressive than awesome customer service.',23,4),(46,'Love this store. The staff is always friendly, knowledgeable, and well trained. They are always willing to give you a can of food to try. They are not carrying food made in China, YES! A Pet Store that understands what it\'s customer want and aren\'t driven by the profits made on China products.',23,2),(47,'This is the only place I will shop at for pet supplies. The employees here are always super friendly and helpful. They are all pet owners and lovers themselves and it really shows. They really pick hire great people, because I walk in, I always feel welcome. Everyone is so warm and helpful.',24,1),(48,'These guys have a huge selection of pet food and they stock bulk sizes.',24,5),(49,'Love this location. Amazing staff. Great products. Buy 3 get one free!',25,3),(50,'Another great Pet Food express!  Came here for an adoption event they were hosting, and it is a pretty good location.  The staff was knowledgeable and friendly.',25,4),(51,'This place has very friendly service and karaoke on the weekends',1,1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
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
