-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bdcobranza
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `codigo_barras` char(13) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `existencias` int NOT NULL,
  `CATEGORIAS_id` smallint unsigned NOT NULL,
  `PROVEEDOR_nombre` varchar(45) NOT NULL,
  `PROVEEDOR_apellidos` varchar(45) NOT NULL,
  `PROVEEDOR_empresa` varchar(45) NOT NULL,
  `PROVEEDOR_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_barras_UNIQUE` (`codigo_barras`),
  KEY `fk_ARTICULOS_CATEGORIAS1_idx` (`CATEGORIAS_id`),
  CONSTRAINT `fk_ARTICULOS_CATEGORIAS1` FOREIGN KEY (`CATEGORIAS_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (4,'PANTALON DE ENDURO','0000000000001',780.00,74,1,'ARTURO','MORENO RUIZ','PAPANTLA',1),(5,'PANTALON DE CROSS','0000000000002',780.00,9,1,'RICARDO','ALVAREZ MUÑOZ','INTERNOS',2),(6,'PANTALON DE MOTO','0000000000010',1599.00,90,1,'PAULA','MENDEZ MONTES','EXTERNOS',3),(16,'PANTALON DE NIÑO','0000000000004',780.00,0,1,'PAULA','MENDEZ MONTES','EXTERNOS',4),(18,'Pantalon Vestir','0000000000007',1299.00,0,2,'RICARDO','ALVAREZ MUÑOZ','INTERNOS',1),(19,'PANTALON GRIS','0000000000011',780.00,33,1,'ARTURO','MORENO RUIZ','PAPANTLA',2),(20,'PANTALON ROSA','0000000000012',780.00,38,1,'ARTURO','MORENO RUIZ','PAPANTLA',3),(21,'PANTALON MORADO','0000000000013',780.00,46,1,'RICARDO','ALVAREZ MUÑOZ','INTERNOS',4);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_articulos` AFTER UPDATE ON `articulos` FOR EACH ROW BEGIN -- ejecuciones del trigger inicio

INSERT INTO historial (fecha,hora,accion) 
					values (current_date(),current_time(),"Se actualizo el inventario"); 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) NOT NULL,
  `DEPARTAMENTOS_id` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CATEGORIAS_DEPARTAMENTOS1_idx` (`DEPARTAMENTOS_id`),
  CONSTRAINT `fk_CATEGORIAS_DEPARTAMENTOS1` FOREIGN KEY (`DEPARTAMENTOS_id`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'PANTALONES',1),(2,'ROPEROS',3),(3,'ESPEJOS',3),(4,'CABECERAS',3),(5,'RECAMARAS',3);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `telefono` char(10) NOT NULL,
  `domicilio` varchar(60) NOT NULL,
  `diaCobro` varchar(13) DEFAULT 'Lunes',
  `saldo` decimal(9,2) DEFAULT '0.00',
  `ruta` varchar(45) DEFAULT '"Degollado"',
  PRIMARY KEY (`id`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (4,'RAUL','ROMO MORENO','4433953778','MORELIA MICHOACAN','Viernes',0.00,'Degollado'),(5,'Raul2','Romo Moreno','3521454063','La Piedad Michoacan','Lunes',0.00,'Villas'),(6,'Ricardo','Deanda Martinez','3521458475','Zamora Michoacán','Martes',0.00,'Degollado'),(7,'Rafael','Ruiz Lopez','3525281750','Morelia Michoacán','Miercoles',0.00,'Numaran'),(8,'Paul','Reyes Montes','3521459587','Penjamillo Michoacán','Jueves',0.00,'Degollado'),(9,'Ana','Santoyo','3521454066','La Vasco Michoacan','Lunes',0.00,'Zinaparo'),(10,'Edwin','Alvarenga','4436077498','La Piedad Michoacán','Viernes',0.00,'Degollado'),(12,'LAURA','LILIA','4433953779','LA PIEDAD MICHOACAN, CIUDAD DEL SOL, 59310, FIRMAMENTO #245','Lunes',0.00,'Zamora');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_clientes` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN -- ejecuciones del trigger inicio

INSERT INTO historial (fecha,hora,accion) 
					values (current_date(),current_time(),"Se agrego un nuevo cliente"); 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `TIENDA_id` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_DEPARTAMENTOS_TIENDA_idx` (`TIENDA_id`),
  CONSTRAINT `fk_DEPARTAMENTOS_TIENDA` FOREIGN KEY (`TIENDA_id`) REFERENCES `tienda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'MTB CLOTHING',1),(3,'MUEBLERIA',3);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_impuestos`
--

DROP TABLE IF EXISTS `detalles_impuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_impuestos` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `IMPUESTOS_id` smallint unsigned NOT NULL,
  `ARTICULOS_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_DETALLES_IMPUESTOS_IMPUESTOS1_idx` (`IMPUESTOS_id`),
  KEY `fk_DETALLES_IMPUESTOS_ARTICULOS1_idx` (`ARTICULOS_id`),
  CONSTRAINT `fk_DETALLES_IMPUESTOS_ARTICULOS1` FOREIGN KEY (`ARTICULOS_id`) REFERENCES `articulos` (`id`),
  CONSTRAINT `fk_DETALLES_IMPUESTOS_IMPUESTOS1` FOREIGN KEY (`IMPUESTOS_id`) REFERENCES `impuestos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_impuestos`
--

LOCK TABLES `detalles_impuestos` WRITE;
/*!40000 ALTER TABLE `detalles_impuestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_impuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_promociones`
--

DROP TABLE IF EXISTS `detalles_promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_promociones` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `descuento` decimal(6,2) NOT NULL,
  `ARTICULOS_id` smallint unsigned NOT NULL,
  `PROMOCIONES_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_DETALLES_PROMOCIONES_ARTICULOS1_idx` (`ARTICULOS_id`),
  KEY `fk_DETALLES_PROMOCIONES_PROMOCIONES1_idx` (`PROMOCIONES_id`),
  CONSTRAINT `fk_DETALLES_PROMOCIONES_ARTICULOS1` FOREIGN KEY (`ARTICULOS_id`) REFERENCES `articulos` (`id`),
  CONSTRAINT `fk_DETALLES_PROMOCIONES_PROMOCIONES1` FOREIGN KEY (`PROMOCIONES_id`) REFERENCES `promociones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_promociones`
--

LOCK TABLES `detalles_promociones` WRITE;
/*!40000 ALTER TABLE `detalles_promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_tickets`
--

DROP TABLE IF EXISTS `detalles_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_tickets` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `cantidad` tinyint unsigned NOT NULL,
  `precio` decimal(7,2) unsigned NOT NULL DEFAULT '0.00',
  `importe_promociones` decimal(7,2) NOT NULL DEFAULT '0.00',
  `ARTICULOS_id` smallint unsigned NOT NULL,
  `TICKETS_id` smallint unsigned NOT NULL,
  `importe` decimal(8,2) GENERATED ALWAYS AS ((`cantidad` * `precio`)) STORED,
  `importe_impuestos` decimal(7,2) GENERATED ALWAYS AS ((`importe` - (`importe` / 1.16))) STORED,
  PRIMARY KEY (`id`),
  KEY `fk_DETALLES_TICKET_ARTICULOS1_idx` (`ARTICULOS_id`),
  KEY `fk_DETALLES_TICKET_TICKETS1_idx` (`TICKETS_id`),
  CONSTRAINT `fk_DETALLES_TICKET_ARTICULOS1` FOREIGN KEY (`ARTICULOS_id`) REFERENCES `articulos` (`id`),
  CONSTRAINT `fk_DETALLES_TICKET_TICKETS1` FOREIGN KEY (`TICKETS_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_tickets`
--

LOCK TABLES `detalles_tickets` WRITE;
/*!40000 ALTER TABLE `detalles_tickets` DISABLE KEYS */;
INSERT INTO `detalles_tickets` (`id`, `cantidad`, `precio`, `importe_promociones`, `ARTICULOS_id`, `TICKETS_id`) VALUES (101,1,780.00,0.00,4,80),(103,1,780.00,0.00,4,83),(106,1,780.00,0.00,4,85),(107,1,780.00,0.00,4,86),(110,1,780.00,0.00,4,89),(112,1,780.00,0.00,4,90),(116,1,780.00,0.00,4,91),(118,2,780.00,0.00,4,92),(119,1,780.00,0.00,4,93),(120,1,780.00,0.00,4,94),(121,1,780.00,0.00,4,95),(122,1,780.00,0.00,4,96),(123,1,780.00,0.00,4,97),(124,1,780.00,0.00,4,98),(125,2,780.00,0.00,4,99),(126,1,780.00,0.00,4,100),(127,2,780.00,0.00,4,101),(129,1,780.00,0.00,4,102),(130,2,780.00,0.00,4,102),(133,2,780.00,0.00,4,104),(134,6,780.00,0.00,4,105),(135,1,780.00,0.00,4,106),(136,1,780.00,0.00,4,107),(137,1,780.00,0.00,4,108),(138,1,780.00,0.00,4,109),(141,1,780.00,0.00,4,117),(153,1,780.00,0.00,4,130),(156,1,780.00,0.00,4,137),(158,2,780.00,0.00,4,139),(159,2,780.00,0.00,4,140),(160,1,780.00,0.00,4,141),(161,2,780.00,0.00,4,142),(162,2,780.00,0.00,4,143),(163,1,780.00,0.00,4,144),(164,2,780.00,0.00,4,145),(165,2,780.00,0.00,4,146),(166,2,780.00,0.00,4,147),(174,2,780.00,0.00,4,161),(176,1,780.00,0.00,4,165),(177,1,780.00,0.00,4,166),(178,2,780.00,0.00,4,167),(180,1,780.00,0.00,4,170),(206,1,780.00,0.00,16,194),(209,1,780.00,0.00,5,195),(210,2,780.00,0.00,4,195),(213,2,780.00,0.00,4,196),(214,2,1299.00,0.00,18,196),(221,2,780.00,0.00,4,204),(224,6,780.00,0.00,4,206),(225,6,780.00,0.00,4,206),(229,4,780.00,0.00,4,208),(239,5,780.00,0.00,4,211),(248,2,780.00,0.00,4,220),(250,2,780.00,0.00,4,222),(251,5,780.00,0.00,4,223),(266,1,780.00,0.00,4,238),(269,1,780.00,0.00,4,241),(275,1,780.00,0.00,4,247),(280,1,780.00,0.00,4,252),(281,1,780.00,0.00,4,253),(283,1,780.00,0.00,4,255),(292,1,780.00,0.00,4,264),(295,1,780.00,0.00,4,267),(297,1,780.00,0.00,4,269),(306,1,780.00,0.00,4,278),(307,1,780.00,0.00,4,279),(313,1,780.00,0.00,4,285),(315,1,780.00,0.00,4,287),(316,1,780.00,0.00,4,288),(317,1,780.00,0.00,4,289),(318,1,780.00,0.00,4,290),(319,1,780.00,0.00,5,291),(320,1,780.00,0.00,4,292),(323,1,780.00,0.00,4,295),(325,1,780.00,0.00,4,297),(326,1,780.00,0.00,4,298),(328,1,780.00,0.00,4,300),(330,1,780.00,0.00,4,302),(331,1,780.00,0.00,4,303),(334,1,780.00,0.00,4,306),(346,1,780.00,0.00,4,317),(347,1,780.00,0.00,4,318),(348,1,780.00,0.00,4,319),(349,1,780.00,0.00,4,320),(350,1,780.00,0.00,5,321),(351,1,780.00,0.00,5,322),(352,1,780.00,0.00,4,323),(354,1,780.00,0.00,4,325),(355,1,780.00,0.00,4,326),(356,2,780.00,0.00,4,327),(357,1,780.00,0.00,5,327),(368,1,780.00,0.00,16,341),(374,1,780.00,0.00,5,347),(375,2,780.00,0.00,21,352),(376,1,780.00,0.00,5,353),(377,1,780.00,0.00,21,354),(378,5,780.00,0.00,4,355),(379,2,780.00,0.00,16,356),(380,5,780.00,0.00,19,357),(381,5,780.00,0.00,16,358),(382,5,780.00,0.00,19,359),(383,5,1599.00,0.00,6,360),(384,5,780.00,0.00,20,361),(385,5,780.00,0.00,20,362),(387,1,780.00,0.00,19,364),(388,5,1299.00,0.00,18,365),(389,2,780.00,0.00,20,366),(390,2,1599.00,0.00,6,367),(391,2,780.00,0.00,4,369),(392,1,780.00,0.00,16,370),(393,4,780.00,0.00,19,371),(394,1,780.00,0.00,5,372),(395,1,780.00,0.00,5,373),(396,1,780.00,0.00,5,374),(397,2,1599.00,0.00,6,375),(398,1,780.00,0.00,21,376),(399,2,780.00,0.00,19,377),(401,2,780.00,0.00,4,382),(402,1,780.00,0.00,5,404),(403,1,780.00,0.00,4,405),(412,1,780.00,0.00,4,412),(413,1,780.00,0.00,4,413),(417,1,780.00,0.00,4,415),(418,1,780.00,0.00,4,416),(421,1,780.00,0.00,4,419),(422,1,780.00,0.00,4,420),(423,1,780.00,0.00,4,421),(424,1,780.00,0.00,4,422),(425,1,780.00,0.00,4,423),(426,1,780.00,0.00,4,424),(429,2,780.00,0.00,4,430),(430,1,780.00,0.00,4,431),(431,1,780.00,0.00,4,432);
/*!40000 ALTER TABLE `detalles_tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizarPrecio` BEFORE INSERT ON `detalles_tickets` FOR EACH ROW BEGIN
set NEW.precio= 
  (select precio from articulos where id=new.ARTICULOS_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_detalles_tickets` AFTER INSERT ON `detalles_tickets` FOR EACH ROW BEGIN -- ejecuciones del trigger inicio
declare actualExistencia int;
select existencias into actualExistencia from articulos where id=new.ARTICULOS_id;
UPDATE tickets SET tickets.total_pagar= (select sum(importe) from detalles_tickets where tickets_id=new.tickets_id) where id=new.TICKETS_id;
UPDATE tickets SET tickets.importe_promociones= (select sum(importe_promociones) from detalles_tickets where tickets_id=new.tickets_id) where id=new.TICKETS_id;
UPDATE tickets SET tickets.importe_impuestos= (select sum(importe_impuestos) from detalles_tickets where tickets_id=new.tickets_id) where id=new.TICKETS_id;
UPDATE tickets SET tickets.cantidad_total= (select sum(cantidad) from detalles_tickets where tickets_id=new.tickets_id) where id=new.TICKETS_id;
-- UPDATE articulos SET existencias=((select existencias from articulos where id=new.ARTICULOS_id)-new.cantidad) where id=new.ARTICULOS_id;
 UPDATE articulos SET existencias=(actualExistencia-new.cantidad) where id=new.ARTICULOS_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_delete_detalles_tickets` AFTER DELETE ON `detalles_tickets` FOR EACH ROW BEGIN -- ejecuciones del trigger inicio
declare actualExistencia int;
select existencias into actualExistencia from articulos where id=old.ARTICULOS_id;
UPDATE tickets SET tickets.total_pagar= (select sum(importe) from detalles_tickets where tickets_id=old.tickets_id) where id=old.TICKETS_id;
UPDATE tickets SET tickets.importe_promociones= (select sum(importe_promociones) from detalles_tickets where tickets_id=old.tickets_id) where id=old.TICKETS_id;
UPDATE tickets SET tickets.importe_impuestos= (select sum(importe_impuestos) from detalles_tickets where tickets_id=old.tickets_id) where id=old.TICKETS_id;
UPDATE tickets SET tickets.cantidad_total= (select sum(cantidad) from detalles_tickets where tickets_id=old.tickets_id) where id=old.TICKETS_id;
-- UPDATE articulos SET existencias=((select existencias from articulos where id=new.ARTICULOS_id)-new.cantidad) where id=new.ARTICULOS_id;
  UPDATE articulos SET existencias=(actualExistencia+old.cantidad) where id=old.ARTICULOS_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `devoluciones`
--

DROP TABLE IF EXISTS `devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devoluciones` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion_articulo` varchar(45) DEFAULT NULL,
  `codigo_barras` char(13) DEFAULT NULL,
  `importe` decimal(8,2) DEFAULT NULL,
  `nombre_cliente` varchar(30) DEFAULT NULL,
  `telefono_cliente` char(10) DEFAULT NULL,
  `TICKETS_id` smallint unsigned NOT NULL,
  `DETALLES_TICKETS_id` mediumint unsigned NOT NULL,
  `cantidad` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_DEVOLUCIONES_TICKETS1_idx` (`TICKETS_id`),
  CONSTRAINT `fk_DEVOLUCIONES_TICKETS1` FOREIGN KEY (`TICKETS_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoluciones`
--

LOCK TABLES `devoluciones` WRITE;
/*!40000 ALTER TABLE `devoluciones` DISABLE KEYS */;
INSERT INTO `devoluciones` VALUES (5,'2023-04-12 22:51:54','PANTALON DE ENDURO','0000000000001',1560.00,'Raul','4433953778',83,104,2),(7,'2023-04-12 22:55:45','PANTALON DE ENDURO','0000000000001',1560.00,'Raul','4433953778',83,104,2),(8,'2023-04-12 22:57:13','PANTALON DE ENDURO','0000000000001',1560.00,'Raul','4433953778',83,104,2),(9,'2023-04-12 22:58:16','PANTALON DE ENDURO','0000000000001',1560.00,'Raul','4433953778',83,104,2),(10,'2023-04-12 22:58:28','PANTALON DE ENDURO','0000000000001',780.00,'Raul','4433953778',83,103,1),(11,'2023-04-12 22:59:43','PANTALON DE ENDURO','0000000000001',1560.00,'Raul','4433953778',83,104,2),(12,'2023-04-12 23:02:03','PANTALON DE ENDURO','0000000000001',1560.00,'Raul','4433953778',83,104,2),(13,'2023-04-12 23:03:40','PANTALON DE ENDURO','0000000000001',780.00,'Raul','4433953778',101,128,1),(15,'2023-04-12 23:10:38','PANTALON DE ENDURO','0000000000001',1560.00,'Raul','4433953778',185,189,2),(17,'2023-04-13 11:00:00','PANTALON DE ENDURO','0000000000001',780.00,'Raul','4433953778',185,190,1),(18,'2023-04-13 11:01:59','PANTALON DE ENDURO','0000000000001',780.00,'Raul','4433953778',176,183,1),(19,'2023-04-13 12:33:45','PANTALON DE ENDURO','0000000000001',780.00,'RAUL','4433953778',172,182,1),(20,'2023-04-13 12:38:48','PANTALON DE ENDURO','0000000000001',780.00,'RAUL','4433953778',171,181,1),(21,'2023-04-13 12:43:12','PANTALON DE ENDURO','0000000000001',1560.00,'RAUL','4433953778',190,198,2),(22,'2023-04-13 12:44:35','PANTALON DE ENDURO','0000000000001',2340.00,'RAUL','4433953778',190,197,3),(23,'2023-04-13 12:46:04','PANTALON DE ENDURO','0000000000001',1560.00,'RAUL','4433953778',191,199,2),(24,'2023-04-13 12:46:30','PANTALON DE ENDURO','0000000000001',1560.00,'RAUL','4433953778',191,200,2),(25,'2023-04-13 12:46:38','PANTALON DE ENDURO','0000000000001',3120.00,'RAUL','4433953778',191,201,4),(26,'2023-04-13 14:42:48','PANTALON DE ENDURO','0000000000001',1560.00,'RAUL','4433953778',192,202,2),(27,'2023-04-13 17:56:13','PANTALON DE ENDURO','0000000000001',1560.00,'RAUL','4433953778',188,194,2),(28,'2023-04-13 20:00:40','PANTALON DE MOTO','0000000000010',4797.00,'Edwin','4436077498',194,208,3),(29,'2023-04-15 00:16:06','PANTALON DE ENDURO','0000000000001',3120.00,'RAUL','4433953778',311,341,4),(30,'2023-04-20 10:36:09','PANTALON DE ENDURO','0000000000001',780.00,'RAUL','4433953778',328,359,1);
/*!40000 ALTER TABLE `devoluciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizarDevoluciones` BEFORE INSERT ON `devoluciones` FOR EACH ROW BEGIN
declare idUser tinyint;
declare idArticulo smallint;
declare actualExistencia int;
select ARTICULOS_id into idArticulo from detalles_tickets where id=new.DETALLES_TICKETS_id;
select existencias into actualExistencia from articulos where id=idArticulo;
select  CLIENTES_id into idUser from tickets where id=new.TICKETS_id;

set NEW.nombre_cliente=(select nombre from clientes where id=idUser);
set NEW.telefono_cliente=(select telefono from clientes where id=idUser);
set new.descripcion_articulo=(select descripcion from articulos where id=idArticulo);
set new.codigo_barras=(select codigo_barras from articulos where id=idArticulo);
set new.cantidad=(select cantidad from detalles_tickets where id=new.DETALLES_TICKETS_id);
set new.importe=(select importe from detalles_tickets where id=new.DETALLES_TICKETS_id);
-- UPDATE articulos SET existencias=(actualExistencia+new.cantidad) where id=idArticulo;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_devoluciones` AFTER INSERT ON `devoluciones` FOR EACH ROW BEGIN -- ejecuciones del trigger inicio
declare var_total_pagar decimal(8,2);
INSERT INTO historial (fecha,hora,accion) 
					values (current_date(),current_time(),"Se realizo una devolucion"); 
DELETE FROM detalles_tickets where id=new.DETALLES_TICKETS_id;
select  total_pagar into var_total_pagar from tickets where id=new.TICKETS_id;
UPDATE pagos SET importe=var_total_pagar where TICKETS_id=new.TICKETS_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Table structure for table `formas_pago`
--

DROP TABLE IF EXISTS `formas_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formas_pago` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formas_pago`
--

LOCK TABLES `formas_pago` WRITE;
/*!40000 ALTER TABLE `formas_pago` DISABLE KEYS */;
INSERT INTO `formas_pago` VALUES (1,'ABONOS'),(2,'CONTADO'),(3,'TRANSFERENCIA BANCARIA');
/*!40000 ALTER TABLE `formas_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `accion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=997 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES (1,'2023-03-07','18:49:39','Se actualizo el inventario'),(2,'2023-03-07','18:49:50','Se realizo una compra'),(3,'2023-03-07','18:50:19','Se realizo una devolucion'),(6,'2023-03-07','18:54:40','Se actualizo el inventario'),(7,'2023-03-07','18:54:47','Se realizo una compra'),(8,'2023-03-07','18:54:52','Se actualizo el inventario'),(9,'2023-03-07','18:54:52','Se realizo una devolucion'),(14,'2023-03-16','11:45:48','Se actualizo el inventario'),(15,'2023-03-16','11:46:06','Se realizo una compra'),(16,'2023-04-05','12:39:15','Se agrego un nuevo cliente'),(23,'2023-04-05','17:44:08','Se actualizo el inventario'),(24,'2023-04-05','17:44:28','Se actualizo el inventario'),(25,'2023-04-05','17:45:10','Se actualizo el inventario'),(26,'2023-04-05','17:45:15','Se actualizo el inventario'),(27,'2023-04-05','17:49:43','Se actualizo el inventario'),(28,'2023-04-09','20:59:36','Se actualizo el inventario'),(29,'2023-04-09','21:01:12','Se actualizo el inventario'),(30,'2023-04-09','21:02:44','Se actualizo el inventario'),(31,'2023-04-09','21:04:32','Se actualizo el inventario'),(32,'2023-04-09','21:08:52','Se actualizo el inventario'),(33,'2023-04-09','21:09:02','Se actualizo el inventario'),(34,'2023-04-09','21:09:23','Se actualizo el inventario'),(35,'2023-04-09','21:11:31','Se actualizo el inventario'),(36,'2023-04-09','21:13:56','Se actualizo el inventario'),(37,'2023-04-09','21:14:26','Se actualizo el inventario'),(38,'2023-04-09','21:15:18','Se actualizo el inventario'),(39,'2023-04-09','21:15:45','Se actualizo el inventario'),(40,'2023-04-09','21:20:58','Se actualizo el inventario'),(41,'2023-04-09','21:21:35','Se actualizo el inventario'),(42,'2023-04-09','21:22:52','Se actualizo el inventario'),(43,'2023-04-09','21:23:02','Se actualizo el inventario'),(44,'2023-04-09','21:24:04','Se actualizo el inventario'),(45,'2023-04-09','21:24:34','Se actualizo el inventario'),(46,'2023-04-09','21:25:27','Se actualizo el inventario'),(47,'2023-04-09','21:25:50','Se actualizo el inventario'),(48,'2023-04-09','21:26:14','Se actualizo el inventario'),(49,'2023-04-09','21:26:40','Se actualizo el inventario'),(50,'2023-04-09','21:27:35','Se actualizo el inventario'),(51,'2023-04-09','21:29:04','Se actualizo el inventario'),(52,'2023-04-09','21:29:25','Se actualizo el inventario'),(53,'2023-04-09','21:30:03','Se actualizo el inventario'),(54,'2023-04-09','21:30:29','Se actualizo el inventario'),(55,'2023-04-09','21:31:03','Se actualizo el inventario'),(56,'2023-04-09','21:31:27','Se actualizo el inventario'),(57,'2023-04-09','21:43:07','Se actualizo el inventario'),(58,'2023-04-09','21:44:10','Se actualizo el inventario'),(59,'2023-04-09','21:45:15','Se actualizo el inventario'),(60,'2023-04-09','21:50:35','Se actualizo el inventario'),(61,'2023-04-09','22:38:20','Se actualizo el inventario'),(62,'2023-04-09','22:38:27','Se actualizo el inventario'),(63,'2023-04-09','22:38:56','Se actualizo el inventario'),(64,'2023-04-09','22:39:33','Se actualizo el inventario'),(65,'2023-04-09','22:40:52','Se actualizo el inventario'),(66,'2023-04-09','22:41:05','Se actualizo el inventario'),(67,'2023-04-09','23:06:09','Se actualizo el inventario'),(68,'2023-04-09','23:06:16','Se actualizo el inventario'),(69,'2023-04-09','23:08:57','Se actualizo el inventario'),(70,'2023-04-09','23:10:33','Se actualizo el inventario'),(71,'2023-04-09','23:11:23','Se actualizo el inventario'),(72,'2023-04-09','23:12:27','Se actualizo el inventario'),(73,'2023-04-09','23:12:50','Se actualizo el inventario'),(74,'2023-04-09','23:12:55','Se actualizo el inventario'),(75,'2023-04-09','23:12:59','Se actualizo el inventario'),(76,'2023-04-09','23:17:32','Se actualizo el inventario'),(77,'2023-04-09','23:17:37','Se actualizo el inventario'),(78,'2023-04-09','23:17:43','Se actualizo el inventario'),(79,'2023-04-09','23:27:37','Se actualizo el inventario'),(80,'2023-04-09','23:30:06','Se actualizo el inventario'),(81,'2023-04-09','23:30:36','Se actualizo el inventario'),(82,'2023-04-09','23:33:33','Se actualizo el inventario'),(83,'2023-04-09','23:34:19','Se actualizo el inventario'),(84,'2023-04-09','23:37:54','Se actualizo el inventario'),(85,'2023-04-09','23:38:07','Se actualizo el inventario'),(86,'2023-04-09','23:38:50','Se actualizo el inventario'),(87,'2023-04-09','23:41:17','Se actualizo el inventario'),(88,'2023-04-09','23:41:54','Se actualizo el inventario'),(89,'2023-04-09','23:42:04','Se actualizo el inventario'),(90,'2023-04-09','23:44:24','Se actualizo el inventario'),(91,'2023-04-09','23:44:43','Se actualizo el inventario'),(92,'2023-04-09','23:44:45','Se actualizo el inventario'),(93,'2023-04-09','23:44:46','Se actualizo el inventario'),(94,'2023-04-09','23:44:53','Se actualizo el inventario'),(95,'2023-04-10','11:17:01','Se actualizo el inventario'),(96,'2023-04-10','11:18:45','Se actualizo el inventario'),(97,'2023-04-10','11:18:53','Se actualizo el inventario'),(98,'2023-04-10','11:18:59','Se actualizo el inventario'),(99,'2023-04-10','11:21:12','Se actualizo el inventario'),(100,'2023-04-10','11:25:50','Se actualizo el inventario'),(101,'2023-04-10','11:26:13','Se actualizo el inventario'),(102,'2023-04-10','11:26:17','Se actualizo el inventario'),(103,'2023-04-10','11:29:33','Se actualizo el inventario'),(104,'2023-04-10','11:31:35','Se actualizo el inventario'),(105,'2023-04-10','11:31:41','Se actualizo el inventario'),(106,'2023-04-10','11:31:46','Se actualizo el inventario'),(107,'2023-04-10','11:36:13','Se actualizo el inventario'),(108,'2023-04-10','11:36:17','Se actualizo el inventario'),(109,'2023-04-10','11:37:48','Se actualizo el inventario'),(110,'2023-04-10','11:37:52','Se actualizo el inventario'),(111,'2023-04-10','11:38:02','Se actualizo el inventario'),(112,'2023-04-10','11:44:24','Se realizo una compra'),(113,'2023-04-10','11:52:03','Se actualizo el inventario'),(114,'2023-04-10','11:52:09','Se actualizo el inventario'),(115,'2023-04-10','11:52:18','Se realizo una compra'),(116,'2023-04-10','11:56:12','Se actualizo el inventario'),(117,'2023-04-10','11:56:12','Se actualizo el inventario'),(118,'2023-04-10','11:56:12','Se actualizo el inventario'),(119,'2023-04-10','11:56:12','Se actualizo el inventario'),(120,'2023-04-10','11:56:12','Se actualizo el inventario'),(121,'2023-04-10','11:56:12','Se actualizo el inventario'),(122,'2023-04-10','11:56:12','Se actualizo el inventario'),(123,'2023-04-10','11:56:12','Se actualizo el inventario'),(124,'2023-04-10','11:56:12','Se actualizo el inventario'),(125,'2023-04-10','11:56:12','Se actualizo el inventario'),(126,'2023-04-10','11:56:12','Se actualizo el inventario'),(127,'2023-04-10','11:56:12','Se actualizo el inventario'),(128,'2023-04-10','11:56:12','Se actualizo el inventario'),(129,'2023-04-10','11:56:12','Se actualizo el inventario'),(130,'2023-04-10','11:56:12','Se actualizo el inventario'),(131,'2023-04-10','11:56:12','Se actualizo el inventario'),(132,'2023-04-10','11:56:12','Se actualizo el inventario'),(133,'2023-04-10','11:56:12','Se actualizo el inventario'),(134,'2023-04-10','11:56:12','Se actualizo el inventario'),(135,'2023-04-10','11:56:12','Se actualizo el inventario'),(136,'2023-04-10','11:56:12','Se actualizo el inventario'),(137,'2023-04-10','11:56:12','Se actualizo el inventario'),(138,'2023-04-10','11:56:12','Se actualizo el inventario'),(139,'2023-04-10','11:56:12','Se actualizo el inventario'),(140,'2023-04-10','11:56:12','Se actualizo el inventario'),(141,'2023-04-10','11:56:12','Se actualizo el inventario'),(142,'2023-04-10','11:56:12','Se actualizo el inventario'),(143,'2023-04-10','11:56:12','Se actualizo el inventario'),(144,'2023-04-10','11:56:12','Se actualizo el inventario'),(145,'2023-04-10','11:56:12','Se actualizo el inventario'),(146,'2023-04-10','11:56:12','Se actualizo el inventario'),(147,'2023-04-10','11:56:12','Se actualizo el inventario'),(148,'2023-04-10','11:56:12','Se actualizo el inventario'),(149,'2023-04-10','11:56:12','Se actualizo el inventario'),(150,'2023-04-10','11:56:12','Se actualizo el inventario'),(151,'2023-04-10','11:56:12','Se actualizo el inventario'),(152,'2023-04-10','11:56:12','Se actualizo el inventario'),(153,'2023-04-10','11:56:12','Se actualizo el inventario'),(154,'2023-04-10','11:56:12','Se actualizo el inventario'),(155,'2023-04-10','11:56:12','Se actualizo el inventario'),(156,'2023-04-10','11:56:12','Se actualizo el inventario'),(157,'2023-04-10','11:56:12','Se actualizo el inventario'),(158,'2023-04-10','11:56:12','Se actualizo el inventario'),(159,'2023-04-10','11:56:12','Se actualizo el inventario'),(160,'2023-04-10','11:56:12','Se actualizo el inventario'),(161,'2023-04-10','11:56:12','Se actualizo el inventario'),(162,'2023-04-10','11:56:12','Se actualizo el inventario'),(163,'2023-04-10','11:56:12','Se actualizo el inventario'),(164,'2023-04-10','11:56:12','Se actualizo el inventario'),(165,'2023-04-10','11:56:12','Se actualizo el inventario'),(166,'2023-04-10','11:56:12','Se actualizo el inventario'),(167,'2023-04-10','11:56:12','Se actualizo el inventario'),(168,'2023-04-10','11:56:12','Se actualizo el inventario'),(169,'2023-04-10','11:56:12','Se actualizo el inventario'),(170,'2023-04-10','11:56:12','Se actualizo el inventario'),(171,'2023-04-10','11:56:12','Se actualizo el inventario'),(172,'2023-04-10','12:03:04','Se agrego un nuevo cliente'),(173,'2023-04-10','12:05:23','Se agrego un nuevo cliente'),(174,'2023-04-10','12:14:43','Se actualizo el inventario'),(175,'2023-04-10','12:14:50','Se actualizo el inventario'),(176,'2023-04-10','12:19:55','Se actualizo el inventario'),(177,'2023-04-10','12:20:06','Se realizo una compra'),(178,'2023-04-10','13:56:01','Se actualizo el inventario'),(179,'2023-04-10','13:56:07','Se actualizo el inventario'),(180,'2023-04-10','13:56:14','Se actualizo el inventario'),(181,'2023-04-10','13:57:03','Se actualizo el inventario'),(182,'2023-04-10','13:58:21','Se actualizo el inventario'),(183,'2023-04-10','13:58:44','Se actualizo el inventario'),(184,'2023-04-10','13:59:53','Se actualizo el inventario'),(185,'2023-04-10','14:05:45','Se actualizo el inventario'),(186,'2023-04-10','14:10:17','Se actualizo el inventario'),(187,'2023-04-10','14:10:23','Se actualizo el inventario'),(188,'2023-04-10','14:11:56','Se actualizo el inventario'),(189,'2023-04-10','14:11:57','Se actualizo el inventario'),(190,'2023-04-10','14:12:04','Se actualizo el inventario'),(191,'2023-04-10','14:12:35','Se actualizo el inventario'),(192,'2023-04-10','14:12:40','Se actualizo el inventario'),(193,'2023-04-10','14:12:49','Se actualizo el inventario'),(194,'2023-04-10','14:16:18','Se actualizo el inventario'),(195,'2023-04-10','14:16:24','Se actualizo el inventario'),(196,'2023-04-10','14:16:28','Se actualizo el inventario'),(197,'2023-04-10','14:16:39','Se actualizo el inventario'),(198,'2023-04-10','14:16:43','Se actualizo el inventario'),(199,'2023-04-10','14:16:47','Se actualizo el inventario'),(200,'2023-04-10','14:17:18','Se actualizo el inventario'),(201,'2023-04-10','14:18:25','Se actualizo el inventario'),(202,'2023-04-10','14:18:31','Se actualizo el inventario'),(203,'2023-04-10','14:18:41','Se actualizo el inventario'),(204,'2023-04-10','14:20:13','Se actualizo el inventario'),(205,'2023-04-10','14:21:50','Se actualizo el inventario'),(206,'2023-04-10','14:21:56','Se realizo una compra'),(207,'2023-04-10','14:27:41','Se actualizo el inventario'),(208,'2023-04-10','14:28:37','Se actualizo el inventario'),(209,'2023-04-10','14:28:45','Se realizo una compra'),(210,'2023-04-10','14:31:27','Se actualizo el inventario'),(211,'2023-04-10','14:31:32','Se realizo una compra'),(212,'2023-04-10','14:40:54','Se actualizo el inventario'),(213,'2023-04-10','14:40:58','Se realizo una compra'),(214,'2023-04-10','14:42:23','Se actualizo el inventario'),(215,'2023-04-10','14:42:27','Se realizo una compra'),(216,'2023-04-10','14:43:30','Se actualizo el inventario'),(217,'2023-04-10','14:43:35','Se realizo una compra'),(218,'2023-04-10','14:56:10','Se actualizo el inventario'),(219,'2023-04-10','14:56:17','Se actualizo el inventario'),(220,'2023-04-10','14:56:21','Se realizo una compra'),(221,'2023-04-10','14:58:48','Se actualizo el inventario'),(222,'2023-04-10','14:58:53','Se actualizo el inventario'),(223,'2023-04-10','14:58:56','Se realizo una compra'),(224,'2023-04-10','15:01:54','Se actualizo el inventario'),(225,'2023-04-10','15:02:00','Se actualizo el inventario'),(226,'2023-04-10','15:02:05','Se realizo una compra'),(227,'2023-04-10','15:22:59','Se actualizo el inventario'),(228,'2023-04-10','15:23:02','Se realizo una compra'),(229,'2023-04-10','15:26:35','Se actualizo el inventario'),(230,'2023-04-10','15:26:39','Se realizo una compra'),(231,'2023-04-10','15:28:14','Se actualizo el inventario'),(232,'2023-04-10','15:28:18','Se realizo una compra'),(233,'2023-04-10','15:31:25','Se actualizo el inventario'),(234,'2023-04-10','15:31:29','Se realizo una compra'),(235,'2023-04-10','15:32:10','Se actualizo el inventario'),(236,'2023-04-10','15:32:14','Se realizo una compra'),(237,'2023-04-10','16:22:51','Se actualizo el inventario'),(238,'2023-04-10','16:23:21','Se realizo una compra'),(239,'2023-04-10','17:19:00','Se actualizo el inventario'),(240,'2023-04-10','17:19:00','Se actualizo el inventario'),(241,'2023-04-10','17:24:26','Se actualizo el inventario'),(242,'2023-04-10','17:24:34','Se actualizo el inventario'),(243,'2023-04-10','17:24:50','Se actualizo el inventario'),(244,'2023-04-10','17:24:50','Se actualizo el inventario'),(245,'2023-04-10','17:37:00','Se actualizo el inventario'),(246,'2023-04-10','17:39:02','Se actualizo el inventario'),(247,'2023-04-10','17:39:24','Se actualizo el inventario'),(248,'2023-04-10','17:42:16','Se actualizo el inventario'),(249,'2023-04-10','17:42:20','Se actualizo el inventario'),(250,'2023-04-10','17:42:37','Se actualizo el inventario'),(251,'2023-04-10','17:42:44','Se realizo una compra'),(252,'2023-04-10','17:45:09','Se actualizo el inventario'),(253,'2023-04-10','17:47:45','Se actualizo el inventario'),(254,'2023-04-10','17:47:53','Se actualizo el inventario'),(255,'2023-04-10','17:48:01','Se actualizo el inventario'),(256,'2023-04-10','17:48:07','Se actualizo el inventario'),(257,'2023-04-10','17:48:16','Se actualizo el inventario'),(258,'2023-04-10','17:48:20','Se realizo una compra'),(259,'2023-04-10','17:48:23','Se actualizo el inventario'),(260,'2023-04-10','17:55:10','Se actualizo el inventario'),(261,'2023-04-10','17:55:29','Se actualizo el inventario'),(262,'2023-04-10','17:55:37','Se actualizo el inventario'),(263,'2023-04-10','17:55:47','Se actualizo el inventario'),(264,'2023-04-10','17:55:57','Se actualizo el inventario'),(265,'2023-04-10','17:56:06','Se actualizo el inventario'),(266,'2023-04-10','17:57:26','Se realizo una compra'),(267,'2023-04-10','17:59:32','Se actualizo el inventario'),(268,'2023-04-10','17:59:32','Se actualizo el inventario'),(269,'2023-04-10','18:00:19','Se actualizo el inventario'),(270,'2023-04-10','18:02:15','Se actualizo el inventario'),(271,'2023-04-10','18:02:21','Se realizo una compra'),(272,'2023-04-10','18:02:41','Se actualizo el inventario'),(273,'2023-04-10','18:39:21','Se actualizo el inventario'),(274,'2023-04-10','18:39:25','Se realizo una compra'),(275,'2023-04-10','18:40:06','Se actualizo el inventario'),(276,'2023-04-10','18:40:14','Se actualizo el inventario'),(277,'2023-04-10','18:40:17','Se realizo una compra'),(278,'2023-04-10','18:41:03','Se actualizo el inventario'),(279,'2023-04-10','18:41:06','Se realizo una compra'),(280,'2023-04-10','18:41:14','Se actualizo el inventario'),(281,'2023-04-10','18:41:41','Se actualizo el inventario'),(282,'2023-04-10','18:41:44','Se realizo una compra'),(283,'2023-04-10','18:42:48','Se actualizo el inventario'),(284,'2023-04-10','18:42:51','Se realizo una compra'),(285,'2023-04-10','18:44:44','Se actualizo el inventario'),(286,'2023-04-10','18:44:47','Se realizo una compra'),(287,'2023-04-10','18:47:42','Se actualizo el inventario'),(288,'2023-04-10','18:47:45','Se realizo una compra'),(289,'2023-04-10','18:49:05','Se actualizo el inventario'),(290,'2023-04-10','18:49:08','Se realizo una compra'),(291,'2023-04-10','18:50:05','Se actualizo el inventario'),(292,'2023-04-10','18:50:08','Se realizo una compra'),(293,'2023-04-10','18:53:59','Se actualizo el inventario'),(294,'2023-04-10','18:54:02','Se realizo una compra'),(295,'2023-04-10','18:54:49','Se actualizo el inventario'),(296,'2023-04-10','18:54:52','Se realizo una compra'),(297,'2023-04-10','18:55:54','Se actualizo el inventario'),(298,'2023-04-10','18:55:57','Se realizo una compra'),(299,'2023-04-10','18:56:49','Se actualizo el inventario'),(300,'2023-04-10','18:56:52','Se realizo una compra'),(301,'2023-04-10','18:57:11','Se actualizo el inventario'),(302,'2023-04-10','18:58:00','Se actualizo el inventario'),(303,'2023-04-10','18:58:03','Se realizo una compra'),(304,'2023-04-10','18:58:43','Se actualizo el inventario'),(305,'2023-04-10','18:58:52','Se actualizo el inventario'),(306,'2023-04-10','18:58:56','Se realizo una compra'),(307,'2023-04-10','18:59:17','Se actualizo el inventario'),(308,'2023-04-10','19:01:09','Se actualizo el inventario'),(309,'2023-04-10','19:01:12','Se realizo una compra'),(310,'2023-04-10','19:01:14','Se actualizo el inventario'),(311,'2023-04-10','19:05:39','Se actualizo el inventario'),(312,'2023-04-10','19:05:56','Se actualizo el inventario'),(313,'2023-04-10','19:23:42','Se actualizo el inventario'),(314,'2023-04-10','19:23:56','Se actualizo el inventario'),(315,'2023-04-10','19:28:11','Se actualizo el inventario'),(316,'2023-04-10','19:28:19','Se actualizo el inventario'),(317,'2023-04-10','19:28:58','Se actualizo el inventario'),(318,'2023-04-10','19:34:58','Se actualizo el inventario'),(319,'2023-04-10','19:35:29','Se actualizo el inventario'),(320,'2023-04-10','19:35:52','Se actualizo el inventario'),(321,'2023-04-10','19:37:18','Se actualizo el inventario'),(322,'2023-04-10','19:46:18','Se actualizo el inventario'),(323,'2023-04-10','19:47:57','Se actualizo el inventario'),(324,'2023-04-10','19:48:05','Se actualizo el inventario'),(325,'2023-04-10','19:51:52','Se actualizo el inventario'),(326,'2023-04-10','19:55:23','Se actualizo el inventario'),(327,'2023-04-10','19:55:42','Se actualizo el inventario'),(328,'2023-04-10','20:08:15','Se actualizo el inventario'),(329,'2023-04-10','20:10:08','Se actualizo el inventario'),(330,'2023-04-10','20:10:30','Se actualizo el inventario'),(331,'2023-04-10','20:14:40','Se actualizo el inventario'),(332,'2023-04-10','20:14:46','Se actualizo el inventario'),(333,'2023-04-10','20:14:50','Se actualizo el inventario'),(334,'2023-04-10','20:14:54','Se realizo una compra'),(335,'2023-04-10','20:15:14','Se actualizo el inventario'),(336,'2023-04-10','23:39:04','Se actualizo el inventario'),(337,'2023-04-10','23:39:12','Se realizo una compra'),(338,'2023-04-10','23:39:14','Se actualizo el inventario'),(339,'2023-04-11','13:15:51','Se agrego un nuevo cliente'),(340,'2023-04-11','16:51:40','Se agrego un nuevo cliente'),(341,'2023-04-11','16:54:37','Se agrego un nuevo cliente'),(342,'2023-04-11','16:56:39','Se agrego un nuevo cliente'),(343,'2023-04-12','22:16:43','Se actualizo el inventario'),(344,'2023-04-12','22:16:52','Se actualizo el inventario'),(345,'2023-04-12','22:51:54','Se actualizo el inventario'),(346,'2023-04-12','22:51:54','Se realizo una devolucion'),(347,'2023-04-12','22:55:45','Se actualizo el inventario'),(348,'2023-04-12','22:55:45','Se realizo una devolucion'),(349,'2023-04-12','22:57:13','Se actualizo el inventario'),(350,'2023-04-12','22:57:13','Se realizo una devolucion'),(351,'2023-04-12','22:58:16','Se actualizo el inventario'),(352,'2023-04-12','22:58:16','Se realizo una devolucion'),(353,'2023-04-12','22:58:28','Se actualizo el inventario'),(354,'2023-04-12','22:58:28','Se realizo una devolucion'),(355,'2023-04-12','22:59:43','Se actualizo el inventario'),(356,'2023-04-12','22:59:43','Se realizo una devolucion'),(357,'2023-04-12','23:02:03','Se actualizo el inventario'),(358,'2023-04-12','23:02:03','Se realizo una devolucion'),(359,'2023-04-12','23:02:03','Se actualizo el inventario'),(360,'2023-04-12','23:03:40','Se actualizo el inventario'),(361,'2023-04-12','23:03:40','Se realizo una devolucion'),(362,'2023-04-12','23:03:40','Se actualizo el inventario'),(363,'2023-04-12','23:08:55','Se actualizo el inventario'),(364,'2023-04-12','23:09:03','Se actualizo el inventario'),(365,'2023-04-12','23:09:09','Se realizo una compra'),(369,'2023-04-12','23:10:38','Se actualizo el inventario'),(370,'2023-04-12','23:10:38','Se realizo una devolucion'),(371,'2023-04-12','23:10:38','Se actualizo el inventario'),(372,'2023-04-13','00:16:46','Se actualizo el inventario'),(373,'2023-04-13','00:19:28','Se actualizo el inventario'),(374,'2023-04-13','00:26:01','Se actualizo el inventario'),(375,'2023-04-13','00:26:54','Se actualizo el inventario'),(376,'2023-04-13','00:27:08','Se actualizo el inventario'),(377,'2023-04-13','00:27:47','Se actualizo el inventario'),(378,'2023-04-13','00:27:54','Se actualizo el inventario'),(379,'2023-04-13','00:28:46','Se actualizo el inventario'),(380,'2023-04-13','00:29:18','Se actualizo el inventario'),(381,'2023-04-13','00:29:32','Se actualizo el inventario'),(382,'2023-04-13','00:29:38','Se actualizo el inventario'),(383,'2023-04-13','00:29:43','Se actualizo el inventario'),(384,'2023-04-13','00:31:07','Se actualizo el inventario'),(385,'2023-04-13','00:31:36','Se actualizo el inventario'),(386,'2023-04-13','00:35:11','Se actualizo el inventario'),(387,'2023-04-13','00:36:36','Se actualizo el inventario'),(388,'2023-04-13','10:55:23','Se actualizo el inventario'),(389,'2023-04-13','10:55:27','Se actualizo el inventario'),(390,'2023-04-13','10:55:35','Se actualizo el inventario'),(391,'2023-04-13','10:56:08','Se realizo una compra'),(392,'2023-04-13','10:56:52','Se actualizo el inventario'),(393,'2023-04-13','10:57:22','Se actualizo el inventario'),(397,'2023-04-13','11:00:00','Se actualizo el inventario'),(398,'2023-04-13','11:00:00','Se realizo una devolucion'),(399,'2023-04-13','11:00:00','Se actualizo el inventario'),(400,'2023-04-13','11:01:59','Se actualizo el inventario'),(401,'2023-04-13','11:01:59','Se realizo una devolucion'),(402,'2023-04-13','11:01:59','Se actualizo el inventario'),(403,'2023-04-13','12:26:46','Se agrego un nuevo cliente'),(404,'2023-04-13','12:29:19','Se actualizo el inventario'),(405,'2023-04-13','12:29:22','Se actualizo el inventario'),(406,'2023-04-13','12:33:45','Se actualizo el inventario'),(407,'2023-04-13','12:33:45','Se realizo una devolucion'),(408,'2023-04-13','12:33:45','Se actualizo el inventario'),(409,'2023-04-13','12:38:48','Se actualizo el inventario'),(410,'2023-04-13','12:38:48','Se realizo una devolucion'),(411,'2023-04-13','12:38:48','Se actualizo el inventario'),(412,'2023-04-13','12:40:37','Se actualizo el inventario'),(413,'2023-04-13','12:41:20','Se actualizo el inventario'),(414,'2023-04-13','12:41:35','Se actualizo el inventario'),(415,'2023-04-13','12:41:47','Se actualizo el inventario'),(416,'2023-04-13','12:41:47','Se actualizo el inventario'),(417,'2023-04-13','12:42:19','Se actualizo el inventario'),(418,'2023-04-13','12:42:26','Se actualizo el inventario'),(419,'2023-04-13','12:42:37','Se realizo una compra'),(420,'2023-04-13','12:43:12','Se actualizo el inventario'),(421,'2023-04-13','12:43:12','Se realizo una devolucion'),(422,'2023-04-13','12:43:12','Se actualizo el inventario'),(423,'2023-04-13','12:44:35','Se actualizo el inventario'),(424,'2023-04-13','12:44:35','Se realizo una devolucion'),(425,'2023-04-13','12:44:35','Se actualizo el inventario'),(426,'2023-04-13','12:45:17','Se actualizo el inventario'),(427,'2023-04-13','12:45:26','Se actualizo el inventario'),(428,'2023-04-13','12:45:34','Se actualizo el inventario'),(429,'2023-04-13','12:45:37','Se realizo una compra'),(430,'2023-04-13','12:46:04','Se realizo una devolucion'),(431,'2023-04-13','12:46:04','Se actualizo el inventario'),(432,'2023-04-13','12:46:30','Se realizo una devolucion'),(433,'2023-04-13','12:46:30','Se actualizo el inventario'),(434,'2023-04-13','12:46:38','Se realizo una devolucion'),(435,'2023-04-13','12:46:38','Se actualizo el inventario'),(436,'2023-04-13','14:41:32','Se actualizo el inventario'),(437,'2023-04-13','14:41:38','Se realizo una compra'),(438,'2023-04-13','14:42:48','Se realizo una devolucion'),(439,'2023-04-13','14:42:48','Se actualizo el inventario'),(440,'2023-04-13','17:26:00','Se actualizo el inventario'),(441,'2023-04-13','17:26:10','Se actualizo el inventario'),(442,'2023-04-13','17:33:56','Se actualizo el inventario'),(443,'2023-04-13','17:34:49','Se actualizo el inventario'),(444,'2023-04-13','17:34:59','Se actualizo el inventario'),(445,'2023-04-13','17:36:35','Se actualizo el inventario'),(446,'2023-04-13','17:36:51','Se actualizo el inventario'),(447,'2023-04-13','17:38:22','Se realizo una compra'),(448,'2023-04-13','17:43:07','Se actualizo el inventario'),(449,'2023-04-13','17:56:13','Se realizo una devolucion'),(450,'2023-04-13','17:56:13','Se actualizo el inventario'),(451,'2023-04-13','19:50:57','Se agrego un nuevo cliente'),(452,'2023-04-13','19:55:45','Se actualizo el inventario'),(453,'2023-04-13','19:55:59','Se actualizo el inventario'),(454,'2023-04-13','19:56:08','Se actualizo el inventario'),(455,'2023-04-13','19:56:31','Se actualizo el inventario'),(456,'2023-04-13','19:56:57','Se realizo una compra'),(457,'2023-04-13','19:59:51','Se actualizo el inventario'),(458,'2023-04-13','20:00:40','Se realizo una devolucion'),(459,'2023-04-13','20:00:40','Se actualizo el inventario'),(460,'2023-04-13','20:03:47','Se actualizo el inventario'),(461,'2023-04-13','20:03:53','Se actualizo el inventario'),(462,'2023-04-13','20:04:03','Se actualizo el inventario'),(463,'2023-04-13','20:04:19','Se actualizo el inventario'),(464,'2023-04-13','20:04:25','Se realizo una compra'),(465,'2023-04-13','20:10:16','Se actualizo el inventario'),(466,'2023-04-13','20:10:21','Se actualizo el inventario'),(467,'2023-04-13','20:10:26','Se actualizo el inventario'),(468,'2023-04-13','20:10:32','Se actualizo el inventario'),(469,'2023-04-13','20:10:35','Se realizo una compra'),(470,'2023-04-14','11:58:14','Se actualizo el inventario'),(471,'2023-04-14','11:58:22','Se actualizo el inventario'),(472,'2023-04-14','11:58:27','Se actualizo el inventario'),(473,'2023-04-14','11:58:32','Se realizo una compra'),(474,'2023-04-14','11:58:48','Se actualizo el inventario'),(475,'2023-04-14','12:02:39','Se actualizo el inventario'),(476,'2023-04-14','12:02:47','Se actualizo el inventario'),(477,'2023-04-14','12:02:56','Se actualizo el inventario'),(478,'2023-04-14','12:03:00','Se actualizo el inventario'),(479,'2023-04-14','12:03:08','Se realizo una compra'),(480,'2023-04-14','12:04:00','Se actualizo el inventario'),(481,'2023-04-14','12:04:00','Se actualizo el inventario'),(482,'2023-04-14','12:08:06','Se actualizo el inventario'),(483,'2023-04-14','12:08:15','Se actualizo el inventario'),(484,'2023-04-14','12:09:43','Se actualizo el inventario'),(485,'2023-04-14','12:11:14','Se actualizo el inventario'),(486,'2023-04-14','12:11:27','Se actualizo el inventario'),(487,'2023-04-14','12:11:56','Se realizo una compra'),(488,'2023-04-14','12:12:00','Se actualizo el inventario'),(489,'2023-04-14','12:12:00','Se actualizo el inventario'),(490,'2023-04-14','12:18:54','Se actualizo el inventario'),(491,'2023-04-14','12:19:11','Se actualizo el inventario'),(492,'2023-04-14','12:27:35','Se actualizo el inventario'),(493,'2023-04-14','12:27:46','Se actualizo el inventario'),(494,'2023-04-14','12:28:15','Se actualizo el inventario'),(495,'2023-04-14','12:28:19','Se actualizo el inventario'),(496,'2023-04-14','12:28:33','Se actualizo el inventario'),(497,'2023-04-14','12:28:51','Se actualizo el inventario'),(498,'2023-04-14','12:31:52','Se actualizo el inventario'),(499,'2023-04-14','12:32:04','Se actualizo el inventario'),(500,'2023-04-14','12:32:13','Se actualizo el inventario'),(501,'2023-04-14','12:32:35','Se actualizo el inventario'),(502,'2023-04-14','12:32:46','Se actualizo el inventario'),(503,'2023-04-14','12:33:39','Se actualizo el inventario'),(504,'2023-04-14','12:33:45','Se actualizo el inventario'),(505,'2023-04-14','12:33:56','Se actualizo el inventario'),(506,'2023-04-14','12:34:05','Se actualizo el inventario'),(507,'2023-04-14','12:34:20','Se realizo una compra'),(508,'2023-04-14','12:34:26','Se actualizo el inventario'),(509,'2023-04-14','12:34:26','Se actualizo el inventario'),(510,'2023-04-14','12:35:21','Se actualizo el inventario'),(511,'2023-04-14','12:35:31','Se actualizo el inventario'),(512,'2023-04-14','12:35:39','Se actualizo el inventario'),(513,'2023-04-14','12:35:46','Se actualizo el inventario'),(514,'2023-04-14','12:35:52','Se actualizo el inventario'),(515,'2023-04-14','12:35:57','Se actualizo el inventario'),(516,'2023-04-14','12:36:06','Se actualizo el inventario'),(517,'2023-04-14','12:36:14','Se realizo una compra'),(518,'2023-04-14','12:36:40','Se actualizo el inventario'),(519,'2023-04-14','12:46:07','Se actualizo el inventario'),(520,'2023-04-14','12:49:31','Se actualizo el inventario'),(521,'2023-04-14','12:51:13','Se actualizo el inventario'),(522,'2023-04-14','12:56:37','Se actualizo el inventario'),(523,'2023-04-14','12:56:54','Se actualizo el inventario'),(524,'2023-04-14','12:57:09','Se actualizo el inventario'),(525,'2023-04-14','12:57:09','Se actualizo el inventario'),(526,'2023-04-14','12:59:25','Se actualizo el inventario'),(527,'2023-04-14','12:59:39','Se actualizo el inventario'),(528,'2023-04-14','12:59:45','Se actualizo el inventario'),(529,'2023-04-14','12:59:50','Se actualizo el inventario'),(530,'2023-04-14','13:00:05','Se actualizo el inventario'),(531,'2023-04-14','13:00:11','Se actualizo el inventario'),(532,'2023-04-14','13:00:21','Se realizo una compra'),(533,'2023-04-14','13:01:34','Se actualizo el inventario'),(534,'2023-04-14','13:01:34','Se actualizo el inventario'),(535,'2023-04-14','13:06:09','Se actualizo el inventario'),(536,'2023-04-14','13:06:24','Se actualizo el inventario'),(537,'2023-04-14','13:06:46','Se actualizo el inventario'),(538,'2023-04-14','13:07:24','Se actualizo el inventario'),(539,'2023-04-14','13:07:33','Se actualizo el inventario'),(540,'2023-04-14','13:10:08','Se actualizo el inventario'),(541,'2023-04-14','13:11:53','Se actualizo el inventario'),(542,'2023-04-14','13:12:45','Se actualizo el inventario'),(543,'2023-04-14','13:12:58','Se actualizo el inventario'),(544,'2023-04-14','13:13:20','Se actualizo el inventario'),(545,'2023-04-14','13:15:15','Se actualizo el inventario'),(546,'2023-04-14','13:15:30','Se actualizo el inventario'),(547,'2023-04-14','13:16:11','Se actualizo el inventario'),(548,'2023-04-14','13:18:59','Se actualizo el inventario'),(549,'2023-04-14','13:19:07','Se realizo una compra'),(550,'2023-04-14','13:19:24','Se actualizo el inventario'),(551,'2023-04-14','13:20:01','Se actualizo el inventario'),(552,'2023-04-14','13:20:06','Se realizo una compra'),(553,'2023-04-14','13:20:26','Se actualizo el inventario'),(554,'2023-04-14','13:20:39','Se actualizo el inventario'),(555,'2023-04-14','13:20:47','Se realizo una compra'),(556,'2023-04-14','13:20:52','Se actualizo el inventario'),(557,'2023-04-14','13:22:55','Se actualizo el inventario'),(558,'2023-04-14','13:23:05','Se actualizo el inventario'),(559,'2023-04-14','13:23:25','Se actualizo el inventario'),(560,'2023-04-14','13:23:57','Se actualizo el inventario'),(561,'2023-04-14','13:24:15','Se actualizo el inventario'),(562,'2023-04-14','13:24:53','Se actualizo el inventario'),(563,'2023-04-14','13:28:38','Se actualizo el inventario'),(564,'2023-04-14','13:28:54','Se actualizo el inventario'),(565,'2023-04-14','13:30:09','Se actualizo el inventario'),(566,'2023-04-14','13:30:38','Se actualizo el inventario'),(567,'2023-04-14','13:31:15','Se actualizo el inventario'),(568,'2023-04-14','13:31:36','Se actualizo el inventario'),(569,'2023-04-14','13:38:51','Se actualizo el inventario'),(570,'2023-04-14','13:38:56','Se actualizo el inventario'),(571,'2023-04-14','13:39:05','Se actualizo el inventario'),(572,'2023-04-14','13:39:16','Se realizo una compra'),(573,'2023-04-14','13:41:30','Se actualizo el inventario'),(574,'2023-04-14','13:41:57','Se actualizo el inventario'),(575,'2023-04-14','13:42:06','Se realizo una compra'),(576,'2023-04-14','13:47:01','Se actualizo el inventario'),(577,'2023-04-14','13:47:11','Se realizo una compra'),(578,'2023-04-14','13:47:46','Se actualizo el inventario'),(579,'2023-04-14','13:48:07','Se actualizo el inventario'),(580,'2023-04-14','13:48:16','Se realizo una compra'),(581,'2023-04-14','13:48:21','Se actualizo el inventario'),(582,'2023-04-14','13:48:50','Se actualizo el inventario'),(583,'2023-04-14','13:48:58','Se realizo una compra'),(584,'2023-04-14','13:56:50','Se actualizo el inventario'),(585,'2023-04-14','13:57:00','Se realizo una compra'),(586,'2023-04-14','14:00:00','Se actualizo el inventario'),(587,'2023-04-14','14:00:29','Se actualizo el inventario'),(588,'2023-04-14','14:00:50','Se realizo una compra'),(589,'2023-04-14','14:01:07','Se actualizo el inventario'),(590,'2023-04-14','14:01:47','Se actualizo el inventario'),(591,'2023-04-14','14:02:05','Se realizo una compra'),(592,'2023-04-14','14:02:23','Se actualizo el inventario'),(593,'2023-04-14','14:03:14','Se actualizo el inventario'),(594,'2023-04-14','14:03:34','Se realizo una compra'),(595,'2023-04-14','14:05:26','Se actualizo el inventario'),(596,'2023-04-14','14:05:42','Se actualizo el inventario'),(597,'2023-04-14','14:05:48','Se realizo una compra'),(598,'2023-04-14','14:08:02','Se actualizo el inventario'),(599,'2023-04-14','14:08:14','Se actualizo el inventario'),(600,'2023-04-14','14:08:18','Se realizo una compra'),(601,'2023-04-14','14:14:12','Se actualizo el inventario'),(602,'2023-04-14','14:14:15','Se realizo una compra'),(603,'2023-04-14','14:14:40','Se actualizo el inventario'),(604,'2023-04-14','14:14:53','Se actualizo el inventario'),(605,'2023-04-14','14:14:57','Se realizo una compra'),(606,'2023-04-14','14:15:19','Se actualizo el inventario'),(607,'2023-04-14','14:15:31','Se actualizo el inventario'),(608,'2023-04-14','14:15:38','Se realizo una compra'),(609,'2023-04-14','14:15:47','Se actualizo el inventario'),(610,'2023-04-14','14:16:55','Se actualizo el inventario'),(611,'2023-04-14','14:16:59','Se realizo una compra'),(612,'2023-04-14','14:18:06','Se actualizo el inventario'),(613,'2023-04-14','14:18:13','Se actualizo el inventario'),(614,'2023-04-14','14:18:17','Se realizo una compra'),(615,'2023-04-14','14:20:25','Se actualizo el inventario'),(616,'2023-04-14','14:20:29','Se realizo una compra'),(617,'2023-04-14','14:21:05','Se actualizo el inventario'),(618,'2023-04-14','14:21:09','Se realizo una compra'),(619,'2023-04-14','14:21:22','Se actualizo el inventario'),(620,'2023-04-14','14:21:29','Se actualizo el inventario'),(621,'2023-04-14','14:21:39','Se realizo una compra'),(622,'2023-04-14','14:24:51','Se actualizo el inventario'),(623,'2023-04-14','14:24:59','Se realizo una compra'),(624,'2023-04-14','14:25:20','Se actualizo el inventario'),(625,'2023-04-14','14:27:56','Se actualizo el inventario'),(626,'2023-04-14','14:28:04','Se realizo una compra'),(627,'2023-04-14','14:28:10','Se actualizo el inventario'),(628,'2023-04-14','14:28:25','Se actualizo el inventario'),(629,'2023-04-14','14:28:28','Se realizo una compra'),(630,'2023-04-14','14:30:08','Se actualizo el inventario'),(631,'2023-04-14','14:30:32','Se actualizo el inventario'),(632,'2023-04-14','14:30:38','Se realizo una compra'),(633,'2023-04-14','14:30:54','Se actualizo el inventario'),(634,'2023-04-14','14:31:03','Se actualizo el inventario'),(635,'2023-04-14','14:31:09','Se realizo una compra'),(636,'2023-04-14','14:31:49','Se actualizo el inventario'),(637,'2023-04-14','14:32:14','Se actualizo el inventario'),(638,'2023-04-14','14:32:16','Se realizo una compra'),(639,'2023-04-14','14:32:23','Se actualizo el inventario'),(640,'2023-04-14','14:32:30','Se actualizo el inventario'),(641,'2023-04-14','14:32:36','Se realizo una compra'),(642,'2023-04-14','14:32:57','Se actualizo el inventario'),(643,'2023-04-14','14:33:05','Se actualizo el inventario'),(644,'2023-04-14','14:33:12','Se realizo una compra'),(645,'2023-04-14','14:33:18','Se actualizo el inventario'),(646,'2023-04-14','14:33:27','Se actualizo el inventario'),(647,'2023-04-14','14:33:31','Se realizo una compra'),(648,'2023-04-14','14:35:21','Se actualizo el inventario'),(649,'2023-04-14','14:35:26','Se realizo una compra'),(650,'2023-04-14','14:35:32','Se actualizo el inventario'),(651,'2023-04-14','14:35:40','Se actualizo el inventario'),(652,'2023-04-14','14:35:45','Se realizo una compra'),(653,'2023-04-14','14:35:57','Se actualizo el inventario'),(654,'2023-04-14','14:36:05','Se actualizo el inventario'),(655,'2023-04-14','14:36:09','Se realizo una compra'),(656,'2023-04-14','14:37:02','Se actualizo el inventario'),(657,'2023-04-14','14:37:05','Se realizo una compra'),(658,'2023-04-14','14:37:19','Se actualizo el inventario'),(659,'2023-04-14','14:57:02','Se actualizo el inventario'),(660,'2023-04-14','14:57:08','Se realizo una compra'),(661,'2023-04-14','14:58:29','Se actualizo el inventario'),(662,'2023-04-14','14:58:35','Se realizo una compra'),(663,'2023-04-14','14:59:05','Se actualizo el inventario'),(664,'2023-04-14','14:59:29','Se actualizo el inventario'),(665,'2023-04-14','14:59:32','Se realizo una compra'),(666,'2023-04-14','14:59:43','Se actualizo el inventario'),(667,'2023-04-14','15:21:44','Se actualizo el inventario'),(668,'2023-04-14','15:21:51','Se realizo una compra'),(669,'2023-04-14','15:21:55','Se actualizo el inventario'),(670,'2023-04-14','15:22:16','Se actualizo el inventario'),(671,'2023-04-14','15:22:20','Se realizo una compra'),(672,'2023-04-14','15:22:33','Se actualizo el inventario'),(673,'2023-04-14','15:22:42','Se actualizo el inventario'),(674,'2023-04-14','15:22:51','Se realizo una compra'),(675,'2023-04-14','15:22:56','Se actualizo el inventario'),(676,'2023-04-14','15:34:12','Se actualizo el inventario'),(677,'2023-04-14','15:34:18','Se realizo una compra'),(678,'2023-04-14','15:36:00','Se actualizo el inventario'),(679,'2023-04-14','15:36:11','Se actualizo el inventario'),(680,'2023-04-14','15:36:17','Se realizo una compra'),(681,'2023-04-14','15:36:29','Se actualizo el inventario'),(682,'2023-04-14','15:36:38','Se actualizo el inventario'),(683,'2023-04-14','15:36:44','Se realizo una compra'),(684,'2023-04-14','15:37:19','Se actualizo el inventario'),(685,'2023-04-14','15:38:27','Se actualizo el inventario'),(686,'2023-04-14','15:38:33','Se realizo una compra'),(687,'2023-04-14','15:39:57','Se actualizo el inventario'),(688,'2023-04-14','15:40:02','Se realizo una compra'),(689,'2023-04-14','15:41:25','Se actualizo el inventario'),(690,'2023-04-14','15:41:31','Se realizo una compra'),(691,'2023-04-14','15:41:53','Se actualizo el inventario'),(692,'2023-04-14','15:43:46','Se actualizo el inventario'),(693,'2023-04-14','15:43:52','Se realizo una compra'),(694,'2023-04-14','15:44:34','Se actualizo el inventario'),(695,'2023-04-14','15:45:01','Se actualizo el inventario'),(696,'2023-04-14','15:45:07','Se realizo una compra'),(697,'2023-04-14','15:46:12','Se actualizo el inventario'),(698,'2023-04-14','15:46:47','Se actualizo el inventario'),(699,'2023-04-14','15:46:52','Se realizo una compra'),(700,'2023-04-14','15:47:02','Se actualizo el inventario'),(701,'2023-04-14','15:51:14','Se actualizo el inventario'),(702,'2023-04-14','15:51:20','Se realizo una compra'),(703,'2023-04-14','15:51:36','Se actualizo el inventario'),(704,'2023-04-14','15:51:51','Se actualizo el inventario'),(705,'2023-04-14','15:51:58','Se realizo una compra'),(706,'2023-04-14','15:52:34','Se actualizo el inventario'),(707,'2023-04-14','15:52:40','Se realizo una compra'),(708,'2023-04-14','15:54:18','Se actualizo el inventario'),(709,'2023-04-14','15:56:24','Se actualizo el inventario'),(710,'2023-04-14','15:56:30','Se realizo una compra'),(711,'2023-04-14','15:58:04','Se actualizo el inventario'),(712,'2023-04-14','15:58:10','Se realizo una compra'),(713,'2023-04-14','15:59:15','Se actualizo el inventario'),(714,'2023-04-14','15:59:20','Se realizo una compra'),(715,'2023-04-14','16:01:57','Se actualizo el inventario'),(716,'2023-04-14','16:02:03','Se realizo una compra'),(717,'2023-04-14','16:03:40','Se actualizo el inventario'),(718,'2023-04-14','16:03:45','Se realizo una compra'),(719,'2023-04-14','16:07:05','Se actualizo el inventario'),(720,'2023-04-14','16:07:15','Se actualizo el inventario'),(721,'2023-04-14','16:07:20','Se realizo una compra'),(722,'2023-04-14','16:08:26','Se actualizo el inventario'),(723,'2023-04-14','16:08:39','Se realizo una compra'),(724,'2023-04-14','16:10:11','Se actualizo el inventario'),(725,'2023-04-14','16:14:09','Se actualizo el inventario'),(726,'2023-04-14','16:14:21','Se realizo una compra'),(727,'2023-04-14','16:14:40','Se actualizo el inventario'),(728,'2023-04-14','16:15:46','Se actualizo el inventario'),(729,'2023-04-14','16:15:52','Se realizo una compra'),(730,'2023-04-14','16:16:36','Se actualizo el inventario'),(731,'2023-04-14','16:16:41','Se realizo una compra'),(732,'2023-04-14','16:17:15','Se actualizo el inventario'),(733,'2023-04-14','16:17:24','Se actualizo el inventario'),(734,'2023-04-14','16:17:33','Se realizo una compra'),(735,'2023-04-14','16:19:40','Se actualizo el inventario'),(736,'2023-04-14','16:19:57','Se realizo una compra'),(737,'2023-04-14','16:21:06','Se actualizo el inventario'),(738,'2023-04-14','16:21:22','Se realizo una compra'),(739,'2023-04-14','16:21:59','Se actualizo el inventario'),(740,'2023-04-14','16:23:22','Se actualizo el inventario'),(741,'2023-04-14','16:23:27','Se realizo una compra'),(742,'2023-04-14','16:26:22','Se actualizo el inventario'),(743,'2023-04-14','16:26:29','Se realizo una compra'),(744,'2023-04-14','16:27:52','Se actualizo el inventario'),(745,'2023-04-14','16:28:01','Se actualizo el inventario'),(746,'2023-04-14','16:28:06','Se realizo una compra'),(747,'2023-04-14','16:30:21','Se actualizo el inventario'),(748,'2023-04-14','16:30:28','Se realizo una compra'),(749,'2023-04-14','16:31:06','Se actualizo el inventario'),(750,'2023-04-14','16:31:12','Se realizo una compra'),(751,'2023-04-14','16:31:32','Se actualizo el inventario'),(752,'2023-04-14','16:31:39','Se actualizo el inventario'),(753,'2023-04-14','16:31:44','Se realizo una compra'),(754,'2023-04-14','16:32:04','Se actualizo el inventario'),(755,'2023-04-14','16:34:48','Se actualizo el inventario'),(756,'2023-04-14','16:34:54','Se realizo una compra'),(757,'2023-04-14','16:35:34','Se actualizo el inventario'),(758,'2023-04-14','16:35:37','Se realizo una compra'),(759,'2023-04-14','16:35:49','Se actualizo el inventario'),(760,'2023-04-14','16:35:58','Se actualizo el inventario'),(761,'2023-04-14','16:36:05','Se realizo una compra'),(762,'2023-04-14','16:36:18','Se actualizo el inventario'),(763,'2023-04-14','16:42:29','Se actualizo el inventario'),(764,'2023-04-14','16:42:35','Se realizo una compra'),(765,'2023-04-14','16:43:00','Se actualizo el inventario'),(766,'2023-04-14','16:43:14','Se actualizo el inventario'),(767,'2023-04-14','16:43:25','Se realizo una compra'),(768,'2023-04-14','16:44:00','Se actualizo el inventario'),(769,'2023-04-15','00:12:22','Se actualizo el inventario'),(770,'2023-04-15','00:13:29','Se actualizo el inventario'),(771,'2023-04-15','00:13:47','Se actualizo el inventario'),(772,'2023-04-15','00:13:54','Se actualizo el inventario'),(773,'2023-04-15','00:14:23','Se actualizo el inventario'),(774,'2023-04-15','00:14:28','Se actualizo el inventario'),(775,'2023-04-15','00:14:52','Se realizo una compra'),(776,'2023-04-15','00:16:06','Se realizo una devolucion'),(777,'2023-04-15','00:16:06','Se actualizo el inventario'),(778,'2023-04-17','09:12:26','Se actualizo el inventario'),(779,'2023-04-17','09:12:37','Se actualizo el inventario'),(780,'2023-04-17','09:12:43','Se actualizo el inventario'),(781,'2023-04-17','09:12:56','Se realizo una compra'),(782,'2023-04-17','09:13:37','Se actualizo el inventario'),(783,'2023-04-17','09:14:04','Se actualizo el inventario'),(784,'2023-04-17','09:14:09','Se realizo una compra'),(785,'2023-04-17','09:14:34','Se actualizo el inventario'),(786,'2023-04-17','09:14:46','Se actualizo el inventario'),(787,'2023-04-17','09:15:21','Se realizo una compra'),(788,'2023-04-17','09:16:37','Se actualizo el inventario'),(789,'2023-04-17','09:19:44','Se actualizo el inventario'),(790,'2023-04-17','09:19:48','Se realizo una compra'),(791,'2023-04-17','09:21:59','Se actualizo el inventario'),(792,'2023-04-17','09:22:04','Se realizo una compra'),(793,'2023-04-17','09:34:35','Se actualizo el inventario'),(794,'2023-04-17','09:34:40','Se realizo una compra'),(795,'2023-04-17','09:35:32','Se actualizo el inventario'),(796,'2023-04-17','09:35:36','Se realizo una compra'),(797,'2023-04-17','09:35:58','Se actualizo el inventario'),(798,'2023-04-17','09:36:03','Se realizo una compra'),(799,'2023-04-17','09:40:21','Se actualizo el inventario'),(800,'2023-04-17','09:40:26','Se realizo una compra'),(801,'2023-04-17','09:41:36','Se actualizo el inventario'),(802,'2023-04-17','09:41:40','Se realizo una compra'),(803,'2023-04-17','16:03:01','Se actualizo el inventario'),(804,'2023-04-17','16:03:12','Se actualizo el inventario'),(805,'2023-04-18','09:21:45','Se actualizo el inventario'),(806,'2023-04-18','09:22:06','Se realizo una compra'),(807,'2023-04-18','09:26:01','Se actualizo el inventario'),(808,'2023-04-18','09:26:06','Se realizo una compra'),(809,'2023-04-19','16:40:29','Se actualizo el inventario'),(810,'2023-04-19','16:42:53','Se actualizo el inventario'),(811,'2023-04-19','16:43:06','Se actualizo el inventario'),(812,'2023-04-19','16:43:17','Se realizo una compra'),(813,'2023-04-20','10:33:51','Se actualizo el inventario'),(814,'2023-04-20','10:34:02','Se actualizo el inventario'),(815,'2023-04-20','10:34:10','Se actualizo el inventario'),(816,'2023-04-20','10:34:35','Se realizo una compra'),(817,'2023-04-20','10:36:09','Se realizo una devolucion'),(818,'2023-04-20','10:36:09','Se actualizo el inventario'),(819,'2023-04-26','12:40:04','Se actualizo el inventario'),(820,'2023-04-26','12:40:23','Se realizo una compra'),(821,'2023-04-26','12:40:45','Se actualizo el inventario'),(822,'2023-04-26','18:03:43','Se actualizo el inventario'),(823,'2023-04-26','18:04:06','Se actualizo el inventario'),(824,'2023-04-26','18:04:13','Se actualizo el inventario'),(825,'2023-04-26','18:04:27','Se actualizo el inventario'),(826,'2023-04-26','18:05:15','Se actualizo el inventario'),(827,'2023-04-26','18:05:30','Se actualizo el inventario'),(828,'2023-04-26','18:05:58','Se actualizo el inventario'),(829,'2023-04-26','18:06:04','Se actualizo el inventario'),(830,'2023-04-26','18:07:02','Se actualizo el inventario'),(831,'2023-04-26','18:07:12','Se actualizo el inventario'),(832,'2023-04-26','18:07:30','Se actualizo el inventario'),(833,'2023-04-26','18:07:38','Se actualizo el inventario'),(834,'2023-04-26','18:07:55','Se actualizo el inventario'),(835,'2023-04-26','18:08:41','Se actualizo el inventario'),(836,'2023-04-26','18:08:51','Se actualizo el inventario'),(837,'2023-04-26','18:10:42','Se actualizo el inventario'),(838,'2023-04-26','18:10:52','Se actualizo el inventario'),(839,'2023-04-26','18:12:03','Se actualizo el inventario'),(840,'2023-04-26','18:12:06','Se actualizo el inventario'),(841,'2023-04-26','18:12:19','Se actualizo el inventario'),(842,'2023-04-26','18:13:15','Se actualizo el inventario'),(843,'2023-04-26','18:13:39','Se actualizo el inventario'),(844,'2023-04-26','18:14:10','Se actualizo el inventario'),(845,'2023-04-26','18:14:27','Se actualizo el inventario'),(846,'2023-04-26','18:14:37','Se realizo una compra'),(847,'2023-04-26','18:14:42','Se actualizo el inventario'),(848,'2023-04-26','18:15:13','Se actualizo el inventario'),(849,'2023-04-26','18:15:20','Se realizo una compra'),(850,'2023-04-26','18:38:30','Se actualizo el inventario'),(851,'2023-04-26','18:38:43','Se actualizo el inventario'),(852,'2023-04-26','18:41:09','Se agrego un nuevo cliente'),(853,'2023-04-26','18:41:56','Se actualizo el inventario'),(854,'2023-04-26','18:42:02','Se realizo una compra'),(855,'2023-04-26','20:10:57','Se actualizo el inventario'),(856,'2023-04-26','20:11:00','Se realizo una compra'),(857,'2023-04-26','20:19:19','Se actualizo el inventario'),(858,'2023-04-26','20:20:14','Se realizo una compra'),(859,'2023-04-27','09:39:47','Se actualizo el inventario'),(860,'2023-04-27','09:40:07','Se realizo una compra'),(861,'2023-04-27','09:45:22','Se actualizo el inventario'),(862,'2023-04-27','09:45:48','Se realizo una compra'),(863,'2023-04-27','09:52:33','Se actualizo el inventario'),(864,'2023-04-27','09:53:19','Se realizo una compra'),(865,'2023-04-27','10:07:16','Se actualizo el inventario'),(866,'2023-04-27','10:08:05','Se realizo una compra'),(867,'2023-04-27','10:20:29','Se actualizo el inventario'),(868,'2023-04-27','10:21:04','Se realizo una compra'),(869,'2023-04-27','10:29:03','Se actualizo el inventario'),(870,'2023-04-27','10:29:46','Se realizo una compra'),(871,'2023-04-27','10:36:09','Se actualizo el inventario'),(872,'2023-04-27','10:36:28','Se realizo una compra'),(873,'2023-04-27','10:44:06','Se actualizo el inventario'),(874,'2023-04-27','10:44:37','Se realizo una compra'),(875,'2023-04-27','10:49:27','Se actualizo el inventario'),(876,'2023-04-27','10:49:41','Se actualizo el inventario'),(877,'2023-04-27','11:00:10','Se actualizo el inventario'),(878,'2023-04-27','11:00:44','Se realizo una compra'),(879,'2023-04-27','11:20:28','Se actualizo el inventario'),(880,'2023-04-27','11:20:55','Se realizo una compra'),(881,'2023-04-27','11:26:20','Se actualizo el inventario'),(882,'2023-04-27','11:26:49','Se realizo una compra'),(883,'2023-04-27','11:33:54','Se actualizo el inventario'),(884,'2023-04-27','11:34:17','Se realizo una compra'),(885,'2023-04-27','11:44:56','Se actualizo el inventario'),(886,'2023-04-27','11:45:21','Se realizo una compra'),(887,'2023-04-27','12:21:10','Se actualizo el inventario'),(888,'2023-04-27','12:21:43','Se realizo una compra'),(889,'2023-04-27','12:26:32','Se actualizo el inventario'),(890,'2023-04-27','12:27:09','Se realizo una compra'),(891,'2023-04-27','12:33:01','Se actualizo el inventario'),(892,'2023-04-27','12:33:32','Se realizo una compra'),(893,'2023-04-27','12:44:10','Se actualizo el inventario'),(894,'2023-04-27','12:44:41','Se realizo una compra'),(895,'2023-04-27','12:57:46','Se actualizo el inventario'),(896,'2023-04-27','12:58:22','Se realizo una compra'),(897,'2023-04-27','13:05:55','Se actualizo el inventario'),(898,'2023-04-27','13:06:30','Se realizo una compra'),(899,'2023-04-27','13:19:40','Se actualizo el inventario'),(900,'2023-04-27','14:09:22','Se actualizo el inventario'),(901,'2023-04-27','14:09:53','Se realizo una compra'),(902,'2023-05-01','18:49:22','Se actualizo el inventario'),(903,'2023-05-01','18:49:34','Se actualizo el inventario'),(904,'2023-05-01','18:49:37','Se actualizo el inventario'),(905,'2023-05-01','18:49:42','Se realizo una compra'),(906,'2023-05-01','20:05:44','Se actualizo el inventario'),(907,'2023-05-01','20:05:44','Se actualizo el inventario'),(908,'2023-05-01','20:05:44','Se actualizo el inventario'),(909,'2023-05-01','20:05:44','Se actualizo el inventario'),(910,'2023-05-01','20:05:44','Se actualizo el inventario'),(911,'2023-05-01','20:05:44','Se actualizo el inventario'),(912,'2023-05-01','20:05:44','Se actualizo el inventario'),(913,'2023-05-01','20:05:44','Se actualizo el inventario'),(914,'2023-05-01','20:42:37','Se actualizo el inventario'),(915,'2023-05-01','20:44:21','Se actualizo el inventario'),(916,'2023-05-01','20:44:21','Se actualizo el inventario'),(917,'2023-05-01','20:44:21','Se actualizo el inventario'),(918,'2023-05-01','20:44:21','Se actualizo el inventario'),(919,'2023-05-01','20:44:21','Se actualizo el inventario'),(920,'2023-05-01','20:44:21','Se actualizo el inventario'),(921,'2023-05-01','20:44:21','Se actualizo el inventario'),(922,'2023-05-01','20:58:19','Se actualizo el inventario'),(923,'2023-05-01','20:58:40','Se actualizo el inventario'),(924,'2023-05-01','21:35:43','Se actualizo el inventario'),(925,'2023-05-01','21:43:07','Se actualizo el inventario'),(926,'2023-05-01','21:43:07','Se actualizo el inventario'),(927,'2023-05-01','21:43:07','Se actualizo el inventario'),(928,'2023-05-01','21:43:07','Se actualizo el inventario'),(929,'2023-05-01','21:43:07','Se actualizo el inventario'),(930,'2023-05-01','21:43:07','Se actualizo el inventario'),(931,'2023-05-01','21:43:07','Se actualizo el inventario'),(932,'2023-05-01','21:43:07','Se actualizo el inventario'),(933,'2023-05-02','09:44:10','Se actualizo el inventario'),(934,'2023-05-02','09:44:25','Se realizo una compra'),(935,'2023-05-03','09:22:30','Se actualizo el inventario'),(936,'2023-05-03','09:23:25','Se realizo una compra'),(937,'2023-05-03','09:24:14','Se actualizo el inventario'),(938,'2023-05-03','09:24:49','Se actualizo el inventario'),(939,'2023-05-03','09:27:52','Se actualizo el inventario'),(940,'2023-05-03','09:28:16','Se actualizo el inventario'),(941,'2023-05-03','09:28:22','Se actualizo el inventario'),(942,'2023-05-03','09:28:38','Se actualizo el inventario'),(943,'2023-05-03','09:28:51','Se realizo una compra'),(944,'2023-05-03','09:29:03','Se actualizo el inventario'),(945,'2023-05-03','09:29:03','Se actualizo el inventario'),(946,'2023-05-03','09:29:31','Se actualizo el inventario'),(947,'2023-05-03','09:29:45','Se actualizo el inventario'),(948,'2023-05-03','09:29:51','Se actualizo el inventario'),(949,'2023-05-03','09:29:57','Se realizo una compra'),(950,'2023-05-03','09:30:20','Se actualizo el inventario'),(951,'2023-05-03','09:31:31','Se actualizo el inventario'),(952,'2023-05-03','09:31:40','Se realizo una compra'),(953,'2023-05-03','09:31:58','Se actualizo el inventario'),(954,'2023-05-03','09:32:26','Se actualizo el inventario'),(955,'2023-05-03','09:32:34','Se realizo una compra'),(956,'2023-05-03','09:32:42','Se actualizo el inventario'),(957,'2023-05-03','09:34:35','Se actualizo el inventario'),(958,'2023-05-03','09:34:39','Se realizo una compra'),(959,'2023-05-03','09:35:32','Se actualizo el inventario'),(960,'2023-05-03','09:35:37','Se realizo una compra'),(961,'2023-05-03','10:05:49','Se actualizo el inventario'),(962,'2023-05-03','10:05:58','Se actualizo el inventario'),(963,'2023-05-03','10:06:07','Se realizo una compra'),(964,'2023-05-03','10:06:17','Se actualizo el inventario'),(965,'2023-05-03','10:06:17','Se actualizo el inventario'),(966,'2023-05-03','13:39:25','Se actualizo el inventario'),(967,'2023-05-03','13:39:29','Se actualizo el inventario'),(968,'2023-05-03','13:39:42','Se actualizo el inventario'),(969,'2023-05-03','13:46:02','Se actualizo el inventario'),(970,'2023-05-03','13:47:27','Se actualizo el inventario'),(971,'2023-05-03','13:48:00','Se actualizo el inventario'),(972,'2023-05-03','13:48:54','Se actualizo el inventario'),(973,'2023-05-03','13:49:26','Se actualizo el inventario'),(974,'2023-05-03','13:49:46','Se actualizo el inventario'),(975,'2023-05-03','13:50:59','Se actualizo el inventario'),(976,'2023-05-03','13:54:32','Se actualizo el inventario'),(977,'2023-05-03','14:01:37','Se realizo una compra'),(978,'2023-05-03','15:24:33','Se realizo una compra'),(979,'2023-05-03','15:28:50','Se realizo una compra'),(980,'2023-05-03','15:29:09','Se realizo una compra'),(981,'2023-05-03','15:31:44','Se actualizo el inventario'),(982,'2023-05-03','15:31:49','Se realizo una compra'),(983,'2023-05-03','15:32:15','Se actualizo el inventario'),(984,'2023-05-03','15:32:32','Se realizo una compra'),(985,'2023-05-03','15:33:22','Se actualizo el inventario'),(986,'2023-05-03','15:33:30','Se realizo una compra'),(989,'2023-05-16','13:19:05','Se actualizo el inventario'),(990,'2023-05-16','13:19:14','Se actualizo el inventario'),(991,'2023-05-16','13:19:38','Se actualizo el inventario'),(992,'2023-05-16','13:19:53','Se realizo una compra'),(993,'2023-12-26','12:25:00','Se actualizo el inventario'),(994,'2023-12-26','12:25:15','Se realizo una compra'),(995,'2023-12-26','12:25:36','Se actualizo el inventario'),(996,'2023-12-26','12:25:53','Se realizo una compra');
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `USER_id` bigint unsigned DEFAULT NULL,
  `imagen` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impuestos`
--

DROP TABLE IF EXISTS `impuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impuestos` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(5) NOT NULL,
  `taza` decimal(5,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuestos`
--

LOCK TABLES `impuestos` WRITE;
/*!40000 ALTER TABLE `impuestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `impuestos` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `importe` decimal(8,2) unsigned DEFAULT NULL,
  `FORMAS_PAGO_id` tinyint unsigned NOT NULL,
  `TICKETS_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PAGOS_FORMAS_PAGO1_idx` (`FORMAS_PAGO_id`),
  KEY `fk_PAGOS_TICKETS1_idx` (`TICKETS_id`),
  CONSTRAINT `fk_PAGOS_FORMAS_PAGO1` FOREIGN KEY (`FORMAS_PAGO_id`) REFERENCES `formas_pago` (`id`),
  CONSTRAINT `fk_PAGOS_TICKETS1` FOREIGN KEY (`TICKETS_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (9,780.00,2,80),(10,780.00,2,94),(11,780.00,2,96),(12,780.00,2,97),(13,780.00,2,98),(14,1560.00,1,99),(15,780.00,3,100),(16,2340.00,2,101),(17,2340.00,2,102),(19,1560.00,2,104),(20,4680.00,2,105),(21,780.00,2,106),(22,780.00,2,107),(23,780.00,2,108),(24,780.00,2,109),(30,780.00,2,137),(32,1560.00,2,139),(33,1560.00,1,140),(34,780.00,2,141),(35,1560.00,2,142),(36,1560.00,2,143),(37,780.00,2,144),(38,1560.00,2,145),(39,1560.00,2,146),(40,1560.00,2,147),(47,NULL,2,185),(49,NULL,2,190),(50,NULL,2,191),(51,NULL,2,192),(53,780.00,2,194),(54,2340.00,2,195),(55,4158.00,2,196),(66,780.00,1,238),(69,780.00,1,241),(75,780.00,2,247),(80,780.00,2,252),(81,780.00,2,253),(83,780.00,1,255),(92,780.00,2,264),(95,780.00,3,267),(97,780.00,1,269),(106,780.00,1,278),(107,780.00,1,279),(113,780.00,1,285),(115,780.00,1,287),(116,780.00,1,288),(117,780.00,1,289),(118,780.00,1,290),(119,780.00,1,291),(120,780.00,1,292),(123,780.00,1,295),(125,780.00,2,297),(126,780.00,1,298),(128,780.00,2,300),(130,780.00,2,302),(131,780.00,1,303),(134,780.00,2,306),(139,NULL,2,311),(143,780.00,2,317),(144,780.00,2,318),(145,780.00,2,319),(146,780.00,2,320),(147,780.00,2,321),(148,780.00,2,322),(149,780.00,2,323),(150,780.00,3,325),(151,780.00,2,326),(152,2340.00,2,327),(153,NULL,3,328),(156,780.00,2,347),(157,1560.00,2,352),(158,780.00,2,353),(159,780.00,2,354),(160,3900.00,2,355),(161,1560.00,1,356),(162,3900.00,1,357),(163,3900.00,1,358),(164,3900.00,1,359),(165,7995.00,1,360),(166,3900.00,1,361),(167,3900.00,1,362),(168,780.00,1,364),(169,6495.00,1,365),(170,1560.00,1,366),(171,3198.00,1,367),(172,1560.00,1,369),(173,780.00,1,370),(174,3120.00,1,371),(175,780.00,1,372),(176,780.00,1,373),(177,780.00,1,374),(178,3198.00,1,375),(179,1560.00,1,377),(180,1560.00,2,382),(181,780.00,2,404),(182,780.00,2,405),(187,780.00,2,412),(188,780.00,2,413),(190,780.00,2,413),(191,780.00,2,413),(192,780.00,2,413),(193,780.00,2,413),(194,780.00,2,422),(195,780.00,1,423),(196,780.00,1,424),(198,1560.00,2,430),(199,780.00,1,431),(200,780.00,1,432);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizarImporte` BEFORE INSERT ON `pagos` FOR EACH ROW BEGIN

-- set NEW.importe= 
  -- (select total_pagar from tickets where id=new.TICKETS_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_pagos` AFTER INSERT ON `pagos` FOR EACH ROW BEGIN -- ejecuciones del trigger inicio

INSERT INTO historial (fecha,hora,accion) 
					values (current_date(),current_time(),"Se realizo una compra"); 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  PRIMARY KEY (`email`)
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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'web','4ce9025b1e055e0b9bee358b02e7e1fd7852b5e7943290cc8fcf39917156dc82','[\"*\"]',NULL,NULL,'2023-03-08 21:49:17','2023-03-08 21:49:17'),(2,'App\\Models\\User',2,'web','888ae3fcaf055569c8a6ca07469d2e61cc8484f0738d5fe39d6933c49827b339','[\"*\"]',NULL,NULL,'2023-03-08 21:53:30','2023-03-08 21:53:30'),(3,'App\\Models\\User',3,'web','65a75b358c345f12fd75eec5e8df931b2c0c29c5c33b56f37c4710a91a94ed0b','[\"*\"]',NULL,NULL,'2023-03-08 22:07:08','2023-03-08 22:07:08'),(4,'App\\Models\\User',4,'web','b142c9011885025f4f10734f9354dcfc142bfacdf7508fc6495cce6151287159','[\"*\"]',NULL,NULL,'2023-03-13 21:47:23','2023-03-13 21:47:23'),(5,'App\\Models\\User',5,'web','9cbad3af280c5675af15ba8ede5b03b7a17e99362f679876688101a942f5abc6','[\"*\"]',NULL,NULL,'2023-03-13 21:55:18','2023-03-13 21:55:18'),(6,'App\\Models\\User',6,'web','94bdaa67c47518de6d04aca7459b2785735af7c703618f24f5d28fce4fc5c006','[\"*\"]',NULL,NULL,'2023-03-14 21:41:28','2023-03-14 21:41:28'),(7,'App\\Models\\User',6,'web','2bcab9d0998b638e01cb933f234f0ac6da76e3f73ef5e46b6676d4c9e796de41','[\"*\"]',NULL,NULL,'2023-03-14 21:45:08','2023-03-14 21:45:08'),(8,'App\\Models\\User',6,'web','295ff3d6e7e830a823ae23a289a2a07e506e0f7de577ae7390cee2039e14b82c','[\"*\"]',NULL,NULL,'2023-03-14 21:47:54','2023-03-14 21:47:54'),(9,'App\\Models\\User',6,'web','8cd07d3f3812d10a7266f2fe247b67f7c63fefefc4db9720e7f643d4cd28f1d1','[\"*\"]',NULL,NULL,'2023-03-14 21:48:15','2023-03-14 21:48:15'),(10,'App\\Models\\User',6,'web','e6078211dd43c3cb34e5651b0d9acf6575c9b364216e4b3ddbc5c6696d61a6bd','[\"*\"]',NULL,NULL,'2023-03-15 21:55:19','2023-03-15 21:55:19'),(11,'App\\Models\\User',6,'web','73e15ef003a49e5f2d32845b976f609a5e9a647cf28137b5025938a80e726ccc','[\"*\"]',NULL,NULL,'2023-03-15 21:55:21','2023-03-15 21:55:21'),(12,'App\\Models\\User',6,'web','132a31f144c935fa754871de2fe9bb0460f5ba97fbe711e4b3359634ba426244','[\"*\"]',NULL,NULL,'2023-03-15 21:57:34','2023-03-15 21:57:34'),(13,'App\\Models\\User',7,'web','a886b26aaed8566266c0a8eb40ed5dffe1a4bdcf55f7c68aa16b0a20e88e32a5','[\"*\"]',NULL,NULL,'2023-03-15 22:01:16','2023-03-15 22:01:16'),(14,'App\\Models\\User',6,'web','4e68224a48d992162f955da8995649c3c2b0c2f38659ecbccf405f7dcc081386','[\"*\"]',NULL,NULL,'2023-03-15 22:14:59','2023-03-15 22:14:59'),(15,'App\\Models\\User',1,'web','b06a0ce21836565f6e10c08c9846e7a4c3252219f62a38e03d4c9cf0008fcada','[\"*\"]',NULL,NULL,'2023-03-16 19:55:54','2023-03-16 19:55:54'),(16,'App\\Models\\User',1,'web','cece03a2bd71531e8a9a8e85b9eee7372ea3153fb5ee55981bdf7dcc018728d9','[\"*\"]',NULL,NULL,'2023-03-16 19:57:27','2023-03-16 19:57:27'),(17,'App\\Models\\User',1,'web','c4001965074a77702fe6613ca2985111a0e1698c5519eae6a06d8b96f1c981db','[\"*\"]',NULL,NULL,'2023-03-16 19:58:11','2023-03-16 19:58:11'),(18,'App\\Models\\User',1,'web','0eecf2bb89ba0622ba92a7102fc84b21b996b9e996cdca7311acba3abe56d9e8','[\"*\"]',NULL,NULL,'2023-03-16 19:58:56','2023-03-16 19:58:56'),(19,'App\\Models\\User',6,'web','ac28178abf25f544f6b1712d08a947a994a2ed1323314a07d837669979a68055','[\"*\"]',NULL,NULL,'2023-03-16 21:55:03','2023-03-16 21:55:03'),(20,'App\\Models\\User',1,'web','a0cf42fdb12951b3264e089f05e21e7f5423827ac897123890b414680a2a76bc','[\"*\"]',NULL,NULL,'2023-03-16 21:55:30','2023-03-16 21:55:30'),(21,'App\\Models\\User',1,'web','281f3fc8eac0f93554113ccd0d1765bbc2166396ab38687fb488323b8496e57d','[\"*\"]',NULL,NULL,'2023-03-16 22:01:27','2023-03-16 22:01:27'),(22,'App\\Models\\User',1,'web','b4e4f487e9046b6dac66f1ef7d15fb23d0ab897aebe7c80c889da7f2ab7867b6','[\"*\"]',NULL,NULL,'2023-03-16 22:01:29','2023-03-16 22:01:29'),(23,'App\\Models\\User',1,'web','87352756e03a56a720316752a2ceb0d7e399425a1903f9b7705927acef6b34d9','[\"*\"]',NULL,NULL,'2023-03-16 22:01:33','2023-03-16 22:01:33'),(24,'App\\Models\\User',1,'web','2edd47842453d2552e7e038c314fa01dea668ab775fbf642f97a395027f9a91f','[\"*\"]',NULL,NULL,'2023-03-16 22:01:35','2023-03-16 22:01:35'),(25,'App\\Models\\User',1,'web','ee9b66d894afa15cb63ad8242d00dec7693526a7cddc4fefa19fb864b5e64832','[\"*\"]',NULL,NULL,'2023-03-16 22:06:32','2023-03-16 22:06:32'),(26,'App\\Models\\User',1,'web','f45f5a65608fceaf2ed31ef5921fa28a77124d43ae03b9fe96bb3b85ba6b8871','[\"*\"]',NULL,NULL,'2023-03-16 22:06:47','2023-03-16 22:06:47'),(27,'App\\Models\\User',1,'web','df3626777edaed383a811128489f4413247829cb4c0315245f7335ea487265fe','[\"*\"]',NULL,NULL,'2023-03-16 22:07:41','2023-03-16 22:07:41'),(28,'App\\Models\\User',1,'web','a0e6b33c23a2f29ec7e7c078f8e8a34a4b6e35ccb54471395b0eb51a1d9cd712','[\"*\"]',NULL,NULL,'2023-03-16 22:08:26','2023-03-16 22:08:26'),(29,'App\\Models\\User',1,'web','610f61243c089077fc4aea4d173946f24da46eec9f70c72ec058d28f1c3923e3','[\"*\"]',NULL,NULL,'2023-03-17 12:16:01','2023-03-17 12:16:01'),(30,'App\\Models\\User',1,'web','6495752b0033c2ed15532682c4a19780636694509f20ecf703df4b74647f0ed4','[\"*\"]',NULL,NULL,'2023-03-17 12:16:34','2023-03-17 12:16:34'),(31,'App\\Models\\User',1,'web','d719278c90897b9f2f78651df68b9b39597e1a3d8ed433edfcfd99e7a7b0d405','[\"*\"]',NULL,NULL,'2023-03-17 12:26:11','2023-03-17 12:26:11'),(32,'App\\Models\\User',1,'web','46d3ffc24bdfb7899f2a5f1614031e7e61e99ab5650bbdcbc03125076bde703d','[\"*\"]',NULL,NULL,'2023-03-17 12:59:07','2023-03-17 12:59:07'),(33,'App\\Models\\User',1,'web','2611869738ea049866bba9eb9a7eac50f2d4f712acf4091fa154a311037cf021','[\"*\"]',NULL,NULL,'2023-03-17 13:00:44','2023-03-17 13:00:44'),(34,'App\\Models\\User',1,'web','b9fd1ee0799e40512329c897c1a33f65ce3a67170da682e4ef526e8863616513','[\"*\"]',NULL,NULL,'2023-03-17 13:08:05','2023-03-17 13:08:05'),(35,'App\\Models\\User',1,'web','02117c48a140ee35e234d0acf8d9472485a195198dc4a7281e46bdb6a8d176e8','[\"*\"]',NULL,NULL,'2023-03-17 13:10:27','2023-03-17 13:10:27'),(36,'App\\Models\\User',1,'web','11b49580992b93018c6880845c481cfab1f1f50aaed7eb3e7906475e787f02c1','[\"*\"]',NULL,NULL,'2023-03-17 13:14:41','2023-03-17 13:14:41'),(37,'App\\Models\\User',1,'web','a733ed9f597f4ee4e756088a5082e037373eeb3b7d34839869617a111e8def18','[\"*\"]',NULL,NULL,'2023-03-17 13:16:18','2023-03-17 13:16:18'),(38,'App\\Models\\User',1,'web','4bf848dec9cb13ccb45de23d7800965a32b6c3dd3d1c1005cefda50a9b11e013','[\"*\"]',NULL,NULL,'2023-03-17 13:18:18','2023-03-17 13:18:18'),(39,'App\\Models\\User',1,'web','3de2c9c63e516df216747bcc1804ad787edad0d29800ab96bce6e01016d723be','[\"*\"]',NULL,NULL,'2023-03-17 13:29:13','2023-03-17 13:29:13'),(40,'App\\Models\\User',1,'web','696e39d1a4d6151b83814e9ba027c5cecf12c47b795781ca9d72e0a9c21b398b','[\"*\"]',NULL,NULL,'2023-03-17 21:34:34','2023-03-17 21:34:34'),(41,'App\\Models\\User',1,'web','41c50e20c0f0649ec16a4358f15347f32db2e93bbfc58831a9e1d7b3f45e2432','[\"*\"]',NULL,NULL,'2023-03-17 21:39:21','2023-03-17 21:39:21'),(42,'App\\Models\\User',1,'web','385a1445743bf6a186121f3f1a154f28e97d7d220b7d0d5a137c59b198605145','[\"*\"]',NULL,NULL,'2023-03-17 22:54:11','2023-03-17 22:54:11'),(43,'App\\Models\\User',1,'web','cab36b1573304a0edaa12c44a43c1d2f426b3fa22cfb8151731f5024a668ea50','[\"*\"]',NULL,NULL,'2023-03-18 02:15:02','2023-03-18 02:15:02'),(44,'App\\Models\\User',1,'web','f6a830874fe84a71c8e487bcada4aebcf36b2d6d0ac2362a63d0fb6d2fdb5e51','[\"*\"]',NULL,NULL,'2023-03-18 02:16:14','2023-03-18 02:16:14'),(45,'App\\Models\\User',1,'web','24d440652a7903a9ebcb720adf2be3931796d135de0df140a93c1545adba6cad','[\"*\"]',NULL,NULL,'2023-03-18 03:37:54','2023-03-18 03:37:54'),(46,'App\\Models\\User',1,'web','00fab1091eb3dc552dec323d5310f38ba012caa6b129ec9558b260e32894d769','[\"*\"]',NULL,NULL,'2023-03-18 03:38:56','2023-03-18 03:38:56'),(47,'App\\Models\\User',1,'web','e57a546a63497fa9b85f50213f230030ef7288935b9d55ed9c77e98b601973f5','[\"*\"]',NULL,NULL,'2023-03-18 03:46:57','2023-03-18 03:46:57'),(48,'App\\Models\\User',1,'web','88c2a910f3f1437084af3e3ba8afc14e513b699b969e2e059d07a4f89fbe16b3','[\"*\"]',NULL,NULL,'2023-03-18 03:51:42','2023-03-18 03:51:42'),(49,'App\\Models\\User',1,'web','4c49b6a6fe131417826b9545f21001a39551b70a855bc3a9d4a7215cb82841c1','[\"*\"]',NULL,NULL,'2023-03-18 03:52:25','2023-03-18 03:52:25'),(50,'App\\Models\\User',1,'web','75aaa296972ee2c7d4014fa54f0a9f7f240b666a92a3309d365795ad7328e763','[\"*\"]',NULL,NULL,'2023-03-18 03:53:04','2023-03-18 03:53:04'),(51,'App\\Models\\User',1,'web','eebf54b446934961dcbfd851d3fb92f6809661293506ac256c68da8ae15c115f','[\"*\"]',NULL,NULL,'2023-03-18 03:54:30','2023-03-18 03:54:30'),(52,'App\\Models\\User',1,'web','d23d14b3589a6e032c950ee580ef03b763f5087cf690b70a52d8667e82b2517e','[\"*\"]',NULL,NULL,'2023-03-18 03:55:13','2023-03-18 03:55:13'),(53,'App\\Models\\User',1,'web','f7c9c4444f67b618cbb8eec7410e46b2091f5438e61571406d12b521b7315bb1','[\"*\"]',NULL,NULL,'2023-03-18 03:57:53','2023-03-18 03:57:53'),(54,'App\\Models\\User',1,'web','369f6865ff95295329222870105851c8b409676a4a55388475d5a2e1fa50a016','[\"*\"]',NULL,NULL,'2023-03-18 03:58:59','2023-03-18 03:58:59'),(55,'App\\Models\\User',1,'web','777089b5e188793d493e96cf019ba10423303986eaafee78b90dd9011bceb90e','[\"*\"]',NULL,NULL,'2023-03-18 03:59:53','2023-03-18 03:59:53'),(56,'App\\Models\\User',1,'web','b6c42c3635366159243205389996b5126d60c366eba180cb654c00f25400f3b8','[\"*\"]',NULL,NULL,'2023-03-18 04:01:39','2023-03-18 04:01:39'),(57,'App\\Models\\User',1,'web','a96a8f8cf071325acb2c124f0c6869641ff97aed25df6a7f918d452205d57c6b','[\"*\"]',NULL,NULL,'2023-03-18 04:02:23','2023-03-18 04:02:23'),(58,'App\\Models\\User',1,'web','ce921679e4b41b94f47a9225dc609807b8b7be90ed7cd7c5149e5feffe69a1f1','[\"*\"]',NULL,NULL,'2023-03-19 22:08:01','2023-03-19 22:08:01'),(59,'App\\Models\\User',8,'web','606051d94e2050926d770a0e815c66975991cafa7856434818440e9a1f25984c','[\"*\"]',NULL,NULL,'2023-03-20 08:24:35','2023-03-20 08:24:35'),(60,'App\\Models\\User',8,'web','e6c6ccc695bb0e9afb23a88bb8c295fcebf88ab9dbc2aae8e6912fa273506160','[\"*\"]',NULL,NULL,'2023-03-20 08:25:05','2023-03-20 08:25:05'),(61,'App\\Models\\User',8,'web','5dffac319e96ce01d5ad3274c2cb8dcb1189aa21415a1ef36b56fcbac04e8512','[\"*\"]',NULL,NULL,'2023-03-20 08:28:30','2023-03-20 08:28:30'),(62,'App\\Models\\User',1,'web','81f50da2476143bf1210820421b1638dc8bddcf414cd01fb8f92a0a26dc82496','[\"*\"]',NULL,NULL,'2023-03-21 21:45:11','2023-03-21 21:45:11'),(63,'App\\Models\\User',9,'web','75827139471302edac877dbe3f4bf7fe2ff5528c3c3d3c103379cdf276f08787','[\"*\"]',NULL,NULL,'2023-03-21 21:46:23','2023-03-21 21:46:23'),(64,'App\\Models\\User',9,'web','5445915f743daff6a72aca50277ff9978da8367b3eaea244cdc00a7a6795ee4b','[\"*\"]',NULL,NULL,'2023-03-21 21:46:43','2023-03-21 21:46:43'),(65,'App\\Models\\User',9,'web','0029697f6eb4724b70f74d251bc40d4114bfbe1e2ff441a25fc72882367c69ef','[\"*\"]',NULL,NULL,'2023-03-21 21:49:45','2023-03-21 21:49:45'),(66,'App\\Models\\User',9,'web','4120a9309282a4f5f9751b4b54b7f5d810bba5710c914ed6cac9c00fc4aaa95a','[\"*\"]',NULL,NULL,'2023-03-21 21:51:44','2023-03-21 21:51:44'),(67,'App\\Models\\User',9,'web','9f8c4c53642d33b8abbb19a9ec0e06be0ecc4a3b29fa7342bdaf375d73422fb4','[\"*\"]',NULL,NULL,'2023-03-21 21:52:05','2023-03-21 21:52:05'),(75,'App\\Models\\User',1,'web','b617fedd0b2845b5b02353507868290411af341f164f55833497f9ec4574885c','[\"*\"]',NULL,NULL,'2023-03-21 22:47:03','2023-03-21 22:47:03'),(82,'App\\Models\\User',1,'web','4048399e84661e691a463e6936a753fe5f8fce0d668310a83df2399cb1c5d49b','[\"*\"]',NULL,NULL,'2023-03-21 22:53:57','2023-03-21 22:53:57'),(83,'App\\Models\\User',1,'web','6e88f69e7792c146529e02a27dfec7d829d11de7df7ee1c41aad1d099a700a51','[\"*\"]',NULL,NULL,'2023-03-21 22:54:19','2023-03-21 22:54:19'),(97,'App\\Models\\User',10,'web','a1c6146f07c5cdef036b77267e5c2a854d381238f9580f1993d72e58ec0f7eef','[\"*\"]',NULL,NULL,'2023-03-22 05:43:09','2023-03-22 05:43:09'),(103,'App\\Models\\User',11,'web','faffce542dbc4b2c24628860b1cc0a524e857418f23fb43db5eadc8bb28cee1c','[\"*\"]',NULL,NULL,'2023-03-22 06:33:50','2023-03-22 06:33:50'),(109,'App\\Models\\User',12,'web','fef4953c924f37420a527bac485bbe8bd67858d79fce4868e0b12fb67c12d342','[\"*\"]',NULL,NULL,'2023-03-27 11:04:11','2023-03-27 11:04:11'),(116,'App\\Models\\User',9,'web','f47f27a76aa3bb98024e84db51566f2ee4015011b4309b6127293ab56a264578','[\"*\"]',NULL,NULL,'2023-04-06 00:43:04','2023-04-06 00:43:04'),(117,'App\\Models\\User',9,'web','a2a4d8740b8bc3e136006aa5c59db56fe2273e8d013579f01b8192dd39de8261','[\"*\"]',NULL,NULL,'2023-04-10 08:09:14','2023-04-10 08:09:14'),(118,'App\\Models\\User',9,'web','866e921660e0e7b5e56948b0b98e7f4a726706bd500d77c2b734e79da330cee7','[\"*\"]',NULL,NULL,'2023-04-10 08:12:51','2023-04-10 08:12:51'),(119,'App\\Models\\User',9,'web','b07daf35e29bd805c875e6189724017350afdde3b19539738c7dd447d18f53aa','[\"*\"]',NULL,NULL,'2023-04-10 08:13:15','2023-04-10 08:13:15'),(121,'App\\Models\\User',13,'web','48ea04aa9558350cd4bcc29461d5fb5317a347ec13daa34501530abc8e37f4ab','[\"*\"]',NULL,NULL,'2023-04-10 08:13:56','2023-04-10 08:13:56'),(122,'App\\Models\\User',13,'web','511cfde32fa2be52e15f500c3a87b3190f54ddf7cb383b7bd5194d86ffe21356','[\"*\"]',NULL,NULL,'2023-04-10 08:13:57','2023-04-10 08:13:57'),(123,'App\\Models\\User',13,'web','68f6471d10c756c23a9d33cd16cd3e3334a10277ecd9571444e73ef2277142e2','[\"*\"]',NULL,NULL,'2023-04-10 11:05:52','2023-04-10 11:05:52'),(124,'App\\Models\\User',13,'web','a6465c081e31020871f5b5006a69fa2dfd9d3d8dcc1dc76f491d45666a908dcf','[\"*\"]',NULL,NULL,'2023-04-10 22:59:51','2023-04-10 22:59:51'),(125,'App\\Models\\User',13,'web','fb4c1c84c5f434aaa14eb672d49dad30d6e2203c2ef3183fad894f6064615c65','[\"*\"]',NULL,NULL,'2023-04-12 00:55:24','2023-04-12 00:55:24'),(126,'App\\Models\\User',13,'web','80bfc19928216ec65919f02dc87d3e688a2a93b88c2ce42596d0a8f964166601','[\"*\"]',NULL,NULL,'2023-04-12 00:55:26','2023-04-12 00:55:26'),(127,'App\\Models\\User',13,'web','50c09c01a043147bf52bdec66ea559c7748ffbdce7c0f30f9e7f8b0bfadffaba','[\"*\"]',NULL,NULL,'2023-04-12 04:46:18','2023-04-12 04:46:18'),(128,'App\\Models\\User',13,'web','3eed2a00df01c6f5c885edff3d9e4b95adcc4833c9ed5b5520c00c9310f7acc5','[\"*\"]',NULL,NULL,'2023-04-13 04:17:37','2023-04-13 04:17:37'),(129,'App\\Models\\User',13,'web','400eb21a66550a760ead1f3a28121934bc2ce6430488d2a42e3c4101a1834f2f','[\"*\"]',NULL,NULL,'2023-04-13 04:17:38','2023-04-13 04:17:38'),(138,'App\\Models\\User',1,'web','5343f79c660497d79addda5a0f474e97f593a79330e60f47854aaaf681cdf8e5','[\"*\"]',NULL,NULL,'2023-04-14 04:56:25','2023-04-14 04:56:25'),(139,'App\\Models\\User',14,'web','0dbfa1458741dcb0444550c7a22a35f20bdba0ca8be25c340b8b0a7aa51790c0','[\"*\"]',NULL,NULL,'2023-04-14 07:48:26','2023-04-14 07:48:26'),(142,'App\\Models\\User',14,'web','e62205da48f55148989d5545bec35c3f53b6ac3131d9e1898342a7e687b81100','[\"*\"]',NULL,NULL,'2023-04-14 07:53:35','2023-04-14 07:53:35'),(143,'App\\Models\\User',14,'web','206c70670aceb64fc387353521da2d9751cdf5b71e106d32b013ef1d45df6532','[\"*\"]',NULL,NULL,'2023-04-14 23:31:13','2023-04-14 23:31:13'),(146,'App\\Models\\User',14,'web','7eb992fd3f32c48418a1c42f21f339067124cd5129b40992cdba16dc7d62c316','[\"*\"]',NULL,NULL,'2023-04-17 21:08:31','2023-04-17 21:08:31'),(147,'App\\Models\\User',14,'web','ce9c67051d9e36edd236b458da530d28734b24e480c37b4da77d22750b80ad0b','[\"*\"]',NULL,NULL,'2023-04-18 02:42:05','2023-04-18 02:42:05'),(148,'App\\Models\\User',14,'web','b150f384026a00b893924ebfbebc5aafbc2acf1fcf1c7cd4491c18dbb3211b0c','[\"*\"]',NULL,NULL,'2023-04-18 03:49:07','2023-04-18 03:49:07'),(152,'App\\Models\\User',14,'web','ff327a222b33c7eed4c7e968c705bd68e716dcde9daea9b68fb51e5351de0759','[\"*\"]',NULL,NULL,'2023-04-19 08:45:21','2023-04-19 08:45:21'),(153,'App\\Models\\User',14,'web','6d620a147772387fa59e328945ec34d2413ad3c31393a4fe2cb34484d9a174e0','[\"*\"]',NULL,NULL,'2023-04-19 10:23:05','2023-04-19 10:23:05'),(158,'App\\Models\\User',15,'web','7cd4dea9ec2eb433649c20b683b7162e988b393da1495afb372396829ae614ae','[\"*\"]',NULL,NULL,'2023-04-19 10:29:07','2023-04-19 10:29:07'),(165,'App\\Models\\User',16,'web','27b93e3423f75e99fe15b4bf49577b9e234bc2eda4d78ff481e10bbb42721be9','[\"*\"]',NULL,NULL,'2023-04-19 21:11:36','2023-04-19 21:11:36'),(169,'App\\Models\\User',14,'web','0b9338420d65430a98c8710afadb3262019b4fc8b894a3b8c931e184f05c2967','[\"*\"]',NULL,NULL,'2023-04-20 20:03:14','2023-04-20 20:03:14'),(173,'App\\Models\\User',17,'web','1808ea1d8d5872cf9e77fc082c9a8ae6562120ec20414222d6949cfd100e2dbb','[\"*\"]',NULL,NULL,'2023-04-21 11:30:52','2023-04-21 11:30:52'),(174,'App\\Models\\User',17,'web','198b84972f2686d748b7fbbcf6fe698be54e6fc58140ccb9a507deab39a6c853','[\"*\"]',NULL,NULL,'2023-04-21 11:30:53','2023-04-21 11:30:53'),(175,'App\\Models\\User',17,'web','41eef6e9789717fd1d037f4955d3f5a4fb4031e222fbd22443e3841e77b1bd50','[\"*\"]',NULL,NULL,'2023-04-21 11:31:51','2023-04-21 11:31:51'),(176,'App\\Models\\User',13,'web','43d787d0926c957f3c000e5f07cab124927246386098927b1be58f9145599b2c','[\"*\"]',NULL,NULL,'2023-04-21 12:14:12','2023-04-21 12:14:12'),(177,'App\\Models\\User',18,'web','b37530e7547ddd4f0ee2ef29cc34d29dacc363cbc3f993915a82d98472c256db','[\"*\"]',NULL,NULL,'2023-04-21 12:14:32','2023-04-21 12:14:32'),(178,'App\\Models\\User',18,'web','bae147b8cb4cd03ceaed04fca2a5bfabcf7c4cec600b4e10a7054c92788f3643','[\"*\"]',NULL,NULL,'2023-04-21 12:14:43','2023-04-21 12:14:43'),(180,'App\\Models\\User',19,'web','176b82f4a17924ba1d9b6818bc7d287fa531d675d01059b80702d8699bd86ddb','[\"*\"]',NULL,NULL,'2023-04-21 12:21:27','2023-04-21 12:21:27'),(183,'App\\Models\\User',20,'web','8c1c38f2d4a1a8d114d5a54eb7fd8e944a80e13b61edf965c9474992d2d391ea','[\"*\"]',NULL,NULL,'2023-04-23 08:56:33','2023-04-23 08:56:33'),(190,'App\\Models\\User',20,'web','1c2a977d3aebcf5d7fbacbb3eafcb9eb6460897b4b80a66c1b736fd8e873ce8e','[\"*\"]',NULL,NULL,'2023-04-24 04:37:45','2023-04-24 04:37:45'),(191,'App\\Models\\User',20,'web','d538e699e8c4409c205b8809a1f0efad699f95153866f4becc42a30c9e2b3cb6','[\"*\"]',NULL,NULL,'2023-04-24 07:01:25','2023-04-24 07:01:25'),(196,'App\\Models\\User',21,'web','b3f1152040948c5aeab5740b286e6487cb806e0d82f5ea6b4cfee4ce475bc261','[\"*\"]',NULL,NULL,'2023-04-24 19:30:30','2023-04-24 19:30:30'),(199,'App\\Models\\User',22,'web','b91a3f5b4ddcb63ecf6f41835d0d230b512b1dbdb69893a70dec02998ed4a0d0','[\"*\"]',NULL,NULL,'2023-04-24 23:35:34','2023-04-24 23:35:34'),(200,'App\\Models\\User',23,'web','99bca5d7e73b55166de67200b8fdcb8d69460e89514a61aa1b13b551cd3c96f9','[\"*\"]',NULL,NULL,'2023-04-25 21:36:54','2023-04-25 21:36:54'),(205,'App\\Models\\User',13,'web','f0b6ff146d1eaab00c79f05e5f5051bb81bd5a18e37e502e0e80b459b8e8ee55','[\"*\"]',NULL,NULL,'2023-04-27 00:27:33','2023-04-27 00:27:33'),(207,'App\\Models\\User',13,'web','07b1ca28500e5fe3ce2607f772e4d931b6bc497ef2a15d2509450ac20cf6d424','[\"*\"]',NULL,NULL,'2023-04-27 00:34:22','2023-04-27 00:34:22'),(209,'App\\Models\\User',13,'web','d419f695babf4f834ae76b9f3ea279f9cdf37e974cecdc049d3d7e7cb1c5ecb9','[\"*\"]',NULL,NULL,'2023-04-27 04:16:32','2023-04-27 04:16:32'),(210,'App\\Models\\User',13,'web','c9b4838adae39d21ac3e0303cd4c7ff0a950cdd6c6afd848a889c0ab98e7a442','[\"*\"]',NULL,NULL,'2023-04-27 05:39:42','2023-04-27 05:39:42'),(216,'App\\Models\\User',20,'web','93a991934d5816ad5f0ac5f5a0a74c8b408555fdaf75c57209398f5b2cb6e35b','[\"*\"]',NULL,NULL,'2023-04-27 20:37:20','2023-04-27 20:37:20'),(217,'App\\Models\\User',24,'web','3dbdbc8fbcfb5366c21a04c51bdcd170311b3fdcb78e1dfbc994b4bf7a3fca84','[\"*\"]',NULL,NULL,'2023-05-01 08:22:08','2023-05-01 08:22:08'),(221,'App\\Models\\User',25,'web','6b4ed1dd939c2f9ae1938186f639843b053e0dfe76ed6e1b0f8a89ac723ee963','[\"*\"]',NULL,NULL,'2023-05-01 08:26:42','2023-05-01 08:26:42'),(223,'App\\Models\\User',26,'web','bf3659c3b5a8ca210e0ef3713772e5349a1793258bbde3eb1a2d0f44a68f6492','[\"*\"]',NULL,NULL,'2023-05-01 08:29:38','2023-05-01 08:29:38'),(225,'App\\Models\\User',27,'web','1519334653aeff6ad21d15e639c76b08caf984111239c408c80627cf246e0dd4','[\"*\"]',NULL,NULL,'2023-05-01 08:32:31','2023-05-01 08:32:31'),(227,'App\\Models\\User',28,'web','ae320c812b20696241999942dbea1d9c080522fcbf16305a84bf44e34744ba38','[\"*\"]',NULL,NULL,'2023-05-01 08:39:57','2023-05-01 08:39:57'),(229,'App\\Models\\User',29,'web','f7d30b46a08a5c28760e40e6a9126b04486ff9cb8c31e0f71d7cea0a1f159557','[\"*\"]',NULL,NULL,'2023-05-01 08:53:20','2023-05-01 08:53:20'),(231,'App\\Models\\User',13,'web','0ad400707ea13ffeb411688abf2f3049627f1f8341dc666d2bade5635048445a','[\"*\"]',NULL,NULL,'2023-05-02 21:34:59','2023-05-02 21:34:59'),(232,'App\\Models\\User',30,'web','a3d4d42268c3c08d1076cfe382a1fca7e50eec10ed46b00d643dc83feeda5de4','[\"*\"]',NULL,NULL,'2023-05-02 21:42:25','2023-05-02 21:42:25'),(234,'App\\Models\\User',20,'web','4f07212778884b6eeba5911cc15dae53f5e03c15062f1a4f5170a488e545acf3','[\"*\"]',NULL,NULL,'2023-05-03 20:49:18','2023-05-03 20:49:18'),(235,'App\\Models\\User',20,'web','837b9ee1de8c51e892a50db44edf18aeb5e509879e368130062235a65d35f1f3','[\"*\"]',NULL,NULL,'2023-05-03 21:00:30','2023-05-03 21:00:30'),(236,'App\\Models\\User',20,'web','50f2558b5971c98d9aa25230c107be07ffc4b84be5f6f5f5d597108696f5d264','[\"*\"]',NULL,NULL,'2023-05-03 21:01:28','2023-05-03 21:01:28'),(238,'App\\Models\\User',31,'web','99daaf9a6f2a3b50b511db476ceb15c281439db555c080d8bf99c88dd2bbbb7b','[\"*\"]',NULL,NULL,'2023-05-03 22:03:47','2023-05-03 22:03:47'),(240,'App\\Models\\User',31,'web','93e4bd321ab24b954e8b1c9c288aedb6e96469824a93dfe64e30e9277368357d','[\"*\"]',NULL,NULL,'2023-05-03 22:05:03','2023-05-03 22:05:03'),(241,'App\\Models\\User',20,'web','7a3da5c4997ccab4c2587c924afd1925dbb61e5673ef0f15bab9ead75aa8607b','[\"*\"]',NULL,NULL,'2023-05-04 01:23:56','2023-05-04 01:23:56'),(242,'App\\Models\\User',20,'web','d7595ca74dd68664c24c5fcaa5e08bc9fb8c423c5b3ecd7708455684ca7e3516','[\"*\"]',NULL,NULL,'2023-05-04 03:31:31','2023-05-04 03:31:31'),(243,'App\\Models\\User',20,'web','ade32782e67209969819f7f1e9cd5e5a78a10f9352537e4bfacd048f5411e51f','[\"*\"]',NULL,NULL,'2023-05-05 08:02:46','2023-05-05 08:02:46'),(244,'App\\Models\\User',20,'web','6538844b0ae4ec3e4f8d936d75a38c5c126dc8193bc460e3f77bfed65e89d052','[\"*\"]',NULL,NULL,'2023-05-05 10:47:14','2023-05-05 10:47:14'),(245,'App\\Models\\User',20,'web','3e532434153f6f7fc73532c5f59998895f992d6d4a9fc6230556a6b410c24106','[\"*\"]',NULL,NULL,'2023-05-06 20:34:11','2023-05-06 20:34:11'),(248,'App\\Models\\User',20,'web','59374a20c2db478c910525eb14f92abd8c4f41e32cb36495acbe20dd379ecb62','[\"*\"]',NULL,NULL,'2023-05-08 03:08:54','2023-05-08 03:08:54'),(249,'App\\Models\\User',20,'web','c7656a32d648c0fae21c35ef7a34e006c1cc2048829d1c6de3340c09a5e41fb3','[\"*\"]',NULL,NULL,'2023-05-08 05:24:55','2023-05-08 05:24:55'),(250,'App\\Models\\User',32,'web','4355eb2867fe5c994167ecd05430ecbbb17ccb555c203d45bc698e5f8fbce9b2','[\"*\"]',NULL,NULL,'2023-05-12 08:37:08','2023-05-12 08:37:08'),(258,'App\\Models\\User',20,'web','795d79648f8705cc356818d1d6ff7b002f7a8fd05502e96d769ec651bdf9b77d','[\"*\"]',NULL,NULL,'2023-05-17 01:01:37','2023-05-17 01:01:37'),(259,'App\\Models\\User',20,'web','19f03426c7e4c4301585b6a07602b5abc13eee628a18390df4bc61274ad5408e','[\"*\"]',NULL,NULL,'2023-05-17 01:17:21','2023-05-17 01:17:21'),(260,'App\\Models\\User',20,'web','95260c89b05611f3a6f35cfcfef762fcae1ec956543eb6b19e13c27c88c81e51','[\"*\"]',NULL,NULL,'2023-05-17 01:18:32','2023-05-17 01:18:32'),(263,'App\\Models\\User',5,'web','b5520d0b5f96413758967816e1f62fcf835d35eddf60b6970cd1f5c02f4d2933','[\"*\"]',NULL,NULL,'2023-05-25 04:05:57','2023-05-25 04:05:57'),(264,'App\\Models\\User',5,'web','b667e5c71c59909197931e13f2601c4337b8cb32abbbe289f082d8009cc844ed','[\"*\"]',NULL,NULL,'2023-05-25 04:05:59','2023-05-25 04:05:59'),(265,'App\\Models\\User',13,'web','037075d4c2c4b079f65377970ce80f109d18acf92afd3e39aca20d3aaa5b8f80','[\"*\"]',NULL,NULL,'2023-12-27 00:24:46','2023-12-27 00:24:46');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `telefono` char(10) NOT NULL,
  `email` varchar(80) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'ARTURO','MORENO RUIZ','La Piedad Michoacán','4433953778','papantla@gmail.com','PAPANTLA'),(2,'RICARDO','ALVAREZ MUÑOZ','La Piedad Michoacán','4433953778','internos@gmail.com','INTERNOS'),(3,'PAULA','MENDEZ MONTES','La Piedad Michoacán','4433953778','externos@gmail.com','EXTERNOS'),(4,'AXEL','MENA RIOS','La Piedad Michoacán','4433953778','internos@gmail.com','INTERNOS');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_pagar` decimal(8,2) DEFAULT '0.00',
  `importe_promociones` decimal(7,2) DEFAULT '0.00',
  `importe_impuestos` decimal(7,2) DEFAULT '0.00',
  `cantidad_total` tinyint DEFAULT '0',
  `VENDEDORES_id` bigint unsigned NOT NULL,
  `CLIENTES_id` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TICKETS_VENDEDORES1_idx` (`VENDEDORES_id`),
  KEY `fk_TICKETS_CLIENTES1_idx` (`CLIENTES_id`),
  CONSTRAINT `fk_TICKETS_CLIENTES1` FOREIGN KEY (`CLIENTES_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_TICKETS_VENDEDORES1` FOREIGN KEY (`VENDEDORES_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (77,'2023-04-10 12:13:27',0.00,0.00,0.00,0,13,4),(78,'2023-04-10 12:14:10',NULL,NULL,NULL,NULL,13,4),(79,'2023-04-10 12:18:58',0.00,0.00,0.00,0,13,4),(80,'2023-04-10 12:19:38',780.00,0.00,107.59,1,13,4),(81,'2023-04-10 13:53:59',0.00,0.00,0.00,0,13,4),(82,'2023-04-10 13:54:14',0.00,0.00,0.00,0,13,4),(83,'2023-04-10 13:55:39',780.00,0.00,107.59,1,13,4),(84,'2023-04-10 13:58:13',NULL,NULL,NULL,NULL,13,4),(85,'2023-04-10 13:59:23',780.00,0.00,107.59,1,13,4),(86,'2023-04-10 14:05:31',780.00,0.00,107.59,1,13,4),(87,'2023-04-10 14:08:04',0.00,0.00,0.00,0,13,4),(88,'2023-04-10 14:08:52',0.00,0.00,0.00,0,13,4),(89,'2023-04-10 14:10:10',780.00,0.00,107.59,1,13,4),(90,'2023-04-10 14:12:27',780.00,0.00,107.59,1,13,4),(91,'2023-04-10 14:16:11',780.00,0.00,107.59,1,13,4),(92,'2023-04-10 14:18:18',1560.00,0.00,215.17,2,13,4),(93,'2023-04-10 14:20:07',780.00,0.00,107.59,1,13,4),(94,'2023-04-10 14:21:44',780.00,0.00,107.59,1,13,4),(95,'2023-04-10 14:27:32',780.00,0.00,107.59,1,13,4),(96,'2023-04-10 14:28:32',780.00,0.00,107.59,1,13,4),(97,'2023-04-10 14:31:20',780.00,0.00,107.59,1,13,4),(98,'2023-04-10 14:40:47',780.00,0.00,107.59,1,13,4),(99,'2023-04-10 14:42:16',1560.00,0.00,215.17,2,13,4),(100,'2023-04-10 14:43:20',780.00,0.00,107.59,1,13,4),(101,'2023-04-10 14:56:04',1560.00,0.00,215.17,2,13,4),(102,'2023-04-10 14:58:41',2340.00,0.00,322.76,3,13,4),(104,'2023-04-10 15:22:52',1560.00,0.00,215.17,2,13,4),(105,'2023-04-10 15:26:28',4680.00,0.00,645.52,6,13,4),(106,'2023-04-10 15:28:08',780.00,0.00,107.59,1,13,4),(107,'2023-04-10 15:31:19',780.00,0.00,107.59,1,13,4),(108,'2023-04-10 15:32:04',780.00,0.00,107.59,1,13,4),(109,'2023-04-10 16:22:41',780.00,0.00,107.59,1,13,4),(110,'2023-04-10 16:25:17',0.00,0.00,0.00,0,13,4),(114,'2023-04-10 17:27:04',0.00,0.00,0.00,0,13,4),(115,'2023-04-10 17:35:35',0.00,0.00,0.00,0,13,4),(117,'2023-04-10 17:36:48',780.00,0.00,107.59,1,13,4),(127,'2023-04-10 17:49:15',0.00,0.00,0.00,0,13,4),(130,'2023-04-10 18:00:03',780.00,0.00,107.59,1,13,4),(132,'2023-04-10 18:03:29',0.00,0.00,0.00,0,13,4),(133,'2023-04-10 18:36:12',0.00,0.00,0.00,0,13,4),(135,'2023-04-10 18:38:31',0.00,0.00,0.00,0,13,4),(137,'2023-04-10 18:40:09',780.00,0.00,107.59,1,13,4),(139,'2023-04-10 18:41:36',1560.00,0.00,215.17,2,13,4),(140,'2023-04-10 18:42:43',1560.00,0.00,215.17,2,13,4),(141,'2023-04-10 18:44:39',780.00,0.00,107.59,1,13,4),(142,'2023-04-10 18:47:36',1560.00,0.00,215.17,2,13,4),(143,'2023-04-10 18:48:59',1560.00,0.00,215.17,2,13,4),(144,'2023-04-10 18:49:59',780.00,0.00,107.59,1,13,4),(145,'2023-04-10 18:53:54',1560.00,0.00,215.17,2,13,4),(146,'2023-04-10 18:54:44',1560.00,0.00,215.17,2,13,4),(147,'2023-04-10 18:55:49',1560.00,0.00,215.17,2,13,4),(152,'2023-04-10 19:03:20',0.00,0.00,0.00,0,13,4),(154,'2023-04-10 19:09:17',0.00,0.00,0.00,0,13,4),(155,'2023-04-10 19:18:34',0.00,0.00,0.00,0,13,4),(157,'2023-04-10 19:22:05',0.00,0.00,0.00,0,13,4),(159,'2023-04-10 19:26:30',0.00,0.00,0.00,0,13,4),(161,'2023-04-10 19:28:52',1560.00,0.00,215.17,2,13,4),(162,'2023-04-10 19:30:59',0.00,0.00,0.00,0,13,4),(163,'2023-04-10 19:34:08',0.00,0.00,0.00,0,13,4),(165,'2023-04-10 19:35:46',780.00,0.00,107.59,1,13,4),(166,'2023-04-10 19:37:13',780.00,0.00,107.59,1,13,4),(167,'2023-04-10 19:46:13',1560.00,0.00,215.17,2,13,4),(170,'2023-04-10 19:51:47',780.00,0.00,107.59,1,13,4),(171,'2023-04-10 19:55:18',NULL,NULL,NULL,NULL,13,4),(172,'2023-04-10 19:55:35',NULL,NULL,NULL,NULL,13,4),(174,'2023-04-10 19:57:44',0.00,0.00,0.00,0,13,4),(175,'2023-04-10 19:59:51',0.00,0.00,0.00,0,13,4),(176,'2023-04-10 20:08:10',NULL,NULL,NULL,NULL,13,4),(181,'2023-04-11 12:59:59',0.00,0.00,0.00,0,13,4),(183,'2023-04-11 14:53:47',0.00,0.00,0.00,0,13,4),(185,'2023-04-12 23:08:45',NULL,NULL,NULL,NULL,13,4),(188,'2023-04-13 12:40:27',NULL,NULL,NULL,NULL,13,4),(190,'2023-04-13 12:42:12',NULL,NULL,NULL,NULL,13,4),(191,'2023-04-13 12:45:09',NULL,NULL,NULL,NULL,13,4),(192,'2023-04-13 14:41:21',NULL,NULL,NULL,NULL,13,4),(194,'2023-04-13 19:55:13',780.00,0.00,107.59,1,14,10),(195,'2023-04-13 20:03:35',2340.00,0.00,322.76,3,14,10),(196,'2023-04-13 20:10:08',4158.00,0.00,573.51,4,14,10),(200,'2023-04-14 12:05:45',0.00,0.00,0.00,0,14,4),(201,'2023-04-14 12:06:27',0.00,0.00,0.00,0,14,5),(204,'2023-04-14 12:09:35',1560.00,0.00,215.17,2,14,4),(206,'2023-04-14 12:18:44',9360.00,0.00,1291.04,12,14,4),(208,'2023-04-14 12:31:45',3120.00,0.00,430.34,4,14,4),(211,'2023-04-14 12:46:01',3900.00,0.00,537.93,5,14,4),(214,'2023-04-14 12:55:23',0.00,0.00,0.00,0,14,4),(215,'2023-04-14 12:55:42',0.00,0.00,0.00,0,14,4),(220,'2023-04-14 13:06:41',1560.00,0.00,215.17,2,14,4),(222,'2023-04-14 13:10:00',1560.00,0.00,215.17,2,14,4),(223,'2023-04-14 13:11:47',3900.00,0.00,537.93,5,14,4),(238,'2023-04-14 13:41:50',780.00,0.00,107.59,1,14,4),(241,'2023-04-14 13:48:43',780.00,0.00,107.59,1,14,4),(247,'2023-04-14 14:08:09',780.00,0.00,107.59,1,14,4),(252,'2023-04-14 14:18:08',780.00,0.00,107.59,1,14,4),(253,'2023-04-14 14:20:21',780.00,0.00,107.59,1,14,4),(255,'2023-04-14 14:21:26',780.00,0.00,107.59,1,14,4),(264,'2023-04-14 14:33:21',780.00,0.00,107.59,1,14,4),(267,'2023-04-14 14:36:00',780.00,0.00,107.59,1,14,4),(269,'2023-04-14 14:56:58',780.00,0.00,107.59,1,14,4),(278,'2023-04-14 15:38:23',780.00,0.00,107.59,1,14,4),(279,'2023-04-14 15:39:53',780.00,0.00,107.59,1,14,4),(285,'2023-04-14 15:51:46',780.00,0.00,107.59,1,14,4),(287,'2023-04-14 15:56:19',780.00,0.00,107.59,1,14,4),(288,'2023-04-14 15:57:59',780.00,0.00,107.59,1,14,4),(289,'2023-04-14 15:59:11',780.00,0.00,107.59,1,14,4),(290,'2023-04-14 16:01:53',780.00,0.00,107.59,1,14,4),(291,'2023-04-14 16:03:35',780.00,0.00,107.59,1,14,4),(292,'2023-04-14 16:07:10',780.00,0.00,107.59,1,14,4),(295,'2023-04-14 16:15:42',780.00,0.00,107.59,1,14,4),(297,'2023-04-14 16:17:18',780.00,0.00,107.59,1,14,4),(298,'2023-04-14 16:19:36',780.00,0.00,107.59,1,14,4),(300,'2023-04-14 16:23:18',780.00,0.00,107.59,1,14,4),(302,'2023-04-14 16:27:57',780.00,0.00,107.59,1,14,4),(303,'2023-04-14 16:30:18',780.00,0.00,107.59,1,14,4),(306,'2023-04-14 16:34:43',780.00,0.00,107.59,1,14,4),(311,'2023-04-15 00:13:04',NULL,NULL,NULL,NULL,13,4),(316,'2023-04-17 09:18:56',0.00,0.00,0.00,0,14,4),(317,'2023-04-17 09:19:37',780.00,0.00,107.59,1,14,5),(318,'2023-04-17 09:21:52',780.00,0.00,107.59,1,14,4),(319,'2023-04-17 09:34:31',780.00,0.00,107.59,1,14,4),(320,'2023-04-17 09:35:27',780.00,0.00,107.59,1,14,4),(321,'2023-04-17 09:35:54',780.00,0.00,107.59,1,14,4),(322,'2023-04-17 09:40:14',780.00,0.00,107.59,1,14,4),(323,'2023-04-17 09:41:32',780.00,0.00,107.59,1,14,4),(325,'2023-04-18 09:21:39',780.00,0.00,107.59,1,14,4),(326,'2023-04-18 09:25:55',780.00,0.00,107.59,1,14,5),(327,'2023-04-19 16:42:30',2340.00,0.00,322.76,3,14,4),(328,'2023-04-20 10:33:43',NULL,NULL,NULL,NULL,1,4),(329,'2023-04-22 21:11:15',0.00,0.00,0.00,0,20,4),(331,'2023-04-26 18:02:04',0.00,0.00,0.00,0,13,4),(341,'2023-04-26 18:08:46',780.00,0.00,107.59,1,13,8),(347,'2023-04-26 18:15:07',780.00,0.00,107.59,1,13,6),(348,'2023-04-26 18:19:12',0.00,0.00,0.00,0,13,6),(349,'2023-04-26 18:19:39',0.00,0.00,0.00,0,13,6),(350,'2023-04-26 18:20:14',0.00,0.00,0.00,0,13,7),(352,'2023-04-26 18:41:21',1560.00,0.00,215.17,2,13,12),(353,'2023-04-26 20:10:48',780.00,0.00,107.59,1,13,4),(354,'2023-04-26 20:18:49',780.00,0.00,107.59,1,1,4),(355,'2023-04-27 09:39:18',3900.00,0.00,537.93,5,20,4),(356,'2023-04-27 09:45:03',1560.00,0.00,215.17,2,20,4),(357,'2023-04-27 09:52:16',3900.00,0.00,537.93,5,20,4),(358,'2023-04-27 10:06:40',3900.00,0.00,537.93,5,20,4),(359,'2023-04-27 10:20:17',3900.00,0.00,537.93,5,20,4),(360,'2023-04-27 10:28:41',7995.00,0.00,1102.76,5,20,4),(361,'2023-04-27 10:35:56',3900.00,0.00,537.93,5,20,4),(362,'2023-04-27 10:43:57',3900.00,0.00,537.93,5,20,4),(364,'2023-04-27 11:00:01',780.00,0.00,107.59,1,20,4),(365,'2023-04-27 11:20:18',6495.00,0.00,895.86,5,20,4),(366,'2023-04-27 11:26:09',1560.00,0.00,215.17,2,20,4),(367,'2023-04-27 11:33:47',3198.00,0.00,441.10,2,20,4),(368,'2023-04-27 11:39:13',0.00,0.00,0.00,0,20,4),(369,'2023-04-27 11:44:48',1560.00,0.00,215.17,2,20,4),(370,'2023-04-27 12:20:53',780.00,0.00,107.59,1,20,4),(371,'2023-04-27 12:26:07',3120.00,0.00,430.34,4,20,4),(372,'2023-04-27 12:32:43',780.00,0.00,107.59,1,20,4),(373,'2023-04-27 12:43:49',780.00,0.00,107.59,1,20,4),(374,'2023-04-27 12:57:36',780.00,0.00,107.59,1,20,4),(375,'2023-04-27 13:05:46',3198.00,0.00,441.10,2,20,4),(376,'2023-04-27 13:19:30',780.00,0.00,107.59,1,20,4),(377,'2023-04-27 14:08:57',1560.00,0.00,215.17,2,20,4),(380,'2023-05-01 18:47:28',0.00,0.00,0.00,0,29,4),(381,'2023-05-01 18:48:17',0.00,0.00,0.00,0,29,8),(382,'2023-05-01 18:49:14',1560.00,0.00,215.17,2,29,4),(386,'2023-05-01 21:17:29',0.00,0.00,0.00,0,29,4),(390,'2023-05-01 21:26:22',0.00,0.00,0.00,0,29,4),(391,'2023-05-01 21:27:16',0.00,0.00,0.00,0,29,4),(392,'2023-05-01 21:30:21',0.00,0.00,0.00,0,29,4),(397,'2023-05-01 21:35:05',0.00,0.00,0.00,0,29,4),(398,'2023-05-01 21:37:17',0.00,0.00,0.00,0,29,4),(399,'2023-05-01 21:39:00',0.00,0.00,0.00,0,29,4),(404,'2023-05-02 09:43:47',780.00,0.00,107.59,1,30,4),(405,'2023-05-03 09:22:22',780.00,0.00,107.59,1,20,4),(412,'2023-05-03 09:34:25',780.00,0.00,107.59,1,20,4),(413,'2023-05-03 09:35:28',780.00,0.00,107.59,1,20,4),(415,'2023-05-03 13:39:20',780.00,0.00,107.59,1,20,4),(416,'2023-05-03 13:45:54',780.00,0.00,107.59,1,20,4),(419,'2023-05-03 13:49:40',780.00,0.00,107.59,1,20,4),(420,'2023-05-03 13:50:53',780.00,0.00,107.59,1,20,4),(421,'2023-05-03 13:54:22',780.00,0.00,107.59,1,20,4),(422,'2023-05-03 15:31:38',780.00,0.00,107.59,1,20,4),(423,'2023-05-03 15:32:10',780.00,0.00,107.59,1,20,4),(424,'2023-05-03 15:33:16',780.00,0.00,107.59,1,20,4),(430,'2023-05-16 13:19:28',1560.00,0.00,215.17,2,20,4),(431,'2023-12-26 12:24:53',780.00,0.00,107.59,1,13,4),(432,'2023-12-26 12:25:29',780.00,0.00,107.59,1,13,4);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `domicilio` varchar(80) NOT NULL,
  `telefono` char(10) NOT NULL,
  `rfc` char(13) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfc_UNIQUE` (`rfc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (1,'GANGBRAND','LA PIEDAD MICHOACAN','3521122358','GBD20220501G2'),(3,'GENIMA','LA PIEDAD MICHOACAN','3521325380','GNM20220501G2');
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juan','juan@gmail.com',NULL,'$2y$10$DBSyzVVHeMW7SqzqNIi0teGFhRGrj1YuTU4Mc13k2ldLq9dgX3KE2',NULL,'2023-03-08 21:49:17','2023-05-16 21:19:58'),(2,'Pablo','Pablo@gmail.com',NULL,'$2y$10$mkRWSUHDkPZrOWvLpfjgkeeMPer4WWmWeax.t5nBmNtNH3HEw.L3e',NULL,'2023-03-08 21:53:30','2023-03-08 21:53:30'),(3,'Pablo2','Pablo2@gmail.com',NULL,'$2y$10$166uJuK2Zn64VGUqjW1efe0nIUz7uXcqvKUQCWepwKBsssvIS95Y2',NULL,'2023-03-08 22:07:08','2023-03-08 22:07:08'),(4,'Arturo','Arturo@gmail.com',NULL,'$2y$10$/0gTRlz5HxidY/STWDkabOfReAOg2H15v9QXNBD354QZRml8N5lZm',NULL,'2023-03-13 21:47:23','2023-03-13 21:47:23'),(5,'Ana','Ana@gmail.com',NULL,'$2y$10$999JZFyJ0W2Y1NPVVmVa0eyXQYCeeAGCcYBrj.w1aE2rq8epehMNK',NULL,'2023-03-13 21:55:18','2023-03-13 21:55:18'),(6,'Moy','Moy@gmail.com',NULL,'$2y$10$JVTD9eNyPmoZ6AqZiVfOAeSgcE/nETpnq0g9inuDKwRxIZAXuKnF2',NULL,'2023-03-14 21:41:28','2023-03-14 21:41:28'),(7,'Pau','pau@gmail.com',NULL,'$2y$10$u0QJb1gzTnw927pmLXA0O..IejAyNxc6xiHRqNL2./3qrEBYjbz1a',NULL,'2023-03-15 22:01:16','2023-03-15 22:01:16'),(8,'pedro','pedro@gmail.com',NULL,'$2y$10$bj0053nDxUMurkF8CSM8EOnjpJ20w5QTvYvWiCqEc0zLfNoeUTSdy',NULL,'2023-03-20 08:24:35','2023-03-20 08:26:32'),(9,'nico','nico@gmail.com',NULL,'$2y$10$dB9WCNgqsVAddOl0pdKu1.2Os1HV3ldr1eWAT704phU0fIreKxRaG',NULL,'2023-03-21 21:46:23','2023-04-14 04:55:54'),(11,'leafar','leafar@gmail.com',NULL,'$2y$10$8ayHc1IstjxE4CZZE91jD.bTOPZLm7cfbigQoEyfKDV/rHUKV41/q',NULL,'2023-03-22 06:33:50','2023-04-24 19:31:37'),(12,'Laura','laura@gmail.com',NULL,'$2y$10$P7RiJVfL2XiXadoRTNij1OoEvGrv/pCL3XwtMnOGOcksO7qveK1ni',NULL,'2023-03-27 11:04:11','2023-03-27 11:04:11'),(13,'1','1@gmail.com',NULL,'$2y$10$9Odn6gfn/2wkBNtBRPuKXuL99jl93W9ZJCPPwLgNpvxKWBkUYm2jq',NULL,'2023-04-10 08:13:56','2023-12-27 00:24:23'),(14,'Genesis','Genesis@gmail.com',NULL,'$2y$10$X4u0m6Nakul2g47LoRSn1uPTlgCiH5Kgdo360Q4kPpPX2Dm662wUS',NULL,'2023-04-14 07:48:26','2023-04-14 07:53:49'),(15,'paul','paul@gmail.com',NULL,'$2y$10$wrPzBcCef71lmD7Tm8N/gOU/V8mOUxoje1PBI9f8mtA.CjkdSBiEe',NULL,'2023-04-19 10:29:07','2023-04-19 10:29:07'),(16,'rogelio','rogelio@gmail.com',NULL,'$2y$10$1/VObWPk6Wn5gVEwH3FPBOHYO0kbzglpx0mK8tbnR7AuvGZ6gTGLm',NULL,'2023-04-19 21:11:36','2023-04-19 21:11:36'),(17,'11','11@gmail.com',NULL,'$2y$10$9f5hmYPbxKUMXFn5.je83uZwr8YDMtypcmNHct5SkdIWaYCCKhPrm',NULL,'2023-04-21 11:30:52','2023-04-21 11:33:58'),(18,'any','any@gmail.com',NULL,'$2y$10$uAfNFxZ2HBIUFp.dO61bX.3Q0xhJ4be.OcQBPcLEt8DQ.MTZ74AVi',NULL,'2023-04-21 12:14:32','2023-04-21 12:14:32'),(19,'paulina','paulina@gmail.com',NULL,'$2y$10$29k3nhqBRdft4DIqfkWpQeUCzSi1Dy290wKN3NqqpsQP66sEwteD6',NULL,'2023-04-21 12:21:27','2023-04-21 12:21:27'),(20,'nicole','nicole@gmail.com',NULL,'$2y$10$C39qJAfRr9YPakqV/qiUheLWIEQwR7WHuTXEngBbLCuy7vVA0fl.y',NULL,'2023-04-23 08:56:33','2023-05-03 21:09:40'),(21,'Guillermo','guillermo@gmail.com',NULL,'$2y$10$r7OLnKTZYSuVj88DUG0DW.Th7T2HsAE0UcPF9ePFNP/W93vGoWEBq',NULL,'2023-04-24 19:30:30','2023-04-24 19:30:30'),(22,'2','2@gmail.com',NULL,'$2y$10$eYe2P/bA9i3uYrgB5gcIQOTnAEXlsF.IKbhk4Jt9qX4Kx3SVjiQBu',NULL,'2023-04-24 23:35:34','2023-04-24 23:35:34'),(23,'pipi','pipi@gmail.com',NULL,'$2y$10$fQH8B3bPPvLrjr8vncCb7eDUvbl1YcyIij/8i251ToK3AmN/cOdW2',NULL,'2023-04-25 21:36:54','2023-04-25 21:37:42'),(24,'Camilo','camilo@gmail.com',NULL,'$2y$10$ogExtDKyVPiTPNlEIKduOeedd4exbR57GWjTp9wP.7H46FtoLCksy',NULL,'2023-05-01 08:22:08','2023-05-01 08:22:08'),(25,'Arturo','Arturo2@gmail.com',NULL,'$2y$10$U42IiWkfrhEXHDqBapzHCOhONCplsuHf.C8RwrHTJT265YQ0sj/Rm',NULL,'2023-05-01 08:26:42','2023-05-01 08:26:42'),(26,'Arturo','Arturo3@gmail.com',NULL,'$2y$10$traJ.XQH633oZBl0Vu2Q9Oibz9gywlNZhQWNA2u8r479fv1yrHepq',NULL,'2023-05-01 08:29:38','2023-05-01 08:29:38'),(27,'Arturo','Arturo4@gmail.com',NULL,'$2y$10$Q.uAiDlrIWxJZYc4tSZHNehXUal68z5e1v6WzH/V9eMpXJsZOV0.e',NULL,'2023-05-01 08:32:31','2023-05-01 08:32:31'),(28,'Arturo','arturo5@gmail.com',NULL,'$2y$10$JDuLWT9saz3fOhil2UkWK.i1p7p5h7apgAOIq8Pi.u1jxBqoIvhAu',NULL,'2023-05-01 08:39:57','2023-05-01 08:39:57'),(29,'Arturo6','arturo6@gmail.com',NULL,'$2y$10$SJGwil9fkHBbKa8v.adLP.5.TP0eWyAn5yqd1ve03d40W.3KZgzYS',NULL,'2023-05-01 08:53:20','2023-05-01 08:53:20'),(30,'3','3@gmail.com',NULL,'$2y$10$hbHtnTFGnd9Wofp.yW4cVuYr61XN5u3k4l/HrDQT3labZxbCdGbqK',NULL,'2023-05-02 21:42:25','2023-05-02 21:42:25'),(31,'alan','alan2@gmail.com',NULL,'$2y$10$wgLA20zx8Cqs1clZKdqK1elpWrUbLbHA9SRZuhfoBFBRH4q49E2Xy',NULL,'2023-05-03 22:03:47','2023-05-03 22:03:47'),(32,'Ricardo','ricardo@gmail.com',NULL,'$2y$10$LOss6PS19ammxUhNE0uOeOM5XhE1aQ5Tz3GjYyz87uDZtD0X0ncy.',NULL,'2023-05-12 08:37:08','2023-05-12 08:40:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email_copy1` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password_copy1` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bdcobranza'
--

--
-- Dumping routines for database 'bdcobranza'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-26 12:36:34
