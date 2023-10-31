-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: dbmovements
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `Family`
--

DROP TABLE IF EXISTS `Family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Family` (
  `FamilyId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(180) NOT NULL,
  PRIMARY KEY (`FamilyId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Family`
--

LOCK TABLES `Family` WRITE;
/*!40000 ALTER TABLE `Family` DISABLE KEYS */;
INSERT INTO `Family` VALUES (1,'Pago Yape'),(2,'Entretenimiento'),(3,'Comida/Delivery'),(4,'Tecnologia'),(5,'Compras Casa'),(6,'Tienda Retail'),(7,'Farmacias');
/*!40000 ALTER TABLE `Family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FamilyConcept`
--

DROP TABLE IF EXISTS `FamilyConcept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FamilyConcept` (
  `FamilyConceptId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(180) NOT NULL,
  `FamilyId` int NOT NULL,
  PRIMARY KEY (`FamilyConceptId`),
  KEY `FK_FamilyConcept` (`FamilyId`),
  CONSTRAINT `FK_FamilyConcept` FOREIGN KEY (`FamilyId`) REFERENCES `Family` (`FamilyId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FamilyConcept`
--

LOCK TABLES `FamilyConcept` WRITE;
/*!40000 ALTER TABLE `FamilyConcept` DISABLE KEYS */;
INSERT INTO `FamilyConcept` VALUES (1,'YAPE',1),(2,'Spotify',2),(3,'Netflix',2),(4,'Disney',2),(5,'RAPPI',3),(6,'PedidosYa',3),(7,'RIPLEY',6),(8,'OECHSLE',6),(9,'IKF',7),(10,'MFA',7),(11,'CAPRICCIO',3);
/*!40000 ALTER TABLE `FamilyConcept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balance`
--

DROP TABLE IF EXISTS `balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `balance` (
  `balanceId` int NOT NULL AUTO_INCREMENT,
  `yearId` int NOT NULL,
  `monthId` int NOT NULL,
  `totalIncome` decimal(18,2) NOT NULL,
  `totalExpense` decimal(18,2) NOT NULL,
  `cardId` int NOT NULL,
  `totalBalance` decimal(18,2) NOT NULL,
  `initialBalance` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`balanceId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance`
--

LOCK TABLES `balance` WRITE;
/*!40000 ALTER TABLE `balance` DISABLE KEYS */;
INSERT INTO `balance` VALUES (1,2022,12,0.00,0.00,3,22269.32,NULL),(9,2023,1,2275.00,1275.22,3,23269.10,22269.32),(10,2023,2,2275.00,1200.10,3,24344.00,23269.10),(11,2023,3,2275.00,780.10,3,25838.90,24344.00),(12,2023,4,6855.00,2300.30,3,30393.60,25838.90),(13,2023,5,6550.00,2886.25,3,34057.35,30393.60),(14,2023,6,8750.00,3506.70,3,39300.65,34057.35),(15,2023,7,3475.00,1699.15,3,41076.50,39300.65);
/*!40000 ALTER TABLE `balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `cardId` int NOT NULL AUTO_INCREMENT,
  `financialEntityId` int NOT NULL,
  `cardTypeId` int NOT NULL,
  `currencyTypeId` int NOT NULL,
  `cardNumber` varchar(80) NOT NULL,
  PRIMARY KEY (`cardId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,1,1,1,'0000-0000-0000-0000'),(2,1,2,1,'0000-0000-0000-0000'),(3,1,1,2,'0000-0000-0000-0000'),(4,2,2,1,'0000-0000-0000-0000');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardType`
--

DROP TABLE IF EXISTS `cardType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardType` (
  `cardTypeId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`cardTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardType`
--

LOCK TABLES `cardType` WRITE;
/*!40000 ALTER TABLE `cardType` DISABLE KEYS */;
INSERT INTO `cardType` VALUES (1,'Debito'),(2,'Credito');
/*!40000 ALTER TABLE `cardType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencyType`
--

DROP TABLE IF EXISTS `currencyType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencyType` (
  `currencyTypeId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `symbol` varchar(3) NOT NULL,
  PRIMARY KEY (`currencyTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencyType`
--

LOCK TABLES `currencyType` WRITE;
/*!40000 ALTER TABLE `currencyType` DISABLE KEYS */;
INSERT INTO `currencyType` VALUES (1,'Soles','S/.'),(2,'Dolares','$');
/*!40000 ALTER TABLE `currencyType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financialEntity`
--

DROP TABLE IF EXISTS `financialEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financialEntity` (
  `financialEntityId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `shortName` varchar(30) NOT NULL,
  PRIMARY KEY (`financialEntityId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financialEntity`
--

LOCK TABLES `financialEntity` WRITE;
/*!40000 ALTER TABLE `financialEntity` DISABLE KEYS */;
INSERT INTO `financialEntity` VALUES (1,'Banco de Credito del Peru','BCP'),(2,'Oeschle','OH!');
/*!40000 ALTER TABLE `financialEntity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movements`
--

DROP TABLE IF EXISTS `movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movements` (
  `movementId` int NOT NULL AUTO_INCREMENT,
  `dateMovement` datetime NOT NULL,
  `dateValue` datetime NOT NULL,
  `concept` varchar(280) NOT NULL,
  `expense` decimal(18,2) NOT NULL,
  `income` decimal(18,2) NOT NULL,
  `cardId` int NOT NULL,
  `FamilyId` int DEFAULT '0',
  PRIMARY KEY (`movementId`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movements`
--

LOCK TABLES `movements` WRITE;
/*!40000 ALTER TABLE `movements` DISABLE KEYS */;
INSERT INTO `movements` VALUES (1,'2023-06-10 00:00:00','2023-06-10 00:00:00','Fpay*Tottus            LIMA          PE',192.72,0.00,2,0),(2,'2023-06-10 00:00:00','2023-06-10 00:00:00','Fpay*Tottus            LIMA          PE',41.57,0.00,2,0),(3,'2023-06-17 00:00:00','2023-06-17 00:00:00','Fpay*Tottus            LIMA          PE',179.74,0.00,2,0),(4,'2023-06-17 00:00:00','2023-06-17 00:00:00','IZI*DULCINELLY         LIMA          PE',4.00,0.00,2,0),(5,'2023-06-20 00:00:00','2023-06-20 00:00:00','IZI*DULCINELLY         LIMA          PE',3.00,0.00,2,0),(6,'2023-06-22 00:00:00','2023-06-22 00:00:00','H Y M HENNES Y MAURITZ LA LIBERTAD   PE',89.95,0.00,2,0),(7,'2023-06-23 00:00:00','2023-06-23 00:00:00','IZI*BOTICA TRUJILLOSAL LIMA          PE',45.00,0.00,2,0),(8,'2023-06-24 00:00:00','2023-06-24 00:00:00','CLINICA PERUANO AMERIC LA LIBERTAD   PE',55.00,0.00,2,0),(9,'2023-06-24 00:00:00','2023-06-24 00:00:00','FARMACIA ISIS          LA LIBERTAD   PE',47.30,0.00,2,0),(10,'2023-06-24 00:00:00','2023-06-24 00:00:00','CLINICA PERUANO AMERIC LA LIBERTAD   PE',18.69,0.00,2,0),(11,'2023-06-27 00:00:00','2023-06-27 00:00:00','CLARO APP MI CLARO     LIMA          PE',110.00,0.00,2,0),(12,'2023-07-01 00:00:00','2023-07-01 00:00:00','RIMAC SOL RECURRENCIA  LIMA          PE',796.00,0.00,2,0),(13,'2023-07-01 00:00:00','2023-07-01 00:00:00','IZI*BERMANLAB          LIMA          PE',103.00,0.00,2,0),(14,'2023-07-01 00:00:00','2023-07-01 00:00:00','IKF 298 TRUJILLO 18    LA LIBERTAD   PE',16.50,0.00,2,7),(15,'2023-07-02 00:00:00','2023-07-02 00:00:00','IZI*EL RINCON DEL BIJA LIMA          PE',97.00,0.00,2,0),(16,'2023-07-04 00:00:00','2023-07-04 00:00:00','PAGO BANCA MOVIL',0.00,1310.08,2,0),(17,'2023-07-04 00:00:00','2023-07-04 00:00:00','PAGO BANCA MOVIL',0.00,2476.37,2,0),(18,'2023-07-02 00:00:00','2023-07-02 00:00:00','SumUp * Psicologo Dieg MIRAFLORES    PE',625.00,0.00,2,0),(19,'2023-07-04 00:00:00','2023-07-04 00:00:00','CLARO APP MI CLARO     LIMA          PE',51.90,0.00,2,0),(20,'2023-07-06 00:00:00','2023-07-06 00:00:00','IZI*DULCINELLY         LIMA          PE',11.00,0.00,2,0),(21,'2023-07-08 00:00:00','2023-07-08 00:00:00','Fpay*Falabella.com     LIMA          PE',411.00,0.00,2,0),(22,'2023-07-09 00:00:00','2023-07-09 00:00:00','Fpay*Tottus            LIMA          PE',153.95,0.00,2,0),(35,'2023-07-04 00:00:00','2023-07-04 00:00:00','Cambio a Soles',890.00,0.00,3,0),(37,'2023-07-04 00:00:00','2023-07-04 00:00:00','Cambio a Soles',809.00,0.00,3,0),(38,'2023-07-10 00:00:00','2023-07-10 00:00:00','AB.TR.EXT-ZU451201',0.00,3475.00,3,0),(39,'2023-07-10 00:00:00','2023-07-10 00:00:00','IMPUESTO ITF',0.15,0.00,3,0),(40,'2023-06-02 00:00:00','2023-06-02 00:00:00','AB.TR.EXT-ZU115625',0.00,2275.00,3,0),(41,'2023-06-02 00:00:00','2023-06-02 00:00:00','IMPUESTO ITF',0.10,0.00,3,0),(42,'2023-06-05 00:00:00','2023-06-05 00:00:00','AB.TR.EXT-ZU139217',0.00,6475.00,3,0),(43,'2023-06-05 00:00:00','2023-06-05 00:00:00','IMPUESTO ITF',0.30,0.00,3,0),(44,'2023-06-05 00:00:00','2023-06-05 00:00:00','Transferencia TC',3069.00,0.00,3,0),(45,'2023-06-10 00:00:00','2023-06-10 00:00:00','Transferencia TC',75.00,0.00,3,0),(46,'2023-06-12 00:00:00','2023-06-12 00:00:00','Transferencia TC',300.00,0.00,3,0),(47,'2023-06-15 00:00:00','2023-06-15 00:00:00','Transferencia TC',62.30,0.00,3,0),(48,'2023-05-02 00:00:00','2023-05-02 00:00:00','AB.TR.EXT-ZT813887',0.00,3475.00,3,0),(49,'2023-05-02 00:00:00','2023-05-02 00:00:00','IMPUESTO ITF',0.15,0.00,3,0),(50,'2023-05-03 00:00:00','2023-05-03 00:00:00','AB.TR.EXT-ZT828266',0.00,2275.00,3,0),(51,'2023-05-03 00:00:00','2023-05-03 00:00:00','IMPUESTO ITF',0.10,0.00,3,0),(52,'2023-05-06 00:00:00','2023-05-06 00:00:00','Transferencia TC',300.00,0.00,3,0),(53,'2023-05-13 00:00:00','2023-05-13 00:00:00','Retiro Efectivo',800.00,0.00,3,0),(54,'2023-05-13 00:00:00','2023-05-13 00:00:00','Deposito Efectivo',0.00,800.00,3,0),(55,'2023-05-13 00:00:00','2023-05-13 00:00:00','Transferencia TC',1486.00,0.00,3,0),(56,'2023-05-22 00:00:00','2023-05-22 00:00:00','Transferencia TC',300.00,0.00,3,0),(57,'2023-04-05 00:00:00','2023-04-05 00:00:00','AB.TR.EXT-ZT578444',0.00,4580.00,3,0),(58,'2023-04-05 00:00:00','2023-04-05 00:00:00','AB.TR.EXT-ZT585245',0.00,2275.00,3,0),(59,'2023-04-05 00:00:00','2023-04-05 00:00:00','IMPUESTO ITF',0.30,0.00,3,0),(60,'2023-04-08 00:00:00','2023-04-08 00:00:00','RETIRO EFECTIVO',800.00,0.00,3,0),(61,'2023-04-27 00:00:00','2023-04-27 00:00:00','Transferencia TC',1500.00,0.00,3,0),(62,'2023-03-03 00:00:00','2023-03-03 00:00:00','AB.TR.EXT-ZT300087',0.00,2275.00,3,0),(63,'2023-03-03 00:00:00','2023-03-03 00:00:00','IMPUESTO ITF',0.10,0.00,3,0),(64,'2023-03-20 00:00:00','2023-03-20 00:00:00','Transferencia TC',780.00,0.00,3,0),(65,'2023-02-03 00:00:00','2023-02-03 00:00:00','AB.TR.EXT-ZT069907',0.00,2275.00,3,0),(66,'2023-02-03 00:00:00','2023-02-03 00:00:00','IMPUESTO ITF',0.10,0.00,3,0),(67,'2023-02-10 00:00:00','2023-02-10 00:00:00','RETIRO EFECTIVO',440.00,0.00,3,0),(68,'2023-02-22 00:00:00','2023-02-22 00:00:00','RETIRO EFECTIVO',760.00,0.00,3,0),(69,'2023-01-05 00:00:00','2023-01-05 00:00:00','AB.TR.EXT-ZS848486',0.00,2275.00,3,0),(70,'2023-01-05 00:00:00','2023-01-05 00:00:00','IMPUESTO ITF',0.10,0.00,3,0),(71,'2023-01-09 00:00:00','2023-01-09 00:00:00','RETIRO EFECTIVO',500.00,0.00,3,0),(72,'2023-01-17 00:00:00','2023-01-17 00:00:00','Transferencia TC',275.12,0.00,3,0),(73,'2023-01-27 00:00:00','2023-01-27 00:00:00','RETIRO EFECTIVO',500.00,0.00,3,0),(74,'2023-08-01 00:00:00','2023-08-01 00:00:00','Pago de Bairesdev',0.00,4697.85,3,0),(75,'2023-08-01 00:00:00','2023-08-01 00:00:00','IMPUESTO ITF - LEY',0.20,0.00,3,0),(76,'2023-08-05 00:00:00','2023-08-05 00:00:00','Transferencia TC',1405.00,0.00,3,0),(77,'2023-08-05 00:00:00','2023-08-05 00:00:00','IMPUESTO ITF - LEY',0.05,0.00,3,0),(78,'2023-08-07 00:00:00','2023-08-07 00:00:00','Pago Scribbles',0.00,3675.00,3,0),(79,'2023-08-07 00:00:00','2023-08-07 00:00:00','IMPUESTO ITF - LEY',0.15,0.00,3,0),(80,'2023-08-11 00:00:00','2023-08-11 00:00:00','Pago de clases ingles',172.85,0.00,3,0),(81,'2022-09-01 00:00:00','2022-09-01 00:00:00','DEPOSITO EFECTIVO',0.00,900.00,1,0),(82,'2022-09-02 00:00:00','2022-09-02 00:00:00','COOLBOX K39',119.40,0.00,1,0),(83,'2022-09-02 00:00:00','2022-09-02 00:00:00','Pago YAPE a 570982    *',33.00,0.00,1,1),(84,'2022-09-02 00:00:00','2022-09-02 00:00:00','PLAZA VEA TRUJILLO',9.19,0.00,1,0),(85,'2022-09-02 00:00:00','2022-09-02 00:00:00','Pago YAPE a 570910    *',6.00,0.00,1,1),(86,'2022-09-02 00:00:00','2022-09-02 00:00:00','Pago YAPE a 570982    *',34.00,0.00,1,1),(87,'2022-09-03 00:00:00','2022-09-03 00:00:00','PAGALO PE',10.30,0.00,1,0),(88,'2022-09-04 00:00:00','2022-09-04 00:00:00','DLC*RAPPI',20.20,0.00,1,3),(89,'2022-09-05 00:00:00','2022-09-05 00:00:00','IZI*BERMANLAB',220.00,0.00,1,0),(90,'2022-09-05 00:00:00','2022-09-05 00:00:00','Pago YAPE a 570046    *',7.00,0.00,1,1),(91,'2022-09-05 00:00:00','2022-09-05 00:00:00','RETIRO EFECTIVO',80.00,0.00,1,0),(92,'2022-09-06 00:00:00','2022-09-06 00:00:00','WONG LARCO',10.40,0.00,1,0),(93,'2022-09-06 00:00:00','2022-09-06 00:00:00','PAG.T.PROP.VISA.BM',822.00,0.00,1,0),(94,'2022-09-06 00:00:00','2022-09-06 00:00:00','MFAA50 TRUJILLO LA',19.80,0.00,1,7),(95,'2022-09-06 00:00:00','2022-09-06 00:00:00','Pago YAPE a 570342    *',13.00,0.00,1,1),(96,'2022-09-07 00:00:00','2022-09-07 00:00:00','Pago YAPE a 570940    *',12.00,0.00,1,1),(97,'2022-09-07 00:00:00','2022-09-07 00:00:00','IZI*JUGUERIA SAN A',55.00,0.00,1,0),(98,'2022-09-07 00:00:00','2022-09-07 00:00:00','E S ESPANA LISTO',5.90,0.00,1,0),(99,'2022-09-07 00:00:00','2022-09-07 00:00:00','Pago YAPE a 570912    *',25.00,0.00,1,1),(100,'2022-09-07 00:00:00','2022-09-07 00:00:00','Pago YAPE a 570265    *',6.00,0.00,1,1),(101,'2022-09-07 00:00:00','2022-09-07 00:00:00','Pago YAPE a 570979    *',6.00,0.00,1,1),(102,'2022-09-07 00:00:00','2022-09-07 00:00:00','SATT CAJ REG CIV',195.50,0.00,1,0),(103,'2022-09-08 00:00:00','2022-09-08 00:00:00','DLC*RAPPI PRIME',16.90,0.00,1,3),(104,'2022-09-08 00:00:00','2022-09-08 00:00:00','Pago YAPE a 570285    *',14.00,0.00,1,1),(105,'2022-09-08 00:00:00','2022-09-08 00:00:00','OECHSLE TRUJILLO',130.15,0.00,1,6),(106,'2022-09-08 00:00:00','2022-09-08 00:00:00','IZI*TORTAS BLANKI',24.00,0.00,1,0),(107,'2022-09-08 00:00:00','2022-09-08 00:00:00','Pago YAPE a 570963    *',5.50,0.00,1,1),(108,'2022-09-08 00:00:00','2022-09-08 00:00:00','Pago YAPE a 570342    *',10.00,0.00,1,1),(109,'2022-09-09 00:00:00','2022-09-09 00:00:00','Pago YAPE a 570957    *',7.00,0.00,1,1),(110,'2022-09-09 00:00:00','2022-09-09 00:00:00','Pago YAPE a 570919    *',7.00,0.00,1,1),(111,'2022-09-09 00:00:00','2022-09-09 00:00:00','RETIRO EFECTIVO',80.00,0.00,1,0),(112,'2022-09-09 00:00:00','2022-09-09 00:00:00','Pago YAPE a 570939    *',6.00,0.00,1,1),(113,'2022-09-09 00:00:00','2022-09-09 00:00:00','YAPE',6.00,0.00,1,1),(114,'2022-09-09 00:00:00','2022-09-09 00:00:00','YAPE',6.00,0.00,1,1),(115,'2022-09-09 00:00:00','2022-09-09 00:00:00','YAPE',7.00,0.00,1,1),(116,'2022-09-10 00:00:00','2022-09-10 00:00:00','Pago YAPE a 570312    *',6.00,0.00,1,1),(117,'2022-09-10 00:00:00','2022-09-10 00:00:00','HIPERMERCADOS METR',75.49,0.00,1,0),(118,'2022-09-10 00:00:00','2022-09-10 00:00:00','Pago YAPE a 570981    *',6.00,0.00,1,1),(119,'2022-09-10 00:00:00','2022-09-10 00:00:00','Pago YAPE a 570048    *',6.00,0.00,1,1),(120,'2022-09-10 00:00:00','2022-09-10 00:00:00','YAPE',50.00,0.00,1,1),(121,'2022-09-11 00:00:00','2022-09-11 00:00:00','YAPE',50.00,0.00,1,1),(122,'2022-09-11 00:00:00','2022-09-11 00:00:00','RETIRO EFECTIVO',120.00,0.00,1,0),(123,'2022-09-11 00:00:00','2022-09-11 00:00:00','WONG LARCO',5.20,0.00,1,0),(124,'2022-09-11 00:00:00','2022-09-11 00:00:00','Pago YAPE a 570342    *',10.00,0.00,1,1),(125,'2022-09-12 00:00:00','2022-09-12 00:00:00','Pago YAPE a 570946    *',6.00,0.00,1,1),(126,'2022-09-12 00:00:00','2022-09-12 00:00:00','Pago YAPE a 570070    *',5.00,0.00,1,1),(127,'2022-09-12 00:00:00','2022-09-12 00:00:00','Pago YAPE a 570316    *',116.00,0.00,1,1),(128,'2022-09-12 00:00:00','2022-09-12 00:00:00','Pago YAPE a 570021    *',7.00,0.00,1,1),(129,'2022-09-12 00:00:00','2022-09-12 00:00:00','Pago YAPE a 570342    *',10.00,0.00,1,1),(130,'2022-09-13 00:00:00','2022-09-13 00:00:00','WONG LARCO',40.79,0.00,1,0),(131,'2022-09-13 00:00:00','2022-09-13 00:00:00','Pago YAPE a 570004    *',5.00,0.00,1,1),(132,'2022-09-13 00:00:00','2022-09-13 00:00:00','YAPE',6.00,0.00,1,1),(133,'2022-09-13 00:00:00','2022-09-13 00:00:00','PLAZA VEA TRUJILLO',18.80,0.00,1,0),(134,'2022-09-13 00:00:00','2022-09-13 00:00:00','Pago YAPE de 57001    *',0.00,9.41,1,1),(135,'2022-09-13 00:00:00','2022-09-13 00:00:00','PLAZA VEA TRUJILLO',55.00,0.00,1,0),(136,'2022-09-13 00:00:00','2022-09-13 00:00:00','Pago YAPE a 570067    *',7.00,0.00,1,1),(137,'2022-09-14 00:00:00','2022-09-14 00:00:00','PAYU*Netflix',44.90,0.00,1,2),(138,'2022-09-14 00:00:00','2022-09-14 00:00:00','YAPE',6.00,0.00,1,1),(139,'2022-09-14 00:00:00','2022-09-14 00:00:00','RADIO SHACK REAL T',39.90,0.00,1,0),(140,'2022-09-14 00:00:00','2022-09-14 00:00:00','Pago YAPE de 57001    *',0.00,20.00,1,1),(141,'2022-09-14 00:00:00','2022-09-14 00:00:00','Pago YAPE a 570947    *',8.00,0.00,1,1),(142,'2022-09-14 00:00:00','2022-09-14 00:00:00','Pago YAPE a 194399    *',8.00,0.00,1,1),(143,'2022-09-14 00:00:00','2022-09-14 00:00:00','PedidosYA Restaura',56.90,0.00,1,3),(144,'2022-09-14 00:00:00','2022-09-14 00:00:00','Pago YAPE a 570968    *',14.00,0.00,1,1),(145,'2022-09-15 00:00:00','2022-09-15 00:00:00','Pago YAPE a 570003    *',13.00,0.00,1,1),(146,'2022-09-15 00:00:00','2022-09-15 00:00:00','JOHN HOLDEN REMATE',662.61,0.00,1,0),(147,'2022-09-15 00:00:00','2022-09-15 00:00:00','IZI*JUGUERIA SAN A',55.00,0.00,1,0),(148,'2022-09-15 00:00:00','2022-09-15 00:00:00','WONG LARCO',9.50,0.00,1,0),(149,'2022-09-15 00:00:00','2022-09-15 00:00:00','RETIRO EFECTIVO',80.00,0.00,1,0),(150,'2022-09-16 00:00:00','2022-09-16 00:00:00','Pago YAPE a 570978    *',14.00,0.00,1,1),(151,'2022-09-16 00:00:00','2022-09-16 00:00:00','RIPLEY TRUJILLO',80.15,0.00,1,6),(152,'2022-09-16 00:00:00','2022-09-16 00:00:00','CAPRICCIO',41.00,0.00,1,3),(153,'2022-09-16 00:00:00','2022-09-16 00:00:00','MFA281 TRUJILLO MA',62.60,0.00,1,7),(154,'2022-09-16 00:00:00','2022-09-16 00:00:00','Pago YAPE de 57096    *',0.00,182.90,1,1),(155,'2022-09-16 00:00:00','2022-09-16 00:00:00','Pago YAPE a 194217    *',364.00,0.00,1,1),(156,'2022-09-16 00:00:00','2022-09-16 00:00:00','Pago YAPE a 570027    *',13.00,0.00,1,1),(157,'2022-09-16 00:00:00','2022-09-16 00:00:00','JOHN HOLDEN REMATE',150.20,0.00,1,0),(158,'2022-09-16 00:00:00','2022-09-16 00:00:00','PAG.T.PROP.VISA.BM',182.90,0.00,1,0),(159,'2022-09-16 00:00:00','2022-09-16 00:00:00','Pago YAPE a 570296    *',12.00,0.00,1,1),(160,'2022-09-17 00:00:00','2022-09-17 00:00:00','Pago YAPE a 570940    *',6.00,0.00,1,1),(161,'2022-09-17 00:00:00','2022-09-17 00:00:00','HIPERMERCADOS METR',21.90,0.00,1,0),(162,'2022-09-17 00:00:00','2022-09-17 00:00:00','YAPE',7.00,0.00,1,1),(163,'2022-09-18 00:00:00','2022-09-18 00:00:00','Pago YAPE a 570915    *',7.00,0.00,1,1),(164,'2022-09-18 00:00:00','2022-09-18 00:00:00','DLC*RAPPI',20.20,0.00,1,3),(165,'2022-09-18 00:00:00','2022-09-18 00:00:00','Pago YAPE a 570987    *',7.80,0.00,1,1),(166,'2022-09-19 00:00:00','2022-09-19 00:00:00','WONG LARCO',9.50,0.00,1,0),(167,'2022-09-19 00:00:00','2022-09-19 00:00:00','Pago YAPE a 570257    *',256.00,0.00,1,1),(168,'2022-09-19 00:00:00','2022-09-19 00:00:00','RETIRO EFECTIVO',100.00,0.00,1,0),(169,'2022-09-19 00:00:00','2022-09-19 00:00:00','TRA O/CTA - AGENTE',171.50,0.00,1,0),(170,'2022-09-19 00:00:00','2022-09-19 00:00:00','YAPE',6.00,0.00,1,1),(171,'2022-09-20 00:00:00','2022-09-20 00:00:00','YAPE',8.00,0.00,1,1),(172,'2022-09-21 00:00:00','2022-09-21 00:00:00','RETIRO EFECTIVO',120.00,0.00,1,0),(173,'2022-09-21 00:00:00','2022-09-21 00:00:00','YAPE',6.00,0.00,1,1),(174,'2022-09-21 00:00:00','2022-09-21 00:00:00','Pago YAPE a 570060    *',8.00,0.00,1,1),(175,'2022-09-22 00:00:00','2022-09-22 00:00:00','WONG LARCO',14.00,0.00,1,0),(176,'2022-09-22 00:00:00','2022-09-22 00:00:00','IZI*COQUITO',68.00,0.00,1,0),(177,'2022-09-22 00:00:00','2022-09-22 00:00:00','Pago YAPE a 570946    *',6.00,0.00,1,1),(178,'2022-09-22 00:00:00','2022-09-22 00:00:00','Pago YAPE a 570990    *',5.40,0.00,1,1),(179,'2022-09-22 00:00:00','2022-09-22 00:00:00','Pago YAPE a 570990    *',1.80,0.00,1,1),(180,'2022-09-23 00:00:00','2022-09-23 00:00:00','RETIRO EFECTIVO',350.00,0.00,1,0),(181,'2022-09-23 00:00:00','2022-09-23 00:00:00','TRAN.CTAS.TERC.BM',0.00,500.00,1,0),(182,'2022-09-23 00:00:00','2022-09-23 00:00:00','Pago YAPE a 570910    *',6.00,0.00,1,1),(183,'2022-09-23 00:00:00','2022-09-23 00:00:00','DLC*RAPPI',20.20,0.00,1,3),(184,'2022-09-23 00:00:00','2022-09-23 00:00:00','YAPE',6.00,0.00,1,1),(185,'2022-09-23 00:00:00','2022-09-23 00:00:00','Pago YAPE a 570073    *',8.00,0.00,1,1),(186,'2022-09-24 00:00:00','2022-09-24 00:00:00','TRAN.CTAS.TERC.BM',0.00,1500.00,1,0),(187,'2022-09-24 00:00:00','2022-09-24 00:00:00','Pago YAPE a 570316    *',91.00,0.00,1,1),(188,'2022-09-24 00:00:00','2022-09-24 00:00:00','Pago YAPE a 570968    *',14.00,0.00,1,1),(189,'2022-09-24 00:00:00','2022-09-24 00:00:00','TRAN.CTAS.TERC.BM',0.00,500.00,1,0),(190,'2022-09-24 00:00:00','2022-09-24 00:00:00','Pago YAPE a 570997    *',6.00,0.00,1,1),(191,'2022-09-24 00:00:00','2022-09-24 00:00:00','INVERSIONES PROVIN',279.20,0.00,1,0),(192,'2022-09-24 00:00:00','2022-09-24 00:00:00','IMPUESTO ITF          *',0.05,0.00,1,0),(193,'2022-09-25 00:00:00','2022-09-25 00:00:00','IKF 295 TRUJILLO 1',12.00,0.00,1,7),(194,'2022-09-25 00:00:00','2022-09-25 00:00:00','CHIFA HAN MUY',136.00,0.00,1,0),(195,'2022-09-25 00:00:00','2022-09-25 00:00:00','YAPE',9.00,0.00,1,1),(196,'2022-09-25 00:00:00','2022-09-25 00:00:00','OECHSLE TRUJILLO',149.80,0.00,1,6),(197,'2022-09-25 00:00:00','2022-09-25 00:00:00','H Y M HENNES Y MAU',65.85,0.00,1,0),(198,'2022-09-25 00:00:00','2022-09-25 00:00:00','YAPE',8.00,0.00,1,1),(199,'2022-09-26 00:00:00','2022-09-26 00:00:00','DISNEY PLUS',28.39,0.00,1,2),(200,'2022-09-26 00:00:00','2022-09-26 00:00:00','RIPLEY COM',309.00,0.00,1,6),(201,'2022-09-26 00:00:00','2022-09-26 00:00:00','YAPE',6.00,0.00,1,1),(202,'2022-09-26 00:00:00','2022-09-26 00:00:00','Pago YAPE a 191321    *',8.00,0.00,1,1),(203,'2022-09-27 00:00:00','2022-09-27 00:00:00','Spotify P1E00CBABA',20.90,0.00,1,2),(204,'2022-09-27 00:00:00','2022-09-27 00:00:00','YAPE',20.00,0.00,1,1),(205,'2022-09-27 00:00:00','2022-09-27 00:00:00','IZI*COQUITO',29.00,0.00,1,0),(206,'2022-09-27 00:00:00','2022-09-27 00:00:00','Pago YAPE a 570248    *',5.50,0.00,1,1),(207,'2022-09-27 00:00:00','2022-09-27 00:00:00','WONG LARCO',5.20,0.00,1,0),(208,'2022-09-28 00:00:00','2022-09-28 00:00:00','YAPE',6.00,0.00,1,1),(209,'2022-09-28 00:00:00','2022-09-28 00:00:00','YAPE',6.00,0.00,1,1),(210,'2022-09-28 00:00:00','2022-09-28 00:00:00','Pago YAPE a 570984    *',6.00,0.00,1,1),(211,'2022-09-29 00:00:00','2022-09-29 00:00:00','YAPE',100.00,0.00,1,1),(212,'2022-09-29 00:00:00','2022-09-29 00:00:00','YAPE',35.00,0.00,1,1),(213,'2022-09-30 00:00:00','2022-09-30 00:00:00','TELE000948746916',51.90,0.00,1,0),(214,'2022-09-30 00:00:00','2022-09-30 00:00:00','Pago YAPE a 570912    *',6.00,0.00,1,1),(215,'2022-09-30 00:00:00','2022-09-30 00:00:00','Pago YAPE a 570990    *',7.20,0.00,1,1),(216,'2022-09-30 00:00:00','2022-09-30 00:00:00','COM.MANTENIM          1',12.00,0.00,1,0);
/*!40000 ALTER TABLE `movements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_card`
--

DROP TABLE IF EXISTS `v_card`;
/*!50001 DROP VIEW IF EXISTS `v_card`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_card` AS SELECT 
 1 AS `cardId`,
 1 AS `cardNumber`,
 1 AS `financialEntityName`,
 1 AS `cardTypeName`,
 1 AS `currencyTypeName`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'dbmovements'
--

--
-- Dumping routines for database 'dbmovements'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_getFamily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_getFamily`(psConcept VARCHAR(180)) RETURNS int
    DETERMINISTIC
BEGIN

DECLARE pFamilyId INT;
SET pFamilyId = 0;

SELECT FamilyId INTO pFamilyId FROM FamilyConcept
WHERE psConcept LIKE CONCAT('%', name, '%');

RETURN pFamilyId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getSumedMovementsByMonthAndConcept` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_getSumedMovementsByMonthAndConcept`(pYearId INT, pmonthId INT, pDayId INT, pCardId INT)
BEGIN


  DROP TABLE IF EXISTS temp_movements;

  CREATE TEMPORARY TABLE temp_movements
  SELECT F.Name as concept, SUM(expense) AS expense FROM movements M
  INNER JOIN Family F ON F.FamilyId = M.FamilyId
  WHERE  YEAR(dateValue) = pYearId AND MONTH(dateValue) = pMonthId
  AND (DAY(dateValue) = CASE WHEN pDayId = 0 THEN DAY(dateValue) ELSE pDayId END)
  AND cardId = pCardId
  AND expense > 0
  GROUP BY F.Name, F.FamilyId;
  
  insert into temp_movements
  select concept, SUM(expense) AS expense from movements
  WHERE  YEAR(dateValue) = pYearId AND MONTH(dateValue) = pMonthId 
  AND (DAY(dateValue) = CASE WHEN pDayId = 0 THEN DAY(dateValue) ELSE pDayId END)
  AND cardId = pCardId
  AND expense > 0
  AND FamilyId = 0
  GROUP BY concept;
  
  SELECT * FROM temp_movements;
  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertMovement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_insertMovement`(pDateMovement DATETIME, pDateValue DATETIME, pConcept VARCHAR(280), pExpense DECIMAL(18,2), pIncome DECIMAL(18,2), pCardId INT)
BEGIN

  SELECT pFamilyId = FamilyId FROM Family
  WHERE name LIKE CONCAT(pConcept, '%');

  INSERT INTO movements
  (dateMovement, dateValue, concept, expense, income, cardid, FamilyId)
  VALUES(pDateMovement, pDateValue, pConcept, pExpense, pIncome, pCardId, pFamilyId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_card`
--

/*!50001 DROP VIEW IF EXISTS `v_card`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_card` AS select `C`.`cardId` AS `cardId`,`C`.`cardNumber` AS `cardNumber`,`FE`.`shortName` AS `financialEntityName`,`CAT`.`name` AS `cardTypeName`,`CT`.`name` AS `currencyTypeName` from (((`card` `C` join `financialEntity` `FE` on((`C`.`financialEntityId` = `FE`.`financialEntityId`))) join `currencyType` `CT` on((`C`.`currencyTypeId` = `CT`.`currencyTypeId`))) join `cardType` `CAT` on((`C`.`cardTypeId` = `CAT`.`cardTypeId`))) */;
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

-- Dump completed on 2023-10-22 11:48:49
