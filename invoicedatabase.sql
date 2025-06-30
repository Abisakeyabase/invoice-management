-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: invoicedatabase
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add billform',7,'add_billform'),(26,'Can change billform',7,'change_billform'),(27,'Can delete billform',7,'delete_billform'),(28,'Can view billform',7,'view_billform'),(29,'Can add invoiceform',8,'add_invoiceform'),(30,'Can change invoiceform',8,'change_invoiceform'),(31,'Can delete invoiceform',8,'delete_invoiceform'),(32,'Can view invoiceform',8,'view_invoiceform'),(33,'Can add installment',9,'add_installment'),(34,'Can change installment',9,'change_installment'),(35,'Can delete installment',9,'delete_installment'),(36,'Can view installment',9,'view_installment');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$uMClXlTaWTqPizGwUscjLl$QdlPDkqlAMPQsLP5Pbd+udEigrWcAAU8UPQmXneRRzI=','2025-01-29 17:24:48.494985',1,'invoice','','','abisakeyabase962@gmail.com',1,1,'2025-01-29 17:24:33.322114');
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
-- Table structure for table `bill_form`
--

DROP TABLE IF EXISTS `bill_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_form` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billnumber` varchar(20) NOT NULL,
  `billdate` date NOT NULL,
  `billstdname` varchar(50) NOT NULL,
  `billconame` varchar(50) NOT NULL,
  `billruppess` varchar(50) NOT NULL,
  `billamount` varchar(50) NOT NULL,
  `payment` varchar(50) NOT NULL,
  `invoice_id` bigint DEFAULT NULL,
  `billstdmobile` varchar(20) DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_form_invoice_id_c0f043bf_fk_invoice_form_id` (`invoice_id`),
  CONSTRAINT `bill_form_invoice_id_c0f043bf_fk_invoice_form_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_form` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_form`
--

LOCK TABLES `bill_form` WRITE;
/*!40000 ALTER TABLE `bill_form` DISABLE KEYS */;
INSERT INTO `bill_form` VALUES (45,'3','2025-01-31','sample1','Java Full Stack','ten thousand rupees only','10000','Cash',12,NULL,0),(48,'1','2025-01-31','abi','Java Full Stack','thirty thousand','13000','Cash',9,NULL,0),(50,'1','2025-02-01','abi','Java Full Stack','sdfgf','10000','Cash',9,NULL,0),(53,'1','2025-02-01','abi','Java Full Stack','','13000','Cash',9,NULL,0),(55,'2','2025-02-01','yabase','UI/UX Design','thirteen thousand','13000','Cash',10,NULL,0),(56,'2','2025-02-01','yabase','UI/UX Design','thirteen thousand','13000','Cash',10,NULL,0);
/*!40000 ALTER TABLE `bill_form` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-01-30 05:23:05.145590','3','',3,'',8,1),(2,'2025-01-30 09:51:32.344611','4','abi',2,'[{\"changed\": {\"fields\": [\"Billstdmobile\"]}}]',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'myproject_app','billform'),(9,'myproject_app','installment'),(8,'myproject_app','invoiceform'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-01-29 10:54:36.661354'),(2,'auth','0001_initial','2025-01-29 10:54:37.570623'),(3,'admin','0001_initial','2025-01-29 10:54:37.777865'),(4,'admin','0002_logentry_remove_auto_add','2025-01-29 10:54:37.789561'),(5,'admin','0003_logentry_add_action_flag_choices','2025-01-29 10:54:37.806326'),(6,'contenttypes','0002_remove_content_type_name','2025-01-29 10:54:37.948055'),(7,'auth','0002_alter_permission_name_max_length','2025-01-29 10:54:38.093213'),(8,'auth','0003_alter_user_email_max_length','2025-01-29 10:54:38.125389'),(9,'auth','0004_alter_user_username_opts','2025-01-29 10:54:38.133850'),(10,'auth','0005_alter_user_last_login_null','2025-01-29 10:54:38.245816'),(11,'auth','0006_require_contenttypes_0002','2025-01-29 10:54:38.249545'),(12,'auth','0007_alter_validators_add_error_messages','2025-01-29 10:54:38.258036'),(13,'auth','0008_alter_user_username_max_length','2025-01-29 10:54:38.388948'),(14,'auth','0009_alter_user_last_name_max_length','2025-01-29 10:54:38.509920'),(15,'auth','0010_alter_group_name_max_length','2025-01-29 10:54:38.539637'),(16,'auth','0011_update_proxy_permissions','2025-01-29 10:54:38.549815'),(17,'auth','0012_alter_user_first_name_max_length','2025-01-29 10:54:38.661268'),(18,'myproject_app','0001_initial','2025-01-29 10:54:38.824154'),(19,'myproject_app','0002_billform_invoice','2025-01-29 10:54:38.934742'),(20,'myproject_app','0003_alter_billform_invoice','2025-01-29 10:54:39.160376'),(21,'myproject_app','0004_delete_user','2025-01-29 10:54:39.179690'),(22,'sessions','0001_initial','2025-01-29 10:54:39.254194'),(23,'myproject_app','0005_billform_billstdmobile','2025-01-29 18:00:23.792610'),(24,'myproject_app','0006_invoiceform_stdid','2025-01-30 09:19:55.248721'),(25,'myproject_app','0007_alter_invoiceform_stdid','2025-01-30 09:19:55.255823'),(26,'myproject_app','0008_alter_billform_billstdmobile','2025-01-31 06:46:11.080355'),(27,'myproject_app','0009_alter_billform_billstdmobile_installment','2025-01-31 09:08:07.905043'),(28,'myproject_app','0010_alter_installment_table','2025-01-31 09:11:30.331428'),(29,'myproject_app','0011_alter_installment_table','2025-01-31 09:49:12.269065'),(30,'myproject_app','0012_delete_installment','2025-01-31 16:14:24.494265'),(31,'myproject_app','0013_billform_is_paid','2025-01-31 16:57:23.690165');
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
INSERT INTO `django_session` VALUES ('c82zgptwbn59go0hu11sc6z5bj5t1bux','.eJxVjEEOwiAQRe_C2pACQ4Mu3XsGMsMMUjWQlHZlvLtt0oVu_3vvv1XEdSlx7TLHidVFGXX63QjTU-oO-IH13nRqdZkn0ruiD9r1rbG8rof7d1Cwl60OZmAPGXMwI9lEMgAGZhGfhc8EHMShFXABvDhLKIkDb9CbNAqg-nwBFC45gQ:1tdBo0:UxlLoslWv75D_wzFxKXOr0jtiL_T_kLx6KbBoBM0RUE','2025-02-12 17:24:48.498843');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_form`
--

DROP TABLE IF EXISTS `invoice_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_form` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `sfname` varchar(50) NOT NULL,
  `slname` varchar(50) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `payment` varchar(50) NOT NULL,
  `pcnumber` varchar(12) NOT NULL,
  `saddress` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `coname` varchar(50) NOT NULL,
  `coduration` varchar(20) NOT NULL,
  `cototal` varchar(20) NOT NULL,
  `coins1` varchar(20) NOT NULL,
  `coins2` varchar(20) NOT NULL,
  `coins3` varchar(20) NOT NULL,
  `coinsdate1` date NOT NULL,
  `coinsdate2` date NOT NULL,
  `coinsdate3` date NOT NULL,
  `stdid` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pcnumber` (`pcnumber`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `stdid` (`stdid`),
  CONSTRAINT `invoice_form_chk_1` CHECK ((`stdid` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_form`
--

LOCK TABLES `invoice_form` WRITE;
/*!40000 ALTER TABLE `invoice_form` DISABLE KEYS */;
INSERT INTO `invoice_form` VALUES (9,'2025-01-31','abi','a','antony','Cash','9879869878','3,kovil street,surandai','abisakeyabase962@gmail.com','Java Full Stack','6 months','36000','10000','13000','13000','2025-01-31','2025-03-03','2025-03-31',1),(10,'2025-01-31','yabase','A','antony','Cash','9080553984','3,kovil street,surandai','yabase@gmail.com','UI/UX Design','6 months','36000','10000','13000','13000','2025-01-31','2025-03-03','2025-03-31',2),(12,'2025-01-31','sample1','A','sample1','Cash','1234567890','sample','aaa@gmail.com','Java Full Stack','6 months','36000','10000','13000','13000','2025-01-31','2025-03-03','2025-03-31',3);
/*!40000 ALTER TABLE `invoice_form` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-01 16:11:20
