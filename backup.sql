-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: inventory_db
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_persons_users_person_id_idx` (`person_id`),
  CONSTRAINT `fk_persons_users_person_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2023-07-26 19:56:32
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: join_lesson
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `salary` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'Juan','Dela Cruz','Male',NULL),(2,'John','Doe','Male',NULL),(3,'Sara','Smith','Female',NULL);
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_persons_users_person_id_idx` (`person_id`),
  CONSTRAINT `fk_persons_users_person_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,1),(4,2);
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

-- Dump completed on 2023-07-26 19:56:32
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: query_optimization_demo
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `IDX_Country_City` (`country`,`city`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Tiertza Glasspoole','Ijūin','Japan','Suite 46'),(2,'Arabel Plues','Kampong Chhnang','Cambodia','Suite 65'),(3,'Fitzgerald Beagrie','Puerto de Nutrias','Venezuela','Apt 1402'),(4,'Dall McInility','Cool űrhajó','Afghanistan','PO Box 27986'),(5,'Ezechiel Luttgert','Lublin','Poland','Apt 1852'),(6,'Melania Robroe','Tarutung','Indonesia','PO Box 20571'),(7,'Catherin Guild','Cajolá','Guatemala','PO Box 97387'),(8,'Alley Muldowney','Nazaré da Mata','Brazil','PO Box 91394'),(9,'Felisha Elsom','Burayevo','Russia','Room 785'),(10,'Sonia Ussher','Herval','Brazil','Apt 1939'),(11,'Roselin Gladbach','San Diego','United States','PO Box 32872'),(12,'Christen Couthard','Toliara','Madagascar','Suite 49'),(13,'Clarita Bavester','Enrekang','Indonesia','Suite 26'),(14,'Carey Code','Alubijid','Philippines','Suite 77'),(15,'Jethro Winspare','Afántou','Greece','PO Box 15233'),(16,'Augustina Suggitt','Citeguh','Indonesia','Apt 485'),(17,'Matthus Thurlbourne','Baihe','China','12th Floor'),(18,'Erastus Tuffield','Podkumskiy','Russia','Apt 532'),(19,'Sinclair Siccombe','Huitán','Guatemala','PO Box 88026'),(20,'Ellerey Bullard','Hezhi','China','18th Floor'),(21,'Dorothee Lawly','Jos','Nigeria','Suite 94'),(22,'Devland Sobczak','Zama','Japan','Room 670'),(23,'Lorrie Daniells','Weda','Indonesia','Room 1007'),(24,'Laetitia Bilborough','Degan','China','Suite 100'),(25,'Durante Sibbons','Quận Tân Phú','Vietnam','Apt 210'),(26,'Leandra Fairclough','Narva','Estonia','PO Box 76226'),(27,'Vassili Clancy','Usagara','Tanzania','15th Floor'),(28,'Ginevra Kennermann','Bangkalan','Indonesia','PO Box 51337'),(29,'Nikos Imeson','Carman','Canada','Room 798'),(30,'Em Caesar','Huai Yot','Thailand','Apt 1071'),(31,'Ofelia Castiello','Kstovo','Russia','Suite 1'),(32,'Danyelle Goricke','Malin','China','Room 150'),(33,'Bette-ann Sawle','Kasangulu','Democratic Republic of the Congo','8th Floor'),(34,'Ethelda Strutt','Haquira','Peru','Suite 89'),(35,'Orson Girt','Xuanhua','China','4th Floor'),(36,'Killie McDyer','Emmeloord','Netherlands','20th Floor'),(37,'Faith Gauvain','Katsuta','Japan','Room 907'),(38,'Viviene Giff','Pleshanovo','Russia','Suite 57'),(39,'Yoko Ulyatt','Santa Cruz','Portugal','PO Box 49962'),(40,'Alexine Swedeland','Allen','Argentina','Apt 1144'),(41,'Washington Parmer','Detroit','United States','Room 697'),(42,'Berne Janota','Douane','Tunisia','Apt 1660'),(43,'Sheena Horlick','Agboville','Ivory Coast','PO Box 45867'),(44,'Doro Chopin','Bordeaux','France','PO Box 86778'),(45,'Gray Pottberry','Montague','Canada','Suite 33'),(46,'Aline Barehead','Binhailu','China','PO Box 246'),(47,'Monica Hatwells','Emmaboda','Sweden','PO Box 80262'),(48,'Elmore Smaile','Juai','Indonesia','Suite 41'),(49,'Kendal Dougher','Mukhen','Russia','Apt 743'),(50,'Phaidra Kenewell','Legen','Slovenia','Apt 1945'),(51,'Ninette Kluge','Uyugan','Philippines','Suite 40'),(52,'Merrilee Yashaev','Helmas','Albania','Room 628'),(53,'Stuart Gillott','Brzeźnica','Poland','Suite 38'),(54,'Ninnetta Dowbakin','Téra','Niger','Suite 48'),(55,'Ottilie Maudett','Pantaibesar','Indonesia','PO Box 77303'),(56,'Efren Swyndley','Ondo','Nigeria','PO Box 16309'),(57,'Leyla Aers','Bilhó','Portugal','Apt 332'),(58,'Tine Sharple','Przemyśl','Poland','Room 181'),(59,'Boony Westraw','Yeysk','Russia','11th Floor'),(60,'Valdemar Harbord','Ljig','Serbia','19th Floor'),(61,'Pearla Dyball','Cinangsih Satu','Indonesia','Suite 3'),(62,'Jennine Gwinn','Växjö','Sweden','Suite 18'),(63,'Consalve Farndell','Weligama','Sri Lanka','Apt 489'),(64,'Frederique Hegarty','Taurija','Peru','18th Floor'),(65,'Johnnie Mosson','Novaya Usman’','Russia','PO Box 58897'),(66,'Krystal Steger','As Suwaydā’','Syria','18th Floor'),(67,'Dacy Cameli','Nova Pazova','Serbia','9th Floor'),(68,'Eachelle Marc','Kolor','Indonesia','17th Floor'),(69,'Bessy Pulster','Svislach','Belarus','Suite 56'),(70,'Anderson Andric','Lenart v Slov. Goricah','Slovenia','16th Floor'),(71,'Sheilah Swetenham','Caitang','China','Suite 11'),(72,'Dorie Lamble','Batanghari','Indonesia','Suite 52'),(73,'Standford Presnail','Chinchaypujio','Peru','Apt 909'),(74,'Natty Tute','Acevedo','Colombia','20th Floor'),(75,'Haleigh Llewellyn','Tournai','Belgium','Suite 15'),(76,'Lanie Biffen','Santa Elena','Ecuador','Suite 86'),(77,'Wilton Paulazzi','Dniprodzerzhyns’k','Ukraine','Apt 1160'),(78,'Ardisj Caldeiro','Pásion','Greece','PO Box 91409'),(79,'Lola Guys','Ḩājjīābād','Iran','Room 1159'),(80,'Candie Dorward','Straldzha','Bulgaria','Room 763'),(81,'Jefferson Martinuzzi','Kadubamban','Indonesia','Suite 64'),(82,'Killian Duinbleton','Cajueiro','Brazil','PO Box 34133'),(83,'Manuel Drewet','Warmare','Indonesia','PO Box 59846'),(84,'Larina Ayliff','Itapecerica da Serra','Brazil','Apt 1220'),(85,'Hugh Curds','Dresden','Germany','Room 1688'),(86,'Olly O\'Donegan','‘Ayn al ‘Arab','Syria','16th Floor'),(87,'Allx Clopton','Khōshāmand','Afghanistan','7th Floor'),(88,'Heloise Storrock','Tiglauigan','Philippines','Apt 1176'),(89,'Yankee Sutherley','Palmira','Panama','Apt 590'),(90,'Ramsey Boothby','Rijeka','Croatia','Apt 1362'),(91,'Kimberli Giovannacc@i','Rikitea','French Polynesia','Room 289'),(92,'Junia Hardwell','Pīr jo Goth','Pakistan','Room 1870'),(93,'Jill Jaxon','Birmingham','United States','Apt 1633'),(94,'Wynnie Franckton','Sjöbo','Sweden','Suite 84'),(95,'Markos Roylance','Kodra','Ukraine','Room 1258'),(96,'Kimberlyn Alphonso','Sungai Iyu','Indonesia','Suite 47'),(97,'Phillip Mays','Huilong','China','Suite 60'),(98,'Barbee Ondrasek','Kiszkowo','Poland','18th Floor'),(99,'Thelma Plum','Kapan','Armenia','Room 1288'),(100,'Mellisent Knightly','Aqqan','China','15th Floor'),(101,'Vanni Wantling','Bambor','Indonesia','Room 119'),(102,'Pancho Whittock','Belköl','Kazakhstan','PO Box 65802'),(103,'Irving Bernlin','Nancheng','China','Room 1154'),(104,'Lucas Coaster','Tonota','Botswana','Room 1754'),(105,'Phip Heinsh','Rybatskoye','Russia','Suite 35'),(106,'Kele Barracks','Xingtan','China','19th Floor'),(107,'Binny Craney','Galátsi','Greece','Apt 1290'),(108,'Rosalyn Costi','Helsingborg','Sweden','4th Floor'),(109,'Vevay Iacavone','San Antonio','Peru','PO Box 77346'),(110,'Ellis Simla','Dallas','United States','Apt 72'),(111,'Annabell Dufall','Sanli','China','Apt 538'),(112,'Sharona Snewin','Stykkishólmur','Iceland','Apt 683'),(113,'Piper Vlahos','Chapecó','Brazil','18th Floor'),(114,'Sinclair Dumpleton','Daduo','China','Room 1549'),(115,'Jay Couve','Suzano','Brazil','Apt 1073'),(116,'Laverne Tupper','Paobokol','Indonesia','14th Floor'),(117,'Margo Bumphrey','Lyon','France','Room 1784'),(118,'Robbie O\'Connel','Mahdia','Tunisia','Room 140'),(119,'Odelinda Hughf','El Alamo','Mexico','Suite 63'),(120,'Eduard Whear','Sayansk','Russia','1st Floor'),(121,'Taber Halligan','Mikulášovice','Czech Republic','Suite 32'),(122,'Theressa Lattka','Tissa','Morocco','Room 133'),(123,'Joyce Saurin','Tanbuqiao','China','PO Box 69704'),(124,'Dora Juste','Pangkalanbunut','Indonesia','Apt 1048'),(125,'Rabbi Jehan','Suhopolje','Croatia','Suite 18'),(126,'Nathalia Gallaher','Lanjaghbyur','Armenia','Suite 59'),(127,'Jarrad Guerreru','Velyka Bilozerka','Ukraine','PO Box 14612'),(128,'Libbi Blaxley','Svitlovods’k','Ukraine','Apt 1048'),(129,'Colby Doe','Kitamilo','Uganda','7th Floor'),(130,'Carolin Yepiskopov','Linjiang','China','Room 1470'),(131,'Ingrim Benettolo','Kyaikkami','Myanmar','8th Floor'),(132,'Benito Jikovsky','Lugulu','Kenya','Room 175'),(133,'Theressa Gley','Santiago','Chile','Room 1567'),(134,'Bunny Crommett','Kusheriki','Nigeria','Room 1203'),(135,'Nanni Caine','Xinchengpu','China','Suite 39'),(136,'Guntar Bothie','Guniushan','China','Room 1367'),(137,'Micheline Slafford','Rizó','Greece','PO Box 78498'),(138,'Alasdair Kendell','Huangjinbu','China','PO Box 8910'),(139,'Agnese Klimes','Algeciras','Colombia','Room 1386'),(140,'Farly Kermeen','Lachute','Canada','Suite 88'),(141,'Brett Soame','Campo Largo','Brazil','Room 1218'),(142,'Penny Leebetter','Paipa','Colombia','Apt 1944'),(143,'Sherill Arkell','Buenos Aires','Mexico','Room 498'),(144,'Eddy Havoc','Pingdu','China','Suite 28'),(145,'Dyna Clausson','Bordeaux','France','12th Floor'),(146,'Raffarty Crolly','Hongsung','South Korea','PO Box 97280'),(147,'Janet Holleran','Bandeirantes','Brazil','1st Floor'),(148,'Erek Scarth','Erie','United States','PO Box 89965'),(149,'Nert Bardwall','Kittilä','Finland','Room 1583'),(150,'Conrad Croix','Xinshidu','China','PO Box 66854'),(151,'Nada Bowart','Widuchowa','Poland','Suite 72'),(152,'Fitz Capnor','Burujul','Indonesia','Apt 844'),(153,'Lauryn Lonie','Liyang','China','Suite 42'),(154,'Janenna Defew','Tipo-Tipo','Philippines','Room 1935'),(155,'Culver Marages','Vista Hermosa','Mexico','Room 1099'),(156,'Annabelle Gogie','Rancharia','Brazil','Apt 631'),(157,'Sheela Addicote','Becerril','Philippines','Suite 11'),(158,'Allyn Harmour','Taiping','China','Room 1995'),(159,'Hamlin MacChaell','Lukovo','Macedonia','PO Box 75151'),(160,'Carlene North','Sangtian','China','1st Floor'),(161,'Jarvis Walbridge','Ronneby','Sweden','8th Floor'),(162,'Lyndel Bassill','Castries','Saint Lucia','PO Box 58364'),(163,'Virgil Lyttle','Shymkent','Kazakhstan','Suite 38'),(164,'Lurette Twitchings','Wufu','China','Room 128'),(165,'Amaleta Blunderfield','Bendo','Indonesia','15th Floor'),(166,'Adore Taaffe','Namwala','Zambia','Room 1965'),(167,'Krissie Strasse','Tyszowce','Poland','Apt 210'),(168,'Hillel Crichton','Thị Trấn Yên Ninh','Vietnam','Room 1724'),(169,'Luci Pardue','Gubskaya','Russia','7th Floor'),(170,'Terry Boness','Ħamrun','Malta','Suite 2'),(171,'Berty Bradder','Sundbyberg','Sweden','Apt 817'),(172,'Hedwig Aldine','Tangjiapo','China','Room 1604'),(173,'Morse Reeday','Kadubera','Indonesia','Room 1456'),(174,'Gusti Gilling','Daru Rilwan','Gambia','15th Floor'),(175,'Daune Sobieski','North Battleford','Canada','PO Box 37574'),(176,'Zelda Provis','Katoúna','Greece','Suite 2'),(177,'Rozanna Stanyard','Lastoursville','Gabon','20th Floor'),(178,'Tynan Hazley','Sanshan','China','Suite 16'),(179,'Chrotoem Montacute','Thayetmyo','Myanmar','7th Floor'),(180,'Northrop Poizer','Kęty','Poland','16th Floor'),(181,'Rebeca Maund','Des Moines','United States','PO Box 76920'),(182,'Loree Kenzie','Huangfang','China','Apt 255'),(183,'Toiboid O\'Cannan','Debrecen','Hungary','Apt 1275'),(184,'Faina Pillington','‘Ajlūn','Jordan','Suite 75'),(185,'Karoline Halworth','Potulando','Indonesia','16th Floor'),(186,'Rene Cholomin','Santa Teresa','Philippines','Room 1008'),(187,'Petunia Leacy','Nunchía','Colombia','Apt 1890'),(188,'Darda Bremmell','Chengkan','China','Suite 27'),(189,'Ruthe Chiplen','Velké Meziříčí','Czech Republic','9th Floor'),(190,'Vitia Stirzaker','Huacheng','China','Apt 1393'),(191,'Ring Reedman','Skien','Norway','Suite 74'),(192,'Paloma Neiland','Kamnica','Slovenia','Suite 6'),(193,'Erwin Tant','Zhenqiao','China','Apt 1003'),(194,'Julita Quincey','Lityn','Ukraine','Suite 34'),(195,'Lonnie Ivashev','Yujin','China','Apt 323'),(196,'Alvie Withrop','La Esperanza','Mexico','Room 715'),(197,'Helaine Brownhall','Dianwan','China','PO Box 36206'),(198,'Garold Davidson','Strasbourg','France','Apt 1155'),(199,'Henrieta Grady','Góra Kalwaria','Poland','Apt 757'),(200,'Tate Leyban','Sunan','North Korea','Room 93'),(201,'Maisie Baudou','Shanban','China','Apt 973'),(202,'Kipper Friary','Susapaya','Peru','PO Box 17070'),(203,'Marjie Ridings','Cilampuyang','Indonesia','PO Box 95513'),(204,'Dorisa Brunel','Landskrona','Sweden','Suite 46'),(205,'Darill Boles','El Pino','Dominican Republic','Suite 23'),(206,'Guthry Frostdick','Zaoxi','China','PO Box 14299'),(207,'Gan Petrushanko','Krajan','Indonesia','Suite 40'),(208,'Laina Adanez','Um Jar Al Gharbiyya','Sudan','18th Floor'),(209,'Forrester Duker','Jiangbu','China','PO Box 73034'),(210,'Ferrel Iashvili','Banga','Philippines','Room 226'),(211,'Ruy Sancraft','Drogomyśl','Poland','Apt 102'),(212,'Ramonda Swepstone','Bordeaux','France','Apt 118'),(213,'Lay Found','Yabluniv','Ukraine','PO Box 51379'),(214,'Deane Waterman','Solkan','Slovenia','Suite 55'),(215,'Darryl Gauford','Metz','France','10th Floor'),(216,'Leanora Saltwell','Giporlos','Philippines','PO Box 63129'),(217,'Quincy Labbati','Campana','Argentina','10th Floor'),(218,'Juli Billsberry','Rayong','Thailand','Suite 88'),(219,'Patten Blackley','San Miguel','Philippines','16th Floor'),(220,'Haven De Maine','Tarnowiec','Poland','17th Floor'),(221,'Lisabeth Crebbin','Madrid','Colombia','10th Floor'),(222,'Randie Deener','Pabuaran','Indonesia','PO Box 18431'),(223,'Lyndy Peatman','Sinilian First','Philippines','19th Floor'),(224,'Frederique Hickeringill','Chishui','China','PO Box 66834'),(225,'Charlton Meneghi','Apeldoorn','Netherlands','Suite 40'),(226,'Jodi Nellis','Santa Adélia','Brazil','Room 925'),(227,'Sumner Jewiss','San Vicente','Philippines','Room 2000'),(228,'Nico Trayhorn','Goczałkowice Zdrój','Poland','Apt 1684'),(229,'Kristofer Jenks','Pecatu','Indonesia','Room 471'),(230,'Wallas Taberer','Dmitriyevka','Russia','14th Floor'),(231,'Janene Penchen','Hongchang','China','Apt 442'),(232,'Aldrich Charrette','Guadalupe','Panama','Suite 9'),(233,'Rorie Corp','Spas’ke','Ukraine','Room 241'),(234,'Jaclin Fildery','Kota Ternate','Indonesia','Room 1808'),(235,'Andromache Rizzardo','Dniprovka','Ukraine','Room 1322'),(236,'Christoph Stirgess','Bujanovac','Serbia','Apt 1816'),(237,'Tripp Kincey','Bandeirantes','Brazil','Suite 73'),(238,'Jeanna Ley','Madrid','Spain','Suite 99'),(239,'Karlis Lodder','Shuiyang','China','Room 745'),(240,'Georgianna Graybeal','Puteaux','France','Suite 65'),(241,'Baxy Iggalden','Kamimaruko','Japan','PO Box 5192'),(242,'Milly MacDonough','Gur’yevsk','Russia','1st Floor'),(243,'Jorrie Weldrick','Glamang','Philippines','Apt 417'),(244,'Taber Sagg','Huangmao','China','Apt 1977'),(245,'Dulsea Gavriel','Trollhättan','Sweden','Suite 18'),(246,'Kilian Kern','Castro','Brazil','PO Box 39940'),(247,'Levin Rix','Reims','France','Room 1600'),(248,'Gaynor O\'Crigane','Qiling','China','11th Floor'),(249,'Sandy Egginson','Dobřany','Czech Republic','PO Box 26413'),(250,'Thomas Dietzler','Dioknisi','Georgia','Apt 742'),(251,'Rustie Bewlay','Vratsa','Bulgaria','Suite 54'),(252,'Stevana Cominello','Pampa Hermosa','Peru','PO Box 16212'),(253,'Demetrius Harker','Colorado Springs','United States','Suite 73'),(254,'Giraud Bardell','Saint-Denis','Reunion','Suite 92'),(255,'Melitta Quarrell','Baimangpu','China','Room 1484'),(256,'Mignon Syms','Bachowice','Poland','Suite 38'),(257,'Jenni Mussen','Himanka','Finland','1st Floor'),(258,'Domeniga Kniveton','Mallawī','Egypt','5th Floor'),(259,'Heriberto Kewzick','Delanggu','Indonesia','Suite 6'),(260,'Etta Calderon','Dashkawka','Belarus','Suite 64'),(261,'Gaspar Dammarell','President Roxas','Philippines','8th Floor'),(262,'Deane Beausang','Kota Kinabalu','Malaysia','Apt 86'),(263,'Rik Filyaev','Bandjoun','Cameroon','Apt 1828'),(264,'Dorice Bowbrick','Mbandaka','Democratic Republic of the Congo','11th Floor'),(265,'Vitoria Woolley','Cova Figueira','Cape Verde','Room 1074'),(266,'Isac Rambadt','Kudirkos Naumiestis','Lithuania','17th Floor'),(267,'Neille Crecy','Kovači','Bosnia and Herzegovina','Apt 329'),(268,'Wakefield Hail','Tokār','Sudan','20th Floor'),(269,'Gwenette De Ferrari','Longbo','China','PO Box 98188'),(270,'Loree Smales','Ladário','Brazil','PO Box 12849'),(271,'Brianne Oxherd','Gualaceo','Ecuador','Room 1897'),(272,'Josefina Danniell','Dan Khun Thot','Thailand','Suite 86'),(273,'Del Etchells','Yelizovo','Russia','Suite 42'),(274,'Engelbert Tolle','Taiping','China','Room 379'),(275,'Darda Kunert','Colinas','Brazil','19th Floor'),(276,'Leola Beglin','Soko','Indonesia','Room 841'),(277,'Cinda Blezard','Yotsukaidō','Japan','PO Box 90921'),(278,'Rowen Clipsham','Changping','China','Room 1040'),(279,'Fleming Ganing','Rivadavia','Argentina','2nd Floor'),(280,'Brooks Van Oort','Bhalil','Morocco','Suite 79'),(281,'Blisse Fitzsimmons','Namysłów','Poland','Room 1413'),(282,'Sammie Russen','Eindhoven','Netherlands','2nd Floor'),(283,'Madelene Monkley','Wangzuo','China','Suite 87'),(284,'Saree Schout','Krychaw','Belarus','Apt 496'),(285,'Creighton Bodill','Vári','Greece','Suite 99'),(286,'Leisha Willetts','Gualeguaychú','Argentina','Suite 11'),(287,'Rafaelita Skippon','Guadalupe Victoria','Mexico','PO Box 16824'),(288,'Jacky Tallent','Yeosu','South Korea','Apt 346'),(289,'Emelita Childrens','Ciherang','Indonesia','18th Floor'),(290,'Barbra Reffe','Kokoshkino','Russia','20th Floor'),(291,'Arlen Steggles','Xinshichang','China','PO Box 70847'),(292,'Bobina Dameisele','Velestíno','Greece','PO Box 27709'),(293,'Valaree O\' Ronan','New York City','United States','PO Box 94163'),(294,'Hector Barratt','Chonogol','Mongolia','Room 875'),(295,'Talya Haggis','Asyūţ','Egypt','18th Floor'),(296,'Rock Allwell','Tungawan','Philippines','PO Box 78937'),(297,'Ferris Ovenell','Soras','Peru','PO Box 55176'),(298,'Jodie Everill','Gedera','Israel','Apt 1688'),(299,'Audi Wayman','Sarzedo','Portugal','Room 57'),(300,'Wandis Grinaugh','Roissy Charles-de-Gaulle','France','Room 1734'),(301,'Paola Ashford','Falköping','Sweden','Suite 70'),(302,'Dale Dalyell','Haapsalu','Estonia','Room 1185'),(303,'Chery Grisley','Koh Kong','Cambodia','PO Box 90512'),(304,'Goober Dorrins','Cojutepeque','El Salvador','Apt 901'),(305,'Wes Markushkin','Sambava','Madagascar','Room 138'),(306,'Quent O\'Loughlin','Dobrljin','Bosnia and Herzegovina','PO Box 84661'),(307,'Fabio Stanyard','Vänersborg','Sweden','Room 383'),(308,'Wrennie Rickwood','Batumi','Georgia','Suite 17'),(309,'Claretta England','Hayil','Saudi Arabia','3rd Floor'),(310,'Marietta Ilott','Boyeros','Cuba','15th Floor'),(311,'Christin Churchley','Colegiales','Argentina','PO Box 80753'),(312,'Bondie Smorthwaite','Fagatogo','American Samoa','Apt 298'),(313,'Martino Proctor','København','Denmark','11th Floor'),(314,'Prisca Bindin','Big Bend','Swaziland','Room 538'),(315,'Jakob Rennox','Jixing','China','Suite 14'),(316,'Griselda Hundley','Zhongyuanlu','China','Room 1338'),(317,'Marnia Siggers','Maumere','Indonesia','PO Box 35322'),(318,'Ki Feechan','Sakon Nakhon','Thailand','PO Box 37537'),(319,'Simona Fegan','New Kingston','Jamaica','Apt 1065'),(320,'Spike Yelden','Pasirhuni','Indonesia','Suite 53'),(321,'Barn Gorling','Massy','France','13th Floor'),(322,'Nicholle Torri','Asprángeloi','Greece','PO Box 76161'),(323,'Jandy Coronado','El Peñol','Colombia','13th Floor'),(324,'Rutter Quilliam','Villa La Angostura','Argentina','Apt 1623'),(325,'Hartley Kevlin','Baturaja','Indonesia','Apt 1585'),(326,'Myrtia Fronks','Karnobat','Bulgaria','Room 947'),(327,'Carlie Celiz','Đồng Mỏ','Vietnam','PO Box 62378'),(328,'Kass Presland','Vicuña','Chile','PO Box 27100'),(329,'Nancie Synnott','Jarošov nad Nežárkou','Czech Republic','12th Floor'),(330,'Hugo Webburn','El Llano','Honduras','Apt 1508'),(331,'Roda De Simone','Lidingö','Sweden','2nd Floor'),(332,'Leland Densell','Turochak','Russia','Suite 25'),(333,'Julieta Bennell','Zengjia','China','16th Floor'),(334,'Waite Burn','Aloleng','Philippines','Suite 56'),(335,'Moises Shailer','Saint-Bruno-de-Guigues','Canada','Suite 87'),(336,'Ekaterina Howden','Huarancante','Peru','Suite 85'),(337,'Tannie Rossander','Hulutao','China','PO Box 70977'),(338,'Brandon Norsworthy','Cumanacoa','Venezuela','Room 461'),(339,'Rodrick Sprasen','Staropyshminsk','Russia','Room 916'),(340,'Bryn Clench','Novobiryusinskiy','Russia','Room 624'),(341,'Devan Ravenhill','San Lorenzo de Esmeraldas','Ecuador','PO Box 96288'),(342,'Blanche Recke','Крушопек','Macedonia','Apt 1336'),(343,'Elise Kleisel','Bobon','Philippines','Room 1804'),(344,'Lori Earthfield','Guapimirim','Brazil','Apt 1440'),(345,'Evin Chadney','Hangchuan','China','15th Floor'),(346,'Gunther Tithacott','Chuchkovo','Russia','Suite 37'),(347,'Clayborn Dufton','Bohutín','Czech Republic','17th Floor'),(348,'Aubine Vanyashkin','Nangerang','Indonesia','Room 1352'),(349,'Hamil Rozier','Décines-Charpieu','France','Room 1055'),(350,'Jeralee Wraggs','Tominian','Mali','Suite 37'),(351,'Ofelia Cassell','Warungbanten','Indonesia','Room 704'),(352,'Ailis Laytham','Tunoshna','Russia','Room 1148'),(353,'Dorthy Moreinis','Zelenogorsk','Russia','Room 1218'),(354,'Simonne Partington','Xunhe','China','Suite 27'),(355,'Shannen Newband','Patrocínio','Brazil','PO Box 28128'),(356,'Nicoline Burnitt','Jinhe','China','Room 575'),(357,'Janenna Sawers','Longkou','China','Room 2000'),(358,'Randell Tokley','Hangbu','China','Room 1485'),(359,'Jourdan Errichiello','Jiucaizhuang','China','8th Floor'),(360,'Norbie Bunch','Gaigeturi','South Korea','Suite 10'),(361,'Gael Preuvost','Alapayevsk','Russia','PO Box 42351'),(362,'Konstanze Bristow','Cuauhtemoc','Mexico','Room 920'),(363,'Ransom Glenny','Santiaoshi','China','PO Box 80043'),(364,'Gilburt Pollendine','Krasnyy Oktyabr’','Russia','16th Floor'),(365,'Kinnie Halpine','Matmata','Morocco','Suite 9'),(366,'Miguel Aleksich','Sorochuco','Peru','PO Box 65180'),(367,'Alyssa Turone','Ralevka','Ukraine','Suite 50'),(368,'Edyth Matyatin','Novoukrainskiy','Russia','Suite 68'),(369,'Sloan Exposito','Ensanche Luperón','Dominican Republic','19th Floor'),(370,'Claiborn Hanham','Shanghudi','China','10th Floor'),(371,'Shandie Mattiussi','Pego Longo','Portugal','Room 1359'),(372,'Meryl Cunney','Arbuzynka','Ukraine','Suite 79'),(373,'Ellis Bainton','Lešná','Czech Republic','Apt 586'),(374,'Ninette McCaighey','Aeka','Indonesia','17th Floor'),(375,'Maggi Blacktin','Landskrona','Sweden','Suite 76'),(376,'Tedda Ruegg','Nelspruit','South Africa','6th Floor'),(377,'Clyve Tissiman','Proletarsk','Russia','Suite 89'),(378,'Nananne Margarson','Neuquén','Argentina','14th Floor'),(379,'Chane Boxall','San Antonio Oeste','Argentina','PO Box 71248'),(380,'Petronia Guyon','Gunan','China','Room 159'),(381,'Leeann Crapper','Datong','China','Suite 92'),(382,'Laney Garrelts','Fengyi','China','18th Floor'),(383,'Lynett MacCaig','Ōbu','Japan','17th Floor'),(384,'Freedman Petheridge','Castro','Brazil','Room 1484'),(385,'Delores Clohissy','Sliema','Malta','PO Box 19113'),(386,'Jacky Teodorski','Krahës','Albania','Room 290'),(387,'Edith Schukert','Ludza','Latvia','Suite 57'),(388,'Danie Heskins','An Nāşirah','Syria','11th Floor'),(389,'Klement Cutler','Sidokumpul','Indonesia','11th Floor'),(390,'Dominique Follet','Chenzhuang','China','Room 165'),(391,'Bordy Lumsdaine','Boshof','South Africa','PO Box 68279'),(392,'Der McCuish','Gununganyar','Indonesia','Apt 774'),(393,'Nikoletta Skokoe','Hajnówka','Poland','10th Floor'),(394,'Lisbeth Carass','Secunda','South Africa','Apt 1624'),(395,'Reine Orr','Shengli','China','PO Box 88465'),(396,'Katey Larrosa','Thị Trấn Việt Lâm','Vietnam','6th Floor'),(397,'Shirlene Scanes','La Plata','Colombia','Room 891'),(398,'Arlyne Pearlman','Gaohu','China','Room 157'),(399,'Meris Dibson','Wasior','Indonesia','1st Floor'),(400,'Birgit Wingham','Kopang Satu','Indonesia','16th Floor'),(401,'Emmaline Ranyell','Axili','China','Room 636'),(402,'Ingar Armin','Xiaosong','China','2nd Floor'),(403,'Sigvard Hargrave','Royan','France','Suite 92'),(404,'Allis Hailston','La Cuesta','Peru','Apt 855'),(405,'Stanly Hutt','Filothéi','Greece','11th Floor'),(406,'Lorne Gammidge','Marzhing','China','Suite 37'),(407,'Johnette Rothery','Paso de Indios','Argentina','Apt 978'),(408,'Joye Chick','Velká Polom','Czech Republic','Suite 2'),(409,'Alida Hoodless','Fangxian','China','Apt 311'),(410,'Omar Matteucci','Luleå','Sweden','Apt 314'),(411,'Mohandas Hollows','Cerna','Croatia','10th Floor'),(412,'Emmie Woolfitt','Tampere','Finland','Room 128'),(413,'Letti Tylor','Mādārīpur','Bangladesh','Apt 722'),(414,'Sheree Speachley','Karlovy Vary','Czech Republic','Room 1078'),(415,'Engracia Aimer','Lázně Kynžvart','Czech Republic','4th Floor'),(416,'Oren Defries','Maloye Verevo','Russia','Apt 1597'),(417,'Rodie Balstone','Damiao','China','Apt 1673'),(418,'Erv Peniman','Lozova','Ukraine','Room 1869'),(419,'Elyssa Vaud','Xinxikou','China','Apt 483'),(420,'Kermy Pipkin','Gryfino','Poland','Suite 61'),(421,'Nessie Sugar','Sobreira','Portugal','PO Box 18579'),(422,'Kelwin Tunn','Luleå','Sweden','Apt 22'),(423,'Harli Matzkaitis','Zhili','China','PO Box 6644'),(424,'Corri Giblett','Qobustan','Azerbaijan','11th Floor'),(425,'Seka Costi','Daying','China','PO Box 28666'),(426,'Dalia Pitkin','Pulopaya','Indonesia','Apt 1102'),(427,'Marlee Tedridge','Rendian','China','Suite 68'),(428,'Ginnie Eslemont','Marulanda','Colombia','Room 1172'),(429,'Beilul Van Arsdall','Kladanj','Bosnia and Herzegovina','Room 1707'),(430,'Jeff Lintot','Gumel','Nigeria','Room 1099'),(431,'Ignazio Silverstone','Värnamo','Sweden','5th Floor'),(432,'Trish Donet','Kuala Baru','Indonesia','Apt 447'),(433,'Talia Reynoldson','Matam','Senegal','Room 1166'),(434,'Andriana Halgarth','Yingwusitang','China','Apt 1560'),(435,'Giacobo Lamey','León','Nicaragua','Suite 80'),(436,'Giorgi Hubbis','Vilque Chico','Peru','8th Floor'),(437,'Zita Eyree','Lisboa','Portugal','Apt 1278'),(438,'Lelah Eisak','Zarqa','Jordan','Apt 1761'),(439,'Tore Babst','Houmen','China','PO Box 47286'),(440,'Gardy McTrustie','Tarakan','Indonesia','Suite 4'),(441,'Jeannine Armatage','Marneuli','Georgia','Suite 2'),(442,'Vachel Gresswood','Ma Đa Gui','Vietnam','8th Floor'),(443,'Yurik Tryme','Red Hill','New Zealand','4th Floor'),(444,'Louis Swedeland','Nanggewer','Indonesia','8th Floor'),(445,'Murial Tainton','Qufu','China','PO Box 50653'),(446,'Eba Brugmann','Qīr Moāv','Jordan','Room 270'),(447,'Liliane Werrilow','Taishanmiao','China','Room 1771'),(448,'Allie Guy','Nové Sedlo','Czech Republic','2nd Floor'),(449,'Kerk Ertel','Pointe-Noire','Republic of the Congo','Suite 38'),(450,'Noella Kimmitt','Sychëvo','Russia','Apt 208'),(451,'Effie Wemm','Prado','Brazil','Apt 1430'),(452,'Bill Alven','Suining','China','Apt 1040'),(453,'Sandra Widdocks','Porecatu','Brazil','1st Floor'),(454,'Saxe Monks','Yayao','China','PO Box 12081'),(455,'Loleta Raise','Dobšice','Czech Republic','PO Box 17774'),(456,'Inigo Leggitt','Pervomayskoye','Russia','9th Floor'),(457,'Harald Halbeard','Roxas','Philippines','18th Floor'),(458,'Terrie Edson','Sanxi','China','8th Floor'),(459,'Dorris Benninck','Jinhai','China','Suite 18'),(460,'Melody Pinnell','Yinghai','China','5th Floor'),(461,'Kailey Egar','Doushan','China','PO Box 59660'),(462,'Maurita Jeafferson','Hakodate','Japan','15th Floor'),(463,'Renault Rubenovic','Gerong','Indonesia','Apt 1202'),(464,'Dodi Raspel','Zhongba','China','Room 1314'),(465,'Dickie Giacopini','Xin’e','China','Room 1819'),(466,'Ezmeralda Gallant','Sidomekar','Indonesia','7th Floor'),(467,'Marius Luciano','Batarasa','Philippines','Room 1172'),(468,'Fifine Manolov','Barg-e Matāl','Afghanistan','Apt 1646'),(469,'Nannette Newcom','Lazaro Cardenas','Mexico','9th Floor'),(470,'Addi Sayer','Varkaus','Finland','Apt 787'),(471,'Chandra Donaghy','Granville','France','1st Floor'),(472,'Lane Beazer','Örebro','Sweden','12th Floor'),(473,'Valentijn Pead','Seixas','Portugal','Suite 93'),(474,'Giulia Curle','Oleiros','Portugal','Apt 541'),(475,'Nara Riddiough','Dapchi','Nigeria','Suite 7'),(476,'Brett Hallam','Castelo','Portugal','PO Box 80023'),(477,'Valeda Nineham','Jagna','Philippines','5th Floor'),(478,'La verne Janoch','Granard','Ireland','17th Floor'),(479,'Isa Pady','Baoquanshan','China','PO Box 59165'),(480,'Nanete Starford','Jiatou','China','Suite 30'),(481,'Lanna Arnaldi','Maltahöhe','Namibia','PO Box 13383'),(482,'Davon McSporrin','Ciladaeun','Indonesia','Apt 519'),(483,'Freddy Roubottom','Colquechaca','Bolivia','10th Floor'),(484,'Laraine Waldocke','Palmas','Brazil','Suite 39'),(485,'Gauthier Godsell','Vangaži','Latvia','PO Box 71792'),(486,'Forrest Clute','Karinë','Albania','Room 473'),(487,'Ari Dallin','Gafanha de Aquém','Portugal','Suite 88'),(488,'Angeli Geeson','Desē','Ethiopia','PO Box 89533'),(489,'Fabiano Phonix','Sedayu','Indonesia','3rd Floor'),(490,'Vaclav Labram','Ramos','Philippines','Apt 875'),(491,'Guillemette Druhan','Kirovsk','Russia','Suite 77'),(492,'Ambrosio Gouinlock','Yulin','China','PO Box 80176'),(493,'Daryle Gleed','Veselí nad Moravou','Czech Republic','Suite 96'),(494,'Parker Conachy','Soraya','Peru','Suite 36'),(495,'Anica Adriani','Fagersta','Sweden','PO Box 97075'),(496,'Eolande Janatka','Butterworth','Malaysia','Room 929'),(497,'Clea Griffoen','Balauring','Indonesia','Room 1854'),(498,'Gardner De Bischop','Pinhal Novo','Portugal','PO Box 68784'),(499,'Maxwell Lannen','Norrköping','Sweden','Room 1391'),(500,'Ninette MacFadin','Arteche','Philippines','PO Box 15893'),(501,'Alley Perree','El Olivar','Honduras','3rd Floor'),(502,'Aurore Minister','Yunmenling','China','16th Floor'),(503,'Montague Jennick','Sapouy','Burkina Faso','Suite 76'),(504,'Panchito Manzell','Palangkaraya','Indonesia','11th Floor'),(505,'Dal McNab','Pleshanovo','Russia','Room 1672'),(506,'Patton Kornyshev','Sitovo','Bulgaria','PO Box 34769'),(507,'Josselyn Vallender','Iba','Philippines','Suite 96'),(508,'Leslie Laidlaw','Kore','Indonesia','PO Box 1875'),(509,'Delmor Cusworth','Obonoma','Nigeria','14th Floor'),(510,'Harv Jeannon','Pattani','Thailand','Room 847'),(511,'Wally Noen','Qixia','China','Suite 22'),(512,'Brew Laible','Moshenskoye','Russia','Apt 984'),(513,'Laurene Cicullo','Kortowo','Poland','2nd Floor'),(514,'Eddie Hobgen','Lago da Pedra','Brazil','PO Box 35384'),(515,'Alfredo Draisey','Conroe','United States','Suite 57'),(516,'Kahaleel Naton','Izyaslav','Ukraine','Apt 1472'),(517,'Trefor Vibert','Novosineglazovskiy','Russia','Apt 634'),(518,'Giselle Darque','Monte Azul Paulista','Brazil','Apt 1929'),(519,'Ingrid Kleingrub','Jinshi','China','Apt 528'),(520,'Brigitta Ladbrook','Broshniv-Osada','Ukraine','20th Floor'),(521,'Stefa Lytle','Richmond','United States','Room 1279'),(522,'Leese Dowbiggin','Daciyao','China','Room 157'),(523,'Merrill Mathet','Telukpakedai','Indonesia','Room 62'),(524,'Terri Woodburn','Cipari','Indonesia','PO Box 451'),(525,'Gilly Aldington','Dobrošte','Macedonia','Apt 1706'),(526,'Rozina Ales','Pacajus','Brazil','7th Floor'),(527,'Leta Leaney','Al Qanāţir al Khayrīyah','Egypt','Room 781'),(528,'Carina Baszniak','Yongchang','China','Room 958'),(529,'Athena Whyte','Bandar-e ‘Asalūyeh','Iran','PO Box 74138'),(530,'Courtney Leighfield','Baojiadian','China','7th Floor'),(531,'Kerby Wooding','Pokrov','Russia','Apt 254'),(532,'Gwenni Starkings','Clearwater','United States','Apt 1483'),(533,'Ardine Matteini','Narvacan','Philippines','Room 45'),(534,'Wain Padberry','Tuanjie','China','PO Box 3626'),(535,'Tammy Burhouse','Ma’ao','China','Apt 1286'),(536,'Hoyt Bretelle','Newmarket on Fergus','Ireland','Apt 1598'),(537,'Annora Skerritt','Lishu','China','Room 1543'),(538,'Michale Skuse','Mtwara','Tanzania','Room 334'),(539,'Faina Caffery','Ośno Lubuskie','Poland','Suite 46'),(540,'Nathan Gutch','Aime','France','Apt 1753'),(541,'Leese Vinnick','Santiago De Compostela','Spain','3rd Floor'),(542,'Carissa Adrain','Menanga','Indonesia','PO Box 76651'),(543,'Cirilo Polle','Digne-les-Bains','France','11th Floor'),(544,'Clea Veitch','Ketapang','Indonesia','Suite 30'),(545,'Bethena Corish','Bol’shaya Setun’','Russia','5th Floor'),(546,'Eddie Camamill','Shangtianba','China','Room 1962'),(547,'Kitti Camell','Castelo','Brazil','Apt 232'),(548,'Amber Parkman','Heqing','China','Apt 1346'),(549,'Carlin Scottrell','Hortolândia','Brazil','7th Floor'),(550,'Katrine Oleshunin','Živinice','Bosnia and Herzegovina','Suite 17'),(551,'Freddy Bailess','Hongos','Peru','Apt 196'),(552,'Hillyer Goodbourn','Longhua','China','PO Box 82937'),(553,'Haroun Casey','La Estancia','Honduras','PO Box 53959'),(554,'Eudora Padilla','Trollhättan','Sweden','Room 1639'),(555,'Lorilyn Donoghue','Huangjia','China','Apt 255'),(556,'Ilse Bulstrode','Lāliān','Pakistan','Apt 1645'),(557,'Theresa Hellis','Mamurras','Albania','Apt 16'),(558,'Valentine Sever','Ruse','Bulgaria','16th Floor'),(559,'Bethena Braitling','Santo Ângelo','Brazil','Suite 53'),(560,'Cornie Inge','Sarilhos Grandes','Portugal','Room 540'),(561,'Anthony Hauger','Sukaraja','Indonesia','Apt 135'),(562,'Gena Knappitt','Pak Chom','Thailand','PO Box 35629'),(563,'Germaine Pykerman','Mpanda','Tanzania','Suite 53'),(564,'Julietta Alen','Sankeng','China','Room 1804'),(565,'Wendell Leving','Phú Túc','Vietnam','Room 197'),(566,'Kathi Wethey','Prislonica','Serbia','PO Box 77136'),(567,'Artur Vasilyonok','Siwa Oasis','Egypt','Suite 36'),(568,'Chloe Bartolini','Calvaria de Baixo','Portugal','PO Box 99626'),(569,'Susi Osban','Łętownia','Poland','PO Box 67564'),(570,'Cleopatra Burgon','Jajaway','Indonesia','Suite 52'),(571,'Marti Thornhill','Stanisław Dolny','Poland','10th Floor'),(572,'Robbert Geldart','Yermolino','Russia','Suite 1'),(573,'Moyna Loos','Edissiya','Russia','PO Box 53974'),(574,'Britta Camelli','Molagavita','Colombia','Room 328'),(575,'Carly Hands','Krapivna','Russia','12th Floor'),(576,'Clay Bier','Morfovoúni','Greece','PO Box 97101'),(577,'Cassandry Mazin','Whitwell','United Kingdom','17th Floor'),(578,'Hansiain Rosas','Rietavas','Lithuania','Apt 502'),(579,'Gayle Julian','Dingbao','China','Room 1408'),(580,'Myca Ivashov','Silab','Philippines','PO Box 68258'),(581,'Arri Peeke-Vout','Gumalang','Philippines','19th Floor'),(582,'Lusa Boulsher','Novoderevyankovskaya','Russia','PO Box 62003'),(583,'Clementine Tiddeman','Votkinsk','Russia','Suite 55'),(584,'Petunia De Hailes','Santa Marta de Penaguião','Portugal','7th Floor'),(585,'Laverna Rossbrook','Saint-Constant','Canada','Apt 1147'),(586,'Allyce Shepton','Qingjiangqiao','China','PO Box 43097'),(587,'Valentine Eisikowitz','Syamzha','Russia','9th Floor'),(588,'Rubi Kermode','Gniezno','Poland','Room 1144'),(589,'Stewart Banks','Xinning','China','Apt 1840'),(590,'Barbee Edge','Piranshahr','Iran','Suite 54'),(591,'Robinetta Levin','Pamedilan','Indonesia','5th Floor'),(592,'Olenolin Langmuir','Nanjing','China','Suite 77'),(593,'Trenna Saddler','Arīḩā','Syria','PO Box 52819'),(594,'Bartram Antoni','Rongelap','Marshall Islands','17th Floor'),(595,'Bronnie Corris','Brazzaville','Republic of the Congo','Suite 20'),(596,'Tristan Eicheler','Meilong','China','PO Box 28852'),(597,'Hart Trim','Yelizavetino','Russia','Room 1886'),(598,'Loria Yukhnevich','Daloa','Ivory Coast','Room 1803'),(599,'Raychel Pavinese','Xiangrong','China','Apt 1578'),(600,'Carmelia Ambrosini','Zamboanguita','Philippines','Room 962'),(601,'Sarita Kippie','Bình Thủy','Vietnam','Room 1490'),(602,'Polly Latour','Bandar-e Ganāveh','Iran','5th Floor'),(603,'Eustacia Local','Sacramento','United States','Apt 1743'),(604,'Stearne Wimpress','Jiangpan','China','Room 1355'),(605,'Melinda Southard','Nkayi','Republic of the Congo','Suite 30'),(606,'Anjela Pattlel','Zhangatas','Kazakhstan','Suite 30'),(607,'Barnie Oppie','Coaraci','Brazil','Room 1825'),(608,'Nari Meynell','Krebetkrajan','Indonesia','PO Box 60372'),(609,'Xena Jacquot','Huanglin','China','Room 276'),(610,'Faydra Guierre','Song’ao','China','Suite 8'),(611,'Dory Lemmertz','Wuquan','China','4th Floor'),(612,'Candra Arnot','Semongkat','Indonesia','Apt 1566'),(613,'Sabine Broomhead','Gravataí','Brazil','PO Box 153'),(614,'Cristen Claypool','Laojiangjunjie','China','Room 1186'),(615,'Manda Perigeaux','Jiuhu','China','PO Box 68081'),(616,'Noland Spratling','Kiarajangkung','Indonesia','PO Box 74052'),(617,'Lindsay Warren','Gjegjan','Albania','12th Floor'),(618,'Modesta Rodway','Radnice','Czech Republic','PO Box 29805'),(619,'Allin Cotman','Jacaltenango','Guatemala','Suite 90'),(620,'Opaline Rasp','Zhaigang','China','Apt 1936'),(621,'Nil Lyptratt','Olszówka','Poland','Room 1931'),(622,'Diahann Carrack','Macaíba','Brazil','Room 1423'),(623,'Shelley Kettlestringes','Guatire','Venezuela','Suite 60'),(624,'Win Pavlovsky','Lahuaytambo','Peru','Suite 70'),(625,'Torrence Welsby','Xushangqiao','China','Room 284'),(626,'Riva Goulthorp','Tuanchengshan','China','PO Box 32510'),(627,'Tyson Street','Las Lomas','Panama','Room 1766'),(628,'Tiffanie Scurfield','Vozuća','Bosnia and Herzegovina','15th Floor'),(629,'Alon Tennock','Wushishi','Nigeria','PO Box 95462'),(630,'Leupold Cubbinelli','Cahors','France','PO Box 80906'),(631,'Evvy Starkings','Jam','Iran','1st Floor'),(632,'Nappie Meads','Berlin','Germany','PO Box 80292'),(633,'Daryn Folbige','São Francisco do Sul','Brazil','PO Box 32108'),(634,'Othilia Simond','Curuzú Cuatiá','Argentina','7th Floor'),(635,'Friederike Gradon','Panolan','Indonesia','Apt 1513'),(636,'Desiri Gartsyde','Milovice','Czech Republic','10th Floor'),(637,'Addi Rowbrey','Madagali','Nigeria','Apt 278'),(638,'Norris Kubasiewicz','Morelos','Mexico','Apt 577'),(639,'Jehanna Leighfield','Xiluodu','China','Room 1587'),(640,'Daria Vardon','Byala','Bulgaria','Suite 5'),(641,'Danica Shilleto','Xinpeicun','China','Suite 3'),(642,'Guy Du Plantier','Huangqiang','China','Suite 4'),(643,'Bobbye Ghioni','Durham','United States','Room 1681'),(644,'Saw Wrightem','Billdal','Sweden','Suite 61'),(645,'Glynn Thecham','Grabovci','Croatia','Room 480'),(646,'Grissel Lideard','Inya','Russia','Apt 1518'),(647,'Uri Tonkes','Yutou','China','Room 1262'),(648,'Ginger Cheetham','Feteira Pequena','Portugal','Apt 673'),(649,'Bret Gloster','Huallanca','Peru','PO Box 64593'),(650,'Zolly Stobie','Quxi','China','Apt 15'),(651,'Rochella Coping','Velyki Sorochyntsi','Ukraine','PO Box 54516'),(652,'Orv Shegog','Malax','Finland','2nd Floor'),(653,'Katleen Rolf','Kumlinge','Aland Islands','Room 1547'),(654,'Lars Bowering','Sison','Philippines','PO Box 98627'),(655,'Myles Goodreid','Yinla','China','Apt 1089'),(656,'Sibelle Poundesford','Jezzîne','Lebanon','PO Box 72357'),(657,'Bertram Glencrash','Saint-Joseph-de-Coleraine','Canada','Apt 1891'),(658,'Octavia McIntee','Baishan','China','Apt 306'),(659,'Domenic Looney','Frankfort','South Africa','Apt 476'),(660,'Farah Suthren','Skoura','Morocco','Suite 4'),(661,'Wylie Mudie','Syktyvkar','Russia','Apt 1952'),(662,'Loleta Scarf','Shajing','China','Room 1305'),(663,'Allayne Foan','Wola Uhruska','Poland','PO Box 51798'),(664,'Alana Flecknell','Sophia Antipolis','France','1st Floor'),(665,'Jervis Killimister','Bílina Kyselka','Czech Republic','Suite 42'),(666,'Kincaid Ovendale','Lamía','Greece','18th Floor'),(667,'Thornton Kiddy','Néa Pélla','Greece','Suite 97'),(668,'Morlee Yakushkin','Oqtosh','Uzbekistan','19th Floor'),(669,'Markos Langan','Sandefjord','Norway','Room 185'),(670,'Leonelle Lawrence','Krasnogorskiy','Russia','3rd Floor'),(671,'Shadow Kippins','Haduohe','China','Suite 31'),(672,'Leona Clixby','Valkeakoski','Finland','PO Box 44497'),(673,'Louisa Orbell','Ludwin','Poland','PO Box 13633'),(674,'Chrystal Scotti','Los Pinos','Mexico','Apt 611'),(675,'Lars Hagergham','Roermond','Netherlands','Suite 75'),(676,'Amalita Danilovich','Sendung','Indonesia','Apt 1420'),(677,'Rozalin Esley','Tanjungluar','Indonesia','PO Box 93245'),(678,'Jasper Thrift','Xieji','China','PO Box 29413'),(679,'Warner Vayro','San Juan','Philippines','Suite 83'),(680,'Isaiah Thurlow','Itapeva','Brazil','Apt 1332'),(681,'Elena Rhelton','Ostrov','Czech Republic','Room 1045'),(682,'Nester Pimbley','Resapombo','Indonesia','2nd Floor'),(683,'Ettie Swalwell','Acandí','Colombia','Apt 1001'),(684,'Karoline Blazhevich','Wintzenheim','France','PO Box 40162'),(685,'Benetta Hector','Ochër','Russia','Room 187'),(686,'Rhoda McLauchlin','Mehrān','Iran','Suite 46'),(687,'Kimmie Reihill','Kotabesi','Indonesia','PO Box 67479'),(688,'Korella Fergyson','Jistebnice','Czech Republic','11th Floor'),(689,'Lester Rees','Masinloc','Philippines','Room 1230'),(690,'Em Risbridge','Suodenniemi','Finland','Suite 32'),(691,'Janessa Raffeorty','Tsuyama','Japan','20th Floor'),(692,'Ottilie Borges','Guanting','China','Suite 44'),(693,'Aaron Petren','Spytkowice','Poland','PO Box 67047'),(694,'Palm Cumber','San Agustín','El Salvador','Room 1411'),(695,'Russ Digle','Burgaltay','Mongolia','PO Box 2796'),(696,'Anselm Tantum','Hvozdná','Czech Republic','PO Box 78030'),(697,'Farrell Whyborne','Qarah Bāgh Bāzār','Afghanistan','3rd Floor'),(698,'Dona Cornborough','San Antonio','Colombia','17th Floor'),(699,'Garek Tzar','Tūkrah','Libya','Suite 53'),(700,'Agnola Matuszak','Palca','Peru','Suite 1'),(701,'Mic Flecknell','Taywanak Ilaya','Philippines','PO Box 98086'),(702,'Maggee Coysh','Zanjān','Iran','Apt 507'),(703,'Belvia Lerer','Várzea Alegre','Brazil','Apt 1938'),(704,'Ernestus Olyunin','Delta del Tigre','Uruguay','Apt 562'),(705,'Lari Studdert','Niulanshan','China','Room 499'),(706,'Emmery Rushby','Ninghai','China','15th Floor'),(707,'Brewster Giacopello','Stockholm','Sweden','Room 989'),(708,'Allen Klemenz','Pulong Gubat','Philippines','PO Box 69080'),(709,'Timoteo Killock','Gumi','South Korea','PO Box 88021'),(710,'Yovonnda Stendell','Dharān Bāzār','Nepal','2nd Floor'),(711,'Ninnette Boffin','Tanjungpati','Indonesia','Room 954'),(712,'Park Guthrum','Yunfu','China','Suite 91'),(713,'Tani Pratt','Kotlas','Russia','Suite 50'),(714,'Timmy Masham','Cojata','Peru','Room 107'),(715,'Odessa Joselovitch','Ilha Solteira','Brazil','14th Floor'),(716,'Helge Hawkett','Sumbersari Wetan','Indonesia','10th Floor'),(717,'Madella Richardt','Kampungladang','Indonesia','Suite 82'),(718,'Klarika Hamberstone','Aygestan','Armenia','Apt 1851'),(719,'Steven Yurikov','Staré Město','Czech Republic','Room 454'),(720,'Rufus Layhe','Uspenka','Ukraine','7th Floor'),(721,'Lowe Gillyatt','Dama','China','Apt 288'),(722,'Cinda Lerway','Miami','United States','20th Floor'),(723,'Ignacius Kleehuhler','Prince Albert','Canada','Suite 8'),(724,'Thedrick McIlmorow','Altos','Brazil','PO Box 58681'),(725,'Ortensia Ottawell','Muruni','Indonesia','19th Floor'),(726,'Kerk Ouchterlony','Xinxian','China','PO Box 21483'),(727,'Violette Littlejohns','Kallithéa','Greece','Room 196'),(728,'Helene Flieg','Aryiropoúlion','Greece','PO Box 54228'),(729,'Vonnie McClaren','Pasirtundun','Indonesia','Apt 682'),(730,'Rhonda Mathiassen','Nanyang','China','Apt 1016'),(731,'Izabel Meadowcraft','Kiaranonggeng','Indonesia','PO Box 87860'),(732,'Lindy Tesauro','Sishilichengzi','China','Room 1555'),(733,'Nell Blaza','Kangān','Iran','11th Floor'),(734,'Aubree Necrews','Ameixoeira','Portugal','PO Box 35537'),(735,'Caren Marrison','El Carmen de Bolívar','Colombia','Suite 52'),(736,'Westley Boecke','Moss','Norway','7th Floor'),(737,'Cozmo Betts','Arnprior','Canada','19th Floor'),(738,'Greta Hainning','Yanhe','China','PO Box 71431'),(739,'Torin Nary','Upernavik','Greenland','Suite 74'),(740,'Octavius Speedy','Yenakiyeve','Ukraine','PO Box 333'),(741,'Ninette Pietasch','San Nicolas','Philippines','Suite 96'),(742,'Aldon Absolem','Daxing','China','PO Box 25277'),(743,'Ody Gannicleff','Conde','Brazil','Apt 1416'),(744,'Tome Got','Yulin','China','Apt 1182'),(745,'Justine Darbey','Caucagüito','Venezuela','15th Floor'),(746,'Fannie Copcutt','Correntina','Brazil','PO Box 15309'),(747,'Jan Bateman','Ryki','Poland','Suite 18'),(748,'Montague Seakes','Hedong','China','Apt 1'),(749,'Siouxie Newton','Limoges','France','11th Floor'),(750,'Clo Jarmyn','San Vicente','Philippines','Suite 41'),(751,'Agretha Welton','Kralice na Hané','Czech Republic','Apt 432'),(752,'Robena Sollis','Wutong','China','PO Box 922'),(753,'Jemie Greenman','Maswarah','Yemen','PO Box 62753'),(754,'Christalle Phizakarley','Jorok Dalam','Indonesia','16th Floor'),(755,'Candida Schubert','Shangshuai','China','13th Floor'),(756,'Maisie Chese','Tatuí','Brazil','PO Box 25402'),(757,'Nicolina Giuron','Semang','Indonesia','4th Floor'),(758,'Caron Pendre','Aanislag','Philippines','Room 60'),(759,'Belia Hender','San Ignacio de Tupile','Panama','Suite 14'),(760,'Sherill Leare','Santo Adrião Vizela','Portugal','Apt 1765'),(761,'Hunt Peschet','Kebon','Indonesia','PO Box 57417'),(762,'Juliann Janous','Karjalohja','Finland','Suite 9'),(763,'Annabella Blankau','Sukhirin','Thailand','Suite 62'),(764,'Ainslie Lymer','Rongelap','Marshall Islands','Apt 516'),(765,'Shep Korn','Baltimore','United States','Apt 1464'),(766,'Dore Pring','Palmar de Varela','Colombia','Suite 28'),(767,'Rouvin Nary','Barra de São Francisco','Brazil','Room 226'),(768,'Hannis Monnelly','Mbalmayo','Cameroon','19th Floor'),(769,'Torr Readmire','Liješnica','Bosnia and Herzegovina','6th Floor'),(770,'Florenza Bertholin','Quankou','China','Apt 1292'),(771,'Chase Staunton','Istres','France','Apt 427'),(772,'Agnese Labusch','Mingzhong','China','4th Floor'),(773,'Lenard McIlreavy','Tiantai','China','Apt 946'),(774,'Shurlock Cattroll','Hairag','China','Room 1406'),(775,'Phyllys Lorand','Purísima','Colombia','Room 220'),(776,'Lemar Senechell','Hongkeli','China','5th Floor'),(777,'Hal Bussey','Cipari','Indonesia','PO Box 52977'),(778,'Ravid Laver','Qingping','China','Room 900'),(779,'Harley Mellhuish','Caeté','Brazil','Room 1244'),(780,'Devonna Daggett','Bergen','Norway','PO Box 42782'),(781,'Reagan Instock','Gaoyi','China','PO Box 58496'),(782,'Adria Ahlin','Bakersfield','United States','Apt 1464'),(783,'Earl Ralls','Zhonghuopu','China','Apt 1028'),(784,'Tawsha McKenney','Passagem','Portugal','Room 5'),(785,'Ram Ferenc','Baoziba','China','Suite 73'),(786,'Alyse Ellwand','Patabog','Philippines','Suite 23'),(787,'Norina Boyett','Sakado','Japan','PO Box 76591'),(788,'Stephine Wattingham','Amgalang','China','3rd Floor'),(789,'Rubetta Gabb','Vilufushi','Maldives','PO Box 66005'),(790,'Beckie Emmott','Pelileo','Ecuador','Room 1599'),(791,'Denys Lensch','Yurimaguas','Peru','Suite 4'),(792,'Dionysus Lightbown','Visby','Sweden','PO Box 62748'),(793,'Brigida Grunwald','Napoles','Philippines','Apt 1983'),(794,'Bartel Syson','Tieremu','China','3rd Floor'),(795,'Piggy Peschet','Capitán Bado','Paraguay','Suite 76'),(796,'Dorita Labba','Mandala','Indonesia','Room 1516'),(797,'Vincenty Khomishin','Jaguimitan','Philippines','9th Floor'),(798,'Lilian Scarrisbrick','Santa Teresita','Philippines','4th Floor'),(799,'Jehu Tichelaar','Hässelby','Sweden','18th Floor'),(800,'Hartley Hellyer','Gwangju','South Korea','3rd Floor'),(801,'Lorry Titta','Quinta','Portugal','1st Floor'),(802,'Arabella Linden','Lagoa','Portugal','Suite 90'),(803,'Simonette Wesson','Ikang','Nigeria','PO Box 43175'),(804,'Dorotea Molen','Haumeni','Indonesia','10th Floor'),(805,'Eduardo Sarrell','Viçosa','Brazil','Room 1703'),(806,'Adele Capun','Białośliwie','Poland','Suite 13'),(807,'Wheeler Trustie','Ajman','United Arab Emirates','PO Box 32967'),(808,'Idette Toor','Cabalawan','Philippines','Apt 1283'),(809,'Irving Baff','Gualeguaychú','Argentina','PO Box 31486'),(810,'Jill Craxford','Shupenzë','Albania','PO Box 3173'),(811,'Quintus Minster','Ban Ratsada','Thailand','Suite 11'),(812,'Ailsun Dobbson','Badīn','Pakistan','Suite 94'),(813,'Orran Stonestreet','Pontivy','France','Suite 68'),(814,'Brigit MacGarrity','Filótion','Greece','16th Floor'),(815,'Maddalena Renvoys','Nerk’in Getashen','Armenia','Room 597'),(816,'Timothy Flecknell','Xiaoling','China','Apt 1793'),(817,'Barton Looks','Issad','Russia','Room 1079'),(818,'Haydon Coupland','Lasehao','Indonesia','Apt 554'),(819,'Mickie Pelzer','Zhuravka','Ukraine','PO Box 25649'),(820,'Cristi Tremellan','Hannover','Germany','Room 1972'),(821,'Audrie Emmot','Vũ Thư','Vietnam','Apt 666'),(822,'Jeanette Proppers','Lanyang','China','Apt 330'),(823,'Kermit Despenser','Youguzhuang','China','Apt 429'),(824,'Nadean Harbidge','Khūgyāṉī','Afghanistan','Room 263'),(825,'Rosalynd Keelin','Torslanda','Sweden','Suite 59'),(826,'Maryjane Weben','Bahāwalnagar','Pakistan','Suite 37'),(827,'Gallagher Girardez','Kudanding','Philippines','Apt 547'),(828,'Deeyn Fasey','Catac','Peru','PO Box 12612'),(829,'Aurel Philbrook','Thiers','France','Room 545'),(830,'Athene Grute','Yashao','China','PO Box 48943'),(831,'Nico Hendrikse','Praia do Ribatejo','Portugal','Room 1673'),(832,'Alwin Cowp','Villejuif','France','Room 610'),(833,'Fitz Atyeo','Taywanak Ilaya','Philippines','Suite 84'),(834,'Erhart Brumfitt','Argostólion','Greece','PO Box 93269'),(835,'Minerva Purkis','Cochabamba','Peru','PO Box 17664'),(836,'Staford O\'Fogarty','E’zhou','China','Apt 661'),(837,'Currey Maccrea','Penja','Cameroon','2nd Floor'),(838,'Hildagarde Parkman','San Isidro','Philippines','PO Box 44874'),(839,'Cathyleen Gutsell','Shiyuan','China','PO Box 97039'),(840,'Stacia Marran','Yangpu','China','Room 965'),(841,'Rubie Lempke','Balite','Philippines','Apt 718'),(842,'Tito Leathwood','Samsan','South Korea','PO Box 83262'),(843,'Modesty Boik','Vuokatti','Finland','Room 1451'),(844,'Christoper Sigg','Beizi','China','Suite 55'),(845,'Shelton Littlepage','Biris Daja','Indonesia','9th Floor'),(846,'Zaria Wilce','Aco','Peru','Room 1541'),(847,'Dwain Treadger','Huangdao','China','8th Floor'),(848,'Felice Cawthorne','Soweto','South Africa','Room 461'),(849,'Leda Ruddock','Banjar Pekandelan','Indonesia','Suite 46'),(850,'Eleanor Shurrocks','Soly','Belarus','Room 1252'),(851,'Mercie Branigan','Varennes','Canada','PO Box 35312'),(852,'Kimberly Collelton','Chivhu','Zimbabwe','Suite 79'),(853,'Trish Keilloh','Zhongshan','China','11th Floor'),(854,'Mommy Turley','Voi','Kenya','Suite 9'),(855,'Dillon O\'Griffin','Kalāt','Pakistan','Suite 40'),(856,'Patrice Otto','Phong Điền','Vietnam','Room 792'),(857,'Jenine Bathoe','Lindavista','Mexico','Suite 25'),(858,'Max Stutte','Liushun','China','Room 847'),(859,'Dorella Putten','Miraflores','Peru','19th Floor'),(860,'Becki Nesbit','Dongmazar','China','Apt 1551'),(861,'Andriette Maudlen','Strohonivka','Ukraine','Room 548'),(862,'Petey Dowyer','Sabadell','Spain','19th Floor'),(863,'Serge Purkiss','Ḩammām Damt','Yemen','Apt 1667'),(864,'Emelda Cowx','Júlio de Castilhos','Brazil','4th Floor'),(865,'Tiffany Ortiger','Chruszczobród','Poland','Apt 503'),(866,'Raye Pfiffer','Oeiras','Brazil','Suite 7'),(867,'Brittaney Hounsome','Tebon','Indonesia','Room 1854'),(868,'Theodore Maty','Luzino','Poland','Apt 1069'),(869,'Joana Bayley','Dualing','Philippines','Apt 920'),(870,'Evered Scalia','Sevilla','Spain','PO Box 24011'),(871,'Tate Cobain','Leitões','Portugal','Apt 651'),(872,'Eleanora Trevains','Kakamega','Kenya','Room 204'),(873,'Orran Gamett','Al Ghandūrah','Syria','Suite 23'),(874,'Dietrich Walwood','Maracay','Venezuela','Suite 89'),(875,'Ambrose Leaman','Mjölby','Sweden','Apt 1589'),(876,'Warde Waddup','Helin','China','Apt 352'),(877,'El Westrip','Mashan','China','PO Box 78795'),(878,'Stephannie Gellibrand','Tangpu','China','Room 1235'),(879,'Angelle Dearsley','La Jutosa','Honduras','Apt 221'),(880,'Gerrard Gilbane','Yahotyn','Ukraine','13th Floor'),(881,'Nara Hubbis','Mae Hi','Thailand','PO Box 70351'),(882,'Bobina Lober','Várzea de Sintra','Portugal','PO Box 15699'),(883,'Ashly Betonia','Zafar','Uzbekistan','4th Floor'),(884,'Kylen Sammonds','Thayetmyo','Myanmar','Suite 77'),(885,'Witty Eagles','Toyonaka','Japan','Suite 33'),(886,'Tomlin Novakovic','Buenos Aires','Peru','16th Floor'),(887,'Mischa Bea','Socorro','Philippines','Apt 1938'),(888,'Ameline Alam','Toulouse','France','PO Box 9969'),(889,'Miquela Coumbe','Rego','Portugal','PO Box 45546'),(890,'Rodi Cawthorne','Concepción del Uruguay','Argentina','4th Floor'),(891,'Ly Dorgan','Montfort-sur-Meu','France','PO Box 13115'),(892,'Justin Holyland','Rybinsk','Russia','2nd Floor'),(893,'Mitchell Trask','Paris 19','France','Suite 21'),(894,'Jenny Hincks','Kunshan','China','Suite 77'),(895,'Michal Nazareth','Ronov nad Doubravou','Czech Republic','Apt 531'),(896,'Stesha Maycey','Ilha de Moçambique','Mozambique','Suite 79'),(897,'Irvin Galvin','Pittsburgh','United States','Suite 62'),(898,'Kare Slingsby','Riofrío','Colombia','Suite 93'),(899,'Thorvald Finley','Kórnik','Poland','Suite 10'),(900,'Hadleigh Applegarth','Ledeč nad Sázavou','Czech Republic','Suite 2'),(901,'Eleanora Burnham','Harstad','Norway','Room 1544'),(902,'Tyson Doughtery','Qiaotou','China','Apt 229'),(903,'Rodrique Brockhouse','Mestre','Italy','PO Box 63295'),(904,'Abrahan Jarmain','Kristinehamn','Sweden','PO Box 48021'),(905,'Kenon Paolino','Andalucía','Colombia','Suite 50'),(906,'Evangelia Elster','Guohe','China','Room 1386'),(907,'Clemmie Beecham','Thanatpin','Myanmar','Room 98'),(908,'Susanna Ismead','Sumberjo','Indonesia','Room 758'),(909,'Stevie Curman','Rakiv Lis','Ukraine','Suite 57'),(910,'Garik Garlick','Wentang','China','Apt 513'),(911,'Lara Hayne','Nambak Tengah','Indonesia','9th Floor'),(912,'Tate Clementel','Villanueva','Colombia','PO Box 76793'),(913,'Nike Craigg','Haylaastay','Mongolia','9th Floor'),(914,'Moishe MacCrann','Huaqiao','China','Apt 208'),(915,'Clifford Quiddihy','Sattahip','Thailand','1st Floor'),(916,'Ryley Smullen','Dalang','China','Apt 226'),(917,'Trude Frain','Foz Giraldo','Portugal','Apt 924'),(918,'Stephenie Richardsson','Portel','Portugal','Room 165'),(919,'Sauveur Brimelow','Mbinga','Tanzania','Apt 1579'),(920,'Amandy Kadwallider','Nglojo','Indonesia','Room 1721'),(921,'Alex Jerrans','Colendra','Indonesia','PO Box 26259'),(922,'Peter Auty','São Francisco do Sul','Brazil','PO Box 46119'),(923,'Sandye Dobby','Gengqing','China','1st Floor'),(924,'Francine Hundley','Shiḩan as Suflá','Yemen','Room 1473'),(925,'Imelda Mault','La Paz Centro','Nicaragua','Room 1942'),(926,'Rudolph Skirven','Hangou','China','Room 471'),(927,'Rheba Hindes','Dvůr Králové nad Labem','Czech Republic','PO Box 20724'),(928,'Gilbertine Edward','Salisbury','Dominica','Room 885'),(929,'Oneida Francesc','Timbó','Brazil','PO Box 60021'),(930,'Gustavus Scotts','Tortosendo','Portugal','Room 1928'),(931,'Mersey Soitoux','Caringin','Indonesia','Suite 71'),(932,'Esdras Sellick','Caratinga','Brazil','Apt 1882'),(933,'Fransisco Yankeev','Gangmian','China','PO Box 61004'),(934,'Aime Gillopp','Yangping','China','Suite 31'),(935,'Scott Blanchflower','Iwonicz-Zdrój','Poland','Room 295'),(936,'Desmond Domenici','Meïganga','Cameroon','Room 332'),(937,'Lindon Loan','Jaguaribe','Brazil','Apt 1135'),(938,'Olly Franklen','Marelesu','China','Apt 1039'),(939,'Fielding Munford','Manaquiri','Brazil','PO Box 92476'),(940,'Jacquenette Larrie','Lidköping','Sweden','Suite 50'),(941,'Grenville Dibden','Amsterdam Oud Zuid en Rivierenbuurt','Netherlands','Room 101'),(942,'Junina Kettell','Nāḩiyat Alī ash Sharqī','Iraq','3rd Floor'),(943,'Bondon Panswick','Auch','France','PO Box 1563'),(944,'Laureen Henriquet','Amirdzhan','Azerbaijan','Room 1525'),(945,'Moreen Dinley','Yeysk','Russia','PO Box 34156'),(946,'Florenza Leare','El Ingenio','Peru','PO Box 55974'),(947,'Angie McIndoe','Xinyi','China','Suite 95'),(948,'Audre Pattlel','Bajiazi','China','Apt 872'),(949,'Hernando Crump','Yousheng','China','Suite 56'),(950,'Ronalda Brahms','Waru','Indonesia','13th Floor'),(951,'Paten Coward','Liujia','China','PO Box 88418'),(952,'Renaud Becom','Kashmor','Pakistan','Suite 20'),(953,'Bear Harcourt','Bāglung','Nepal','Suite 99'),(954,'Weber Levi','Ferdinandovac','Croatia','12th Floor'),(955,'Reider Aumerle','Huatai','China','10th Floor'),(956,'Dmitri Clausen','Marseille','France','Suite 77'),(957,'Alaine Mulroy','Hexi','China','6th Floor'),(958,'Morgen Bootton','Tiancheng','China','Suite 95'),(959,'Louise Truluck','Sanshan','China','Apt 1126'),(960,'Megan Courtonne','Choloma','Honduras','Suite 100'),(961,'Kelcie Malenfant','Leninogorsk','Russia','Room 881'),(962,'Louella Beckhurst','Leština','Czech Republic','Apt 1031'),(963,'Rosalind Enrdigo','Pak Phanang','Thailand','Room 120'),(964,'Filbert Wilkenson','Bollnäs','Sweden','Room 202'),(965,'Lea Cappell','Xiaojin','China','Apt 38'),(966,'Roze Melchior','Beiyang','China','Apt 638'),(967,'Huberto Hinge','Bizana','South Africa','Suite 32'),(968,'Aimil Solesbury','Goba','Ethiopia','Apt 183'),(969,'Lavinie Suatt','Reims','France','Apt 1521'),(970,'Otto Jeanesson','Kosonsoy Shahri','Uzbekistan','Room 798'),(971,'Leighton Bielfeldt','Qukës-Skënderbe','Albania','Suite 88'),(972,'Garvey Constantinou','Mechrá Belqsiri','Morocco','Apt 715'),(973,'Darius Plet','Yabluniv','Ukraine','PO Box 4137'),(974,'Sallie Barnet','Sombor','Serbia','20th Floor'),(975,'Constancy Iacoviello','Warudoyong','Indonesia','PO Box 3284'),(976,'Urban Gouinlock','Dazi','China','Room 1269'),(977,'Neale Trippitt','Kvänum','Sweden','Room 455'),(978,'Siobhan Chastagnier','Magdalena','Peru','Suite 65'),(979,'Benedicta de Almeida','Cikananga','Indonesia','Suite 8'),(980,'Cinnamon Dulton','Pérama','Greece','9th Floor'),(981,'Genvieve Lago','Naguanagua','Venezuela','Apt 1007'),(982,'Joel Iacovelli','Normandin','Canada','18th Floor'),(983,'Aaron Please','Căuşeni','Moldova','PO Box 80271'),(984,'Gonzalo Macken','Anshun','China','PO Box 77670'),(985,'Bev Ritter','Zuoxi','China','Apt 947'),(986,'Thibaud Eagger','Harhorin','Mongolia','PO Box 9882'),(987,'Arleyne Shyre','Fajões','Portugal','Apt 862'),(988,'Kerry Escala','Nossebro','Sweden','Suite 52'),(989,'Margit Prendiville','Proástion','Greece','Room 759'),(990,'Dewey Borrie','Piteå','Sweden','9th Floor'),(991,'Nellie Marlow','Kumo','Nigeria','14th Floor'),(992,'Jerrie Amis','Hongqiao','China','PO Box 98030'),(993,'Asa Fewkes','Yelan’','Russia','PO Box 42978'),(994,'Cynde Binyon','Ramat Yishay','Israel','PO Box 83309'),(995,'Florri D\'eath','Tongyang','China','Room 888'),(996,'Estele Baison','Rashaant','Mongolia','19th Floor'),(997,'Monro Highway','Mamu','China','Suite 34'),(998,'Nerty Stagg','Lagayan','Philippines','PO Box 45241'),(999,'Delores Sarton','Rezovac','Croatia','Room 67'),(1000,'Bud Barrasse','Diamantina','Philippines','PO Box 94535');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-26 19:56:32
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: laravel_demo
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Male',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `age` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (2,'Amely','Walker','Male','leslie22@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(3,'Justen','Lueilwitz','Male','jadyn71@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(4,'Royce','Schiller','Male','bode.stefan@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(5,'Darius','Franecki','Female','alexandria.mayert@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(6,'Reggie','Goldner','Female','krajcik.laurence@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(7,'Carissa','Greenfelder','Female','ndooley@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(8,'Tad','Sauer','Male','cwatsica@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(9,'Marcel','Leffler','Female','vicenta85@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(10,'Timmothy','Feest','Male','merl43@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(11,'Pedro','Spinka','Female','hoppe.gustave@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(12,'Emanuel','Schamberger','Male','roxanne41@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(13,'Alysa','Jerde','Male','gottlieb.elnora@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(14,'Victor','Lakin','Female','bartoletti.chadd@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(15,'Lillian','Koepp','Male','grimes.alejandrin@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(16,'Katrine','Dooley','Male','torn@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(17,'Peyton','Kutch','Male','ytrantow@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(18,'Zola','Deckow','Female','icorkery@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(19,'Jamie','Effertz','Female','eloy.kshlerin@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(20,'Makenna','Bailey','Male','deven56@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(21,'Wellington','Ortiz','Male','idavis@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(22,'Aileen','Spencer','Female','helmer.spencer@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(23,'Tristian','Lueilwitz','Male','jast.linda@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(24,'Jaylen','Fahey','Female','hattie.windler@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(25,'Roma','Wiza','Female','arielle17@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(26,'Brown','Nolan','Female','woodrow.bartoletti@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(27,'Alf','Beahan','Male','maymie71@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(28,'Brendon','Raynor','Female','hartmann.ward@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(29,'Darwin','Hansen','Male','chet.krajcik@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(30,'Twila','Halvorson','Male','bradtke.kamryn@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(31,'Whitney','Dach','Male','batz.george@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(32,'Alexis','Mraz','Male','olaf.abshire@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(33,'Afton','Frami','Female','lchristiansen@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(34,'Everett','Murphy','Female','jules.schinner@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(35,'Eunice','Keeling','Female','earnestine92@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(36,'Athena','Fisher','Male','laila.renner@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(37,'Nadia','Quigley','Female','ernestine54@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(38,'Jerrod','Schuster','Male','swaniawski.hazel@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(39,'Larissa','Howell','Female','koby.runolfsdottir@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(40,'Felicity','Carroll','Male','kirlin.kelsi@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(41,'Laurel','Connelly','Female','efadel@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(42,'Martin','Veum','Male','orippin@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(43,'Darron','Windler','Male','pschultz@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(44,'Evan','Zemlak','Female','broderick67@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(45,'Willie','Harber','Male','hane.magdalena@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(46,'Odell','Parisian','Male','tristian.gleichner@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(47,'Noemie','Heaney','Female','bayer.vicky@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(48,'Jay','Ward','Female','christine38@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(49,'Camylle','Maggio','Female','gerald62@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(50,'Anne','Cassin','Female','bjohnson@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(51,'Rosa','Morar','Male','wmaggio@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(52,'Kellie','Oberbrunner','Female','norberto.dubuque@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(53,'Angel','Yost','Female','zmetz@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(54,'Ellie','Ratke','Male','mueller.diana@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(55,'Norval','Stokes','Female','yerdman@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(56,'Corbin','Bogan','Male','ymraz@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(57,'Rylee','Schinner','Female','awalker@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(58,'Kathleen','Ernser','Male','laurie.wilderman@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(59,'Jada','Turcotte','Female','qstark@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(60,'Lexi','Schneider','Female','prosacco.miles@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(61,'Jennie','Shanahan','Female','prince.mueller@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(62,'Lulu','Johns','Male','mike.breitenberg@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(63,'Rashad','Kohler','Male','calista03@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(64,'Keshawn','Stark','Male','ubarrows@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(65,'Bettie','Miller','Female','hartmann.raquel@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(66,'Jonathan','Bernhard','Male','tianna.ebert@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(67,'Dawn','Muller','Male','thompson.anthony@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(68,'Karianne','McGlynn','Female','jdouglas@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(69,'Camron','Hoppe','Female','cameron81@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(70,'Ariel','Heathcote','Female','karine51@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(72,'Johnson','Effertz','Female','eryn94@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(73,'Susan','Terry','Male','brice29@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(74,'Zechariah','Heller','Male','rparisian@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(75,'Jessy','Nikolaus','Female','nkiehn@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(76,'Alexandrea','Little','Female','gtreutel@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(77,'Dale','Okuneva','Male','wharvey@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(78,'Isobel','Schoen','Female','nhill@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(79,'Lucie','Stehr','Male','price.moshe@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(80,'Noemy','Terry','Male','kreiger.rhoda@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(81,'Kathleen','Rolfson','Male','zmann@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(82,'Garth','Anderson','Male','anderson.nikolaus@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(83,'Adrain','Walker','Male','doris02@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(84,'Marielle','Strosin','Female','murphy.mollie@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(85,'Colin','Kilback','Male','rraynor@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(86,'Meda','McDermott','Male','johnston.krystel@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(87,'Marcel','McLaughlin','Male','rborer@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(88,'Linnie','Hill','Female','dpouros@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(89,'Samanta','Gerlach','Male','erunolfsdottir@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(90,'Coby','Lebsack','Female','herman58@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(91,'Skylar','Wolff','Male','gregg39@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(92,'Wendell','Huels','Female','mcdermott.cruz@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(93,'Nelson','Schuppe','Male','lind.orin@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(94,'Emmie','Bartoletti','Male','lauryn94@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(95,'Evans','Volkman','Female','orn.remington@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(96,'Grace','Boyle','Female','rita02@example.com','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(97,'Devante','Casper','Male','ykrajcik@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(98,'Matilde','Deckow','Male','wilbert27@example.org','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(99,'Dwight','Skiles','Female','anderson.letha@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(100,'Davin','Durgan','Male','leatha41@example.net','2023-07-24 03:25:22','2023-07-24 03:25:22',0),(101,'Vince Melmar','Ybañez','Male','vinceybanez5521@gmail.com','2023-07-25 02:19:28','2023-07-25 02:19:28',23);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (9,'2014_10_12_000000_create_users_table',1),(10,'2014_10_12_100000_create_password_resets_table',1),(11,'2019_08_19_000000_create_failed_jobs_table',1),(12,'2019_12_14_000001_create_personal_access_tokens_table',1),(13,'2023_07_24_105433_create_employees_table',2),(14,'2023_07_24_144100_alter_employees_table_add_column_age',3),(15,'2023_07_25_100447_alter_employees_table_add_column_gender_default_value',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Tristin O\'Keefe','edwin41@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9gJ7r6eZ4b','2023-07-24 02:52:46','2023-07-24 02:52:46'),(2,'Jammie Daugherty','hattie.roberts@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fF00o9mfxH','2023-07-24 02:52:46','2023-07-24 02:52:46'),(3,'Flavio Olson','jbayer@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','dxqPJL1bti','2023-07-24 02:52:46','2023-07-24 02:52:46'),(4,'Mrs. Delia Erdman','willa21@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','BadFxsqxBR','2023-07-24 02:52:46','2023-07-24 02:52:46'),(5,'Prof. Gerhard Dach','sean.langosh@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','jqsXYj9bOi','2023-07-24 02:52:46','2023-07-24 02:52:46'),(6,'Zola Rodriguez PhD','dickinson.arvid@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','poNb2gxg6o','2023-07-24 02:52:46','2023-07-24 02:52:46'),(7,'Verla Strosin','montana.funk@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','nY4k7BuBiJ','2023-07-24 02:52:46','2023-07-24 02:52:46'),(8,'Jairo Murphy MD','harmon27@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','QX90kIharW','2023-07-24 02:52:46','2023-07-24 02:52:46'),(9,'Freddy Adams','unique06@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','M9D1sXHhls','2023-07-24 02:52:46','2023-07-24 02:52:46'),(10,'Juana Stanton','cartwright.sibyl@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','VInmviZtBc','2023-07-24 02:52:46','2023-07-24 02:52:46'),(11,'Trinity Weber','hal.rowe@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','z39YBsMdUm','2023-07-24 02:52:46','2023-07-24 02:52:46'),(12,'Graham Blanda','aurore.gulgowski@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','QgipWPFPn8','2023-07-24 02:52:46','2023-07-24 02:52:46'),(13,'Mr. Gregory Mills PhD','zella24@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','eRE0AqD9QY','2023-07-24 02:52:46','2023-07-24 02:52:46'),(14,'Prof. Marlene Olson','pschuppe@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','dPnvCLedM5','2023-07-24 02:52:46','2023-07-24 02:52:46'),(15,'Royce Wolff','ayana15@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','23C8mlXic7','2023-07-24 02:52:46','2023-07-24 02:52:46'),(16,'Novella Marquardt DDS','autumn26@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','MuHt8Lq5px','2023-07-24 02:52:46','2023-07-24 02:52:46'),(17,'Karli Rosenbaum Sr.','tillman.andreane@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','cxpcUQupH4','2023-07-24 02:52:46','2023-07-24 02:52:46'),(18,'Ms. Eleonore Bauch I','nelle.jakubowski@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','OKYSOBUsFY','2023-07-24 02:52:46','2023-07-24 02:52:46'),(19,'Elda Cormier','marta04@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','WvE5iSfe1V','2023-07-24 02:52:46','2023-07-24 02:52:46'),(20,'Eula Parisian','cwaters@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','2MXhPp5ZH1','2023-07-24 02:52:46','2023-07-24 02:52:46'),(21,'Shana Heller','torphy.maegan@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','tRLCxb7mCh','2023-07-24 02:52:46','2023-07-24 02:52:46'),(22,'Mr. Marcel Stanton','arlene.leffler@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mp4IXoEm6F','2023-07-24 02:52:46','2023-07-24 02:52:46'),(23,'Clinton Purdy','wolff.fred@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','seDPhna1PJ','2023-07-24 02:52:46','2023-07-24 02:52:46'),(24,'Estefania Funk','oren.satterfield@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ZXyyLYZ8nO','2023-07-24 02:52:46','2023-07-24 02:52:46'),(25,'Mr. Elmore DuBuque','schuster.monica@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','XW70mj3dzQ','2023-07-24 02:52:46','2023-07-24 02:52:46'),(26,'Torey Dietrich','tkuhn@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','iCaILzL5Ml','2023-07-24 02:52:46','2023-07-24 02:52:46'),(27,'Mrs. Katlynn Wuckert','torp.gus@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lMvvQpZ8fy','2023-07-24 02:52:46','2023-07-24 02:52:46'),(28,'Rodolfo O\'Reilly','eichmann.shawna@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','7kBJ63iCMM','2023-07-24 02:52:46','2023-07-24 02:52:46'),(29,'Hermina Wunsch','haley.cole@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','kywUa6PiJc','2023-07-24 02:52:46','2023-07-24 02:52:46'),(30,'Kamryn Fritsch','rschaefer@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','GVvAkOB8ru','2023-07-24 02:52:46','2023-07-24 02:52:46'),(31,'Aiden Wisoky','dwitting@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qQpNFwARCn','2023-07-24 02:52:46','2023-07-24 02:52:46'),(32,'Ms. Citlalli Bode I','ythompson@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','RGXqHV3nV0','2023-07-24 02:52:46','2023-07-24 02:52:46'),(33,'Bernadine Botsford','destany.kovacek@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','jow4n33Z40','2023-07-24 02:52:46','2023-07-24 02:52:46'),(34,'Jane Yost Sr.','joanny.windler@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','YsThQJofVp','2023-07-24 02:52:46','2023-07-24 02:52:46'),(35,'Hoyt Skiles','gokuneva@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','oE5BPX4CV9','2023-07-24 02:52:46','2023-07-24 02:52:46'),(36,'Jackson Farrell','breitenberg.ceasar@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fW21VF2GLS','2023-07-24 02:52:46','2023-07-24 02:52:46'),(37,'Mr. Desmond Schoen','mathew.weissnat@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','IYTBnSSU1c','2023-07-24 02:52:46','2023-07-24 02:52:46'),(38,'Mr. Rogers Kling','hlarkin@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','k2KNWBKeu7','2023-07-24 02:52:46','2023-07-24 02:52:46'),(39,'Marianna Emard','eva.witting@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','vIj3DuafrE','2023-07-24 02:52:46','2023-07-24 02:52:46'),(40,'Lenore Goyette I','ryleigh.ernser@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','BjCgiUSqNh','2023-07-24 02:52:46','2023-07-24 02:52:46'),(41,'Miss Mayra Nitzsche','legros.bailee@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','dom19i9Qtk','2023-07-24 02:52:46','2023-07-24 02:52:46'),(42,'Burnice Howe','vicenta46@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','PRhM24N9qp','2023-07-24 02:52:46','2023-07-24 02:52:46'),(43,'Dr. Norris Shanahan','jesus.leannon@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','f5p2qOdGR3','2023-07-24 02:52:46','2023-07-24 02:52:46'),(44,'Mrs. Nellie Paucek I','rosalee96@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','POoB8Sm0hC','2023-07-24 02:52:46','2023-07-24 02:52:46'),(45,'Sylvia McClure','cullen.thiel@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ZommqGa2ft','2023-07-24 02:52:46','2023-07-24 02:52:46'),(46,'Dr. Johnnie Bailey II','marcelino27@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','i38QMRumAb','2023-07-24 02:52:46','2023-07-24 02:52:46'),(47,'Mrs. Berniece Schmidt III','osvaldo99@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','uZIqBWdf1z','2023-07-24 02:52:46','2023-07-24 02:52:46'),(48,'Josh Murphy','jdickens@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','WAUK6ORqQ2','2023-07-24 02:52:46','2023-07-24 02:52:46'),(49,'Evan Jast','haley42@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','GiMAWhU0wX','2023-07-24 02:52:46','2023-07-24 02:52:46'),(50,'Teresa Berge','deontae.runte@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ZeWJlfQnvG','2023-07-24 02:52:46','2023-07-24 02:52:46'),(51,'Dr. Rory Purdy V','uschowalter@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Td54Cageiv','2023-07-24 02:52:46','2023-07-24 02:52:46'),(52,'Davin Schamberger','wyman.wilfredo@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','jzjKwyzPdf','2023-07-24 02:52:46','2023-07-24 02:52:46'),(53,'Candelario Bashirian III','shania48@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','c7qTLhwMUN','2023-07-24 02:52:46','2023-07-24 02:52:46'),(54,'Reyes Casper','lane96@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Uz9STHleX1','2023-07-24 02:52:46','2023-07-24 02:52:46'),(55,'Kaycee Senger III','rosemary.damore@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','uCzyriTCeP','2023-07-24 02:52:46','2023-07-24 02:52:46'),(56,'Gayle Abernathy','triston56@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Viih1wesKK','2023-07-24 02:52:46','2023-07-24 02:52:46'),(57,'Anissa Schoen','bartoletti.emmet@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','HqRWW0eYCO','2023-07-24 02:52:46','2023-07-24 02:52:46'),(58,'Osborne DuBuque PhD','tleannon@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','4heEEqrIqy','2023-07-24 02:52:46','2023-07-24 02:52:46'),(59,'Austyn Durgan','gloria34@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','cc2IVJBYTU','2023-07-24 02:52:46','2023-07-24 02:52:46'),(60,'Mrs. Dorothy Hilpert IV','oliver67@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','WYAE8US01j','2023-07-24 02:52:46','2023-07-24 02:52:46'),(61,'Ms. Malvina Halvorson','zack98@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','MrJ1fOxZQf','2023-07-24 02:52:46','2023-07-24 02:52:46'),(62,'Clay McKenzie III','samanta62@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','epSafE2TnB','2023-07-24 02:52:46','2023-07-24 02:52:46'),(63,'Alvera Graham','stroman.gennaro@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','aMvkjUPI1C','2023-07-24 02:52:46','2023-07-24 02:52:46'),(64,'Morris Fisher','connor.koelpin@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','IzqKvjT7DC','2023-07-24 02:52:46','2023-07-24 02:52:46'),(65,'River Friesen','kling.makayla@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','HqVm3Odo5n','2023-07-24 02:52:46','2023-07-24 02:52:46'),(66,'Mr. Norbert Kozey II','wyman.felicia@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','DYBBp2NcJA','2023-07-24 02:52:46','2023-07-24 02:52:46'),(67,'Dr. Lenny Wisozk','ulices.schulist@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ZGQV1AdeqO','2023-07-24 02:52:46','2023-07-24 02:52:46'),(68,'Karl Torphy Jr.','elfrieda.howell@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','3R944V6Dig','2023-07-24 02:52:46','2023-07-24 02:52:46'),(69,'Meredith Greenholt','al.mccullough@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','b4FzYMTd2G','2023-07-24 02:52:46','2023-07-24 02:52:46'),(70,'Camren Dach IV','qturner@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','3HtQJ5JckP','2023-07-24 02:52:46','2023-07-24 02:52:46'),(71,'Dr. Liam Kuhn','predovic.rhoda@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','bgX4sNY0IW','2023-07-24 02:52:46','2023-07-24 02:52:46'),(72,'Reinhold Lowe DVM','ujones@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','WtQaQsqDiU','2023-07-24 02:52:46','2023-07-24 02:52:46'),(73,'Reta Davis MD','goodwin.elwyn@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','blQozNX3ok','2023-07-24 02:52:46','2023-07-24 02:52:46'),(74,'Dante Crona','stokes.maeve@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','YwbefRZZh6','2023-07-24 02:52:46','2023-07-24 02:52:46'),(75,'Gaylord Abbott','bosco.jaden@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','TAQYeCTCVR','2023-07-24 02:52:46','2023-07-24 02:52:46'),(76,'Ophelia Hyatt','mheidenreich@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','eC3Ay7JnAm','2023-07-24 02:52:46','2023-07-24 02:52:46'),(77,'Mac Zieme','eldora.halvorson@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','btYpshH4O9','2023-07-24 02:52:46','2023-07-24 02:52:46'),(78,'Sim Glover','destiny.sanford@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','bcu0vUVSp3','2023-07-24 02:52:46','2023-07-24 02:52:46'),(79,'Lucie Feil','little.trey@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','5DTimWTB0E','2023-07-24 02:52:46','2023-07-24 02:52:46'),(80,'Mrs. Cassandra Yundt','brekke.antoinette@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','yI3r8frQSh','2023-07-24 02:52:46','2023-07-24 02:52:46'),(81,'Dr. Geovanni Jones MD','izaiah.rosenbaum@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ZNd1bRaLXO','2023-07-24 02:52:46','2023-07-24 02:52:46'),(82,'Casandra Hammes','kasandra70@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','FdjsOeBF4w','2023-07-24 02:52:46','2023-07-24 02:52:46'),(83,'Prof. Ronny Witting PhD','frederik.bauch@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','R8FmZe5Bvv','2023-07-24 02:52:46','2023-07-24 02:52:46'),(84,'Dr. Imogene Kirlin Jr.','yframi@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','BnD4oo2udm','2023-07-24 02:52:46','2023-07-24 02:52:46'),(85,'Emmitt Carroll','etromp@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','GCiWyTKT1U','2023-07-24 02:52:46','2023-07-24 02:52:46'),(86,'Antonio Kessler','haley.swift@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','uKQ7rQYAhR','2023-07-24 02:52:46','2023-07-24 02:52:46'),(87,'Mr. Dusty Bernhard','maurice39@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','HWKbG7K5Ar','2023-07-24 02:52:46','2023-07-24 02:52:46'),(88,'Mr. Trenton Stoltenberg IV','tom.rippin@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','0Zb09c4j0B','2023-07-24 02:52:46','2023-07-24 02:52:46'),(89,'Miracle Cummings','osinski.blanca@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','uFTFvwEtAz','2023-07-24 02:52:46','2023-07-24 02:52:46'),(90,'Kira Keeling','shawna.waelchi@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','1OYwSVHYTA','2023-07-24 02:52:46','2023-07-24 02:52:46'),(91,'Mr. Junior Kautzer Jr.','portiz@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','V5XJgeUALH','2023-07-24 02:52:46','2023-07-24 02:52:46'),(92,'Mr. Flavio Mante Jr.','ulices.carroll@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mKC6fqgPRP','2023-07-24 02:52:46','2023-07-24 02:52:46'),(93,'Margarett Gottlieb','pbartell@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','X5ZQM0goOS','2023-07-24 02:52:46','2023-07-24 02:52:46'),(94,'Mrs. Brandy Homenick Sr.','hoyt45@example.org','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Ph9PX57gUW','2023-07-24 02:52:46','2023-07-24 02:52:46'),(95,'Prof. Kendrick Carroll DDS','remington.mcdermott@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rXMoxNx3Ui','2023-07-24 02:52:46','2023-07-24 02:52:46'),(96,'Gregg Kunde','katharina.hill@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','tV73uueaBs','2023-07-24 02:52:46','2023-07-24 02:52:46'),(97,'Miss Sadie Sipes','hhermann@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','LZXfxbmmYO','2023-07-24 02:52:46','2023-07-24 02:52:46'),(98,'Dr. Kayleigh Dickens','tokuneva@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rRjsisfF2d','2023-07-24 02:52:46','2023-07-24 02:52:46'),(99,'Bailey Kshlerin','katelyn02@example.com','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','777Hyyw62R','2023-07-24 02:52:46','2023-07-24 02:52:46'),(100,'Mr. George Kris Jr.','cschultz@example.net','2023-07-24 02:52:46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','wAS8cn4N7c','2023-07-24 02:52:46','2023-07-24 02:52:46');
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

-- Dump completed on 2023-07-26 19:56:32
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: employee_management
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `salary` varchar(45) DEFAULT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'John','Doe','male','sports,games,arts',1,'60000','2023-07-17 14:37:47'),(5,'Sara','Smith','female','movies,cooking',12,'20000','2023-07-17 14:42:47'),(6,'Ike','De la Barre','male','cooking',12,'10000','2023-07-17 16:13:23'),(7,'Asher','Wheal','male','sports',13,'10000','2023-07-17 16:13:23'),(9,'Linnet','Paty','female','arts',13,'10000','2023-07-17 16:13:23'),(10,'Jeanie','Timbrell','female','movies',13,'10000','2023-07-17 16:13:23'),(11,'Derwin','Lescop','male','others',13,'10000','2023-07-17 16:13:23'),(12,'Hansiain','Fomichyov','male','cooking',13,'10000','2023-07-17 16:13:23'),(13,'Georgie','Corradini','male','sports',13,'10000','2023-07-17 16:13:23'),(14,'Geralda','Sibbons','female','games',13,'10000','2023-07-17 16:13:23'),(15,'Cara','Lynn','female','arts',13,'10000','2023-07-17 16:13:23');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'HR Manager','2023-07-17 13:11:43'),(11,'Supervisor','2023-07-17 13:29:16'),(12,'Cashier','2023-07-17 13:29:32'),(13,'Salesperson','2023-07-17 13:29:38'),(14,'Bagger','2023-07-17 13:29:43'),(15,'Security Guard','2023-07-17 13:40:30');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-26 19:56:32
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: sql_lesson
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Beverages','Soft drinks, coffees, teas, beers, and ales'),(2,'Condiments','Sweet and savory sauces, relishes, spreads, and seasonings'),(3,'Confections','Desserts, candies, and sweet breads'),(4,'Dairy Products','Cheeses'),(5,'Grains/Cereals','Breads, crackers, pasta, and cereal'),(6,'Meat/Poultry','Prepared meats'),(7,'Produce','Dried fruit and bean curd'),(8,'Seafood','Seaweed and fish');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(255) DEFAULT NULL,
  `ContactName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Alfreds Futterkiste','Maria Anders','Obere Str. 57','Berlin','12209','Germany'),(2,'Ana Trujillo Emparedados y helados','Ana Trujillo','Avda. de la Constitución 2222','México D.F.','05021','Mexico'),(3,'Antonio Moreno Taquería','Antonio Moreno','Mataderos 2312','México D.F.','05023','Mexico'),(4,'Around the Horn','Thomas Hardy',NULL,NULL,'WA1 1DP','UK'),(5,'Berglunds snabbköp','Christina Berglund','Berguvsvägen 8','Luleå','S-958 22','Sweden'),(6,'Blauer See Delikatessen','Hanna Moos','Forsterstr. 57','Mannheim','68306','Germany'),(7,'Blondel père et fils','Frédérique Citeaux','24, place Kléber','Strasbourg','67000','France'),(8,'Bólido Comidas preparadas','Martín Sommer','C/ Araquil, 67','Madrid','28023','Spain'),(9,'Bon app\'','Laurence Lebihans','12, rue des Bouchers','Marseille','13008','France'),(10,'Bottom-Dollar Marketse','Elizabeth Lincoln','23 Tsawassen Blvd.','Tsawassen','T2F 8M4','Canada'),(11,'B\'s Beverages','Victoria Ashworth','Fauntleroy Circus','London','EC2 5NT','UK'),(12,'Cactus Comidas para llevar','Patricio Simpson','Cerrito 333','Buenos Aires','1010','Argentina'),(13,'Centro comercial Moctezuma','Francisco Chang','Sierras de Granada 9993','México D.F.','05022','Mexico'),(14,'Chop-suey Chinese','Yang Wang','Hauptstr. 29','Bern','3012','Switzerland'),(15,'Comércio Mineiro','Pedro Afonso','Av. dos Lusíadas, 23','São Paulo','05432-043','Brazil'),(16,'Consolidated Holdings','Elizabeth Brown','Berkeley Gardens 12 Brewery','London','WX1 6LT','UK'),(17,'Drachenblut Delikatessend','Sven Ottlieb','Walserweg 21','Aachen','52066','Germany'),(18,'Du monde entier','Janine Labrune','67, rue des Cinquante Otages','Nantes','44000','France'),(19,'Eastern Connection','Ann Devon','35 King George','London','WX3 6FW','UK'),(20,'Ernst Handel','Roland Mendel','Kirchgasse 6','Graz','8010','Austria'),(21,'Familia Arquibaldo','Aria Cruz','Rua Orós, 92','São Paulo','05442-030','Brazil'),(22,'FISSA Fabrica Inter. Salchichas S.A.','Diego Roel','C/ Moralzarzal, 86','Madrid','28034','Spain'),(23,'Folies gourmandes','Martine Rancé','184, chaussée de Tournai','Lille','59000','France'),(24,'Folk och fä HB','Maria Larsson','Åkergatan 24','Bräcke','S-844 67','Sweden'),(25,'Frankenversand','Peter Franken','Berliner Platz 43','München','80805','Germany'),(26,'France restauration','Carine Schmitt','54, rue Royale','Nantes','44000','France'),(27,'Franchi S.p.A.','Paolo Accorti','Via Monte Bianco 34','Torino','10100','Italy'),(28,'Furia Bacalhau e Frutos do Mar','Lino Rodriguez','Jardim das rosas n. 32','Lisboa','1675','Portugal'),(29,'Galería del gastrónomo','Eduardo Saavedra','Rambla de Cataluña, 23','Barcelona','08022','Spain'),(30,'Godos Cocina Típica','José Pedro Freyre','C/ Romero, 33','Sevilla','41101','Spain'),(31,'Gourmet Lanchonetes','André Fonseca','Av. Brasil, 442','Campinas','04876-786','Brazil'),(32,'Great Lakes Food Market','Howard Snyder','2732 Baker Blvd.','Eugene','97403','USA'),(33,'GROSELLA-Restaurante','Manuel Pereira','5ª Ave. Los Palos Grandes','Caracas','1081','Venezuela'),(34,'Hanari Carnes','Mario Pontes','Rua do Paço, 67','Rio de Janeiro','05454-876','Brazil'),(35,'HILARIÓN-Abastos','Carlos Hernández','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','5022','Venezuela'),(36,'Hungry Coyote Import Store','Yoshi Latimer','City Center Plaza 516 Main St.','Elgin','97827','USA'),(37,'Hungry Owl All-Night Grocers','Patricia McKenna','8 Johnstown Road','Cork','','Ireland'),(38,'Island Trading','Helen Bennett','Garden House Crowther Way','Cowes','PO31 7PJ','UK'),(39,'Königlich Essen','Philip Cramer','Maubelstr. 90','Brandenburg','14776','Germany'),(40,'La corne d\'abondance','Daniel Tonini','67, avenue de l\'Europe','Versailles','78000','France'),(41,'La maison d\'Asie','Annette Roulet','1 rue Alsace-Lorraine','Toulouse','31000','France'),(42,'Laughing Bacchus Wine Cellars','Yoshi Tannamuri','1900 Oak St.','Vancouver','V3F 2K1','Canada'),(43,'Lazy K Kountry Store','John Steel','12 Orchestra Terrace','Walla Walla','99362','USA'),(44,'Lehmanns Marktstand','Renate Messner','Magazinweg 7','Frankfurt a.M.','60528','Germany'),(45,'Let\'s Stop N Shop','Jaime Yorres','87 Polk St. Suite 5','San Francisco','94117','USA'),(46,'LILA-Supermercado','Carlos González','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','3508','Venezuela'),(47,'LINO-Delicateses','Felipe Izquierdo','Ave. 5 de Mayo Porlamar','I. de Margarita','4980','Venezuela'),(48,'Lonesome Pine Restaurant','Fran Wilson','89 Chiaroscuro Rd.','Portland','97219','USA'),(49,'Magazzini Alimentari Riuniti','Giovanni Rovelli','Via Ludovico il Moro 22','Bergamo','24100','Italy'),(50,'Maison Dewey','Catherine Dewey','Rue Joseph-Bens 532','Bruxelles','B-1180','Belgium'),(51,'Mère Paillarde','Jean Fresnière','43 rue St. Laurent','Montréal','H1J 1C3','Canada'),(52,'Morgenstern Gesundkost','Alexander Feuer','Heerstr. 22','Leipzig','04179','Germany'),(53,'North/South','Simon Crowther','South House 300 Queensbridge','London','SW7 1RZ','UK'),(54,'Océano Atlántico Ltda.','Yvonne Moncada','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires','1010','Argentina'),(55,'Old World Delicatessen','Rene Phillips','2743 Bering St.','Anchorage','99508','USA'),(56,'Ottilies Käseladen','Henriette Pfalzheim','Mehrheimerstr. 369','Köln','50739','Germany'),(57,'Paris spécialités','Marie Bertrand','265, boulevard Charonne','Paris','75012','France'),(58,'Pericles Comidas clásicas','Guillermo Fernández','Calle Dr. Jorge Cash 321','México D.F.','05033','Mexico'),(59,'Piccolo und mehr','Georg Pipps','Geislweg 14','Salzburg','5020','Austria'),(60,'Princesa Isabel Vinhoss','Isabel de Castro','Estrada da saúde n. 58','Lisboa','1756','Portugal'),(61,'Que Delícia','Bernardo Batista','Rua da Panificadora, 12','Rio de Janeiro','02389-673','Brazil'),(62,'Queen Cozinha','Lúcia Carvalho','Alameda dos Canàrios, 891','São Paulo','05487-020','Brazil'),(63,'QUICK-Stop','Horst Kloss','Taucherstraße 10','Cunewalde','01307','Germany'),(64,'Rancho grande','Sergio Gutiérrez','Av. del Libertador 900','Buenos Aires','1010','Argentina'),(65,'Rattlesnake Canyon Grocery','Paula Wilson','2817 Milton Dr.','Albuquerque','87110','USA'),(66,'Reggiani Caseifici','Maurizio Moroni','Strada Provinciale 124','Reggio Emilia','42100','Italy'),(67,'Ricardo Adocicados','Janete Limeira','Av. Copacabana, 267','Rio de Janeiro','02389-890','Brazil'),(68,'Richter Supermarkt','Michael Holz','Grenzacherweg 237','Genève','1203','Switzerland'),(69,'Romero y tomillo','Alejandra Camino','Gran Vía, 1','Madrid','28001','Spain'),(70,'Santé Gourmet','Jonas Bergulfsen','Erling Skakkes gate 78','Stavern','4110','Norway'),(71,'Save-a-lot Markets','Jose Pavarotti','187 Suffolk Ln.','Boise','83720','USA'),(72,'Seven Seas Imports','Hari Kumar','90 Wadhurst Rd.','London','OX15 4NB','UK'),(73,'Simons bistro','Jytte Petersen','Vinbæltet 34','København','1734','Denmark'),(74,'Spécialités du monde','Dominique Perrier','25, rue Lauriston','Paris','75016','France'),(75,'Split Rail Beer & Ale','Art Braunschweiger','P.O. Box 555','Lander','82520','USA'),(76,'Suprêmes délices','Pascale Cartrain','Boulevard Tirou, 255','Charleroi','B-6000','Belgium'),(77,'The Big Cheese','Liz Nixon','89 Jefferson Way Suite 2','Portland','97201','USA'),(78,'The Cracker Box','Liu Wong','55 Grizzly Peak Rd.','Butte','59801','USA'),(79,'Toms Spezialitäten','Karin Josephs','Luisenstr. 48','Münster','44087','Germany'),(80,'Tortuga Restaurante','Miguel Angel Paolino','Avda. Azteca 123','México D.F.','05033','Mexico'),(81,'Tradição Hipermercados','Anabela Domingues','Av. Inês de Castro, 414','São Paulo','05634-030','Brazil'),(82,'Trail\'s Head Gourmet Provisioners','Helvetius Nagy','722 DaVinci Blvd.','Kirkland','98034','USA'),(83,'Vaffeljernet','Palle Ibsen','Smagsløget 45','Århus','8200','Denmark'),(84,'Victuailles en stock','Mary Saveley','2, rue du Commerce','Lyon','69004','France'),(85,'Vins et alcools Chevalier','Paul Henriot','59 rue de l\'Abbaye','Reims','51100','France'),(86,'Die Wandernde Kuh','Rita Müller','Adenauerallee 900','Stuttgart','70563','Germany'),(87,'Wartian Herkku','Pirkko Koskitalo','Torikatu 38','Oulu','90110','Finland'),(88,'Wellington Importadora','Paula Parente','Rua do Mercado, 12','Resende','08737-363','Brazil'),(89,'White Clover Markets','Karl Jablonski','305 - 14th Ave. S. Suite 3B','Seattle','98128','USA'),(90,'Wilman Kala','Matti Karttunen','Keskuskatu 45','Helsinki','21240','Finland'),(91,'Wolski','Zbyszek','ul. Filtrowa 68','Walla','01-012','Poland');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_notes_history`
--

DROP TABLE IF EXISTS `employee_notes_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_notes_history` (
  `NoteID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int NOT NULL,
  `Notes` text,
  PRIMARY KEY (`NoteID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_notes_history`
--

LOCK TABLES `employee_notes_history` WRITE;
/*!40000 ALTER TABLE `employee_notes_history` DISABLE KEYS */;
INSERT INTO `employee_notes_history` VALUES (2,11,'This is my note'),(3,11,'John Doe Notes'),(4,11,'New Notes'),(5,11,'No Notes');
/*!40000 ALTER TABLE `employee_notes_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Davolio','Nancy','1968-12-08','EmpID1.pic','Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of \'Toastmasters International\'.'),(2,'Fuller','Andrew','1952-02-19','EmpID2.pic','Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.'),(3,'Leverling','Janet','1963-08-30','EmpID3.pic','Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.'),(4,'Peacock','Margaret','1958-09-19','EmpID4.pic','Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.'),(5,'Buchanan','Steven','1955-03-04','EmpID5.pic','Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses \'Successful Telemarketing\' and \'International Sales Management\'. He is fluent in French.'),(6,'Suyama','Michael','1963-07-02','EmpID6.pic','Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses \'Multi-Cultural Selling\' and \'Time Management for the Sales Professional\'. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.'),(7,'King','Robert','1960-05-29','EmpID7.pic','Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled \'Selling in Europe\', he was transferred to the London office.'),(8,'Callahan','Laura','1958-01-09','EmpID8.pic','Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.'),(9,'Dodsworth','Anne','1969-07-02','EmpID9.pic','Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.'),(10,'West','Adam','1928-09-19','EmpID10.pic','An old chum.'),(11,'Doe','John',NULL,NULL,'Hello World!'),(12,'Dela Cruz','Juan',NULL,NULL,NULL),(13,'Parker','Peter',NULL,NULL,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `OrderDetailID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,10248,11,12),(2,10248,42,10),(3,10248,72,5),(4,10249,14,9),(5,10249,51,40),(6,10250,41,10),(7,10250,51,35),(8,10250,65,15),(9,10251,22,6),(10,10251,57,15),(11,10251,65,20),(12,10252,20,40),(13,10252,33,25),(14,10252,60,40),(15,10253,31,20),(16,10253,39,42),(17,10253,49,40),(18,10254,24,15),(19,10254,55,21),(20,10254,74,21),(21,10255,2,20),(22,10255,16,35),(23,10255,36,25),(24,10255,59,30),(25,10256,53,15),(26,10256,77,12),(27,10257,27,25),(28,10257,39,6),(29,10257,77,15),(30,10258,2,50),(31,10258,5,65),(32,10258,32,6),(33,10259,21,10),(34,10259,37,1),(35,10260,41,16),(36,10260,57,50),(37,10260,62,15),(38,10260,70,21),(39,10261,21,20),(40,10261,35,20),(41,10262,5,12),(42,10262,7,15),(43,10262,56,2),(44,10263,16,60),(45,10263,24,28),(46,10263,30,60),(47,10263,74,36),(48,10264,2,35),(49,10264,41,25),(50,10265,17,30),(51,10265,70,20),(52,10266,12,12),(53,10267,40,50),(54,10267,59,70),(55,10267,76,15),(56,10268,29,10),(57,10268,72,4),(58,10269,33,60),(59,10269,72,20),(60,10270,36,30),(61,10270,43,25),(62,10271,33,24),(63,10272,20,6),(64,10272,31,40),(65,10272,72,24),(66,10273,10,24),(67,10273,31,15),(68,10273,33,20),(69,10273,40,60),(70,10273,76,33),(71,10274,71,20),(72,10274,72,7),(73,10275,24,12),(74,10275,59,6),(75,10276,10,15),(76,10276,13,10),(77,10277,28,20),(78,10277,62,12),(79,10278,44,16),(80,10278,59,15),(81,10278,63,8),(82,10278,73,25),(83,10279,17,15),(84,10280,24,12),(85,10280,55,20),(86,10280,75,30),(87,10281,19,1),(88,10281,24,6),(89,10281,35,4),(90,10282,30,6),(91,10282,57,2),(92,10283,15,20),(93,10283,19,18),(94,10283,60,35),(95,10283,72,3),(96,10284,27,15),(97,10284,44,21),(98,10284,60,20),(99,10284,67,5),(100,10285,1,45),(101,10285,40,40),(102,10285,53,36),(103,10286,35,100),(104,10286,62,40),(105,10287,16,40),(106,10287,34,20),(107,10287,46,15),(108,10288,54,10),(109,10288,68,3),(110,10289,3,30),(111,10289,64,9),(112,10290,5,20),(113,10290,29,15),(114,10290,49,15),(115,10290,77,10),(116,10291,13,20),(117,10291,44,24),(118,10291,51,2),(119,10292,20,20),(120,10293,18,12),(121,10293,24,10),(122,10293,63,5),(123,10293,75,6),(124,10294,1,18),(125,10294,17,15),(126,10294,43,15),(127,10294,60,21),(128,10294,75,6),(129,10295,56,4),(130,10296,11,12),(131,10296,16,30),(132,10296,69,15),(133,10297,39,60),(134,10297,72,20),(135,10298,2,40),(136,10298,36,40),(137,10298,59,30),(138,10298,62,15),(139,10299,19,15),(140,10299,70,20),(141,10300,66,30),(142,10300,68,20),(143,10301,40,10),(144,10301,56,20),(145,10302,17,40),(146,10302,28,28),(147,10302,43,12),(148,10303,40,40),(149,10303,65,30),(150,10303,68,15),(151,10304,49,30),(152,10304,59,10),(153,10304,71,2),(154,10305,18,25),(155,10305,29,25),(156,10305,39,30),(157,10306,30,10),(158,10306,53,10),(159,10306,54,5),(160,10307,62,10),(161,10307,68,3),(162,10308,69,1),(163,10308,70,5),(164,10309,4,20),(165,10309,6,30),(166,10309,42,2),(167,10309,43,20),(168,10309,71,3),(169,10310,16,10),(170,10310,62,5),(171,10311,42,6),(172,10311,69,7),(173,10312,28,4),(174,10312,43,24),(175,10312,53,20),(176,10312,75,10),(177,10313,36,12),(178,10314,32,40),(179,10314,58,30),(180,10314,62,25),(181,10315,34,14),(182,10315,70,30),(183,10316,41,10),(184,10316,62,70),(185,10317,1,20),(186,10318,41,20),(187,10318,76,6),(188,10319,17,8),(189,10319,28,14),(190,10319,76,30),(191,10320,71,30),(192,10321,35,10),(193,10322,52,20),(194,10323,15,5),(195,10323,25,4),(196,10323,39,4),(197,10324,16,21),(198,10324,35,70),(199,10324,46,30),(200,10324,59,40),(201,10324,63,80),(202,10325,6,6),(203,10325,13,12),(204,10325,14,9),(205,10325,31,4),(206,10325,72,40),(207,10326,4,24),(208,10326,57,16),(209,10326,75,50),(210,10327,2,25),(211,10327,11,50),(212,10327,30,35),(213,10327,58,30),(214,10328,59,9),(215,10328,65,40),(216,10328,68,10),(217,10329,19,10),(218,10329,30,8),(219,10329,38,20),(220,10329,56,12),(221,10330,26,50),(222,10330,72,25),(223,10331,54,15),(224,10332,18,40),(225,10332,42,10),(226,10332,47,16),(227,10333,14,10),(228,10333,21,10),(229,10333,71,40),(230,10334,52,8),(231,10334,68,10),(232,10335,2,7),(233,10335,31,25),(234,10335,32,6),(235,10335,51,48),(236,10336,4,18),(237,10337,23,40),(238,10337,26,24),(239,10337,36,20),(240,10337,37,28),(241,10337,72,25),(242,10338,17,20),(243,10338,30,15),(244,10339,4,10),(245,10339,17,70),(246,10339,62,28),(247,10340,18,20),(248,10340,41,12),(249,10340,43,40),(250,10341,33,8),(251,10341,59,9),(252,10342,2,24),(253,10342,31,56),(254,10342,36,40),(255,10342,55,40),(256,10343,64,50),(257,10343,68,4),(258,10343,76,15),(259,10344,4,35),(260,10344,8,70),(261,10345,8,70),(262,10345,19,80),(263,10345,42,9),(264,10346,17,36),(265,10346,56,20),(266,10347,25,10),(267,10347,39,50),(268,10347,40,4),(269,10347,75,6),(270,10348,1,15),(271,10348,23,25),(272,10349,54,24),(273,10350,50,15),(274,10350,69,18),(275,10351,38,20),(276,10351,41,13),(277,10351,44,77),(278,10351,65,10),(279,10352,24,10),(280,10352,54,20),(281,10353,11,12),(282,10353,38,50),(283,10354,1,12),(284,10354,29,4),(285,10355,24,25),(286,10355,57,25),(287,10356,31,30),(288,10356,55,12),(289,10356,69,20),(290,10357,10,30),(291,10357,26,16),(292,10357,60,8),(293,10358,24,10),(294,10358,34,10),(295,10358,36,20),(296,10359,16,56),(297,10359,31,70),(298,10359,60,80),(299,10360,28,30),(300,10360,29,35),(301,10360,38,10),(302,10360,49,35),(303,10360,54,28),(304,10361,39,54),(305,10361,60,55),(306,10362,25,50),(307,10362,51,20),(308,10362,54,24),(309,10363,31,20),(310,10363,75,12),(311,10363,76,12),(312,10364,69,30),(313,10364,71,5),(314,10365,11,24),(315,10366,65,5),(316,10366,77,5),(317,10367,34,36),(318,10367,54,18),(319,10367,65,15),(320,10367,77,7),(321,10368,21,5),(322,10368,28,13),(323,10368,57,25),(324,10368,64,35),(325,10369,29,20),(326,10369,56,18),(327,10370,1,15),(328,10370,64,30),(329,10370,74,20),(330,10371,36,6),(331,10372,20,12),(332,10372,38,40),(333,10372,60,70),(334,10372,72,42),(335,10373,58,80),(336,10373,71,50),(337,10374,31,30),(338,10374,58,15),(339,10375,14,15),(340,10375,54,10),(341,10376,31,42),(342,10377,28,20),(343,10377,39,20),(344,10378,71,6),(345,10379,41,8),(346,10379,63,16),(347,10379,65,20),(348,10380,30,18),(349,10380,53,20),(350,10380,60,6),(351,10380,70,30),(352,10381,74,14),(353,10382,5,32),(354,10382,18,9),(355,10382,29,14),(356,10382,33,60),(357,10382,74,50),(358,10383,13,20),(359,10383,50,15),(360,10383,56,20),(361,10384,20,28),(362,10384,60,15),(363,10385,7,10),(364,10385,60,20),(365,10385,68,8),(366,10386,24,15),(367,10386,34,10),(368,10387,24,15),(369,10387,28,6),(370,10387,59,12),(371,10387,71,15),(372,10388,45,15),(373,10388,52,20),(374,10388,53,40),(375,10389,10,16),(376,10389,55,15),(377,10389,62,20),(378,10389,70,30),(379,10390,31,60),(380,10390,35,40),(381,10390,46,45),(382,10390,72,24),(383,10391,13,18),(384,10392,69,50),(385,10393,2,25),(386,10393,14,42),(387,10393,25,7),(388,10393,26,70),(389,10393,31,32),(390,10394,13,10),(391,10394,62,10),(392,10395,46,28),(393,10395,53,70),(394,10395,69,8),(395,10396,23,40),(396,10396,71,60),(397,10396,72,21),(398,10397,21,10),(399,10397,51,18),(400,10398,35,30),(401,10398,55,120),(402,10399,68,60),(403,10399,71,30),(404,10399,76,35),(405,10399,77,14),(406,10400,29,21),(407,10400,35,35),(408,10400,49,30),(409,10401,30,18),(410,10401,56,70),(411,10401,65,20),(412,10401,71,60),(413,10402,23,60),(414,10402,63,65),(415,10403,16,21),(416,10403,48,70),(417,10404,26,30),(418,10404,42,40),(419,10404,49,30),(420,10405,3,50),(421,10406,1,10),(422,10406,21,30),(423,10406,28,42),(424,10406,36,5),(425,10406,40,2),(426,10407,11,30),(427,10407,69,15),(428,10407,71,15),(429,10408,37,10),(430,10408,54,6),(431,10408,62,35),(432,10409,14,12),(433,10409,21,12),(434,10410,33,49),(435,10410,59,16),(436,10411,41,25),(437,10411,44,40),(438,10411,59,9),(439,10412,14,20),(440,10413,1,24),(441,10413,62,40),(442,10413,76,14),(443,10414,19,18),(444,10414,33,50),(445,10415,17,2),(446,10415,33,20),(447,10416,19,20),(448,10416,53,10),(449,10416,57,20),(450,10417,38,50),(451,10417,46,2),(452,10417,68,36),(453,10417,77,35),(454,10418,2,60),(455,10418,47,55),(456,10418,61,16),(457,10418,74,15),(458,10419,60,60),(459,10419,69,20),(460,10420,9,20),(461,10420,13,2),(462,10420,70,8),(463,10420,73,20),(464,10421,19,4),(465,10421,26,30),(466,10421,53,15),(467,10421,77,10),(468,10422,26,2),(469,10423,31,14),(470,10423,59,20),(471,10424,35,60),(472,10424,38,49),(473,10424,68,30),(474,10425,55,10),(475,10425,76,20),(476,10426,56,5),(477,10426,64,7),(478,10427,14,35),(479,10428,46,20),(480,10429,50,40),(481,10429,63,35),(482,10430,17,45),(483,10430,21,50),(484,10430,56,30),(485,10430,59,70),(486,10431,17,50),(487,10431,40,50),(488,10431,47,30),(489,10432,26,10),(490,10432,54,40),(491,10433,56,28),(492,10434,11,6),(493,10434,76,18),(494,10435,2,10),(495,10435,22,12),(496,10435,72,10),(497,10436,46,5),(498,10436,56,40),(499,10436,64,30),(500,10436,75,24),(501,10437,53,15),(502,10438,19,15),(503,10438,34,20),(504,10438,57,15),(505,10439,12,15),(506,10439,16,16),(507,10439,64,6),(508,10439,74,30),(509,10440,2,45),(510,10440,16,49),(511,10440,29,24),(512,10440,61,90),(513,10441,27,50),(514,10442,11,30),(515,10442,54,80),(516,10442,66,60),(517,10443,11,6),(518,10443,28,12);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `EmployeeID` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShipperID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `ShipperID` (`ShipperID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`ShipperID`) REFERENCES `shippers` (`ShipperID`)
) ENGINE=InnoDB AUTO_INCREMENT=10444 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (10248,90,5,'1996-07-04',3),(10249,81,6,'1996-07-05',1),(10250,34,4,'1996-07-08',2),(10251,84,3,'1996-07-08',1),(10252,76,4,'1996-07-09',2),(10253,34,3,'1996-07-10',2),(10254,14,5,'1996-07-11',2),(10255,68,9,'1996-07-12',3),(10256,88,3,'1996-07-15',2),(10257,35,4,'1996-07-16',3),(10258,20,1,'1996-07-17',1),(10259,13,4,'1996-07-18',3),(10260,55,4,'1996-07-19',1),(10261,61,4,'1996-07-19',2),(10262,65,8,'1996-07-22',3),(10263,20,9,'1996-07-23',3),(10264,24,6,'1996-07-24',3),(10265,7,2,'1996-07-25',1),(10266,87,3,'1996-07-26',3),(10267,25,4,'1996-07-29',1),(10268,33,8,'1996-07-30',3),(10269,89,5,'1996-07-31',1),(10270,87,1,'1996-08-01',1),(10271,75,6,'1996-08-01',2),(10272,65,6,'1996-08-02',2),(10273,63,3,'1996-08-05',3),(10274,85,6,'1996-08-06',1),(10275,49,1,'1996-08-07',1),(10276,80,8,'1996-08-08',3),(10277,52,2,'1996-08-09',3),(10278,5,8,'1996-08-12',2),(10279,44,8,'1996-08-13',2),(10280,5,2,'1996-08-14',1),(10281,69,4,'1996-08-14',1),(10282,69,4,'1996-08-15',1),(10283,46,3,'1996-08-16',3),(10284,44,4,'1996-08-19',1),(10285,63,1,'1996-08-20',2),(10286,63,8,'1996-08-21',3),(10287,67,8,'1996-08-22',3),(10288,66,4,'1996-08-23',1),(10289,11,7,'1996-08-26',3),(10290,15,8,'1996-08-27',1),(10291,61,6,'1996-08-27',2),(10292,81,1,'1996-08-28',2),(10293,80,1,'1996-08-29',3),(10294,65,4,'1996-08-30',2),(10295,85,2,'1996-09-02',2),(10296,46,6,'1996-09-03',1),(10297,7,5,'1996-09-04',2),(10298,37,6,'1996-09-05',2),(10299,67,4,'1996-09-06',2),(10300,49,2,'1996-09-09',2),(10301,86,8,'1996-09-09',2),(10302,76,4,'1996-09-10',2),(10303,30,7,'1996-09-11',2),(10304,80,1,'1996-09-12',2),(10305,55,8,'1996-09-13',3),(10306,69,1,'1996-09-16',3),(10307,48,2,'1996-09-17',2),(10308,2,7,'1996-09-18',3),(10309,37,3,'1996-09-19',1),(10310,77,8,'1996-09-20',2),(10311,18,1,'1996-09-20',3),(10312,86,2,'1996-09-23',2),(10313,63,2,'1996-09-24',2),(10314,65,1,'1996-09-25',2),(10315,38,4,'1996-09-26',2),(10316,65,1,'1996-09-27',3),(10317,48,6,'1996-09-30',1),(10318,38,8,'1996-10-01',2),(10319,80,7,'1996-10-02',3),(10320,87,5,'1996-10-03',3),(10321,38,3,'1996-10-03',2),(10322,58,7,'1996-10-04',3),(10323,39,4,'1996-10-07',1),(10324,71,9,'1996-10-08',1),(10325,39,1,'1996-10-09',3),(10326,8,4,'1996-10-10',2),(10327,24,2,'1996-10-11',1),(10328,28,4,'1996-10-14',3),(10329,75,4,'1996-10-15',2),(10330,46,3,'1996-10-16',1),(10331,9,9,'1996-10-16',1),(10332,51,3,'1996-10-17',2),(10333,87,5,'1996-10-18',3),(10334,84,8,'1996-10-21',2),(10335,37,7,'1996-10-22',2),(10336,60,7,'1996-10-23',2),(10337,25,4,'1996-10-24',3),(10338,55,4,'1996-10-25',3),(10339,51,2,'1996-10-28',2),(10340,9,1,'1996-10-29',3),(10341,73,7,'1996-10-29',3),(10342,25,4,'1996-10-30',2),(10343,44,4,'1996-10-31',1),(10344,89,4,'1996-11-01',2),(10345,63,2,'1996-11-04',2),(10346,65,3,'1996-11-05',3),(10347,21,4,'1996-11-06',3),(10348,86,4,'1996-11-07',2),(10349,75,7,'1996-11-08',1),(10350,41,6,'1996-11-11',2),(10351,20,1,'1996-11-11',1),(10352,28,3,'1996-11-12',3),(10353,59,7,'1996-11-13',3),(10354,58,8,'1996-11-14',3),(10355,4,6,'1996-11-15',1),(10356,86,6,'1996-11-18',2),(10357,46,1,'1996-11-19',3),(10358,41,5,'1996-11-20',1),(10359,72,5,'1996-11-21',3),(10360,7,4,'1996-11-22',3),(10361,63,1,'1996-11-22',2),(10362,9,3,'1996-11-25',1),(10363,17,4,'1996-11-26',3),(10364,19,1,'1996-11-26',1),(10365,3,3,'1996-11-27',2),(10366,29,8,'1996-11-28',2),(10367,83,7,'1996-11-28',3),(10368,20,2,'1996-11-29',2),(10369,75,8,'1996-12-02',2),(10370,14,6,'1996-12-03',2),(10371,41,1,'1996-12-03',1),(10372,62,5,'1996-12-04',2),(10373,37,4,'1996-12-05',3),(10374,91,1,'1996-12-05',3),(10375,36,3,'1996-12-06',2),(10376,51,1,'1996-12-09',2),(10377,72,1,'1996-12-09',3),(10378,24,5,'1996-12-10',3),(10379,61,2,'1996-12-11',1),(10380,37,8,'1996-12-12',3),(10381,46,3,'1996-12-12',3),(10382,20,4,'1996-12-13',1),(10383,4,8,'1996-12-16',3),(10384,5,3,'1996-12-16',3),(10385,75,1,'1996-12-17',2),(10386,21,9,'1996-12-18',3),(10387,70,1,'1996-12-18',2),(10388,72,2,'1996-12-19',1),(10389,10,4,'1996-12-20',2),(10390,20,6,'1996-12-23',1),(10391,17,3,'1996-12-23',3),(10392,59,2,'1996-12-24',3),(10393,71,1,'1996-12-25',3),(10394,36,1,'1996-12-25',3),(10395,35,6,'1996-12-26',1),(10396,25,1,'1996-12-27',3),(10397,60,5,'1996-12-27',1),(10398,71,2,'1996-12-30',3),(10399,83,8,'1996-12-31',3),(10400,19,1,'1997-01-01',3),(10401,65,1,'1997-01-01',1),(10402,20,8,'1997-01-02',2),(10403,20,4,'1997-01-03',3),(10404,49,2,'1997-01-03',1),(10405,47,1,'1997-01-06',1),(10406,62,7,'1997-01-07',1),(10407,56,2,'1997-01-07',2),(10408,23,8,'1997-01-08',1),(10409,54,3,'1997-01-09',1),(10410,10,3,'1997-01-10',3),(10411,10,9,'1997-01-10',3),(10412,87,8,'1997-01-13',2),(10413,41,3,'1997-01-14',2),(10414,21,2,'1997-01-14',3),(10415,36,3,'1997-01-15',1),(10416,87,8,'1997-01-16',3),(10417,73,4,'1997-01-16',3),(10418,63,4,'1997-01-17',1),(10419,68,4,'1997-01-20',2),(10420,88,3,'1997-01-21',1),(10421,61,8,'1997-01-21',1),(10422,27,2,'1997-01-22',1),(10423,31,6,'1997-01-23',3),(10424,51,7,'1997-01-23',2),(10425,41,6,'1997-01-24',2),(10426,29,4,'1997-01-27',1),(10427,59,4,'1997-01-27',2),(10428,66,7,'1997-01-28',1),(10429,37,3,'1997-01-29',2),(10430,20,4,'1997-01-30',1),(10431,10,4,'1997-01-30',2),(10432,75,3,'1997-01-31',2),(10433,60,3,'1997-02-03',3),(10434,24,3,'1997-02-03',2),(10435,16,8,'1997-02-04',2),(10436,7,3,'1997-02-05',2),(10437,87,8,'1997-02-05',1),(10438,79,3,'1997-02-06',2),(10439,51,6,'1997-02-07',3),(10440,71,4,'1997-02-10',2),(10441,55,3,'1997-02-10',2),(10442,20,3,'1997-02-11',2),(10443,66,8,'1997-02-12',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Chais',1,1,'10 boxes x 20 bags',18),(2,'Chang',1,1,'24 - 12 oz bottles',19),(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10),(4,'Chef Anton\'s Cajun Seasoning',2,2,'48 - 6 oz jars',22),(5,'Chef Anton\'s Gumbo Mix',2,2,'36 boxes',21.35),(6,'Grandma\'s Boysenberry Spread',3,2,'12 - 8 oz jars',25),(7,'Uncle Bob\'s Organic Dried Pears',3,7,'12 - 1 lb pkgs.',30),(8,'Northwoods Cranberry Sauce',3,2,'12 - 12 oz jars',40),(9,'Mishi Kobe Niku',4,6,'18 - 500 g pkgs.',97),(10,'Ikura',4,8,'12 - 200 ml jars',31),(11,'Queso Cabrales',5,4,'1 kg pkg.',21),(12,'Queso Manchego La Pastora',5,4,'10 - 500 g pkgs.',38),(13,'Konbu',6,8,'2 kg box',6),(14,'Tofu',6,7,'40 - 100 g pkgs.',23.25),(15,'Genen Shouyu',6,2,'24 - 250 ml bottles',15.5),(16,'Pavlova',7,3,'32 - 500 g boxes',17.45),(17,'Alice Mutton',7,6,'20 - 1 kg tins',39),(18,'Carnarvon Tigers',7,8,'16 kg pkg.',62.5),(19,'Teatime Chocolate Biscuits',8,3,'10 boxes x 12 pieces',9.2),(20,'Sir Rodney\'s Marmalade',8,3,'30 gift boxes',81),(21,'Sir Rodney\'s Scones',8,3,'24 pkgs. x 4 pieces',10),(22,'Gustaf\'s Knäckebröd',9,5,'24 - 500 g pkgs.',21),(23,'Tunnbröd',9,5,'12 - 250 g pkgs.',9),(24,'Guaraná Fantástica',10,1,'12 - 355 ml cans',4.5),(25,'NuNuCa Nuß-Nougat-Creme',11,3,'20 - 450 g glasses',14),(26,'Gumbär Gummibärchen',11,3,'100 - 250 g bags',31.23),(27,'Schoggi Schokolade',11,3,'100 - 100 g pieces',43.9),(28,'Rössle Sauerkraut',12,7,'25 - 825 g cans',45.6),(29,'Thüringer Rostbratwurst',12,6,'50 bags x 30 sausgs.',123.79),(30,'Nord-Ost Matjeshering',13,8,'10 - 200 g glasses',25.89),(31,'Gorgonzola Telino',14,4,'12 - 100 g pkgs',12.5),(32,'Mascarpone Fabioli',14,4,'24 - 200 g pkgs.',32),(33,'Geitost',15,4,'500 g',2.5),(34,'Sasquatch Ale',16,1,'24 - 12 oz bottles',14),(35,'Steeleye Stout',16,1,'24 - 12 oz bottles',18),(36,'Inlagd Sill',17,8,'24 - 250 g jars',19),(37,'Gravad lax',17,8,'12 - 500 g pkgs.',26),(38,'Côte de Blaye',18,1,'12 - 75 cl bottles',263.5),(39,'Chartreuse verte',18,1,'750 cc per bottle',18),(40,'Boston Crab Meat',19,8,'24 - 4 oz tins',18.4),(41,'Jack\'s New England Clam Chowder',19,8,'12 - 12 oz cans',9.65),(42,'Singaporean Hokkien Fried Mee',20,5,'32 - 1 kg pkgs.',14),(43,'Ipoh Coffee',20,1,'16 - 500 g tins',46),(44,'Gula Malacca',20,2,'20 - 2 kg bags',19.45),(45,'Røgede sild',21,8,'1k pkg.',9.5),(46,'Spegesild',21,8,'4 - 450 g glasses',12),(47,'Zaanse koeken',22,3,'10 - 4 oz boxes',9.5),(48,'Chocolade',22,3,'10 pkgs.',12.75),(49,'Maxilaku',23,3,'24 - 50 g pkgs.',20),(50,'Valkoinen suklaa',23,3,'12 - 100 g bars',16.25),(51,'Manjimup Dried Apples',24,7,'50 - 300 g pkgs.',53),(52,'Filo Mix',24,5,'16 - 2 kg boxes',7),(53,'Perth Pasties',24,6,'48 pieces',32.8),(54,'Tourtière',25,6,'16 pies',7.45),(55,'Pâté chinois',25,6,'24 boxes x 2 pies',24),(56,'Gnocchi di nonna Alice',26,5,'24 - 250 g pkgs.',38),(57,'Ravioli Angelo',26,5,'24 - 250 g pkgs.',19.5),(58,'Escargots de Bourgogne',27,8,'24 pieces',13.25),(59,'Raclette Courdavault',28,4,'5 kg pkg.',55),(60,'Camembert Pierrot',28,4,'15 - 300 g rounds',34),(61,'Sirop d\'érable',29,2,'24 - 500 ml bottles',28.5),(62,'Tarte au sucre',29,3,'48 pies',49.3),(63,'Vegie-spread',7,2,'15 - 625 g jars',43.9),(64,'Wimmers gute Semmelknödel',12,5,'20 bags x 4 pieces',33.25),(65,'Louisiana Fiery Hot Pepper Sauce',2,2,'32 - 8 oz bottles',21.05),(66,'Louisiana Hot Spiced Okra',2,2,'24 - 8 oz jars',17),(67,'Laughing Lumberjack Lager',16,1,'24 - 12 oz bottles',14),(68,'Scottish Longbreads',8,3,'10 boxes x 8 pieces',12.5),(69,'Gudbrandsdalsost',15,4,'10 kg pkg.',36),(70,'Outback Lager',7,1,'24 - 355 ml bottles',15),(71,'Fløtemysost',15,4,'10 - 500 g pkgs.',21.5),(72,'Mozzarella di Giovanni',14,4,'24 - 200 g pkgs.',34.8),(73,'Röd Kaviar',17,8,'24 - 150 g jars',15),(74,'Longlife Tofu',4,7,'5 kg pkg.',10),(75,'Rhönbräu Klosterbier',12,1,'24 - 0.5 l bottles',7.75),(76,'Lakkalikööri',23,1,'500 ml',18),(77,'Original Frankfurter grüne Soße',12,2,'12 boxes',13),(78,'Band Aid',1,1,'10 boxes x 20 bags',4);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippers` (
  `ShipperID` int NOT NULL AUTO_INCREMENT,
  `ShipperName` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
INSERT INTO `shippers` VALUES (1,'Speedy Express','(503) 555-9831'),(2,'United Package','(503) 555-3199'),(3,'Federal Shipping','(503) 555-9931');
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(255) DEFAULT NULL,
  `ContactName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Exotic Liquid','Charlotte Cooper','49 Gilbert St.','Londona','EC1 4SD','UK','(171) 555-2222'),(2,'New Orleans Cajun Delights','Shelley Burke','P.O. Box 78934','New Orleans','70117','USA','(100) 555-4822'),(3,'Grandma Kelly\'s Homestead','Regina Murphy','707 Oxford Rd.','Ann Arbor','48104','USA','(313) 555-5735'),(4,'Tokyo Traders','Yoshi Nagase','9-8 Sekimai Musashino-shi','Tokyo','100','Japan','(03) 3555-5011'),(5,'Cooperativa de Quesos \'Las Cabras\'','Antonio del Valle Saavedra','Calle del Rosal 4','Oviedo','33007','Spain','(98) 598 76 54'),(6,'Mayumi\'s','Mayumi Ohno','92 Setsuko Chuo-ku','Osaka','545','Japan','(06) 431-7877'),(7,'Pavlova, Ltd.','Ian Devling','74 Rose St. Moonie Ponds','Melbourne','3058','Australia','(03) 444-2343'),(8,'Specialty Biscuits, Ltd.','Peter Wilson','29 King\'s Way','Manchester','M14 GSD','UK','(161) 555-4448'),(9,'PB Knäckebröd AB','Lars Peterson','Kaloadagatan 13','Göteborg','S-345 67','Sweden','031-987 65 43'),(10,'Refrescos Americanas LTDA','Carlos Diaz','Av. das Americanas 12.890','São Paulo','5442','Brazil','(11) 555 4640'),(11,'Heli Süßwaren GmbH & Co. KG','Petra Winkler','Tiergartenstraße 5','Berlin','10785','Germany','(010) 9984510'),(12,'Plutzer Lebensmittelgroßmärkte AG','Martin Bein','Bogenallee 51','Frankfurt','60439','Germany','(069) 992755'),(13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Frahmredder 112a','Cuxhaven','27478','Germany','(04721) 8713'),(14,'Formaggi Fortini s.r.l.','Elio Rossi','Viale Dante, 75','Ravenna','48100','Italy','(0544) 60323'),(15,'Norske Meierier','Beate Vileid','Hatlevegen 5','Sandvika','1320','Norway','(0)2-953010'),(16,'Bigfoot Breweries','Cheryl Saylor','3400 - 8th Avenue Suite 210','Bend','97101','USA','(503) 555-9931'),(17,'Svensk Sjöföda AB','Michael Björn','Brovallavägen 231','Stockholm','S-123 45','Sweden','08-123 45 67'),(18,'Aux joyeux ecclésiastiques','Guylène Nodier','203, Rue des Francs-Bourgeois','Paris','75004','France','(1) 03.83.00.68'),(19,'New England Seafood Cannery','Robb Merchant','Order Processing Dept. 2100 Paul Revere Blvd.','Boston','02134','USA','(617) 555-3267'),(20,'Leka Trading','Chandra Leka','471 Serangoon Loop, Suite #402','Singapore','0512','Singapore','555-8787'),(21,'Lyngbysild','Niels Petersen','Lyngbysild Fiskebakken 10','Lyngby','2800','Denmark','43844108'),(22,'Zaanse Snoepfabriek','Dirk Luchte','Verkoop Rijnweg 22','Zaandam','9999 ZZ','Netherlands','(12345) 1212'),(23,'Karkki Oy','Anne Heikkonen','Valtakatu 12','Lappeenranta','53120','Finland','(953) 10956'),(24,'G\'day, Mate','Wendy Mackenzie','170 Prince Edward Parade Hunter\'s Hill','Sydney','2042','Australia','(02) 555-5914'),(25,'Ma Maison','Jean-Guy Lauzon','2960 Rue St. Laurent','Montréal','H1J 1C3','Canada','(514) 555-9022'),(26,'Pasta Buttini s.r.l.','Giovanni Giudici','Via dei Gelsomini, 153','Salerno','84100','Italy','(089) 6547665'),(27,'Escargots Nouveaux','Marie Delamare','22, rue H. Voiron','Montceau','71300','France','85.57.00.07'),(28,'Gai pâturage','Eliane Noz','Bat. B 3, rue des Alpes','Annecy','74000','France','38.76.98.06'),(29,'Forêts d\'érables','Chantal Goulet','148 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canada','(514) 555-2955');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_orders`
--

DROP TABLE IF EXISTS `vw_orders`;
/*!50001 DROP VIEW IF EXISTS `vw_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_orders` AS SELECT 
 1 AS `OrderID`,
 1 AS `CustomerID`,
 1 AS `EmployeeID`,
 1 AS `Quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_top_10_customers`
--

DROP TABLE IF EXISTS `vw_top_10_customers`;
/*!50001 DROP VIEW IF EXISTS `vw_top_10_customers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_top_10_customers` AS SELECT 
 1 AS `CustomerID`,
 1 AS `CustomerName`,
 1 AS `TotalQtyOrdered`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_top_10_employees`
--

DROP TABLE IF EXISTS `vw_top_10_employees`;
/*!50001 DROP VIEW IF EXISTS `vw_top_10_employees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_top_10_employees` AS SELECT 
 1 AS `EmployeeID`,
 1 AS `FullName`,
 1 AS `TotalQty`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_orders`
--

/*!50001 DROP VIEW IF EXISTS `vw_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_orders` AS select `o`.`OrderID` AS `OrderID`,`o`.`CustomerID` AS `CustomerID`,`o`.`EmployeeID` AS `EmployeeID`,`od`.`Quantity` AS `Quantity` from (`orders` `o` join `order_details` `od` on((`o`.`OrderID` = `od`.`OrderID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_top_10_customers`
--

/*!50001 DROP VIEW IF EXISTS `vw_top_10_customers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_top_10_customers` AS select `c`.`CustomerID` AS `CustomerID`,`c`.`CustomerName` AS `CustomerName`,sum(`o`.`Quantity`) AS `TotalQtyOrdered` from (`vw_orders` `o` join `customers` `c` on((`o`.`CustomerID` = `c`.`CustomerID`))) group by `c`.`CustomerID` order by `TotalQtyOrdered` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_top_10_employees`
--

/*!50001 DROP VIEW IF EXISTS `vw_top_10_employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_top_10_employees` AS select `e`.`EmployeeID` AS `EmployeeID`,concat(`e`.`FirstName`,' ',`e`.`LastName`) AS `FullName`,sum(`o`.`Quantity`) AS `TotalQty` from (`vw_orders` `o` join `employees` `e` on((`o`.`EmployeeID` = `e`.`EmployeeID`))) group by `e`.`EmployeeID` order by `TotalQty` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-26 19:56:33
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: laravel_crud
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_07_26_034130_create_positions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'HR Manager','2023-07-25 19:51:35','2023-07-25 19:51:35'),(2,'Supervisor','2023-07-25 21:06:06','2023-07-25 21:06:06'),(3,'Salesperson','2023-07-25 21:06:13','2023-07-25 21:06:13'),(4,'Cashier','2023-07-25 21:06:19','2023-07-25 21:06:19'),(5,'Bagger','2023-07-25 21:21:23','2023-07-25 21:29:04');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2023-07-26 19:56:33
