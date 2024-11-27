-- 1
DELIMITER //

CREATE TRIGGER update_product_inventory
AFTER INSERT ON Ventas
FOR EACH ROW
BEGIN
    UPDATE Productos
    SET stock_actual = stock_actual - NEW.cantidad
    WHERE id_producto IN (SELECT id_producto FROM DetallesVenta WHERE id_venta = NEW.id_venta);
END;

//

DELIMITER ;

-- 2

DELIMITER //

CREATE TRIGGER log_salary_change
AFTER UPDATE ON Empleados
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (tabla_afectada, id_referencia, accion, fecha, usuario, columna_modificada, valor_antiguo, valor_nuevo)
    VALUES ('Empleados', OLD.id_empleado, 'UPDATE', NOW(), USER(), 'salario', OLD.salario, NEW.salario);
END;

//

DELIMITER ;

-- 3

DELIMITER //

CREATE TRIGGER check_machine_availability
BEFORE INSERT ON UsoMaquinaria
FOR EACH ROW
BEGIN
    DECLARE count_uso INT;
    SELECT COUNT(*) INTO count_uso
    FROM UsoMaquinaria
    WHERE id_maquinaria = NEW.id_maquinaria AND fecha_uso = NEW.fecha_uso;

    IF count_uso > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La maquinaria ya está asignada para esta fecha.';
    END IF;
END;

//

DELIMITER ;

-- 4

DELIMITER //

CREATE TRIGGER prevent_empty_stock_sales
BEFORE INSERT ON Ventas
FOR EACH ROW
BEGIN
    DECLARE stock DECIMAL(10,2);
    SELECT stock_actual INTO stock FROM Productos WHERE id_producto = (SELECT id_producto FROM DetallesVenta WHERE id_venta = NEW.id_venta);

    IF stock < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficiente stock para realizar la venta.';
    END IF;
END;

//

DELIMITER ;

-- 5

DELIMITER //

CREATE TRIGGER adjust_insumo_status
AFTER INSERT ON Insumos
FOR EACH ROW
BEGIN
    IF NEW.stock_actual < NEW.stock_minimo THEN
        UPDATE Insumos SET estado = 'Descontinuado' WHERE id_insumo = NEW.id_insumo;
    END IF;
END;

//

DELIMITER ;

-- 6


DELIMITER //

CREATE TRIGGER restock_insumos
AFTER DELETE ON UsoInsumos
FOR EACH ROW
BEGIN
    UPDATE Insumos
    SET stock_actual = stock_actual + OLD.cantidad
    WHERE id_insumo = OLD.id_insumo;
END;

//

DELIMITER ;

-- 7


DELIMITER //

CREATE TRIGGER update_machine_status
AFTER INSERT ON UsoMaquinaria
FOR EACH ROW
BEGIN
    UPDATE Maquinaria
    SET id_estado = (SELECT id_estado FROM EstadosMaquinaria WHERE descripcion = 'En Uso')
    WHERE id_maquinaria = NEW.id_maquinaria;
END;

//

DELIMITER ;

-- 8


DELIMITER //

CREATE TRIGGER log_sales
AFTER INSERT ON Ventas
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (tabla_afectada, id_referencia, accion, fecha, usuario)
    VALUES ('Ventas', NEW.id_venta, 'INSERT', NOW(), USER());
END;

//

DELIMITER ;

-- 9


DELIMITER //

CREATE TRIGGER restrict_product_deletion
BEFORE DELETE ON Productos
FOR EACH ROW
BEGIN
    DECLARE reason VARCHAR(255);
    SET reason = 'No puede eliminarse el producto: ' || OLD.nombre || ' sin justificación.';
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = reason;
END;

//

DELIMITER ;
-- 10


DELIMITER //

CREATE TRIGGER auto_update_min_stock
AFTER UPDATE ON Insumos
FOR EACH ROW
BEGIN
    IF NEW.stock_actual < (0.1 * OLD.stock_minimo) THEN
        UPDATE Insumos SET stock_minimo = NEW.stock_actual * 2 WHERE id_insumo = OLD.id_insumo;
    END IF;
END;

//

DELIMITER ;


-- 11


DELIMITER //

CREATE TRIGGER count_active_insumos
AFTER INSERT ON Insumos
FOR EACH ROW
BEGIN
    DECLARE active_count INT;
    SELECT COUNT(*) INTO active_count FROM Insumos WHERE estado = 'Activo';
    -- Puedes, por ejemplo, insertar este conteo en una tabla de estadísticas.
END;

//

DELIMITER ;

-- 12

DELIMITER //

CREATE TRIGGER update_finca_based_on_production
AFTER INSERT ON Produccion
FOR EACH ROW
BEGIN
    UPDATE Finca SET estado = 'Inactiva' WHERE id_finca = NEW.id_finca AND NEW.cantidad_producida < 100;
END;

//

DELIMITER ;

-- 13


DELIMITER //

CREATE TRIGGER adjust_client_status
AFTER UPDATE ON Clientes
FOR EACH ROW
BEGIN
    IF NEW.estado = 'Inactivo' THEN
        UPDATE Ventas SET estado = 'Cancelada' WHERE id_cliente = NEW.id_cliente;
    END IF;
END;

//

DELIMITER ;

-- 14


DELIMITER //

CREATE TRIGGER audit_changes  
AFTER UPDATE ON Productos
FOR EACH ROW  
BEGIN  
    INSERT INTO Auditoria (tabla_afectada, id_referencia, accion, fecha, usuario, columna_modificada, valor_antiguo, valor_nuevo)
    VALUES ('Productos', OLD.id_producto, 'UPDATE', NOW(), USER(), 'nombre', OLD.nombre, NEW.nombre);  
END;

//

DELIMITER ;

-- 15


DELIMITER //

CREATE TRIGGER prevent_assignment_of_discontinued_products
BEFORE INSERT ON DetallesVenta
FOR EACH ROW
BEGIN
    DECLARE product_status ENUM('Activo', 'Descontinuado');
    
    SELECT estado INTO product_status
    FROM Productos
    WHERE id_producto = NEW.id_producto;

    IF product_status = 'Descontinuado' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede asignar un producto que está descontinuado.';
    END IF;
END;

//

DELIMITER ;
-- 16

DELIMITER //

CREATE TRIGGER update_supplier_state_on_insumo_delete
AFTER DELETE ON Insumos
FOR EACH ROW
BEGIN
    UPDATE Proveedores SET estado = 'Inactivo' 
    WHERE id_proveedor IN (SELECT id_proveedor FROM ProveedoresInsumos WHERE id_insumo = OLD.id_insumo);
END;

//

DELIMITER ;

-- 17

DELIMITER //

CREATE TRIGGER update_finca_certifications
AFTER INSERT ON CertificacionesFinca
FOR EACH ROW
BEGIN
    DECLARE cert_count INT;
    
    SELECT COUNT(*) INTO cert_count 
    FROM CertificacionesFinca
    WHERE id_finca = NEW.id_finca;
    
    IF cert_count > 3 THEN
        UPDATE Finca SET estado = 'Activa' WHERE id_finca = NEW.id_finca;
    END IF;
END;

//

DELIMITER ;

-- 18


DELIMITER //

CREATE TRIGGER notify_sale_change  
AFTER UPDATE ON Ventas  
FOR EACH ROW  
BEGIN  
    IF NEW.total <> OLD.total THEN  
        INSERT INTO Auditoria (tabla_afectada, id_referencia, accion, fecha, usuario)
        VALUES ('Ventas', NEW.id_venta, 'UPDATE', NOW(), USER());
    END IF;  
END;

//

DELIMITER ;

-- 19

DELIMITER //

CREATE TRIGGER update_insumo_status
AFTER INSERT ON Insumos
FOR EACH ROW
BEGIN
    IF NEW.stock_actual < NEW.stock_minimo THEN
        UPDATE Insumos 
        SET estado = 'Descontinuado' 
        WHERE id_insumo = NEW.id_insumo;
    END IF;
END;

//

DELIMITER ;

-- 20

DELIMITER //

CREATE TRIGGER prevent_supplier_without_contact
BEFORE INSERT ON Proveedores
FOR EACH ROW
BEGIN
    IF NEW.contacto IS NULL OR NEW.contacto = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El proveedor debe tener un contacto.';
    END IF;
END;

//

DELIMITER ;

-- visualizar triggers 

SHOW TRIGGERS\G;