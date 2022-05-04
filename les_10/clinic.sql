Terminal close -- exit!
trib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: med_clinic_db
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int unsigned DEFAULT NULL,
  `employee_id` int unsigned DEFAULT NULL,
  `at_time` datetime DEFAULT NULL COMMENT 'Время записи',
  `finished` tinyint(1) DEFAULT NULL COMMENT 'Состоялся ли приём',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_patient_id` (`patient_id`),
  KEY `index_of_employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Записи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (7,1,4,'2012-10-21 13:30:00',1,1000.00,'2022-04-29 13:05:16','2022-04-29 13:05:16'),(8,2,6,'2012-10-21 12:30:00',0,2000.00,'2022-04-29 13:05:16','2022-04-29 13:05:16'),(9,5,4,'2012-10-22 13:34:00',1,1500.00,'2022-04-29 13:05:16','2022-04-29 13:05:16'),(10,1,4,'2012-10-25 15:10:00',1,2000.00,'2022-04-29 13:05:16','2022-04-29 13:05:16'),(11,2,4,'2012-11-11 12:20:00',1,1000.00,'2022-04-29 13:05:16','2022-04-29 13:05:16'),(12,1,6,'2013-10-21 10:00:00',0,1300.00,'2022-04-29 13:05:16','2022-04-29 13:05:16');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Имя сотрудника',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `position_id` int unsigned DEFAULT NULL COMMENT 'Индентификатор должности',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Сотрудники';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Валентин','1993-10-03',2,'2022-04-29 13:02:30','2022-04-29 13:02:30'),(2,'Анна','1964-10-12',4,'2022-04-29 13:02:30','2022-04-29 13:02:30'),(3,'Александр','1995-05-22',5,'2022-04-29 13:02:30','2022-04-29 13:02:30'),(4,'Ольга','2000-04-24',1,'2022-04-29 13:02:30','2022-04-29 13:02:30'),(5,'Джон','1958-01-02',3,'2022-04-29 13:02:30','2022-04-29 13:02:30'),(6,'Людмила','1999-06-29',1,'2022-04-29 13:02:30','2022-04-29 13:02:30');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Имя пациента',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пациент';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Геннадий','1990-10-05','2022-04-29 12:59:47','2022-04-29 12:59:47'),(2,'Наталья','1984-11-12','2022-04-29 12:59:47','2022-04-29 12:59:47'),(3,'Александр','1985-05-20','2022-04-29 12:59:47','2022-04-29 12:59:47'),(4,'Сергей','1988-02-14','2022-04-29 12:59:47','2022-04-29 12:59:47'),(5,'Иван','1998-01-12','2022-04-29 12:59:47','2022-04-29 12:59:47'),(6,'Мария','1992-08-29','2022-04-29 12:59:47','2022-04-29 12:59:47');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название позиции',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Список позиций';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Доктор','2022-04-29 13:01:52','2022-04-29 13:01:52'),(2,'Медсестра/медбрат','2022-04-29 13:01:52','2022-04-29 13:01:52'),(3,'Администратор','2022-04-29 13:01:52','2022-04-29 13:01:52'),(4,'Санитарка/санитар','2022-04-29 13:01:52','2022-04-29 13:01:52'),(5,'Директор','2022-04-29 13:01:52','2022-04-29 13:01:52');
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

-- Dump completed on 2022-04-29 13:08:54
