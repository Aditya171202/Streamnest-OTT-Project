-- MySQL dump 10.13  Distrib 9.4.0, for macos15.4 (arm64)
--
-- Host: localhost    Database: streamnest
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subscription_end` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (1,'2025-09-17 13:20:14.767950',4),(3,'2025-09-17 13:26:37.766049',1),(4,'2025-09-17 13:26:37.773946',2),(5,'2025-09-17 13:26:37.775525',3),(6,'2026-09-17 13:31:09.530654',5),(7,'2026-09-17 13:35:48.875596',6),(8,'2026-09-17 13:38:40.715122',7),(9,'2026-09-17 13:41:27.771867',8),(10,'2026-09-19 15:56:55.256115',9),(11,'2026-09-21 12:00:15.887995',10),(12,'2026-09-22 09:50:02.086693',11);
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add movie',7,'add_movie'),(26,'Can change movie',7,'change_movie'),(27,'Can delete movie',7,'delete_movie'),(28,'Can view movie',7,'view_movie'),(29,'Can add series',8,'add_series'),(30,'Can change series',8,'change_series'),(31,'Can delete series',8,'delete_series'),(32,'Can view series',8,'view_series'),(33,'Can add watchlist item',9,'add_watchlistitem'),(34,'Can change watchlist item',9,'change_watchlistitem'),(35,'Can delete watchlist item',9,'delete_watchlistitem'),(36,'Can view watchlist item',9,'view_watchlistitem'),(37,'Can add profile',10,'add_profile'),(38,'Can change profile',10,'change_profile'),(39,'Can delete profile',10,'delete_profile'),(40,'Can view profile',10,'view_profile'),(41,'Can add episode',11,'add_episode'),(42,'Can change episode',11,'change_episode'),(43,'Can delete episode',11,'delete_episode'),(44,'Can view episode',11,'view_episode'),(45,'Can add coming soon',12,'add_comingsoon'),(46,'Can change coming soon',12,'change_comingsoon'),(47,'Can delete coming soon',12,'delete_comingsoon'),(48,'Can view coming soon',12,'view_comingsoon'),(49,'Can add genre',13,'add_genre'),(50,'Can change genre',13,'change_genre'),(51,'Can delete genre',13,'delete_genre'),(52,'Can view genre',13,'view_genre'),(53,'Can add genre',14,'add_genre'),(54,'Can change genre',14,'change_genre'),(55,'Can delete genre',14,'delete_genre'),(56,'Can view genre',14,'view_genre');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$eLPIAIeZpKBPxuZLd3YOhl$ON8623krISe7451CN1Ejug2KjmsaJCYWJPFk6qnlmVQ=','2025-09-22 13:27:18.464457',1,'admin','','','adityasamant70@gmail.com',1,1,'2025-09-15 02:55:21.790721'),(2,'pbkdf2_sha256$1000000$ksFSA7zBQlsMtyC4DaU8sM$0GKPwQBqx9vNr0amhMUtMnjIHHbj5imtukwWkYC5t4U=','2025-09-15 03:13:41.433279',0,'Aditya','','','xyz@gmail.com',0,1,'2025-09-15 03:13:41.202712'),(3,'pbkdf2_sha256$1000000$M5kgmYlq9yXKJOYXDziIrp$NQmz6Xtif98XsUZmTxayr8VNyd/qHRSubJZgLneKBnc=','2025-09-22 09:53:02.417228',0,'amuser','','','user@gmail.com',0,1,'2025-09-15 03:29:05.910373'),(4,'pbkdf2_sha256$1000000$urkv0YbiIBlTHnkIwYARZB$9i+DH+pnkL3OYbUF74pOwsRwj/QBiaYBdOfWBZ6xfE8=',NULL,0,'sparky','','','sparky@gmail.com',0,0,'2025-09-17 13:20:14.538752'),(5,'pbkdf2_sha256$1000000$GvijhQGjuCLS8R2fQdXsYs$5lF34jrqpFF+nVAaf3toyAUYhU9hkI5mMeYLIRnmPkc=','2025-09-17 13:31:09.538254',0,'sparky_test','','','sparky@gmail.com',0,1,'2025-09-17 13:28:52.784572'),(6,'pbkdf2_sha256$1000000$sO5rUUXy2Bg07urCZYFjR0$aAXQfS0WdEzBumyVAG+fYidSE5vUa1O073nAT6I6z9U=','2025-09-17 13:35:48.886599',0,'final_test','','','fin@gmail.com',0,1,'2025-09-17 13:35:13.996267'),(7,'pbkdf2_sha256$1000000$UvMyfrWv0Qxgej25AAZBeV$i9EyDbimqItP9BcZz3/Rqobol0bLzOH6JdWL1JOmisM=','2025-09-17 13:38:40.725494',0,'zoro','','','zoro@gmail.com',0,1,'2025-09-17 13:38:05.946068'),(8,'pbkdf2_sha256$1000000$hwi5aV2Xxs3xZq1SXOj6uk$ZxE2ijcVZYD7AwH5aY4PZX8URBLBLfU7AHg35YJjHE4=','2025-09-17 13:41:48.256228',0,'Naruto','','','Naruto@gmail.com',0,1,'2025-09-17 13:40:54.075504'),(9,'pbkdf2_sha256$1000000$4rIYP3GuEqPvL6CT4Aa7Ss$X5XHRU5iFFWth+ymCeHSGtJBdw/ai62jjz5uJ40cHfE=','2025-09-19 15:56:55.264298',0,'Adu','','','adu@gmail.com',0,1,'2025-09-19 15:56:18.792744'),(10,'pbkdf2_sha256$1000000$uxe6f7VYWD2RK3saJeFttH$B7Yzq4wRnmbhpzqMoIb/iJ0xw0Q3NXFRIbSMTZRVLHc=','2025-09-21 12:00:15.894535',0,'json','','','json@gmail.com',0,1,'2025-09-21 11:59:38.227928'),(11,'pbkdf2_sha256$1000000$TGP3hktEBIPyD9Vd5oU0b4$X/gR4iIvEZNP6HMAh+tmlpZy0dXozlP4BZl60gVD8PQ=','2025-09-22 09:50:02.091928',0,'qwerty','','','xyz@gmail.com',0,1,'2025-09-22 09:49:25.916835');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-09-15 13:51:40.163353','1','Demon Slayer Infinity Castle',1,'[{\"added\": {}}]',7,1),(2,'2025-09-15 14:13:49.449419','2','Transformers One',1,'[{\"added\": {}}]',7,1),(3,'2025-09-15 14:24:03.259946','3','Avengers Endgame',1,'[{\"added\": {}}]',7,1),(4,'2025-09-15 14:29:34.543429','4','Chhichhore',1,'[{\"added\": {}}]',7,1),(5,'2025-09-16 13:28:35.277506','1','Cobra Kai',1,'[{\"added\": {}}]',8,1),(6,'2025-09-16 13:40:22.697488','2','One Piece',1,'[{\"added\": {}}]',8,1),(7,'2025-09-16 13:54:49.213351','3','Taarak Mehta ka ooltah chashmah',1,'[{\"added\": {}}]',8,1),(8,'2025-09-19 10:22:51.581119','1','Demon Slayer Infinity Castle',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',7,1),(9,'2025-09-19 13:53:55.350919','2','Transformers One',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',7,1),(10,'2025-09-19 14:09:02.517617','3','Avengers Endgame',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',7,1),(11,'2025-09-19 14:15:22.947047','3','Avengers Endgame',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',7,1),(12,'2025-09-19 14:25:06.467757','3','Avengers Endgame',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',7,1),(13,'2025-09-21 10:13:54.459357','1','Cobra Kai',2,'[{\"added\": {\"name\": \"episode\", \"object\": \"Cobra Kai - Episode 1: Johnny vs Wolf\"}}]',8,1),(14,'2025-09-21 10:14:23.547928','1','Cobra Kai',2,'[{\"added\": {\"name\": \"episode\", \"object\": \"Cobra Kai - Episode 2: The climax\"}}]',8,1),(15,'2025-09-22 13:31:38.477734','1','F1',1,'[{\"added\": {}}]',12,1),(16,'2025-09-22 13:52:25.926595','2','Crayon Shin-chan the Movie: Super Hot! The Spicy Kasukabe Dancers',1,'[{\"added\": {}}]',12,1),(17,'2025-09-22 14:07:53.245940','1','Romance',1,'[{\"added\": {}}]',13,1),(18,'2025-09-22 14:08:02.590458','2','Comedy',1,'[{\"added\": {}}]',13,1),(19,'2025-09-22 14:08:09.126919','3','Sports',1,'[{\"added\": {}}]',13,1),(20,'2025-09-22 14:08:32.140789','4','Teen',1,'[{\"added\": {}}]',13,1),(21,'2025-09-22 14:08:40.033886','5','Drama',1,'[{\"added\": {}}]',13,1),(22,'2025-09-22 14:08:44.832429','6','Hindi',1,'[{\"added\": {}}]',13,1),(23,'2025-09-22 14:08:50.579083','4','Chhichhore',2,'[{\"changed\": {\"fields\": [\"Genres\"]}}]',7,1),(24,'2025-09-22 14:10:23.092144','3','Avengers Endgame',2,'[{\"changed\": {\"fields\": [\"Genres\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'accounts','profile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'movies','comingsoon'),(13,'movies','genre'),(7,'movies','movie'),(11,'series','episode'),(14,'series','genre'),(8,'series','series'),(6,'sessions','session'),(9,'watchlist','watchlistitem');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-07-31 07:37:32.243267'),(2,'auth','0001_initial','2025-07-31 07:37:32.344928'),(3,'admin','0001_initial','2025-07-31 07:37:32.374374'),(4,'admin','0002_logentry_remove_auto_add','2025-07-31 07:37:32.376722'),(5,'admin','0003_logentry_add_action_flag_choices','2025-07-31 07:37:32.378996'),(6,'contenttypes','0002_remove_content_type_name','2025-07-31 07:37:32.396664'),(7,'auth','0002_alter_permission_name_max_length','2025-07-31 07:37:32.405411'),(8,'auth','0003_alter_user_email_max_length','2025-07-31 07:37:32.412724'),(9,'auth','0004_alter_user_username_opts','2025-07-31 07:37:32.414968'),(10,'auth','0005_alter_user_last_login_null','2025-07-31 07:37:32.426967'),(11,'auth','0006_require_contenttypes_0002','2025-07-31 07:37:32.427332'),(12,'auth','0007_alter_validators_add_error_messages','2025-07-31 07:37:32.429695'),(13,'auth','0008_alter_user_username_max_length','2025-07-31 07:37:32.440882'),(14,'auth','0009_alter_user_last_name_max_length','2025-07-31 07:37:32.452915'),(15,'auth','0010_alter_group_name_max_length','2025-07-31 07:37:32.460372'),(16,'auth','0011_update_proxy_permissions','2025-07-31 07:37:32.462860'),(17,'auth','0012_alter_user_first_name_max_length','2025-07-31 07:37:32.473773'),(18,'sessions','0001_initial','2025-07-31 07:37:32.480488'),(19,'movies','0001_initial','2025-09-15 13:34:42.111898'),(20,'series','0001_initial','2025-09-16 13:07:45.928906'),(21,'watchlist','0001_initial','2025-09-16 14:55:22.427735'),(22,'accounts','0001_initial','2025-09-17 13:16:06.493262'),(23,'movies','0002_movie_video','2025-09-19 09:45:36.198413'),(24,'series','0002_episode','2025-09-21 09:35:22.594497'),(25,'movies','0003_comingsoon','2025-09-22 13:26:57.021813'),(26,'movies','0004_genre_movie_genres','2025-09-22 14:06:19.081439'),(27,'series','0003_genre_series_genres','2025-09-22 14:06:19.119330');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('28kj0c545stlbb85kbpakcdo5vdo9cg4','e30:1uxzzM:Be6_6saC4Z1Y2Sp-RxPVJCPEuxfxgY56qrC_ARbUh7s','2025-09-29 03:34:48.533613'),('3v9imy25lm2ceua1qvus8bsr4retwv4o','eyJuZXdfdXNlcl9pZCI6N30:1uysMq:2GUfeoqfQsXLpJnQRN6yI2Nl61QNAdvwChO8TP-pbyU','2025-10-01 13:38:40.723622'),('488yj7qrgiig5a21h59n3i1jgyd2s0gm','eyJuZXdfdXNlcl9pZCI6Nn0:1uysK4:vdgP0BN-gjayIz46ZyW4G3kGVsmzGJ00thRI0F7kMS0','2025-10-01 13:35:48.882384'),('a9t10wlioxyyaimeapnqhkrzhm4atpba','e30:1uys8t:hQ7fFjC07gp3NjjpnOfYP9Ylm3xuoDU7HQxyV68wWyU','2025-10-01 13:24:15.673538'),('gg1z772vuc928j33heazdmxgcxc33pnr','e30:1uy000:2h7rMqDK8lihOOdU0r2Zg_wu3PSd65rUTLIaxHKtZBM','2025-09-29 03:35:28.919574'),('xxgq3yfk3ooy89qzxro34nmfd3f1c616','.eJxVjM0OwiAQhN-FsyH8xAIevfsMZJddpGogKe2p8d2VpAe9Teb7ZnYRYVtL3DovcSZxEVqcfjuE9OQ6AD2g3ptMra7LjHIo8qBd3hrx63q4fwcFevmu0YMFgyap4MAprZkAAinilCmQt3ki9qgRzjDSZCwHZs5snbWaxfsDGa45fg:1v0gZa:4UvQ3z-bY3du1PJr6tJLlwCsEBDp5VP4Tnjl--rIHk0','2025-10-06 13:27:18.467584');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_comingsoon`
--

DROP TABLE IF EXISTS `movies_comingsoon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_comingsoon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `release_date` date NOT NULL,
  `poster` varchar(100) NOT NULL,
  `trailer_url` varchar(200) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_comingsoon`
--

LOCK TABLES `movies_comingsoon` WRITE;
/*!40000 ALTER TABLE `movies_comingsoon` DISABLE KEYS */;
INSERT INTO `movies_comingsoon` VALUES (1,'F1','A Formula One driver comes out of retirement to mentor and team up with a younger driver.','2025-10-15','comingsoon_posters/F1.jpg','https://www.youtube.com/watch?v=8yh9BPUBbbQ','2025-09-22 13:31:38.467750'),(2,'Crayon Shin-chan the Movie: Super Hot! The Spicy Kasukabe Dancers','After the Kasukabe Defence Force wins a trip to India, Shinnosuke and Bo-chan enter a suspicious general store and find a backpack that holds a terrifying secret.','2025-09-28','comingsoon_posters/Shinchan.jpg','https://www.youtube.com/watch?v=oYd6KLmhTZw','2025-09-22 13:52:25.922860');
/*!40000 ALTER TABLE `movies_comingsoon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_genre`
--

DROP TABLE IF EXISTS `movies_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_genre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_genre`
--

LOCK TABLES `movies_genre` WRITE;
/*!40000 ALTER TABLE `movies_genre` DISABLE KEYS */;
INSERT INTO `movies_genre` VALUES (2,'Comedy'),(5,'Drama'),(6,'Hindi'),(1,'Romance'),(3,'Sports'),(4,'Teen');
/*!40000 ALTER TABLE `movies_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_movie`
--

DROP TABLE IF EXISTS `movies_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_movie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `poster` varchar(100) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie`
--

LOCK TABLES `movies_movie` WRITE;
/*!40000 ALTER TABLE `movies_movie` DISABLE KEYS */;
INSERT INTO `movies_movie` VALUES (1,'Demon Slayer Infinity Castle','The Demon Slayer Corps are drawn into the Infinity Castle, where Tanjiro, Nezuko, and the Hashira face terrifying Upper Rank demons in a desperate fight as the final battle against Muzan Kibutsuji begins. Rated R for bloody violence throughout.','posters/Demon_Slayer.jpg','2025-09-12','videos/ScreenRecording_09-19-2025_15-35-59_1.mov'),(2,'Transformers One','The untold origin story of Optimus Prime and Megatron, better known as sworn enemies, but who once were friends bonded like brothers who changed the fate of Cybertron forever.','posters/Transformers_one.jpg','2024-09-20','videos/My_Movie_9.MOV'),(3,'Avengers Endgame','After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.','posters/Avengers_Endgame.jpg','2019-04-26','videos/ScreenRecording_09-19-2025_19-48-17_1.mov'),(4,'Chhichhore','A tragic incident forces Anirudh, a middle-aged man, to take a trip down memory lane and reminisce his college days along with his friends, who were labelled as losers.','posters/Chhichhore.jpg','2020-09-16','');
/*!40000 ALTER TABLE `movies_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_movie_genres`
--

DROP TABLE IF EXISTS `movies_movie_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_movie_genres` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `movie_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_movie_genres_movie_id_genre_id_5ff3c723_uniq` (`movie_id`,`genre_id`),
  KEY `movies_movie_genres_genre_id_c3609db2_fk_movies_genre_id` (`genre_id`),
  CONSTRAINT `movies_movie_genres_genre_id_c3609db2_fk_movies_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `movies_genre` (`id`),
  CONSTRAINT `movies_movie_genres_movie_id_ff5e55a1_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie_genres`
--

LOCK TABLES `movies_movie_genres` WRITE;
/*!40000 ALTER TABLE `movies_movie_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_movie_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_episode`
--

DROP TABLE IF EXISTS `series_episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series_episode` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number` int unsigned NOT NULL,
  `title` varchar(200) NOT NULL,
  `video` varchar(100) NOT NULL,
  `release_date` date DEFAULT NULL,
  `series_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `series_episode_series_id_5d55adc1_fk_series_series_id` (`series_id`),
  CONSTRAINT `series_episode_series_id_5d55adc1_fk_series_series_id` FOREIGN KEY (`series_id`) REFERENCES `series_series` (`id`),
  CONSTRAINT `series_episode_chk_1` CHECK ((`number` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_episode`
--

LOCK TABLES `series_episode` WRITE;
/*!40000 ALTER TABLE `series_episode` DISABLE KEYS */;
INSERT INTO `series_episode` VALUES (1,1,'Johnny vs Wolf','episodes/C_K_ep1.mov',NULL,1),(2,2,'The climax','episodes/C_K_ep2.mov',NULL,1);
/*!40000 ALTER TABLE `series_episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_series`
--

DROP TABLE IF EXISTS `series_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series_series` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `poster` varchar(100) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_series`
--

LOCK TABLES `series_series` WRITE;
/*!40000 ALTER TABLE `series_series` DISABLE KEYS */;
INSERT INTO `series_series` VALUES (1,'Cobra Kai','Bitter enemies. Warring dojos. New blood. Daniel and Johnny reignite old West Valley rivalries in this follow-up series to the \"Karate Kid\" films.','posters/Cobra_kai.jpg','2025-02-14'),(2,'One Piece','Rubber-bodied dreamer Monkey D. Luffy gathers an eclectic pirate crew and braves the perilous Grand Line, battling tyrants and monsters to claim the legendary \"One Piece\" and become King of the Pirates.','posters/One_piece.jpg.jpg','2025-09-01'),(3,'Taarak Mehta ka ooltah chashmah','The day-to-day happenings of Gokuldham Society and its members, who live, celebrate and often face problems together.','posters/tmkoc.jpg','2008-07-28');
/*!40000 ALTER TABLE `series_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_series_genres`
--

DROP TABLE IF EXISTS `series_series_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series_series_genres` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `series_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series_series_genres_series_id_genre_id_f6d54e4b_uniq` (`series_id`,`genre_id`),
  KEY `series_series_genres_genre_id_cad59961_fk_series_genre_id` (`genre_id`),
  CONSTRAINT `series_series_genres_genre_id_cad59961_fk_series_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `series_genre` (`id`),
  CONSTRAINT `series_series_genres_series_id_7d0ee19b_fk_series_series_id` FOREIGN KEY (`series_id`) REFERENCES `series_series` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_series_genres`
--

LOCK TABLES `series_series_genres` WRITE;
/*!40000 ALTER TABLE `series_series_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `series_series_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist_watchlistitem`
--

DROP TABLE IF EXISTS `watchlist_watchlistitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlist_watchlistitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `added_at` datetime(6) NOT NULL,
  `movie_id` bigint DEFAULT NULL,
  `series_id` bigint DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `watchlist_watchlistitem_movie_id_c2a8c052_fk_movies_movie_id` (`movie_id`),
  KEY `watchlist_watchlistitem_series_id_4ac8b8c0_fk_series_series_id` (`series_id`),
  KEY `watchlist_watchlistitem_user_id_8f495069_fk_auth_user_id` (`user_id`),
  CONSTRAINT `watchlist_watchlistitem_movie_id_c2a8c052_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`),
  CONSTRAINT `watchlist_watchlistitem_series_id_4ac8b8c0_fk_series_series_id` FOREIGN KEY (`series_id`) REFERENCES `series_series` (`id`),
  CONSTRAINT `watchlist_watchlistitem_user_id_8f495069_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist_watchlistitem`
--

LOCK TABLES `watchlist_watchlistitem` WRITE;
/*!40000 ALTER TABLE `watchlist_watchlistitem` DISABLE KEYS */;
INSERT INTO `watchlist_watchlistitem` VALUES (1,'2025-09-16 14:55:38.629059',1,NULL,3),(3,'2025-09-16 15:03:15.494587',2,NULL,1),(6,'2025-09-16 15:14:32.257740',NULL,1,1);
/*!40000 ALTER TABLE `watchlist_watchlistitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-22 20:21:42
