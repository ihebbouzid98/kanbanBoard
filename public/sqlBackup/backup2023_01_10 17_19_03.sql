-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: kanbanboard
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `column_id` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `cards_column_id_foreign` (`column_id`),
  CONSTRAINT `cards_column_id_foreign` FOREIGN KEY (`column_id`) REFERENCES `columns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,'Mrs. Joy Hamill','Voluptas consequatur accusantium officia alias numquam sint. Dolorem velit voluptatem harum dolorum saepe. Facere atque nam quia nam ipsum est et.',1,NULL,'2023-01-10 14:57:57','2023-01-10 14:57:57',1),(2,'Bridie Berge','Maxime qui laboriosam praesentium sequi dolores neque voluptates. Aut temporibus sit autem nam sed eum quia. Numquam aliquid libero voluptas ut.',1,NULL,'2023-01-10 14:57:57','2023-01-10 14:57:57',2),(3,'Mr. Waylon Kerluke PhD','Debitis qui sunt ut cum nam et qui. Consequuntur impedit voluptatem atque expedita autem et. Omnis facilis praesentium incidunt a laboriosam dolores totam.',3,NULL,'2023-01-10 14:57:57','2023-01-10 14:57:57',1),(4,'Derrick Metz','Repellendus atque reiciendis nesciunt repellat nihil quo est. Qui quis temporibus dolorum expedita. Quia eaque sunt voluptate maiores omnis.',3,NULL,'2023-01-10 14:57:57','2023-01-10 14:57:57',2),(5,'Marcellus Steuber','Blanditiis quos quia voluptatem voluptatem praesentium et ipsam. Placeat mollitia est animi repellat et.',1,NULL,'2023-01-10 14:57:57','2023-01-10 14:57:57',3),(6,'Ebba Cormier','Ut nihil qui voluptas error. Et eveniet distinctio beatae qui rerum sit consequatur. Et similique sed dolor minima doloremque. Eos odio saepe earum alias dolorem illum minus.',3,NULL,'2023-01-10 14:57:57','2023-01-10 14:57:57',3),(7,'Ms. Carissa Brekke Jr.','Corrupti aut dolorem neque dolorem. Fuga officiis repudiandae minima maxime autem qui dolorum itaque. Atque rem eaque aut et et animi occaecati. Deleniti quia ex ut nihil facilis rerum et eum.',3,NULL,'2023-01-10 14:57:57','2023-01-10 14:57:57',4),(8,'Ida Adams Jr.','Accusantium consequatur officia qui recusandae et. Rerum voluptate delectus est omnis totam quaerat mollitia. Qui odio omnis quia.',3,NULL,'2023-01-10 14:57:57','2023-01-10 14:57:57',5),(9,'Moises Pollich','Molestiae deleniti non eveniet qui nesciunt id nesciunt eius. Ut rerum et veritatis cupiditate voluptatem esse alias. Laboriosam mollitia qui nesciunt quo.',2,NULL,'2023-01-10 14:57:57','2023-01-10 14:57:57',1),(10,'Earnest Hills','Eaque eum nesciunt pariatur accusamus tempore nulla quibusdam. Odio expedita maiores omnis eos.',3,NULL,'2023-01-10 14:57:57','2023-01-10 14:57:57',6),(11,'Afton Schuster','Laboriosam quia hic at ut sunt atque consectetur velit. Nostrum hic id aliquam quos. Iure repellat quis tempore expedita qui ut. Cum rerum rerum porro ea debitis non consequatur placeat.',1,NULL,'2023-01-10 14:58:00','2023-01-10 14:58:00',4),(12,'Dr. Janis Zulauf II','Eum molestias nulla sapiente est. Explicabo qui voluptates omnis autem accusantium distinctio. Consequatur ullam pariatur facilis explicabo placeat laudantium.',1,NULL,'2023-01-10 14:58:00','2023-01-10 14:58:00',5),(13,'Rosina Davis III','Laborum qui placeat asperiores earum repellendus recusandae ut. Consequatur magnam ducimus dolores commodi temporibus repellendus excepturi occaecati. Provident et est sed sit cupiditate omnis.',1,NULL,'2023-01-10 14:58:00','2023-01-10 14:58:00',6),(14,'Amanda Daugherty','Aspernatur impedit quos non asperiores neque qui debitis. Occaecati laudantium ut vitae dolor. Quisquam rerum dolores labore soluta amet. Sed mollitia quidem fugiat repudiandae explicabo.',1,NULL,'2023-01-10 14:58:00','2023-01-10 14:58:00',7),(15,'Luigi Bernhard','Nihil expedita itaque laborum illum minus ipsa. Rem laborum in illo perspiciatis. Et voluptas porro perferendis similique. Corrupti consequatur ab qui deleniti laborum.',2,NULL,'2023-01-10 14:58:00','2023-01-10 14:58:00',2),(16,'Marilyne Gleason','Itaque dolorum illum in. Enim eius quod provident et nobis. Ducimus distinctio molestias voluptatum asperiores ut. Consequatur enim facilis minima tempore quibusdam.',3,NULL,'2023-01-10 14:58:00','2023-01-10 14:58:00',7),(17,'Charlene Lemke PhD','Et et vel consectetur. Vero vel ab perspiciatis incidunt enim voluptate non. Eius qui dolores deleniti.',2,NULL,'2023-01-10 14:58:00','2023-01-10 14:58:00',3),(18,'Dr. Murl Brakus MD','Est quasi sed velit. Quis enim aut voluptates pariatur. Animi sed et porro quisquam. Labore amet repudiandae aliquam. Sit earum nihil magni quae fugit.',2,NULL,'2023-01-10 14:58:00','2023-01-10 14:58:00',4),(19,'Mr. Kennedy Bailey DVM','Aperiam qui est commodi adipisci dolor minus nam. Magni eum saepe earum. Explicabo ipsum occaecati nesciunt. Explicabo temporibus odio totam vero officia.',1,NULL,'2023-01-10 14:58:00','2023-01-10 14:58:00',8),(20,'Mr. Keegan Christiansen','Deserunt necessitatibus ut quam perspiciatis architecto. Sit ut ut placeat accusamus iste eos aut. Aspernatur voluptate quis porro.',3,NULL,'2023-01-10 14:58:00','2023-01-10 14:58:00',8);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `columns`
--

DROP TABLE IF EXISTS `columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns`
--

LOCK TABLES `columns` WRITE;
/*!40000 ALTER TABLE `columns` DISABLE KEYS */;
INSERT INTO `columns` VALUES (1,'To Do',NULL,'2023-01-10 14:57:56','2023-01-10 14:57:56'),(2,'In Progress',NULL,'2023-01-10 14:57:56','2023-01-10 14:57:56'),(3,'Done',NULL,'2023-01-10 14:57:56','2023-01-10 14:57:56');
/*!40000 ALTER TABLE `columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (19,'2014_10_12_000000_create_users_table',1),(20,'2014_10_12_100000_create_password_resets_table',1),(21,'2019_08_19_000000_create_failed_jobs_table',1),(22,'2019_12_14_000001_create_personal_access_tokens_table',1),(23,'2023_01_09_160929_create_columns_table',1),(24,'2023_01_09_161120_create_cards_table',1),(25,'2023_01_09_204308_add_order_to_cards_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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

-- Dump completed on 2023-01-10 18:19:03
