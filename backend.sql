/*
SQLyog Community v13.1.8 (64 bit)
MySQL - 8.0.17 : Database - amazon_pinia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`amazon_pinia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `amazon_pinia`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `categorias` */

insert  into `categorias`(`id`,`nombre`) values 
(1,'Electronicos'),
(2,'Belleza'),
(3,'Auto');

/*Table structure for table `detalles_carrito` */

DROP TABLE IF EXISTS `detalles_carrito`;

CREATE TABLE `detalles_carrito` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cantidad` tinyint(3) unsigned NOT NULL,
  `precio` decimal(7,2) unsigned NOT NULL,
  `importe` decimal(8,2) GENERATED ALWAYS AS ((`cantidad` * `precio`)) VIRTUAL,
  `Productos_id` mediumint(8) unsigned NOT NULL,
  `Usuario_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Detalles_Carrito_Productos1_idx` (`Productos_id`),
  KEY `fk_Detalles_Carrito_Usuario1_idx` (`Usuario_id`),
  CONSTRAINT `fk_Detalles_Carrito_Productos1` FOREIGN KEY (`Productos_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `fk_Detalles_Carrito_Usuario1` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`id`)
);

/*Data for the table `detalles_carrito` */

insert  into `detalles_carrito`(`id`,`cantidad`,`precio`,`Productos_id`,`Usuario_id`) values 
(1,1,10999.00,1,1),
(3,1,900.00,13,2),
(4,1,11999.00,2,2),
(5,1,1999.00,15,3),
(6,1,1499.00,14,3),
(7,4,398.00,10,4),
(8,2,438.00,9,4),
(9,1,999.00,7,5),
(10,2,599.00,8,5),
(11,2,2499.00,11,6),
(12,4,3499.00,12,6),
(13,1,10999.00,1,2),
(14,1,10999.00,1,3),
(15,1,10999.00,1,4),
(16,1,1499.00,14,2),
(17,1,1999.00,15,1),
(18,1,1999.00,15,5),
(19,1,1999.00,15,6),
(20,1,999.00,7,1);

/*Table structure for table `detalles_lista` */

DROP TABLE IF EXISTS `detalles_lista`;

CREATE TABLE `detalles_lista` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Listas_id` mediumint(8) unsigned NOT NULL,
  `Productos_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Detalles_Lista_Listas1_idx` (`Listas_id`),
  KEY `fk_Detalles_Lista_Productos1_idx` (`Productos_id`),
  CONSTRAINT `fk_Detalles_Lista_Listas1` FOREIGN KEY (`Listas_id`) REFERENCES `listas` (`id`),
  CONSTRAINT `fk_Detalles_Lista_Productos1` FOREIGN KEY (`Productos_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detalles_lista` */

/*Table structure for table `detalles_pedido` */

DROP TABLE IF EXISTS `detalles_pedido`;

CREATE TABLE `detalles_pedido` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cantidad` tinyint(4) NOT NULL,
  `precio` decimal(7,2) unsigned NOT NULL,
  `importe` decimal(8,2) GENERATED ALWAYS AS ((`cantidad` * `precio`)) VIRTUAL,
  `Pedidos_id` mediumint(8) unsigned NOT NULL,
  `Productos_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Detalles_Pedido_Pedidos1_idx` (`Pedidos_id`),
  KEY `fk_Detalles_Pedido_Productos1_idx` (`Productos_id`),
  CONSTRAINT `fk_Detalles_Pedido_Pedidos1` FOREIGN KEY (`Pedidos_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `fk_Detalles_Pedido_Productos1` FOREIGN KEY (`Productos_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `detalles_pedido` */

insert  into `detalles_pedido`(`id`,`cantidad`,`precio`,`Pedidos_id`,`Productos_id`) values 
(1,1,10999.00,1,1),
(2,3,272.00,1,6),
(3,1,1999.00,1,15),
(4,1,900.00,2,13),
(5,1,11999.00,2,2),
(6,1,10999.00,2,1),
(7,1,1499.00,2,14),
(8,1,1999.00,4,15),
(9,1,1499.00,4,14),
(10,1,10999.00,4,1),
(11,4,398.00,5,10),
(12,2,438.00,5,9),
(13,1,10999.00,5,1),
(14,1,999.00,6,7),
(15,2,599.00,6,8),
(16,1,1999.00,6,15),
(17,1,10999.00,7,1),
(18,1,1999.00,7,15),
(19,1,999.00,7,7);

/*Table structure for table `direcciones` */

DROP TABLE IF EXISTS `direcciones`;

CREATE TABLE `direcciones` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `calle` varchar(45) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `colonia` varchar(45) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `estado` char(6) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `Usuario_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Direcciones_Usuario1_idx` (`Usuario_id`),
  CONSTRAINT `fk_Direcciones_Usuario1` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `direcciones` */

insert  into `direcciones`(`id`,`calle`,`numero`,`colonia`,`cp`,`estado`,`ciudad`,`Usuario_id`) values 
(1,'juan rodriguez vega','100','centro','59300','Mich','La Piedad',1),
(2,'juarez','89','centro','59300','Mich','La Piedad',1),
(4,'mariano jimenez','62','centro','59300','Mich','La Piedad',2),
(5,'Gomez farias','54','centro','59300','Mich','La Piedad',2),
(6,'Melgoza','630','centro','59300','Mich','La Piedad',3),
(7,'Obogono','720','centro','59300','Mich','La Piedad',3),
(8,'Prolongacion la luna','1437','Cuidad del Sol','59310','Mich','La Piedad',4),
(9,'Apolo','1247','Cuidad del Sol','59310','Mich','La Piedad',4),
(11,'galaxias','1982','Cuidad del Sol','59310','Mich','La Piedad',5),
(12,'rosas','4320','Cuidad del Sol','59310','Mich','La Piedad',5);

/*Table structure for table `envios` */

DROP TABLE IF EXISTS `envios`;

CREATE TABLE `envios` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_entrega` datetime DEFAULT NULL,
  `fecha_envio` datetime NOT NULL,
  `estado` char(1) NOT NULL COMMENT 'E = enviado, C = En Camino, R = Recibido',
  `numero_seguimiento` char(20) NOT NULL,
  `Direcciones_id` mediumint(8) unsigned NOT NULL,
  `Pedidos_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Envios_Direcciones1_idx` (`Direcciones_id`),
  KEY `fk_Envios_Pedidos1_idx` (`Pedidos_id`),
  CONSTRAINT `fk_Envios_Direcciones1` FOREIGN KEY (`Direcciones_id`) REFERENCES `direcciones` (`id`),
  CONSTRAINT `fk_Envios_Pedidos1` FOREIGN KEY (`Pedidos_id`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `envios` */

insert  into `envios`(`id`,`fecha_entrega`,`fecha_envio`,`estado`,`numero_seguimiento`,`Direcciones_id`,`Pedidos_id`) values 
(1,'2022-12-09 12:00:00','2022-12-07 18:00:00','E','1',1,1),
(2,'2022-12-09 12:15:00','2022-12-07 18:00:00','E','2',4,2),
(4,'2022-12-10 12:30:00','2022-12-07 18:00:00','E','4',6,4),
(5,'2022-12-10 12:30:00','2022-12-07 18:00:00','S','5',8,5),
(6,'2022-12-18 12:30:00','2022-12-07 18:00:00','D','6',11,6);

/*Table structure for table `listas` */

DROP TABLE IF EXISTS `listas`;

CREATE TABLE `listas` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_listas` varchar(60) NOT NULL,
  `Usuario_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Listas_Usuario1_idx` (`Usuario_id`),
  CONSTRAINT `fk_Listas_Usuario1` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `listas` */

/*Table structure for table `metodos_pago` */

DROP TABLE IF EXISTS `metodos_pago`;

CREATE TABLE `metodos_pago` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `metodos_pago` */

insert  into `metodos_pago`(`id`,`nombre`) values 
(1,'Tarjeta Credito'),
(2,'Tarjeta Debito'),
(3,'Efectivo'),
(4,'Dep.Bancario');

/*Table structure for table `pedidos` */

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `numero` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `importe_producto` decimal(9,2) unsigned NOT NULL,
  `importe_envio` decimal(6,2) unsigned NOT NULL,
  `importe_iva` decimal(6,2) GENERATED ALWAYS AS ((`importe_producto` * 0.16)) VIRTUAL,
  `total` decimal(9,2) GENERATED ALWAYS AS (((`importe_producto` + `importe_envio`) + `importe_iva`)) VIRTUAL,
  `importre_pagado` decimal(9,2) unsigned DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `Usuario_id` smallint(5) unsigned NOT NULL,
  `Metodo_pago_id` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Pedidos_Usuario1_idx` (`Usuario_id`) /*!80000 INVISIBLE */,
  KEY `fk_Pedidos_Metodos_pago1_idx` (`Metodo_pago_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_Pedidos_Metodos_pago1` FOREIGN KEY (`Metodo_pago_id`) REFERENCES `metodos_pago` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Pedidos_Usuario1` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `pedidos` */

insert  into `pedidos`(`id`,`fecha`,`numero`,`importe_producto`,`importe_envio`,`importre_pagado`,`fecha_pago`,`Usuario_id`,`Metodo_pago_id`) values 
(1,'2022-12-05 00:00:00','1',13814.00,50.00,13755.40,'2022-12-05 10:00:00',1,1),
(2,'2022-12-05 00:00:00','2',35897.00,50.00,41690.52,'2022-12-05 09:02:00',2,1),
(4,'2022-12-05 00:00:00','4',14497.00,50.00,16866.52,'2022-12-05 08:50:22',3,2),
(5,'2022-12-05 00:00:00','5',13467.00,50.00,15671.72,'2022-12-05 08:50:22',4,4),
(6,'2022-12-05 00:00:00','6',4196.00,50.00,4917.36,'2022-12-05 09:54:28',5,3),
(7,'2023-01-13 10:52:01','99959438-9362-11ed-b13b-9828a601e1dc',13997.00,99.99,NULL,NULL,1,NULL);

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `precio` decimal(7,2) unsigned NOT NULL,
  `color` char(2) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `descripcion` varchar(120) NOT NULL,
  `peso` decimal(4,2) unsigned NOT NULL,
  `dimensiones` varchar(20) DEFAULT NULL,
  `Categorias_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Productos_Categorias1_idx` (`Categorias_id`),
  CONSTRAINT `fk_Productos_Categorias1` FOREIGN KEY (`Categorias_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `productos` */

insert  into `productos`(`id`,`nombre`,`precio`,`color`,`marca`,`descripcion`,`peso`,`dimensiones`,`Categorias_id`) values 
(1,'Telefono Xiaomi note 9s',10999.00,'bl','Xiaomi','Xiaomi note 9s, 256 gb de almacemanimento, 8 ram',0.20,'6.2*2*.5',1),
(2,'Telefono Xiaomi note 10s',11999.00,'bl','Xiaomi','Xiaomi note 10s, 128 gb de almacemanimento, 6 ram',0.20,'6.2*2*.5',1),
(3,'Telefono Xiaomi poco M4',8000.00,'az','Xiaomi','Xiaomi poco M4, 128 gb de almacemanimento, 6 ram',0.20,'6.2*2*.5',1),
(4,'Telefono Xiaomi poco M4 Pro',14999.00,'dr','Xiaomi','Xiaomi poco M4 Pro, 256 gb de almacemanimento, 8 ram',0.20,'6.4*2*.5',1),
(5,'Televisión Hissense 65',22999.00,'ng','Hissense','Televisión Hissense 65,4k con roku',10.00,'65*45*2 pugadas',1),
(6,'Nivea Sun Protector Solar Facial Control De Brillo ',272.00,'bl','Nivea','Nivea Sun Protector Solar Facial Control De Brillo (50 ml), con Efecto Matificante de Larga Duración',0.07,'4.3 x 3.2 x 13.1 cm',2),
(7,'PHILIPS OneBlade híbrida QP2520/30 ',999.00,'vd','PHILIPS','PHILIPS OneBlade híbrida QP2520/30, Recorta, afeita y perfila Cualquier Longitud de Vello, con 3 peines guía Removibles.',0.33,'18 x 20.55 x 6 cm',2),
(8,'La Roche Posay Effaclar Gel Purificante ',599.00,'az','La Roche Posay ','La Roche Posay Effaclar Gel Purificante Gel Limpiador Facial para Piel Grasa, 400 ml',0.40,'6 x 6 x 6 cm',2),
(9,'Vichy Mineral 89 ',438.00,'az','Vichy ','Vichy Mineral 89',0.21,'3.25x4.95x13.25cm',2),
(10,'Serum Vitamina C + Ácido Hialurónico + Vitamina E ',398.00,'cf','Serum ','Serum Vitamina C + Ácido Hialurónico + Vitamina E | 95% Ingredientes Naturales | Skin Care | Luminosidad',0.08,'2.79x3.05x10.16cm',2),
(11,'Llantas Continect 195/65 R15 ',2499.00,'ng','Continect','Llantas Continect primer 195/65 R15 91H ',2.00,'195*65*20',3),
(12,'Llantas Bridgestone 205/60 R16 ',3499.00,'ng','Bridgestone','Llantas Bridgestone 205/60 R16 92H ',2.00,'205*60*20',3),
(13,'Aceite Movil 5L ',900.00,'gs','Movil','Aceite Movil 5L 20w-50 multigrado ',5.00,'40*20*10',3),
(14,'Frenos Boge Nissan sentra 2002 delanteros ',1499.00,'ng','Boge','Frenos Boge Nissan sentra 2002 delanteros, alta durabilidad ',2.00,'30*15*10',3),
(15,'Bujias Boge Iridium sentra 2002 ',1999.00,'ng','Boge','Bujias Boge Iridium sentra 2002 1.8 L Doble Iridium ',0.80,'20*15*10',3);

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` char(10) NOT NULL,
  `sexo` char(1) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `contrasena` char(10) NOT NULL,
  `subtotal` decimal(9,2) DEFAULT '0.00',
  `cantidad_productos` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `usuario` */

insert  into `usuario`(`id`,`nombre`,`email`,`telefono`,`sexo`,`fecha_nacimiento`,`contrasena`,`subtotal`,`cantidad_productos`) values 
(1,'Ezequiel','ezequiel@gmail.com','3521531718','H','2003-09-15','123',13997.00,3),
(2,'Juan Perez','juancho@gmail.com','3525222015','H','1980-06-12','12345',35897.00,4),
(3,'Luis Javier','guicho@gmail.com','3525234152','H','2003-07-10','guicho',14497.00,3),
(4,'Carlos Martinez','thereman@gmail.com','3521531756','H','2003-11-09','123456',13467.00,7),
(5,'Jose Angel','joselito@gmail.com','3525221478','H','2003-08-07','joselito',4196.00,4),
(6,'Angel David','mataviejitas@gmail.com','3525221479','H','2001-09-22','david',20993.00,7);

/* Trigger structure for table `detalles_carrito` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `detalles_carrito_despues_insertar` */$$

/*!50003 CREATE */ /*!50003 TRIGGER `detalles_carrito_despues_insertar` AFTER INSERT ON `detalles_carrito` FOR EACH ROW BEGIN
	UPDATE usuario
	SET cantidad_productos = cantidad_productos + NEW.cantidad, subtotal = subtotal + NEW.importe
	WHERE id = NEW.Usuario_id;

    END */$$


DELIMITER ;

/* Trigger structure for table `detalles_carrito` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `detalles_carrito_despues_borrar` */$$

/*!50003 CREATE */ /*!50003 TRIGGER `detalles_carrito_despues_borrar` AFTER DELETE ON `detalles_carrito` FOR EACH ROW BEGIN
	UPDATE usuario
	SET cantidad_productos = cantidad_productos - OLD.cantidad, subtotal = subtotal - OLD.importe
	WHERE id = OLD.Usuario_id;

    END */$$


DELIMITER ;

/* Function  structure for function  `cantidad_carrito` */

/*!50003 DROP FUNCTION IF EXISTS `cantidad_carrito` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `cantidad_carrito`(P_Usuario_id SMALLINT) RETURNS smallint(6)
    DETERMINISTIC
BEGIN
	/* DECLARACION DE VARIABLES*/
	DECLARE v_resultado INT;
	
	/* EJECUCION DE LA CONSULTA*/
	SELECT SUM(cantidad) INTO v_resultado 
	FROM detalles_carrito WHERE Usuario_id = P_Usuario_id;
	
	/* REGRESAR EL RESULTADO DE LA FUNCION*/
	RETURN v_resultado;

    END */$$
DELIMITER ;

/* Procedure structure for procedure `crea_pedido_desde_carrito` */

/*!50003 DROP PROCEDURE IF EXISTS  `crea_pedido_desde_carrito` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `crea_pedido_desde_carrito`(in p_usuario_id SMALLINT, 
	IN p_importe_envio DECIMAL(6,2))
BEGIN
		insert into pedidos (fecha, numero, importe_producto, importe_envio, Usuario_id) 
		VALUES (NOW(), uuid(), (SELECT subtotal FROM usuario WHERE id = p_usuario_id),
		        p_importe_envio, p_usuario_id);

	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
