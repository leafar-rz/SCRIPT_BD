
/*------------------------------------------------------------------------TRIGGERS-----------------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Trigger structure for table `detalles_carrito` */
 /* TRIGGER QUE ACTUALIZA AL USUARIO CUANDO SE MODIFICA LA CANTIDAD DE UN PRODUCTO EN EL CARRITO*/
DELIMITER $$

 CREATE TRIGGER `detalles_carrito_despues_actualizar` AFTER UPDATE ON `detalles_carrito` FOR EACH ROW BEGIN
	UPDATE usuario
	SET cantidad_productos = (SELECT SUM(cantidad) FROM DETALLES_CARRITO WHERE Usuario_id=NEW.Usuario_id)
	WHERE id = NEW.Usuario_id;
    
    UPDATE usuario
	SET subtotal = (SELECT SUM(importe) FROM DETALLES_CARRITO WHERE Usuario_id=NEW.Usuario_id)
	WHERE id = NEW.Usuario_id;

    END $$
DELIMITER $$


 CREATE TRIGGER `detalles_carrito_despues_insertar` AFTER INSERT ON `detalles_carrito` FOR EACH ROW BEGIN
	UPDATE usuario
	SET cantidad_productos = cantidad_productos + NEW.cantidad, subtotal = subtotal + NEW.importe
	WHERE id = NEW.Usuario_id;

    END $$

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Trigger structure for table `detalles_carrito` */

DELIMITER $$

 CREATE TRIGGER `detalles_carrito_despues_borrar` AFTER DELETE ON `detalles_carrito` FOR EACH ROW BEGIN
	UPDATE usuario
	SET cantidad_productos = cantidad_productos - OLD.cantidad, subtotal = subtotal - OLD.importe
	WHERE id = OLD.Usuario_id;

    END $$

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Function  structure for function  `cantidad_carrito` */
DELIMITER $$

CREATE FUNCTION `cantidad_carrito`(P_Usuario_id SMALLINT) RETURNS smallint(6)
    DETERMINISTIC
BEGIN
	/* DECLARACION DE VARIABLES*/
	DECLARE v_resultado INT;
	
	/* EJECUCION DE LA CONSULTA*/
	SELECT SUM(cantidad) INTO v_resultado 
	FROM detalles_carrito WHERE Usuario_id = P_Usuario_id;
	
	/* REGRESAR EL RESULTADO DE LA FUNCION*/
	RETURN v_resultado;

    END $$

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Procedure structure for procedure `crea_pedido_desde_carrito` */

DELIMITER $$

CREATE PROCEDURE `crea_pedido_desde_carrito`(in p_usuario_id SMALLINT, 
	IN p_importe_envio DECIMAL(6,2))
BEGIN
		insert into pedidos (fecha, numero, importe_producto, importe_envio, Usuario_id) 
		VALUES (NOW(), uuid(), (SELECT subtotal FROM usuario WHERE id = p_usuario_id),
		        p_importe_envio, p_usuario_id);

	END $$
    