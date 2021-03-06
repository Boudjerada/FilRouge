-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: village_green
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Current Database: `village_green`
--


--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_nom` varchar(50) NOT NULL,
  `cat_parent_id` int DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `cat_parent_id` (`cat_parent_id`),
  CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`cat_parent_id`) REFERENCES `categorie` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Flûte',NULL),(2,'Guitare',NULL),(3,'Batterie',NULL),(4,'Basse',NULL),(5,'Saxophone',NULL),(6,'Piano',NULL),(7,'Sono',NULL),(8,'Percution',NULL),(9,'Flûte picollo',1),(10,'Flûte en ré',1),(11,'Flûte traversière',1),(12,'Flûte en sol ',1),(13,'guitare folk',2),(14,'guitare flamenco',2),(15,'guitare manouche',2),(16,'guitare à résonateur',2),(17,'Guitare électro-acoustique',2),(18,'Batterie à tambour',3),(19,'Batterie électrique',3),(20,'Basse à 4 cordes',4),(21,'Basse à 6 cordes',4),(22,'Contrebasse',4),(23,'Saxophone contrebasse',5),(24,'Saxophone basse',5),(25,'Saxophone baryton',5),(26,'Saxophone soprano',5),(27,'Piano classique',6),(28,'Piano pédale',6),(29,'Piano droit',6),(30,'Amplie',7),(31,'Micro',7),(32,'Enceinte',7),(33,'Caisse claire',8),(34,'Castagnettes',8),(35,'Célesta',8),(36,'Cymbales',8),(37,'Cymbales antiques',36),(38,'Cymbales frappées',36),(39,'Cymbales suspendues',36),(40,'Fouet',36);
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `cli_id` int NOT NULL AUTO_INCREMENT,
  `cli_nom` varchar(50) NOT NULL,
  `cli_prenom` varchar(30) DEFAULT NULL,
  `cli_adresse` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cli_codepostal` varchar(5) NOT NULL,
  `cli_ville` varchar(50) NOT NULL,
  `cli_pays_id` char(2) NOT NULL,
  `cli_mail` varchar(255) NOT NULL,
  `cli_tel` varchar(10) NOT NULL,
  `cli_motdepasse` varchar(60) NOT NULL,
  `cli_d_ajout` datetime NOT NULL,
  `cli_d_modif` datetime DEFAULT NULL,
  `cli_ref` varchar(20) NOT NULL,
  `cli_coef` decimal(3,2) NOT NULL,
  `cli_cat` varchar(5) NOT NULL,
  `cli_emp_id` int NOT NULL,
  PRIMARY KEY (`cli_id`),
  UNIQUE KEY `idx_cli_ref` (`cli_ref`),
  KEY `cli_pays_id` (`cli_pays_id`),
  KEY `cli_emp_id` (`cli_emp_id`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`cli_pays_id`) REFERENCES `pays` (`pays_id`),
  CONSTRAINT `client_ibfk_2` FOREIGN KEY (`cli_emp_id`) REFERENCES `employe` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Riviere','Romain','2301 boulevard Alsace-Lorraine','80000','Amiens','FR','risus.morbi@laposte.net','201583083','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-04-02 23:47:20','2020-05-06 00:01:53','hsfddsg',1.12,'Part',6),(2,'Bailly','Lilou','Ap #125-483 Fusce Street','80300','Birmingham','GB','sagittis.placerat@Aliquam.co.uk','700966695','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-12-14 06:52:52','2020-05-18 00:00:00','hdcdvsg',2.34,'Prof',7),(3,'Muller','Alexandre','P.O. Box 149, 6931 Nulla. Rd.','80100','Abbeville','FR','mauris.Morbi@Lorem.co.uk','167413271','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-08-19 01:35:44',NULL,'ergve',1.80,'Part',6),(4,'Lefebvre','Élisa','Ap #850-6013 Suscipit, Av.','62000','Arras','FR','laplusbelledu62g@gmail.com','710601863','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-05-11 02:58:51',NULL,'egtg',3.00,'Prof',7),(5,'Andre','Maëlle','Ap #449-9035 Ac Street','59133','Vieux-Genappe','FR','aliquam.adipiscing@fringilla.net','296292567','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-06-24 17:09:33',NULL,'zffez',2.04,'Part',6),(6,'Lemaire','Enzo','P.O. Box 771, 895 Libero Avenue','31779','Sevastopol','FR','interdum.feugiat@a.edu','395027964','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-08-16 15:18:39',NULL,'rrvac',2.34,'Prof',21),(7,'Perez','Bienvenue','Ap #382-9259 Tincidunt, Rd.','49960','Maastricht','FR','tempus.mauris@nonloremvitae.net','735753221','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-02-19 12:25:51',NULL,'etqhtzh',2.34,'Prof',89),(8,'Dumont','Emma','299-2527 Blandit Road','13011','Paternopoli','FR','tristique.ac@Sedmalesuadaaugue.com','373682901','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-07-17 08:28:22',NULL,'ddzcc',1.12,'Part',6),(9,'Riviere','Alice','P.O. Box 743, 4502 Dictum St.','64066','Campbelltown','FR','fringilla.ornare.placerat@odioEtiam.edu','962347562','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-06-26 23:05:17',NULL,'eavae',2.34,'Prof',7),(10,'Boucher','Noë','865-7652 Nibh. Ave','75197','Fermont','CA','facilisi.Sed.neque@eteuismodet.ca','527427380','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-01-24 12:00:27',NULL,'ccdfz',2.34,'Prof',7),(11,'Masson','Aaron','680-7022 Sollicitudin Avenue','68058','Renfrew','FR','felis.Nulla@ligulaAeneangravida.net','325055764','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-06-02 00:22:39',NULL,'frrvr',3.20,'Prof',21),(12,'Nazdorovie','Sergueï','592 Moskow road','51769','Vladivostok','RU','serguei@nazdorovie.ru','925855798','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-06-17 01:02:23','2020-05-23 00:00:00','ezfrv',2.34,'Prof',89),(13,'Lemoine','Yasmine','9317 Sodales Ave','06190','Huntsville','FR','dolor.sit.amet@Seddiam.net','857714507','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-08-29 21:44:14',NULL,'fzrfr',1.12,'Part',6),(14,'Lopez','Marion','292 Ligula. Road','47589','Kota','FR','molestie.in@accumsannequeet.edu','698455911','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-01-09 19:02:05',NULL,'tgtth',2.34,'Prof',21),(15,'Blanchard','Émilie','Ap #923-6845 Commodo Street','90846','Rodgau','FR','consectetuer.adipiscing@risusDuisa.co.uk','471496791','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-06-24 12:06:59',NULL,'thhhrr',2.34,'Prof',7),(16,'Philippe','Léonard','7315 Proin Street','70095','Matamata','FR','sodales.elit.erat@Vivamusnibhdolor.org','107172928','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-03-26 13:44:18',NULL,'ezfff',1.12,'Part',6),(17,'Girard','Kimberley','P.O. Box 184, 8937 Pretium Street','30481','Kamalia','FR','Suspendisse.sed.dolor@enimNunc.org','404189030','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-12-11 14:27:22',NULL,'edezdef',1.80,'Part',6),(18,'Morin','Élise','Ap #846-6229 Eu, St.','27844','West Valley City','FR','Integer.vitae@lorem.edu','254854268','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-04-28 23:38:36',NULL,'efefffz',3.00,'Prof',21),(19,'Lefebvre','Zoé','677-3832 Dis St.','94571','Caruaru','FR','Sed@odioAliquamvulputate.net','639577658','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-05-17 18:12:34',NULL,'feeff',2.34,'Prof',7),(20,'Renault','Lilian','163 Sed Avenue','36652','La Unión','FR','erat.semper@est.co.uk','255166898','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-04-11 05:47:10',NULL,'efzef',2.34,'Prof',89),(21,'Remy','Dimitri','Ap #801-6517 Eros Avenue','78009','Frigento','FR','amet.dapibus.id@placerat.ca','396036245','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-12-18 03:53:15',NULL,'deef',2.04,'Part',6),(22,'Guillaume','Lena','1064 Donec St.','78387','Anchorage','US','varius.orci@fermentum.com','953782036','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-11-15 06:58:24',NULL,'efezf',3.20,'Prof',7),(23,'Maillard','Charlotte','738 Euismod Avenue','17914','Losino-Petrovsky','RU','Maecenas.libero@nunc.com','817015812','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-05-09 13:47:48','2020-05-13 00:00:00','efzfzf',2.34,'Prof',89),(24,'Albert','Diego','Ap #332-8162 Proin Road','83410','Trois-Rivières','CA','aliquam@vestibulum.edu','255430951','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-10-08 11:56:34',NULL,'tyeju',1.12,'Part',6),(25,'Leclerc','Lauriane','Ap #661-6175 Turpis St.','88100','Pékin','CN','non@auctorveliteget.org','498920916','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-05-06 10:22:02',NULL,'hrgrah',2.34,'Prof',89),(26,'Poirier','Paul','Ap #784-932 Quis Rd.','42399','Flushing','FR','lectus.sit@ligulaAliquamerat.net','763446742','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-05-09 06:32:53',NULL,'ryetg',2.34,'Prof',21),(27,'Hubert','Marianne','8 cours javascript','80090','Amiens','FR','vitae.purus@curae.org','206792150','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-11-03 04:53:14','2020-06-01 00:00:00','thzhj',2.34,'Prof',89),(28,'Caron','Cédric','P.O. Box 643, 5476 Mi Rd.','23735','Vanderhoof','FR','egestas.Duis.ac@eleifend.edu','266232419','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-10-01 22:21:43',NULL,'fzrgzr',1.12,'Part',6),(29,'Fournier','Célia','P.O. Box 301, 1701 Neque. Street','14711','Harrisburg','FR','ante.Nunc@porta.edu','692615826','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-02-02 09:30:12',NULL,'hrgeth',2.34,'Prof',7),(30,'Hubert','Corentin','Ap #150-5696 Et, St.','08762','Veldwezelt','FR','fringilla.euismod.enim@Namligula.ca','539979021','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2000-10-08 04:53:40',NULL,'defez',1.12,'Part',6),(31,'Dupont','Macéo','P.O. Box 580, 927 Amet Ave','32275','Karachi','FR','Sed.auctor.odio@velitPellentesque.net','758036455','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-11-24 08:24:31',NULL,'tkutuj',1.12,'Part',6),(32,'Fabre','Maelys','P.O. Box 347, 5390 Sit St.','04549','Francavilla Fontana','FR','Duis.cursus@Pellentesquehabitantmorbi.ca','253671958','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-09-26 18:10:38',NULL,'rgedfet',2.34,'Prof',21),(33,'Henry','Florentin','4750 Molestie Rd.','91323','Heusden-Zolder','FR','a.sollicitudin@adipiscingfringilla.ca','726936785','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-07-04 00:37:24',NULL,'dscku',2.34,'Prof',89),(34,'Pons','Léonard','6857 Scelerisque Ave','52811','Antofagasta','FR','lectus@aliquet.edu','941616307','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-08-10 13:20:15',NULL,'ezdcfz',2.04,'Part',6),(35,'Fleury','Solene','Ap #518-8977 Duis Street','55043','Olmué','FR','mollis@laciniavitae.net','808630903','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-09-05 16:06:49',NULL,'ytdzejyt',3.20,'Prof',7),(36,'Richard','Rémi','P.O. Box 480, 2248 Ac Road','09509','Bilbo','FR','bibendum.sed@semvitaealiquam.ca','943962068','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-11-03 12:40:42',NULL,'rgczega',1.12,'Part',6),(37,'Blanc','Sarah','P.O. Box 535, 8956 Ut, Avenue','61210','Joliet','FR','rutrum@nibh.com','805575004','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-06-27 03:01:40',NULL,'zrgdcgga',2.34,'Prof',89),(38,'Evrard','Paul','P.O. Box 909, 6072 Nullam St.','79346','Raiganj','FR','arcu.Vestibulum@elitpellentesquea.org','401905237','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-03-31 09:57:34',NULL,'uycdyk',2.34,'Prof',21),(39,'Legrand','Romane','P.O. Box 567, 3645 Eu Rd.','41510','Vilvoorde','FR','nunc@faucibus.org','963165937','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-11-21 09:09:09',NULL,'zdhdhg',1.80,'Part',6),(40,'Huet','Julien','285-395 Est, Rd.','22174','Eschwege','FR','amet@eudolor.edu','240881253','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-06-11 22:34:48',NULL,'gtdvz',2.34,'Prof',89),(41,'Dubois','Lamia','145-1564 Vestibulum Rd.','86306','Valleyview','FR','Pellentesque.habitant.morbi@musAenean.ca','682183873','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-06-20 16:12:22',NULL,'ydcDh',3.00,'Prof',89),(42,'Carpentier','Maïwenn','P.O. Box 181, 3727 Sem Road','77351','Farrukhabad-cum-Fatehgarh','FR','sem.magna@sedorci.org','715511479','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-02-18 17:34:11',NULL,'gadhdgg',2.34,'Prof',21),(43,'Perez','Florentin','2114 Nisi. St.','75209','Trivandrum','FR','velit.justo.nec@MaurisnullaInteger.com','870041920','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-03-02 07:07:47',NULL,'hshgearhr',2.34,'Prof',7),(44,'Dupont','Chaïma','P.O. Box 576, 4207 Sociis Av.','78616','Romeral','FR','lorem.ipsum@Praesenteunulla.edu','399708266','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-08-26 02:39:06',NULL,'egaegrg',3.20,'Prof',89),(45,'Schneider','Alice','548-7461 Nunc Av.','18591','Marburg','FR','Aliquam.erat@eget.org','297079661','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-07-05 07:36:55',NULL,'rgdzch',2.34,'Prof',21),(46,'Gautier','Rose','P.O. Box 705, 741 Integer Avenue','73604','Kartaly','FR','ante@aliquet.com','932461360','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-09-13 08:02:43',NULL,'ukzefzk',1.12,'Part',6),(47,'Guillot','Loevan','Ap #601-2284 Commodo Road','54873','Gonnosfanadiga','FR','cursus.in@ultriciessem.ca','314644035','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-11-19 14:41:00',NULL,'ehefzh',2.34,'Prof',7),(48,'Lefevre','Clémence','476-8880 Suscipit, Rd.','61563','Vöcklabruck','FR','ut@sollicitudinadipiscing.co.uk','457752971','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-12-09 16:42:16',NULL,'jytfzt',2.04,'Part',6),(49,'Bouvier','Clara','P.O. Box 282, 9786 Tellus Street','07517','Wilskerke','FR','Fusce.fermentum.fermentum@adipiscingfringillaporttitor.co.uk','432914963','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-12-21 23:10:13',NULL,'tehfz',2.34,'Prof',89),(50,'Blanchard','Adam','P.O. Box 259, 7958 Sem, St.','82728','Roosbeek','FR','elementum@atfringillapurus.edu','139672737','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-08-13 16:41:09',NULL,'gjdhthh',1.12,'Part',6),(51,'Pikatchien','Jessica','92 rue de la plage','22190','Plérin','FR','jessica.pikatchien@plerin.fr','278564042','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-06-22 04:55:34','2020-05-18 07:26:24','hrgggah',1.12,'Part',6),(52,'Bailly','Léo','800-2734 Morbi Av.','50231','Widooie','FR','ornare.lectus@hendreritDonec.edu','734831721','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-02-01 18:54:35',NULL,'zfafg',1.12,'Part',6),(53,'Schneider','Florentin','P.O. Box 468, 4940 Cursus Rd.','36508','Vaux-sur-Sure','FR','erat.vitae@aliquet.com','821421997','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-03-16 09:28:03',NULL,'dvvzvv',2.34,'Prof',7),(54,'Caron','Martin','242-9793 Ipsum Road','51877','Tain','FR','pharetra.sed@Etiambibendumfermentum.edu','788393239','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-07-23 09:59:23',NULL,'bbrbb',1.12,'Part',6),(55,'David','Lutécia','665-963 Donec Road','44664','Westkapelle','FR','lorem@felispurusac.net','792783693','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-05-25 12:33:45',NULL,'ggebth',2.34,'Prof',89),(56,'Robert','Agathe','6737 Ut, Road','05249','Sandy','FR','nunc.sed.pede@consectetueradipiscing.com','634450159','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-01-30 21:14:24',NULL,'tutukkt',2.34,'Prof',21),(57,'Rodriguez','Macéo','P.O. Box 355, 2303 Vitae Street','57821','Suncheon','FR','orci@ametornarelectus.org','472684476','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-01-22 06:07:53',NULL,'efeggea',2.34,'Prof',7),(58,'Humbert','Élouan','P.O. Box 452, 8712 Purus, Av.','05252','Alix','FR','quam.dignissim.pharetra@ornare.org','682265107','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-07-24 01:49:50',NULL,'rgeeb',3.00,'Prof',7),(59,'Charpentier','Lucie','9957 Morbi Rd.','24752','Aschersleben','FR','ac.nulla@ante.net','441099805','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-07-15 19:33:57',NULL,'rgherh',3.20,'Prof',21),(60,'Colin','Yanis','804-4641 Nunc. Avenue','16829','Alness','FR','sit.amet.orci@turpisnec.co.uk','812254447','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-06-19 11:55:02',NULL,'grzggeep',1.12,'Part',6),(61,'Robert','Élise','Ap #872-7281 Amet Street','09693','Rocky Mountain House','FR','erat.nonummy.ultricies@sapienAenean.ca','407007247','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-12-08 10:54:13',NULL,'ylyik',2.34,'Prof',89),(62,'Lucas','Laura','976-2480 Turpis Ave','58690','Alanya','FR','vel.mauris@massarutrummagna.ca','405524344','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','0000-00-00 00:00:00',NULL,'tjyjt',2.34,'Prof',89),(63,'Laurent','Quentin','489-9653 Fermentum Rd.','65691','Fort Resolution','FR','porttitor.interdum@dictum.co.uk','707373852','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-06-08 17:58:44',NULL,'thrth',2.04,'Part',6),(64,'Giraud','Kimberley','7411 Ut Rd.','51814','Stroud','FR','nec@nectempus.com','103884425','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-06-28 21:35:30',NULL,'grgetth',2.34,'Prof',89),(65,'Bailly','Julien','Ap #182-3848 Nunc St.','82181','Laramie','FR','Morbi@feugiatLorem.org','274508650','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-05-01 14:27:23',NULL,'grgeeeeg',1.12,'Part',6),(66,'Chevalier','Gaspard','8464 Blandit Rd.','03869','Glain','FR','elit.sed.consequat@ultricies.co.uk','466809005','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-04-06 14:32:34',NULL,'vbdbgb',2.34,'Prof',7),(67,'Francois','Tatiana','Ap #961-9752 Vestibulum Rd.','77822','Cap-de-la-Madeleine','FR','dictum.mi.ac@ametconsectetueradipiscing.org','200147301','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-01-26 19:17:52',NULL,'fvqvrrr',2.34,'Prof',89),(68,'Mercier','Constant','Ap #706-6920 Amet Rd.','49458','Haut-Ittre','FR','tellus.imperdiet@variusorciin.org','296096563','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-03-14 09:41:04',NULL,'hggrh',2.34,'Prof',21),(69,'Gomez','Jérémy','70 avenue des travailleurs','80000','Amiens','FR','lacus.Etiam@nibhco.net','967938363','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-12-15 13:46:02','2020-06-01 00:00:00','ilyily',2.34,'Prof',89),(70,'Leroy','Benjamin','P.O. Box 202, 4157 Et, Avenue','41799','Eckernförde','FR','non.magna.Nam@ultriciesdignissim.com','199309302','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-04-16 12:28:17',NULL,'iltiil',2.34,'Prof',21),(71,'Rolland','Ethan','907-4675 Pede Rd.','32055','Enterprise','FR','dolor.Fusce.mi@dignissim.co.uk','584704040','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-11-01 17:46:48',NULL,'ethhtt',1.80,'Part',6),(72,'Meunier','Margaux','P.O. Box 461, 5531 In Rd.','39165','Glimes','FR','morbi.tristique.senectus@Phasellusdolor.co.uk','422001131','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-12-16 15:43:52',NULL,'tuzyuu',2.34,'Prof',7),(73,'Roger','Thomas','P.O. Box 505, 6494 Vel Avenue','06743','Fino Mornasco','FR','porttitor.vulputate@egetipsumSuspendisse.edu','894398702','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-12-25 11:33:00',NULL,'yiliylti',2.34,'Prof',89),(74,'Renaud','Anaël','Ap #309-9136 Suspendisse St.','45464','Westmount','FR','eget@ipsumcursusvestibulum.edu','299244593','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-03-11 14:57:33',NULL,'ethargh',2.34,'Prof',89),(75,'Morin','Yüna','8089 Erat St.','07900','Shenkursk','FR','Integer@lectuspedeultrices.org','230162777','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-07-28 04:31:18',NULL,'reage',3.20,'Prof',7),(76,'Joly','Eva','479-8537 Ipsum Ave','42231','Bhimavaram','FR','et.nunc.Quisque@odiotristique.com','917398026','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-11-09 23:09:40',NULL,'grrgggrge',1.12,'Part',6),(77,'Garnier','Anaël','4703 Fringilla, Street','66625','Kobbegem','FR','at.arcu@vitaeodio.org','173395243','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-10-20 09:29:18',NULL,'yjtyyj',3.00,'Prof',89),(78,'Martinez','Lina','Ap #466-9700 Pede. Avenue','46174','My','FR','nisi.nibh.lacinia@nunc.com','497067354','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-05-24 09:07:41',NULL,'ukruku',2.34,'Prof',21),(79,'Le gall','Nathan','P.O. Box 792, 625 Libero Rd.','40854','Ancaster Town','FR','Sed.nunc@sitamet.ca','676975310','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-09-25 11:13:28',NULL,'iultil',2.34,'Prof',7),(80,'Martinez','Fanny','Ap #677-8255 Et Avenue','14981','Rodgau','FR','tortor@maurissitamet.co.uk','893683553','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-12-11 22:25:30',NULL,'qteti',2.34,'Prof',7),(81,'Clement','Lucas','694-5524 Sit St.','92268','Branchon','FR','luctus@vitaeorci.org','786695746','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-04-01 19:01:57',NULL,'hqetjetj',2.34,'Prof',89),(82,'Marchal','Thomas','200-3480 A Road','11669','Saint-Honor�','FR','magna.Praesent.interdum@velit.edu','225003361','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-01-15 06:06:53',NULL,'uyuykft',2.34,'Prof',89),(83,'Rey','Alicia','P.O. Box 606, 9603 Lorem Av.','75377','l Escaillre','FR','Mauris.magna@est.co.uk','413194483','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','0000-00-00 00:00:00',NULL,'zrttjy',1.12,'Part',6),(84,'Rey','Jeanne','P.O. Box 550, 3352 Vitae Avenue','81795','Olmué','FR','auctor@sem.com','585086153','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-09-11 17:17:01',NULL,'uiykyyge',2.34,'Prof',21),(85,'Bouvier','Léonie','116-5083 Tortor. Ave','67639','Chieti','FR','Duis.risus.odio@a.com','164663188','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-11-02 11:42:08',NULL,'tjebet',3.20,'Prof',7),(86,'Paul','Marwane','249-1253 Odio Street','70886','Wimmertingen','FR','sociis.natoque.penatibus@suscipit.org','702449373','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-02-25 04:13:58',NULL,'yurtez',2.34,'Prof',89),(87,'Collin','Macéo','Ap #349-3573 Nibh St.','04443','Terrance','FR','per@pellentesqueSed.ca','197051563','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-05-23 08:50:39',NULL,'rgtyj',2.04,'Part',6),(88,'Maillard','Maelys','6013 Metus Avenue','88526','Huancayo','FR','magnis@tristiquealiquet.net','362978211','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-09-22 07:22:30',NULL,'ezfuy',2.34,'Prof',89),(89,'Maillard','Constant','Ap #403-2940 Egestas St.','61695','Heidenheim','FR','parturient.montes.nascetur@luctussitamet.com','301933055','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-03-16 17:11:53',NULL,'kfefze',2.34,'Prof',89),(90,'Daniel','Félix','Ap #325-2095 Risus, Rd.','12706','Chimay','FR','Donec.sollicitudin.adipiscing@Morbinon.net','297199570','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-03-13 06:11:54',NULL,'htuk',2.34,'Prof',7),(91,'Bon','Jean','30 rue de poulainville','80080','Amiens','FR','adipiscing@gmail.com','354213413','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2014-04-13 11:14:36','2020-06-01 00:00:00','sgtjt',3.00,'Prof',7),(92,'Boulanger','Mathis','P.O. Box 595, 7563 Id Avenue','92588','Bhatinda','FR','laoreet.ipsum@id.co.uk','292792782','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-04-26 14:48:02',NULL,'uksdf',1.12,'Part',6),(93,'Boucher','Dorian','P.O. Box 795, 7040 Venenatis Ave','82751','Jelenia Góra','FR','Curabitur@nonummy.com','199164804','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-05-27 07:39:18',NULL,'efiy',2.34,'Prof',21),(94,'Bouvier','Marion','1071 Molestie Ave','38203','Limburg','FR','Suspendisse.aliquet@nibh.co.uk','555750153','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-10-17 07:59:06',NULL,'zefzgfd',2.34,'Prof',89),(95,'Maillard','Pauline','4721 Nonummy Av.','61225','Seilles','FR','magna.Praesent@pedeCum.edu','743297591','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-08-28 15:49:08',NULL,'fdbui',2.34,'Prof',21),(96,'Renaud','Rose','7837 Hendrerit Rd.','67206','Fremantle','FR','orci.in@ultriciesornareelit.edu','817838763','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-07-17 14:27:43',NULL,'zefht',1.80,'Part',6),(97,'Robert','Maelys','P.O. Box 393, 5911 Felis, St.','06642','Casper','FR','malesuada.id.erat@velitCras.com','643869652','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-10-29 11:53:49',NULL,'utkef',1.12,'Part',6),(98,'Dupuis','Carla','Ap #874-1931 Iaculis Road','69142','Virginia Plage','FR','nisi@neceuismod.ca','913028975','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-05-06 03:59:39',NULL,'zefyj',1.12,'Part',6),(99,'Meunier','Angelina','Ap #784-906 Amet, Ave','46591','Melle','FR','gravida.mauris@rutrumeu.edu','797466269','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2019-10-20 11:20:59',NULL,'grergyu',3.20,'Prof',21),(100,'Philippe','Maïwenn','2585 In Street','53983','Lumaco','FR','elit@Crassed.co.uk','460749886','$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW','2020-09-21 15:57:34',NULL,'eafzyjty',1.80,'Part',6);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `com_id` int NOT NULL AUTO_INCREMENT,
  `com_d_com` datetime NOT NULL,
  `com_d_paiement` datetime DEFAULT NULL,
  `com_reduc` decimal(3,2) DEFAULT '0.00',
  `com_ref` varchar(10) NOT NULL,
  `com_etat` char(1) NOT NULL,
  `com_adress_livraison` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `com_adress_factu` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `com_cli_id` int NOT NULL,
  PRIMARY KEY (`com_id`),
  UNIQUE KEY `idx_com_ref` (`com_ref`),
  KEY `com_cli_id` (`com_cli_id`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`com_cli_id`) REFERENCES `client` (`cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,'2020-01-24 12:00:27','2020-02-12 14:00:27',3.05,'iuig','1','865-7652 Nibh. Ave,10,75197,Fermont','865-7652 Nibh. Ave,10,75197,Fermont',10),(2,'2019-06-24 17:09:33','2019-06-28 18:09:33',4.00,'idv','1','P.O. Box 771, 895 Libero Avenue 31779 Sevastopol','P.O. Box 771, 895 Libero Avenue 31779 Sevastopol',6),(3,'2020-02-24 12:00:27','2020-03-05 14:00:27',2.00,'icdcg','1','P.O. Box 771, 895 Libero Avenue 31779 Sevastopol','P.O. Box 771, 895 Libero Avenue 31779 Sevastopol',6),(4,'2020-05-24 09:07:41','2020-05-31 10:07:11',1.09,'ecvfg','1','Ap #466-9700 Pede. Avenue 46174 MY','Ap #466-9700 Pede. Avenue 46174 MY',78),(5,'2020-05-06 03:59:39','2020-05-06 03:59:39',1.00,'zfig','1','Ap #874-1931 Iaculis Road 69142 Virginia Plage','Ap #874-1931 Iaculis Road 69142 Virginia Plage',98),(6,'2019-08-13 16:41:09','2019-08-13 16:41:09',2.00,'fggfg','1','P.. Box 259, 7958 Sem, St. 82728 Roosbeek','P.O. Box 259, 7958 Sem, St. 82728 Roosbeek',50),(7,'2020-11-18 18:41:09','2020-11-18 18:41:09',2.00,'fdqc','0','P.O. Box 259, 7958 Sem, St. 82728 Roosbeek','P.O. Box 259, 7958 Sem, St. 82728 Roosbeek',50),(8,'2019-05-01 14:27:23','2019-05-01 14:27:23',6.10,'fddqc','1','Ap #182-3848 Nunc St. 82181 Laramie','Ap #182-3848 Nunc St. 82181 Laramie',65),(9,'2020-11-18 15:57:34','2020-11-18 15:57:34',2.00,'azaqc','0','2585 In Street 53983 Lumaco','2585 In Street 53983 Lumaco',100),(10,'2019-04-02 23:47:20','2019-04-02 23:47:20',4.00,'fdrqc','1','2301 boulevard Alsace-Lorraine 80000 Amiens','2301 boulevard Alsace-Lorraine 80000 Amiens',1),(11,'2020-05-06 00:01:53','2020-05-06 00:01:53',6.00,'fvsfc','1','2301 boulevard Alsace-Lorraine 80000 Amiens','2301 boulevard Alsace-Lorraine 80000 Amiens',1),(12,'2019-12-14 06:52:52','2019-12-21 08:00:10',2.50,'fdvvec','1','Ap #125-483 Fusce Street 80300 Birmingham','Ap #125-483 Fusce Street 80300 Birmingham',2),(13,'2019-06-24 17:09:33','2019-06-24 17:09:33',3.50,'czcze','1','Ap #449-9035 Ac Street 59133 Vieux-Genappe','Ap #449-9035 Ac Street 59133 Vieux-Genappe',5),(14,'2019-05-17 18:12:34','2019-05-27 10:12:30',0.87,'rggtc','1','677-3832 Dis St. 94571 Caruaru','677-3832 Dis St. 94571 Caruaru',19),(15,'2020-01-09 19:02:05','2020-01-12 19:02:05',0.00,'ffrc','1','292 Ligula. Road 47589 Kota','292 Ligula. Road 47589 Kota',14),(16,'2020-03-09 19:02:05','2020-03-14 19:02:05',0.50,'fdveavc','1','292 Ligula. Road 47589 Kota','292 Ligula. Road 47589 Kota',14),(17,'2020-06-26 23:05:17','2020-06-29 11:05:17',1.50,'fggavc','1','P.O. Box 743, 4502 Dictum St. 64066 Campbelltown','P.O. Box 743, 4502 Dictum St. 64066 Campbelltown',9),(18,'2019-05-11 02:58:51','2019-05-15 02:00:50',2.50,'azsdc','1','Ap #850-6013 Suscipit, Av. 62000 Arras','Ap #850-6013 Suscipit, Av. 62000 Arras',4),(19,'2019-05-09 06:32:53','2019-05-18 18:02:05',1.50,'djdhf','1','Ap #784-932 Quis Rd. 42399 Flushing','Ap #784-932 Quis Rd. 42399 Flushing',26),(20,'2020-05-10 06:32:53','2020-05-14 09:02:10',2.50,'ljojjk','1','Ap #784-932 Quis Rd. 42399 Flushing','Ap #784-932 Quis Rd. 42399 Flushing',26),(21,'2019-08-26 02:39:06','2019-09-05 01:00:06',6.50,'fgege','1','P.O. Box 576, 4207 Sociis Av. 78616 Romeral','P.O. Box 576, 4207 Sociis Av. 78616 Romeral',44),(22,'2019-07-04 00:37:24','2019-07-10 09:37:24',0.50,'fbgddr','1','4750 Molestie Rd. 91323 Heusden-Zolder','4750 Molestie Rd. 91323 Heusden-Zolder',33),(23,'2020-04-04 10:37:24','2020-04-09 12:40:24',2.30,'gethhry','1','4750 Molestie Rd. 91323 Heusden-Zolder','4750 Molestie Rd. 91323 Heusden-Zolder',33),(24,'2020-06-26 23:05:17','2020-06-29 12:05:17',5.50,'fefrrv','1','P.O. Box 743, 4502 Dictum St. 64066 Campbelltown','P.O. Box 743, 4502 Dictum St. 64066 Campbelltown',9),(25,'2020-08-26 23:05:17','2020-08-30 23:05:17',5.50,'fczefv','1','P.O. Box 743, 4502 Dictum St. 64066 Campbelltown','P.O. Box 743, 4502 Dictum St. 64066 Campbelltown',9),(26,'2020-06-01 00:00:00','2020-06-11 11:05:00',0.50,'thyuju','1','30 rue de poulainville 80080 Amiens','30 rue de poulainville 80080 Amiens',91),(27,'2020-04-06 14:32:34','2020-04-10 14:00:00',1.50,'ergzthy','1','8464 Blandit Rd. 03869 Glain','8464 Blandit Rd. 03869 Glain',66),(28,'2019-06-27 03:01:40','2019-06-30 16:09:49',5.50,'iklu','1','P.O. Box 535, 8956 Ut, Avenue 61210 Joliet','P.O. Box 535, 8956 Ut, Avenue 61210 Joliet',37),(29,'2019-10-20 11:20:59','2019-10-28 10:23:59',0.30,'fzfrgag','1','Ap #784-906 Amet, Ave 46591 Melle','Ap #784-906 Amet, Ave 46591 Melle',99),(30,'2019-10-29 11:53:49','2019-10-29 11:53:49',0.90,'ikiuk','1','Ap #874-1931 Iaculis Road 69142 Virginia Plage','Ap #874-1931 Iaculis Road 69142 Virginia Plage',97);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details_com`
--

DROP TABLE IF EXISTS `details_com`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `details_com` (
  `detcom_id` int NOT NULL AUTO_INCREMENT,
  `detcom_qte` int unsigned NOT NULL,
  `detcom_tva` decimal(4,2) NOT NULL,
  `detcom_com_id` int NOT NULL,
  `detcom_pro_id` int NOT NULL,
  PRIMARY KEY (`detcom_id`),
  KEY `detcom_com_id` (`detcom_com_id`),
  KEY `detcom_pro_id` (`detcom_pro_id`),
  CONSTRAINT `details_com_ibfk_1` FOREIGN KEY (`detcom_com_id`) REFERENCES `commande` (`com_id`),
  CONSTRAINT `details_com_ibfk_2` FOREIGN KEY (`detcom_pro_id`) REFERENCES `produits` (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details_com`
--

LOCK TABLES `details_com` WRITE;
/*!40000 ALTER TABLE `details_com` DISABLE KEYS */;
INSERT INTO `details_com` VALUES (1,5,6.00,1,12),(2,2,6.00,1,14),(3,1,6.00,2,6),(4,5,6.00,3,23),(5,6,6.00,4,13),(6,2,20.00,5,17),(7,4,20.00,6,19),(8,1,20.00,7,3),(9,5,20.00,8,1),(10,1,20.00,8,5),(11,2,20.00,9,4),(12,1,20.00,10,6),(13,3,20.00,11,8),(14,1,6.00,12,14),(15,1,6.00,12,16),(16,1,6.00,12,21),(17,6,20.00,13,20),(18,6,20.00,13,20),(19,6,20.00,13,20),(20,3,20.00,14,7),(21,1,20.00,14,15),(22,1,6.00,15,5),(23,2,6.00,15,24),(24,1,6.00,16,30),(25,5,6.00,17,30),(26,1,6.00,18,11),(27,2,6.00,19,8),(28,3,6.00,20,27),(29,8,6.00,21,17),(30,4,6.00,22,11),(31,1,6.00,23,6),(32,1,6.00,24,22),(33,4,6.00,25,30),(34,1,6.00,26,21),(35,4,6.00,26,29),(36,2,6.00,27,13),(37,5,6.00,28,2),(38,1,6.00,29,6),(39,1,20.00,30,14);
/*!40000 ALTER TABLE `details_com` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employe` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_sup_id` int DEFAULT NULL,
  `emp_pos_id` int NOT NULL,
  `emp_nom` varchar(50) NOT NULL,
  `emp_prenom` varchar(50) NOT NULL,
  `emp_addresse` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_codepostal` varchar(5) NOT NULL,
  `emp_ville` varchar(50) NOT NULL,
  `emp_mail` varchar(255) NOT NULL,
  `emp_tel` varchar(10) NOT NULL,
  `emp_salaire` decimal(8,2) DEFAULT NULL,
  `emp_d_entree` date NOT NULL,
  `emp_sexe` char(1) NOT NULL,
  `emp_nbenf` tinyint NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `emp_sup_id` (`emp_sup_id`),
  KEY `emp_pos_id` (`emp_pos_id`),
  CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`emp_sup_id`) REFERENCES `employe` (`emp_id`),
  CONSTRAINT `employe_ibfk_2` FOREIGN KEY (`emp_pos_id`) REFERENCES `poste` (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (1,17,34,'MOLETTE','Denis','27 avenue Paul Lepoulpe','80000','Amiens','dmolette@blabla.fr','0102030405',18473.00,'2020-05-05','M',8),(2,3,2,'NAGER','Emma','14 rue Tabaga','80300','Albert','emmanager@laposte.net','0102030405',39576.00,'2015-03-27','F',0),(3,NULL,1,'LEBOSSE','Hugo','28 mail Ludovic Cruchot','75001','Paris','leboss@jarditou.com','0102030405',350000.78,'2000-01-01','M',2),(4,17,6,'LAPAGE','Edith','22 rue Stevy Boulay','60300','Senlis','lapage60300@yahoo.fr','0102030405',18473.00,'2012-12-01','F',1),(5,3,35,'DRESSAMERE','Yvan','224 avenue Caumartin','75009','Paris','yvan75009@outlook.com','0102030405',39576.00,'2007-11-04','M',0),(6,5,3,'MERCE','Coco','56 cours Loana','02000','Laon','merce@wazaa.net','0102030405',30000.00,'2010-07-31','F',2),(7,2,3,'AMAR','Yann','4 rue du papillon de lumière','62000','Arras','amar@azerty.com','0102030405',30000.00,'2008-05-28','M',3),(8,14,13,'ASAP','Liliane','Appartement 202-3846 Suspendisse Chemin','FA46 ','Pekanbaru','convallis@Integer.com','0102030405',18473.00,'2007-03-20','F',5),(9,17,34,'LAVISSE','Edouard','131-3667 Arcu. Rd.','80136','Rivery','nulla.magna@Proinvel.co.uk','0102030405',24000.00,'2016-12-17','M',2),(10,17,14,'HILLARY','Dorian','6824 Placerat. Route','12787','Parramatta','mus@Morbi.co.uk','0102030405',20450.00,'2002-03-10','M',2),(11,26,27,'POUTIN','Vladimir','251-633 Convallis Impasse','8373 ','Colchester','facilisis.vitae.orci@indolor.net','0102030405',29500.00,'2015-05-03','M',4),(12,17,7,'DECLAN','Richard','Appartement 870-7677 Magna Av.','42980','Dornbirn','Mauris@amet.ca','0102030405',51802.00,'2003-06-25','M',2),(13,47,14,'ABRAHAM','François','612-4178 Urna Chemin','87784','Llanidloes','sodales@malesuadaInteger.com','0102030405',20450.00,'2012-09-08','M',5),(14,22,4,'COOPER','Dale','6954 Mauris Av.','17543','Kalyan','Nunc.ullamcorper.velit@penatibuset.org','0102030405',39576.00,'2000-01-21','M',4),(15,17,8,'FULLER','Christophe','977-8389 Dui. Ave','9229','Konstanz','semper@metus.edu','0102030405',18473.00,'2006-02-19','M',1),(16,7,17,'TRON','Paul','2323 Metus. Rue','20403','Jumet','eu@gravidamauris.org','0102030405',51802.00,'2013-04-08','M',1),(17,47,14,'HASZIC','Alec','370-2193 Sed Rd.','39132','Orangeville','cursus.Nunc@amet.edu','0102030405',20450.00,'2006-09-15','M',4),(18,17,10,'VADENT','Sophie','CP 131, 8783 Nisi Impasse','26972','Burnaby','a@vitaepurusgravida.org','0102030405',51802.00,'2014-06-26','F',2),(19,47,14,'BALZAC','Jérémy','CP 630, 2906 Mollis Route','0247','Colchester','penatibus.et@sempertellusid.net','0102030405',20450.00,'2009-07-29','M',3),(20,17,14,'YETTA','Ahmed','228-2670 Luctus. Route','85726','Havillers','non@ac.edu','0102030405',20450.00,'2008-03-13','M',0),(21,14,3,'CHERET','Philippe','443 Non Rue','58015','Dolcedo','placerat.augue.Sed@mi.net','0102030405',30000.00,'2002-06-30','M',2),(22,7,17,'FERRIS','Anne','Appartement 172-7219 Ante Chemin','5155 ','North Waziristan','Duis.risus.odio@at.com','0102030405',51802.00,'2015-05-21','F',0),(23,34,12,'TERIEUR','Alex','Appartement 733-1291 Velit Av.','60100','Creil','alex@integereu.edu','0102030405',30000.00,'2019-03-19','M',3),(24,17,4,'JANA','Vincent','1229 Laoreet Av.','07789','Bad Ischl','lacus@iderat.org','0102030405',39576.00,'2008-06-06','M',5),(25,4,17,'LABALLE','Willy','113-6834 At Rd.','B4X 7','Labuissire','Suspendisse@nec.ca','0102030405',51802.00,'2004-03-06','M',1),(26,17,8,'COCU','Stéphanie','CP 382, 9910 Massa. Avenue','50718','Regina','ac.metus.vitae@quamquisdiam.net','0102030405',18473.00,'2013-07-11','F',4),(27,17,13,'DELISLE','Stéphane','Appartement 406-5833 Facilisis, Av.','26986','Sainte-Flavie','natoque.penatibus.et@utnullaCras.edu','0102030405',18473.00,'2002-09-01','M',4),(28,17,7,'FULTON','Bernard','Appartement 896-3857 Sit Rue','78933','Versailles','elit.elit@blanditNamnulla.ca','0102030405',51802.00,'2011-04-23','M',1),(29,14,13,'KELSIE','Kirsten','5586 Mus. Ave','C2W 9','Kumluca','pharetra.Quisque@Suspendisse.net','0102030405',18473.00,'2000-03-30','M',4),(30,17,19,'RHONDA','Bradley','7331 Pede. Rue','01971','Pishin Valley','Nunc.lectus@leoMorbi.co.uk','0102030405',18473.00,'2013-10-18','M',0),(31,34,12,'ASPEN','Casey','7026 Orci Route','13075','Impe','enim@ornareelitelit.co.uk','0102030405',30000.00,'2018-03-01','F',4),(32,17,8,'KELSIE','Nadia','723 Orci Rd.','9989','Isola del Gran Sasso d Italia','amet.risus.Donec@bibendumDonec.ca','0102030405',18473.00,'2003-10-17','F',2),(33,17,18,'DUMOULIN','Isabelle','Appartement 235-4026 Maecenas Chemin','77-30','Glovertown','amet@habitant.edu','0102030405',51802.00,'2009-04-07','F',4),(34,14,11,'DRAKE','Ray','902-1314 Ut Route','93131','Sorbo Serpico','sapien.cursus@Donec.com','0102030405',39576.00,'2019-12-10','M',1),(35,17,11,'RICHARD','Destiny','5004 Tellus Ave','39013','Ambon','consectetuer@laciniaSedcongue.com','0102030405',39576.00,'2009-06-30','F',2),(36,39,12,'DUFOURD','Steve','356-7367 Nec, Impasse','30661','Bonnert','in@Nunc.edu','0102030405',30000.00,'2013-08-19','M',5),(37,7,2,'BECK','Carl','9194 Nulla Ave','87-14','Paris','tellus@et.ca','0102030405',39576.00,'2004-02-09','M',1),(38,22,14,'SIMONE','George','700-7880 Gravida Av.','52439','Allentown','nostra@fringillaest.ca','0102030405',20450.00,'2000-04-07','M',2),(39,14,11,'DORIAN','Zelda','CP 315, 4816 Dui. Chemin','13801','Saravena','vehicula@turpis.org','0102030405',39576.00,'2000-08-12','F',1),(40,17,13,'FARINI','Jana','CP 578, 8898 Purus Impasse','91148','Wiener Neustadt','cursus.in.hendrerit@egetvariusultrices.ca','0102030405',18473.00,'2016-09-19','M',0),(41,17,12,'GINGER','Tara','Appartement 254-6736 Sit Route','74002','Amstelveen','iaculis@rutrum.org','0102030405',30000.00,'2001-05-31','F',5),(42,17,13,'CHARLOT','Elijah','725-5577 Dictum Chemin','63145','Annan','luctus.et@Nunc.net','0102030405',18473.00,'2001-04-10','M',3),(43,17,12,'DUPOND','Adrian','CP 919, 5276 Leo. Rue','18974','Perquenco','Lorem.ipsum@amagnaLorem.net','0102030405',30000.00,'2010-10-19','M',3),(44,17,14,'ISAAC','Christine','Appartement 717-2181 Et Impasse','88779','Roux','lacus@Donecnonjusto.co.uk','0102030405',20450.00,'2016-01-09','F',1),(45,22,14,'QUAMAR','Allistair','Appartement 223-3446 Mollis Rd.','55469','Güssing','orci@ultricesiaculis.ca','0102030405',20450.00,'2016-10-30','M',0),(46,17,14,'PRINCE','Laurent','665 Nibh. Rd.','75217','Driffield','Curae.Phasellus.ornare@quamdignissimpharetra.net','0102030405',18473.00,'2003-10-15','M',2),(47,22,2,'DUMAS','Ingrid','396-7762 Magna. Route','50406','Frigento','in.molestie@anteipsumprimis.org','0102030405',39576.00,'2017-04-28','F',1),(48,17,19,'RAMERY','Bruno','863 Nec Ave','21485','Sint-Kruis-Winkel','at.lacus.Quisque@maurisipsum.edu','0102030405',18473.00,'2000-06-14','M',5),(49,17,11,'MALACHI','René','Appartement 165-7157 Auctor Impasse','40583','Wambeek','tincidunt.orci@dolorvitae.co.uk','0102030405',39576.00,'2002-07-15','M',1),(50,14,13,'RENSTER','Jeannette','CP 758, 4652 Mauris Chemin','85874','Gelbressee','iaculis@elementumat.ca','0102030405',18473.00,'2007-06-22','F',5),(51,17,12,'BERTAUX','Marc','1664 Bibendum Avenue','3274','Allein','mauris.blandit@temporarcuVestibulum.org','0102030405',30000.00,'2014-05-10','M',5),(52,14,11,'RIGEL','Armand','CP 694, 2496 Eget Rue','1104','Drachten','Aenean.eget.metus@orciin.com','0102030405',39576.00,'2013-05-11','M',4),(53,17,12,'WYLIE','Jean-Michel','CP 725, 3993 Nec Av.','97875','Maule','ac.turpis@maurissapiencursus.co.uk','0102030405',30000.00,'2014-12-21','M',5),(54,26,27,'HONORA','Anita','414-9179 Phasellus Rue','6971','Werder','Suspendisse.commodo.tincidunt@quispede.org','0102030405',29500.00,'2009-06-18','F',5),(55,17,29,'LANNOY','Julia','Appartement 111-9165 Metus. Rue','0521 ','Mata de Plátano','Mauris.ut@urnajusto.co.uk','0102030405',18473.00,'2018-06-08','F',0),(56,17,19,'RICHAUMONT','Kendall','954-5221 Dictum Avenue','45146','Gulfport','natoque.penatibus.et@ametconsectetueradipiscing.net','0102030405',18473.00,'2007-01-20','M',1),(57,17,14,'MALIK','Keiko','Appartement 633-956 Quis, Rd.','45000','Orléans','pede.ultrices.a@lacusEtiam.org','0102030405',20450.00,'2003-03-21','F',2),(58,17,6,'HECTOR','Macaulay','2095 In Ave','52-91','Emarèse','sem.Nulla.interdum@lobortis.ca','0102030405',18473.00,'2007-12-26','M',3),(59,4,2,'HANNAH','Amity','537-1971 Vestibulum Rd.','8203 ','Palagano','fermentum@quisturpisvitae.co.uk','0102030405',39576.00,'2013-08-01','M',2),(60,17,8,'HEDY','Katell','CP 850, 1578 In Rue','9661','Connah s Quay','lorem.sit.amet@pellentesque.co.uk','0102030405',18473.00,'2010-07-26','M',0),(61,17,8,'BELL','Oleg','Appartement 679-9483 Fringilla Route','B4 6E','Parndorf','Aenean.massa.Integer@dui.org','0102030405',18473.00,'2012-03-25','M',2),(62,17,13,'PAULA','Tasha','Appartement 193-7862 Mollis. Rue','24446','McCallum','adipiscing.lobortis.risus@semmolestiesodales.com','0102030405',18473.00,'2018-02-03','F',1),(63,17,12,'POPOV','Yuri','6111 Risus. Ave','60214','Compiègne','yuri@gmail.com','0102030405',30000.00,'2012-08-06','M',5),(64,14,6,'DENIS','Jeanine','8325 Ornare Avenue','71414','Colico','Integer.id@blanditviverraDonec.edu','0102030405',18473.00,'2011-11-30','F',4),(65,17,20,'KEELY','Nassim','14 avenue Isabelle Herdhebaut','94086','San Juan de Dios','n.keely@yahoo.fr','0102030405',27000.00,'2000-10-15','M',4),(66,17,22,'FULTON','Michel','245 avenue du Président Roosevelt','80000','Amiens','faucibus@leoMorbi.org','0102030405',18473.00,'2001-02-16','M',4),(67,22,14,'Cole','ALLISTAIR','27 rue Denis Garnier','58318','Sierning','vel@vitae.net','0102030405',20450.00,'2007-11-26','M',3),(68,39,12,'JOEL','Rose','855-6714 Metus. Rue','00046','Lestizza','risus.a@odio.com','0102030405',39576.00,'2000-12-26','F',2),(69,17,17,'PRAZART','Emmanuel','8515 Nullam Av.','80500','Montdidier','dolor.tempus@augueid.com','0102030405',18473.00,'2004-03-15','M',0),(70,17,17,'GUERAFI','Hakim','480-2381 Volutpat. Avenue','41233','Porto Cesareo','hguerafi@laposte.net','0102030405',18473.00,'2017-04-16','M',5),(71,17,13,'AIMEE','Germaine','5466 Nec Avenue','96176','Melipilla','lorem@sociis.edu','0102030405',18473.00,'2010-05-21','F',2),(72,17,2,'CARTER','Robin','497 Chemin Ante','60195','Duncan','nisi@blandit.ca','0102030405',18473.00,'2012-01-20','M',1),(73,7,2,'LIRMA','Hugues','91 bis rue Jarno','62000','Arras','hugues.lirma@jarditou.com','0102030405',39576.00,'2019-07-10','M',5),(74,17,22,'FITZGERALD','Neil','CP 545, 2293 Aenean Rue','4431','Algarrobo','Quisque.purus@Donectincidunt.org','0102030405',18473.00,'2014-06-25','M',2),(75,17,24,'AINSLEY','Hayden','633-8228 Et Av.','6878','Güstrow','Etiam@Cumsociis.ca','0102030405',18473.00,'2003-05-25','M',3),(76,17,12,'HILARY','Zia','2945 Volutpat. Av.','T0X 3','Rabbi','ut.quam.vel@semut.net','0102030405',30000.00,'2006-04-17','F',2),(77,47,24,'MADELINE','Jonas','Appartement 521-8237 Ligula. Chemin','Z4232','Noginsk','ac.metus@tellusloremeu.net','0102030405',18473.00,'2016-04-06','M',2),(78,17,14,'TIMON','Alyssa','CP 503, 6759 Ultricies Avenue','79444','Rockhampton','Sed.et.libero@necorci.org','0102030405',20450.00,'2005-03-25','F',3),(79,47,24,'PETER','Carly','Appartement 792-2242 Semper Rd.','29429','Greater Sudbury','Etiam.imperdiet@Cumsociisnatoque.ca','0102030405',18473.00,'2017-11-16','F',5),(80,17,21,'TEEGAN','Benjamin','915-3308 Morbi Avenue','8258','Bottidda','habitant.morbi.tristique@tempor.com','0102030405',18473.00,'2015-05-16','M',5),(81,17,12,'WILLA','Nina','CP 708, 8796 Proin Avenue','6562','Innsbruck','eros@sem.edu','0102030405',30000.00,'2009-03-12','F',0),(82,17,11,'CHANEY','Irma','4854 Proin Chemin','22235','Fort Providence','ultricies.sem.magna@non.com','0102030405',39576.00,'2006-01-31','F',2),(83,17,24,'LAITH','Ariel','CP 298, 9838 Porttitor Rue','40182','Wilmington','non.bibendum@penatibus.co.uk','0102030405',18473.00,'2016-01-17','F',3),(84,52,12,'CALDWELL','Megan','CP 183, 6687 Vel Ave','71913','Leerbeek','Proin.sed@tellusPhaselluselit.ca','0102030405',30000.00,'2012-01-05','M',0),(85,47,22,'HERMAN','Alan','CP 248, 4557 Augue. Route','03002','Bridgeport','Phasellus@molestietortor.org','0102030405',18473.00,'2010-04-16','M',0),(86,2,2,'MICHAEL','Quinn','777-2337 Pretium Chemin','6350','Bilaspur','tellus@Uttinciduntvehicula.edu','0102030405',39576.00,'2002-09-26','M',5),(87,17,13,'DOLLE-RAYMOND','Christian','3578 Fermentum Avenue','69961','Greenwich','lobortis.quis@Phasellus.net','0102030405',18473.00,'2018-12-25','M',0),(88,17,25,'CALLUM','Howard','7637 Nisi Av.','16638','Gagliano del Capo','Aliquam@euligulaAenean.net','0102030405',33020.40,'2017-10-23','M',2),(89,6,3,'KEANE','Ashton','772-9554 Ipsum Av.','4095 ','Khanpur','metus@eratvel.edu','0102030405',30000.00,'2005-09-07','M',4),(90,17,12,'RANA','Charles-Henri','2425 Aliquam Impasse','10892','La Roche-sur-Yon','nisi.nibh@diamSeddiam.ca','0102030405',30000.00,'2007-01-29','f',1),(91,22,20,'CARDON','Yvonne','986-8855 Lacus. Ave','1865','Corozal','Integer@metuseu.edu','0102030405',27000.00,'2000-10-31','F',5),(92,47,22,'MASON','Martin','Appartement 397-5505 Leo, Avenue','83701','General Lagos','a.facilisis@mollis.com','0102030405',18473.00,'2003-12-29','M',1),(93,17,25,'ADENA','Dorothée','5988 Varius Chemin','1666','Bonvicino','sem.consequat.nec@sagittisDuis.co.uk','0102030405',33020.40,'2017-12-04','F',5),(94,17,19,'ZELDA','Britney','5 rue de la mine','62300','Lens','pellentesque@neque.edu','0102030405',18473.00,'2018-07-15','F',1),(95,52,12,'RENARD','Caroline','142-9516 Sed Rd.','5685','Ross-on-Wye','mauris.Integer@tristiquesenectuset.net','0102030405',39576.00,'2007-02-02','F',1),(96,17,34,'GISELA','Guy','440-6585 Risus. Route','80800','Corbie','facilisis@nullamagnamalesuada.edu','0102030405',24000.00,'2009-11-29','M',1),(97,17,26,'ROSOFT','Mike','646-1281 Vestibulum, Route','15948','Barranquilla','id.libero.Donec@idmagna.com','0102030405',28822.00,'2005-06-11','M',2),(98,26,28,'MARAT','Hans','8882 Sollicitudin Chemin','45142','Solihull','ornare.sagittis@eleifendCras.net','0102030405',38459.27,'2009-08-14','M',2),(99,26,27,'LEMAIRE','Pierre-Jean','CP 456, 6156 Orci Ave','96335','Nottingham','nulla.at.sem@anteblandit.ca','0102030405',29500.00,'2008-05-21','M',4),(100,26,31,'TRENET','Nathan','CP 286, 8977 Magna. Rue','63661','Kasli','Lorem.ipsum.dolor@facilisis.ca','0102030405',20450.00,'2005-02-19','M',2),(101,52,12,'MECHELLE','Leila','CP 295, 7493 Sit Avenue','87341','Rosarno','mi@tempordiamdictum.org','0102030405',30000.00,'2001-02-26','M',3),(102,26,32,'DEVIN','Timothée','Appartement 161-9249 Ac Rd.','55053','Wismar','fringilla@orciDonec.ca','0102030405',24051.59,'2015-11-15','M',4),(103,17,14,'PALMER','Mia','1044 Vivamus Ave','K1K 9','Rajanpur','et@lectus.edu','0102030405',20450.00,'2015-10-05','M',1),(104,17,30,'QUIN','Josiah','1390 Sollicitudin Chemin','07573','Kanpur Cantonment','tellus.imperdiet@cursuspurusNullam.org','0102030405',18473.00,'2010-10-07','M',1),(105,17,9,'COHEN','David','4687 Ullamcorper Avenue','41-72','Augusta','faucibus.orci.luctus@faucibus.com','0102030405',51802.00,'2016-05-21','M',5),(106,26,32,'XENOS','Illiana','8543 Sed Impasse','73070','Castelvecchio di Rocca Barbena','sem.mollis.dui@tinciduntadipiscingMauris.edu','0102030405',24051.59,'2001-10-05','M',5),(107,26,31,'MANNICK','Sébastien','CP 797, 7428 At, Av.','53215','Söderhamn','Donec@quamafelis.edu','0102030405',20450.00,'2013-02-14','M',2);
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fournisseur` (
  `four_id` int NOT NULL AUTO_INCREMENT,
  `four_nom` varchar(50) NOT NULL,
  `four_ville` varchar(50) NOT NULL,
  `four_pays_id` char(2) NOT NULL,
  `four_adresse` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `four_codepostal` varchar(5) NOT NULL,
  `four_representant` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `four_tel` varchar(10) NOT NULL,
  `four_mail` varchar(75) NOT NULL,
  `four_status` varchar(15) NOT NULL,
  PRIMARY KEY (`four_id`),
  KEY `four_pays_id` (`four_pays_id`),
  CONSTRAINT `fournisseur_ibfk_1` FOREIGN KEY (`four_pays_id`) REFERENCES `pays` (`pays_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur`
--

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` VALUES (1,'Music 75','Paris','FR','1 avenue Cyril Hanouna','75017','Nicolas Dujardin','0102030405','contact@music.fr','Constructeur'),(2,'Royez Music','Amiens','FR','200 boulevard Eve Angeli','80090','Mike Anic','0708091011','musicplus@gmail.com','Importateur'),(3,'Droit Music','Marseille','FR','31 rue Nabilla Benattia','13000','Elle Ephant','0213141516','attila.percu@laposte.net','Constructeur'),(4,'Corrida Music','Narbonne','FR','56 avenue Donald Trump','11000','Gérard Menfaim','0512345678','sales@guitare.com','Importateur'),(5,'Music chine','Shangaï','CN','112 rue de Pékin','340','Chang Li','0102030405','chang.li@fournirien.cn','Constructeur');
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livraison` (
  `liv_id` int NOT NULL AUTO_INCREMENT,
  `liv_detcom_id` int NOT NULL,
  `liv_qte` int unsigned NOT NULL,
  `liv_d_exp` date NOT NULL,
  `liv_d_liv` date DEFAULT NULL,
  `liv_adresse` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`liv_id`),
  KEY `liv_detcom_id` (`liv_detcom_id`),
  CONSTRAINT `livraison_ibfk_1` FOREIGN KEY (`liv_detcom_id`) REFERENCES `details_com` (`detcom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livraison`
--

LOCK TABLES `livraison` WRITE;
/*!40000 ALTER TABLE `livraison` DISABLE KEYS */;
INSERT INTO `livraison` VALUES (1,1,5,'2020-01-26','2020-02-04','865-7652 Nibh Ave 10 75197 Fermont'),(2,2,2,'2020-01-30','2020-02-07','865-7652 Nibh Ave 10 75197 Fermont'),(3,3,1,'2020-01-30','2020-02-07','P.O. Box 771, 895 Libero Avenue 31779 Sevastopol'),(4,4,3,'2020-01-30','2020-02-07','P.O. Box 771, 895 Libero Avenue 31779 Sevastopol'),(5,4,2,'2020-02-15','2020-02-20','P.O. Box 771, 895 Libero Avenue 31779 Sevastopol'),(6,5,6,'2020-01-27','2020-02-05','Ap #466-9700 Pede. Avenue 46174 MY'),(7,6,2,'2020-05-09','2020-05-15','Ap #874-1931 Iaculis Road 69142 Virginia Plage'),(8,7,4,'2019-08-16','2019-08-16','P.O. Box 259, 7958 Sem, St. 82728 Roosbeek'),(9,8,1,'2020-11-22',NULL,'P.O. Box 259, 7958 Sem, St. 82728 Roosbeek'),(10,9,5,'2019-05-03','2019-05-08','Ap #182-3848 Nunc St. 82181 Laramie'),(11,10,1,'2019-05-03','2019-05-08','Ap #182-3848 Nunc St. 82181 Laramie'),(12,11,2,'2020-11-21',NULL,'2585 In Street 53983 Lumaco'),(13,12,1,'2019-04-02','2019-04-08','2301 boulevard Alsace-Lorraine 80000 Amiens'),(14,13,1,'2020-05-06','2020-05-10','2301 boulevard Alsace-Lorraine 80000 Amiens'),(15,13,2,'2020-05-10','2020-05-15','2301 boulevard Alsace-Lorraine 80000 Amiens'),(16,14,1,'2019-12-16','2019-12-23','Ap #125-483 Fusce Street 80300 Birmingham'),(17,15,1,'2019-12-16','2019-12-23','Ap #125-483 Fusce Street 80300 Birmingham'),(18,16,1,'2019-12-16','2019-12-23','Ap #125-483 Fusce Street 80300 Birmingham'),(19,17,6,'2019-12-16','2019-12-21','Ap #449-9035 Ac Street 59133 Vieux-Genappe'),(20,18,6,'2019-12-16','2019-12-21','Ap #449-9035 Ac Street 59133 Vieux-Genappe'),(21,19,6,'2019-12-16','2019-12-21','Ap #449-9035 Ac Street 59133 Vieux-Genappe'),(22,20,3,'2019-05-20','2019-05-28','677-3832 Dis St. 94571 Caruaru'),(23,21,1,'2019-05-30','2019-06-12','677-3832 Dis St. 94571 Caruaru'),(24,22,1,'2020-01-11','2020-01-15','292 Ligula. Road 47589 Kota'),(25,23,2,'2020-01-11','2020-01-15','292 Ligula. Road 47589 Kota'),(26,24,1,'2020-03-14','2020-03-20','292 Ligula. Road 47589 Kota'),(27,25,5,'2020-06-30','2020-07-10','P.O. Box 743, 4502 Dictum St. 64066 Campbelltown'),(28,26,1,'2019-05-15','2019-05-20','Ap #850-6013 Suscipit, Av. 62000 Arras'),(29,27,2,'2019-05-11','2019-05-20','Ap #784-932 Quis Rd. 42399 Flushing'),(30,28,3,'2020-05-10','2020-05-16','Ap #784-932 Quis Rd. 42399 Flushing'),(31,29,4,'2019-08-29','2019-09-05','15 avenue des champs élyssés 75000 Paris'),(32,29,4,'2019-09-29','2019-10-05','15 avenue des champs élyssés 75000 Paris'),(33,30,4,'2019-07-09','2019-07-14','4750 Molestie Rd. 91323 Heusden-Zolder'),(34,31,1,'2020-04-08','2020-04-14','4750 Molestie Rd. 91323 Heusden-Zolder'),(35,32,1,'2020-06-29','2020-07-08','P.O. Box 743, 4502 Dictum St. 64066 Campbelltown'),(36,33,4,'2020-08-30','2020-09-14','P.O. Box 743, 4502 Dictum St. 64066 Campbelltown'),(37,34,1,'2020-06-03','2020-06-07','30 rue de poulainville 80080 Amiens'),(38,35,4,'2020-06-03','2020-06-07','30 rue de poulainville 80080 Amiens'),(39,36,2,'2020-04-09','2020-04-14','8464 Blandit Rd. 03869 Glain'),(40,37,5,'2019-06-30','2019-07-25','P.O. Box 535, 8956 Ut, Avenue 61210 Joliet'),(41,38,1,'2019-10-23','2019-10-30','Ap #784-906 Amet, Ave 46591 Melle'),(42,39,1,'2019-11-09','2019-11-20','Ap #874-1931 Iaculis Road 69142 Virginia Plage');
/*!40000 ALTER TABLE `livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pays` (
  `pays_id` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pays_nom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pays_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES ('AD','Andorre'),('AE','Émirats Arabes Unis'),('AF','Afghanistan'),('AG','Antigua-et-Barbuda'),('AI','Anguilla'),('AL','Albanie'),('AM','Arménie'),('AN','Antilles Néerlandaises'),('AO','Angola'),('AQ','Antarctique'),('AR','Argentine'),('AS','Samoa Américaines'),('AT','Autriche'),('AU','Australie'),('AW','Aruba'),('AX','Îles Åland'),('AZ','Azerbaïdjan'),('BA','Bosnie-Herzégovine'),('BB','Barbade'),('BD','Bangladesh'),('BE','Belgique'),('BF','Burkina Faso'),('BG','Bulgarie'),('BH','Bahreïn'),('BI','Burundi'),('BJ','Bénin'),('BM','Bermudes'),('BN','Brunéi Darussalam'),('BO','Bolivie'),('BR','Brésil'),('BS','Bahamas'),('BT','Bhoutan'),('BV','Île Bouvet'),('BW','Botswana'),('BY','Bélarus'),('BZ','Belize'),('CA','Canada'),('CC','Îles Cocos (Keeling)'),('CD','République Démocratique du Congo'),('CF','République Centrafricaine'),('CG','République du Congo'),('CH','Suisse'),('CI','Côte d Ivoire'),('CK','Îles Cook'),('CL','Chili'),('CM','Cameroun'),('CN','Chine'),('CO','Colombie'),('CR','Costa Rica'),('CS','Serbie-et-Monténégro'),('CU','Cuba'),('CV','Cap-vert'),('CX','Île Christmas'),('CY','Chypre'),('CZ','République Tchèque'),('DE','Allemagne'),('DJ','Djibouti'),('DK','Danemark'),('DM','Dominique'),('DO','République Dominicaine'),('DZ','Algérie'),('EC','Équateur'),('EE','Estonie'),('EG','Égypte'),('EH','Sahara Occidental'),('ER','Érythrée'),('ES','Espagne'),('ET','Éthiopie'),('FI','Finlande'),('FJ','Fidji'),('FK','Îles (malvinas) Falkland'),('FM','États Fédérés de Micronésie'),('FO','Îles Féroé'),('FR','France'),('GA','Gabon'),('GB','Royaume-Uni'),('GD','Grenade'),('GE','Géorgie'),('GF','Guyane Française'),('GH','Ghana'),('GI','Gibraltar'),('GL','Groenland'),('GM','Gambie'),('GN','Guinée'),('GP','Guadeloupe'),('GQ','Guinée Équatoriale'),('GR','Grèce'),('GS','Géorgie du Sud et les Îles Sandwich du Sud'),('GT','Guatemala'),('GU','Guam'),('GW','Guinée-Bissau'),('GY','Guyana'),('HK','Hong-Kong'),('HM','Îles Heard et Mcdonald'),('HN','Honduras'),('HR','Croatie'),('HT','Haïti'),('HU','Hongrie'),('ID','Indonésie'),('IE','Irlande'),('IL','Israël'),('IM','Île de Man'),('IN','Inde'),('IO','Territoire Britannique de l Océan Indien'),('IQ','Iraq'),('IR','République Islamique d Iran'),('IS','Islande'),('IT','Italie'),('JM','Jamaïque'),('JO','Jordanie'),('JP','Japon'),('KE','Kenya'),('KG','Kirghizistan'),('KH','Cambodge'),('KI','Kiribati'),('KM','Comores'),('KN','Saint-Kitts-et-Nevis'),('KP','République Populaire Démocratique de Corée'),('KR','République de Corée'),('KW','Koweït'),('KY','Îles Caïmanes'),('KZ','Kazakhstan'),('LA','République Démocratique Populaire Lao'),('LB','Liban'),('LC','Sainte-Lucie'),('LI','Liechtenstein'),('LK','Sri Lanka'),('LR','Libéria'),('LS','Lesotho'),('LT','Lituanie'),('LU','Luxembourg'),('LV','Lettonie'),('LY','Jamahiriya Arabe Libyenne'),('MA','Maroc'),('MC','Monaco'),('MD','République de Moldova'),('MG','Madagascar'),('MH','Îles Marshall'),('MK','L ex-République Yougoslave de Macédoine'),('ML','Mali'),('MM','Myanmar'),('MN','Mongolie'),('MO','Macao'),('MP','Îles Mariannes du Nord'),('MQ','Martinique'),('MR','Mauritanie'),('MS','Montserrat'),('MT','Malte'),('MU','Maurice'),('MV','Maldives'),('MW','Malawi'),('MX','Mexique'),('MY','Malaisie'),('MZ','Mozambique'),('NA','Namibie'),('NC','Nouvelle-Calédonie'),('NE','Niger'),('NF','Île Norfolk'),('NG','Nigéria'),('NI','Nicaragua'),('NL','Pays-Bas'),('NO','Norvège'),('NP','Népal'),('NR','Nauru'),('NU','Niué'),('NZ','Nouvelle-Zélande'),('OM','Oman'),('PA','Panama'),('PE','Pérou'),('PF','Polynésie Française'),('PG','Papouasie-Nouvelle-Guinée'),('PH','Philippines'),('PK','Pakistan'),('PL','Pologne'),('PM','Saint-Pierre-et-Miquelon'),('PN','Pitcairn'),('PR','Porto Rico'),('PS','Territoire Palestinien Occupé'),('PT','Portugal'),('PW','Palaos'),('PY','Paraguay'),('QA','Qatar'),('RE','Réunion'),('RO','Roumanie'),('RU','Fédération de Russie'),('RW','Rwanda'),('SA','Arabie Saoudite'),('SB','Îles Salomon'),('SC','Seychelles'),('SD','Soudan'),('SE','Suède'),('SG','Singapour'),('SH','Sainte-Hélène'),('SI','Slovénie'),('SJ','Svalbard etÎle Jan Mayen'),('SK','Slovaquie'),('SL','Sierra Leone'),('SM','Saint-Marin'),('SN','Sénégal'),('SO','Somalie'),('SR','Suriname'),('ST','Sao Tomé-et-Principe'),('SV','El Salvador'),('SY','République Arabe Syrienne'),('SZ','Swaziland'),('TC','Îles Turks et Caïques'),('TD','Tchad'),('TF','Terres Australes Françaises'),('TG','Togo'),('TH','Thaïlande'),('TJ','Tadjikistan'),('TK','Tokelau'),('TL','Timor-Leste'),('TM','Turkménistan'),('TN','Tunisie'),('TO','Tonga'),('TR','Turquie'),('TT','Trinité-et-Tobago'),('TV','Tuvalu'),('TW','Taïwan'),('TZ','République-Unie de Tanzanie'),('UA','Ukraine'),('UG','Ouganda'),('UM','Îles Mineures Éloignées des États-Unis'),('US','États-Unis'),('UY','Uruguay'),('UZ','Ouzbékistan'),('VA','Saint-Siège (état de la Cité du Vatican)'),('VC','Saint-Vincent-et-les Grenadines'),('VE','Venezuela'),('VG','Îles Vierges Britanniques'),('VI','Îles Vierges des États-Unis'),('VN','Viet Nam'),('VU','Vanuatu'),('WF','Wallis et Futuna'),('WS','Samoa'),('YE','Yémen'),('YT','Mayotte'),('ZA','Afrique du Sud'),('ZM','Zambie'),('ZW','Zimbabwe');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poste`
--

DROP TABLE IF EXISTS `poste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poste` (
  `pos_id` int NOT NULL AUTO_INCREMENT,
  `pos_libelle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poste`
--

LOCK TABLES `poste` WRITE;
/*!40000 ALTER TABLE `poste` DISABLE KEYS */;
INSERT INTO `poste` VALUES (1,'Président-Directeur Général'),(2,'Manager(/geuse)'),(3,'Commercial(e)'),(4,'Responsable des ventes'),(6,'Assistant(e) commercial(e)'),(7,'Acheteur(/teuse)'),(8,'Assistant(e) RH'),(9,'Directeur(/trice) financier'),(10,'Directeur(/trice) des Ressources Humaines'),(11,'Chef(fe) de rayon'),(12,'Vendeur/(euse)'),(13,'Hôte(/esse) de caisse'),(14,'Magasinier'),(17,'Directeur(/trice) de magasin'),(18,'Directeur(/trice) du marketing'),(19,'Assistant(e) marketing'),(20,'Comptable'),(21,'Assistant(e) comptable'),(22,'Vigile'),(24,'Préparateur(/trice) de commandes'),(25,'Formateur(/trice)'),(26,'Directeur(/trice) des systèmes d information'),(27,'Développeur(/peuse)'),(28,'Chef(/fe) de projet informatique'),(29,'Community manager'),(30,'Graphiste'),(31,'Technicien(/ne) réseau'),(32,'Technicien(/ne) support informatique'),(33,'Electricien(/ne)'),(34,'Technicien(/ne) de maintenance'),(35,'Directeur(/trice) commercial');
/*!40000 ALTER TABLE `poste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produits` (
  `pro_id` int NOT NULL AUTO_INCREMENT,
  `pro_cat_id` int NOT NULL,
  `pro_prix` decimal(7,2) NOT NULL,
  `pro_ref` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_stock` int unsigned NOT NULL,
  `pro_libelle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_desc_court` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_desc_long` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_d_ajout` datetime NOT NULL,
  `pro_d_modif` datetime DEFAULT NULL,
  `pro_four_id` int NOT NULL,
  `pro_emp_id` int NOT NULL,
  `pro_photo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  UNIQUE KEY `idx_pro_ref` (`pro_ref`),
  KEY `pro_cat_id` (`pro_cat_id`),
  KEY `pro_four_id` (`pro_four_id`),
  KEY `pro_emp_id` (`pro_emp_id`),
  CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`pro_cat_id`) REFERENCES `categorie` (`cat_id`),
  CONSTRAINT `produits_ibfk_2` FOREIGN KEY (`pro_four_id`) REFERENCES `fournisseur` (`four_id`),
  CONSTRAINT `produits_ibfk_3` FOREIGN KEY (`pro_emp_id`) REFERENCES `employe` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (1,27,1110.00,'piano001',5,'Aramis ','Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. In porttitor sit amet ipsum sit amet dapibus. Cras suscipit neque ac magna sagittis lobortis. Duis venenatis enim ac nisl luctus, a scelerisque velit porttitor. Integer nec massa quis urna mollis consectetur et et nisl. Nullam eget nunc vitae nisl convallis faucibus. Vestibulum dapibus, metus nec molestie lobortis, nunc sem mollis tortor, et auctor dolor nunc at nisi. Pellentesque sit amet turpis nisi. ','2019-04-18 00:00:00',NULL,1,34,'jpg'),(2,29,1200.00,'piano002',50,'Athos','Cu rabitur pellentesque posuere luctus','Cu rabitur pellentesque posuere luctus. Sed et risus vel quam pharetra pretium non quis odio. Praesent varius risus vel orci ultrices tincidunt.','2019-04-18 00:00:00',NULL,2,34,'jpg'),(3,28,2310.00,'piano003',55,'Red','Phasellus ac gravida lorem','Phasellus ac gravida lorem. Aliquam sed aliquam nisl. Etiam non ornare sapien. Aenean ut tellus non risus varius bibendum quis vel ligula.','2019-04-18 00:00:00',NULL,4,34,'jpg'),(4,27,4500.00,'piano004',22,'Chrome','Fusce rutrum odio sem','Fusce rutrum odio sem, quis finibus nisl finibus a. Praesent dictum ex in lectus porta, vitae varius lacus eleifend. Sed sed lacinia mi, sed egestas odio. Integer a congue lectus.','2019-04-18 00:00:00',NULL,3,34,'png'),(5,14,110.00,'guitare001',16,'Clatronic','Phasellus auctor mattis justo','Phasellus auctor mattis justo, in semper urna congue eget. Nunc sit amet nunc sed dui fringilla scelerisque a eget sem. Aenean cursus eros vehicula arcu blandit, sit amet faucibus leo finibus. Duis pharetra felis eget viverra tempor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas','2019-04-18 00:00:00','2020-05-20 00:00:00',1,35,'jpg'),(6,16,300.00,'guitare002',10,'Camping','Fusce interdum ex justo','Fusce interdum ex justo, vel imperdiet erat volutpat non. Donec et maximus lacus. ','2020-04-18 00:00:00','2020-08-08 00:00:00',4,35,'jpg'),(7,15,299.99,'guitare003',32,'Green','Pellentesque ultrices','Pellentesque ultrices vestibulum sagittis.','2018-04-18 00:00:00',NULL,1,35,'jpg'),(8,17,999.00,'guitare004',45,'Silver','Sed lobortis pulvinar orci','Sed lobortis pulvinar orci, ut efficitur urna egestas eu.','2018-04-18 00:00:00',NULL,3,35,'jpg'),(9,23,300.00,'saxophone001',8,'Yellow','Nulla at','Nulla at consequat orci.','2018-04-18 00:00:00',NULL,2,39,'jpg'),(10,26,450.00,'saxophone002',9,'Saxo GA 410','Curabitur varius interdum nulla','Curabitur varius interdum nulla, sit amet consequat massa. Vestibulum rutrum leo lectus. Phasellus sit amet viverra velit.','2018-04-18 00:00:00',NULL,1,39,'jpg'),(11,24,610.00,'saxophone003',76,'Saxo GA 388','Pellentesque fermentum ut est sagittis feugiat','Pellentesque fermentum ut est sagittis feugiat. Morbi in turpis augue. Maecenas dapibus ligula velit, ac gravida risus imperdiet in.','2018-04-18 00:00:00',NULL,4,39,'jpg'),(12,18,1110.00,'batterie001',9,'batterie SCM0555','raesent ante felis','raesent ante felis, iaculis vitae lectus sed, luctus laoreet metus. Aenean mattis egestas eleifend. Morbi dictum erat ut lorem porta, a volutpat nibh ultrices. Nunc ut tortor ac velit fringilla dictum at non nulla.','2019-04-18 00:00:00',NULL,4,49,'jpg'),(13,19,1220.00,'batterie002',11,'batterie SCM0666','Cras nec dapibus erat','Cras nec dapibus erat. Cras bibendum auctor dui quis tristique.','2018-04-18 00:00:00',NULL,3,49,'jpg'),(14,19,2100.00,'batterie003',56,'batterie H062','Etiam eu sem ligula.','Etiam eu sem ligula. Donec aliquet velit a condimentum sagittis. Nullam ipsum augue, porta non vestibulum cursus, eleifend tempor erat. Proin et turpis molestie augue mollis laoreet. Nulla lorem tellus, pellentesque nec hendrerit vehicula, consectetur non nisl. Maecenas eget accumsan lectus. Vivamus eleifend lorem scelerisque augue rutrum laoreet. ','2018-04-18 00:00:00',NULL,3,49,'jpg'),(15,18,799.90,'batterie004',23,'Titan','Là où passe Attila','Là où passe Attila, l herbe ne repousse pas.','2018-04-18 00:00:00',NULL,2,39,'jpg'),(16,31,110.90,'sono001',21,'Attila','aliquet accumsan eleifend.','aliquet accumsan eleifend. Pellentesque mauris tortor, ultricies a pulvinar ut, fringilla ac mi. Sed consequat, nibh at tempus porttitor, tellus nunc dictum nulla, sed finibus felis augue sed libero. Donec augue mi, mattis et orci ac, mollis feugiat elit.','2019-04-18 00:00:00',NULL,4,34,'png'),(17,32,220.00,'sono002',55,'Aquitaine','Morbi porta ultricies nibh vel varius.','Morbi porta ultricies nibh vel varius. Vestibulum nec rutrum ex, vel posuere nisi. Ut scelerisque sit amet ligula sed imperdiet. Morbi lacinia sapien in elementum iaculis. Vivamus a ultrices enim.','2019-04-18 00:00:00',NULL,3,34,'jpg'),(18,30,1100.00,'sono003',11,'Brown','Quisque fermentum, dui eu elementum sagittis','Quisque fermentum, dui eu elementum sagittis, risus lorem placerat ipsum, vitae venenatis tellus sapien id nibh. Suspendisse et aliquet tellus, in suscipit magna.','2019-04-18 00:00:00','2020-05-08 00:00:00',2,34,'jpg'),(19,20,999.00,'bass001',12,'Biarritz','Curabitur sodales sem vitae ex commodo','Curabitur sodales sem vitae ex commodo, in ullamcorper quam congue. Aliquam erat volutpat. Praesent mollis at velit eu molestie. Proin ac tellus a enim venenatis ultrices vitae sed libero. Vivamus at vulputate orci. Curabitur mattis ac turpis id tempus. Sed turpis enim, egestas ac arcu et, elementum luctus ante.','2020-06-18 00:00:00',NULL,3,35,'jpg'),(20,22,790.20,'bass002',50,'Cannes','Morbi porta ultricies nibh vel varius','Morbi porta ultricies nibh vel varius. Vestibulum nec rutrum ex, vel posuere nisi. Ut scelerisque sit amet ligula sed imperdiet. Morbi lacinia sapien in elementum iaculis.','2019-04-18 00:00:00',NULL,1,39,'png'),(21,21,1100.00,'bass003',5,'Crotoy','Vivamus a ultrices enim.','Vivamus a ultrices enim. Etiam at viverra justo. Cras consectetur justo euismod mi maximus, ac tincidunt leo suscipit. Quisque fermentum, dui eu elementum sagittis, risus lorem placerat ipsum, vitae venenatis tellus sapien id nibh.','2020-04-20 00:00:00',NULL,4,39,'jpg'),(22,21,2000.99,'bass004',16,'Agave','Curabitur sodales sem vitae ex commodo','Curabitur sodales sem vitae ex commodo, in ullamcorper quam congue. Aliquam erat volutpat. Praesent mollis at velit eu molestie.','2019-04-18 00:00:00','2019-09-18 00:00:00',1,39,'jpg'),(23,9,100.00,'flute001',8,'Dark','Vel porta orci convallis','Vel porta orci convallis. Duis sodales vehicula porta. Etiam sit amet scelerisque massa.','2019-04-18 00:00:00',NULL,2,34,'jpg'),(24,11,678.00,'flute002',34,'Fuschia','Praesent nunc dui','Praesent nunc dui, porta at leo eget, iaculis ultrices quam. Mauris vulputate metus in nisl aliquam, et sollicitudin nisl mollis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2020-04-18 00:00:00',NULL,3,34,'jpg'),(25,10,987.00,'flute003',12,'Iris','hac habitasse platea dictumst','hac habitasse platea dictumst. Quisque at sagittis nunc.','2020-06-18 00:00:00','2020-09-23 00:00:00',1,34,'png'),(26,12,99.99,'flute004',56,'Bahco','Suspendisse congue nibh sed dui commodo sollicitudin.','Suspendisse congue nibh sed dui commodo sollicitudin. Vestibulum augue eros, accumsan vel vulputate ut, gravida id libero. Nullam sodales urna id nulla porta vestibulum. Aliquam lectus lacus, tincidunt nec metus.','2019-04-18 00:00:00',NULL,4,34,'jpg'),(27,39,699.00,'percussion001',5,'Einhell','luctus aliquet enim.','luctus aliquet enim. Phasellus quis velit quis tellus pharetra aliquam in at urna. Cras vitae turpis erat. Phasellus libero arcu, fringilla sit amet tempus blandit, congue eu nulla. Morbi id efficitur tellus.','2019-04-18 00:00:00',NULL,2,35,'jpg'),(28,35,789.00,'percussion002',5,'Grizzly','Quisque nec nisi risus','Quisque nec nisi risus. Fusce eu est non velit mollis tristique a et magna. Proin sodales.','2019-04-18 00:00:00',NULL,1,35,'jpg'),(29,38,345.00,'percussion003',5,'Hero','uis vehicula risus in nibh lobortis euismod.','uis vehicula risus in nibh lobortis euismod. In hac habitasse platea dictumst. Quisque at sagittis nunc. Phasellus ac gravida lorem. Aliquam sed aliquam nisl. Etiam non ornare sapien.','2019-07-18 00:00:00','2019-10-04 00:00:00',3,35,'jpg'),(30,34,110.99,'percussion004',5,'SL 1280','Aenean ut tellus non risus varius','Aenean ut tellus non risus varius bibendum quis vel ligula.','2019-04-18 00:00:00',NULL,4,35,'jpg');
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_prod_four`
--

DROP TABLE IF EXISTS `v_prod_four`;
/*!50001 DROP VIEW IF EXISTS `v_prod_four`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_prod_four` AS SELECT 
 1 AS `Référence Produit`,
 1 AS `Libelle produit`,
 1 AS `Prix produit`,
 1 AS `Stock produit`,
 1 AS `Nom du fournisseur`,
 1 AS `Ville du fournisseur`,
 1 AS `Status du fournisseur`,
 1 AS `Représentant du fournisseur`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `village_green`
--

USE `village_green`;

--
-- Final view structure for view `v_prod_four`
--

/*!50001 DROP VIEW IF EXISTS `v_prod_four`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_prod_four` AS select `produits`.`pro_ref` AS `Référence Produit`,`produits`.`pro_libelle` AS `Libelle produit`,`produits`.`pro_prix` AS `Prix produit`,`produits`.`pro_stock` AS `Stock produit`,`fournisseur`.`four_nom` AS `Nom du fournisseur`,`fournisseur`.`four_ville` AS `Ville du fournisseur`,`fournisseur`.`four_status` AS `Status du fournisseur`,`fournisseur`.`four_representant` AS `Représentant du fournisseur` from (`fournisseur` left join `produits` on((`produits`.`pro_four_id` = `fournisseur`.`four_id`))) order by `fournisseur`.`four_nom` */;
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

-- Dump completed on 2020-12-05 18:39:33
