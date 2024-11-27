-- 1. Procedimiento Almacenado para Procesar Ventas

DELIMITER //
CREATE PROCEDURE ProcesarVenta(
    IN p_id_cliente INT,
    IN p_id_produccion INT,
    IN p_fecha_venta DATE,
    IN p_cantidad DECIMAL(10,2),
    IN p_precio_unitario DECIMAL(10,2)
)
BEGIN
    DECLARE v_id_venta INT;

    -- Insertar la venta en la tabla Ventas
    INSERT INTO Ventas (id_cliente, id_produccion, fecha_venta, cantidad, precio_unitario)
    VALUES (p_id_cliente, p_id_produccion, p_fecha_venta, p_cantidad, p_precio_unitario);

    SET v_id_venta = LAST_INSERT_ID();

-- Insertar detalles de venta a partir de la producción
    INSERT INTO DetallesVenta (id_venta, id_producto, cantidad, precio_unitario)
    SELECT v_id_venta, id_producto, p_cantidad, p_precio_unitario 
    FROM Produccion WHERE id_produccion = p_id_produccion;

    -- Actualizar el inventario
    CALL ActualizarInventario(p_id_produccion, p_cantidad);
END //
DELIMITER ;

-- 2. Procedimiento Almacenado para Actualizar Inventario

DELIMITER //
CREATE PROCEDURE ActualizarInventario(
    IN p_id_produccion INT,
    IN p_cantidad DECIMAL(10,2)
)
BEGIN
    DECLARE v_id_producto INT;

    -- Obtener el id_producto de la producción
    SELECT id_producto INTO v_id_producto
    FROM Produccion WHERE id_produccion = p_id_produccion;

    -- Actualizar el stock actual del insumo
    UPDATE Insumos 
    SET stock_actual = stock_actual - p_cantidad 
    WHERE id_insumo = v_id_producto;
END //
DELIMITER ;

-- 3. Procedimiento Almacenado para Registrar Nuevos Proveedores

DELIMITER //
CREATE PROCEDURE RegistrarProveedor(
    IN p_nombre_empresa VARCHAR(150),
    IN p_contacto VARCHAR(100),
    IN p_estado ENUM('Activo', 'Inactivo')
)
BEGIN
    INSERT INTO Proveedores (nombre_empresa, contacto, estado)
    VALUES (p_nombre_empresa, p_contacto, p_estado);
END //
DELIMITER ;

-- 4. Procedimiento Almacenado para Registrar Nuevos Empleados

DELIMITER //
CREATE PROCEDURE RegistrarEmpleado(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_fecha_nacimiento DATE,
    IN p_id_tipo_empleado INT,
    IN p_fecha_contratacion DATE,
    IN p_salario DECIMAL(10,2)
)
BEGIN
    INSERT INTO Empleados (nombre, apellido, fecha_nacimiento, id_tipo_empleado, fecha_contratacion, salario)
    VALUES (p_nombre, p_apellido, p_fecha_nacimiento, p_id_tipo_empleado, p_fecha_contratacion, p_salario);
END //
DELIMITER ;

-- 5. Procedimiento Almacenado para Actualizar Estado de Maquinaria

DELIMITER //
CREATE PROCEDURE ActualizarEstadoMaquinaria(
    IN p_id_maquinaria INT,
    IN p_nuevo_estado INT
)
BEGIN
    UPDATE Maquinaria
    SET id_estado = p_nuevo_estado
    WHERE id_maquinaria = p_id_maquinaria;
END //
DELIMITER ;

-- 6. Procedimiento Almacenado para Registrar el Mantenimiento de Maquinaria

DELIMITER //
CREATE PROCEDURE RegistrarMantenimiento(
    IN p_id_maquinaria INT,
    IN p_fecha_ultimo_mantenimiento DATE,
    IN p_proxima_revision DATE
)
BEGIN
    UPDATE Maquinaria
    SET fecha_ultimo_mantenimiento = p_fecha_ultimo_mantenimiento,
        proxima_revision = p_proxima_revision
    WHERE id_maquinaria = p_id_maquinaria;
END //
DELIMITER ;

-- 7. Procedimiento Almacenado para Agregar un Insumo

DELIMITER //
CREATE PROCEDURE AgregarInsumo(
    IN p_nombre VARCHAR(100),
    IN p_id_unidad_medida INT,
    IN p_stock_actual DECIMAL(10,2),
    IN p_stock_minimo DECIMAL(10,2),
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO Insumos (nombre, id_unidad_medida, stock_actual, stock_minimo, descripcion)
    VALUES (p_nombre, p_id_unidad_medida, p_stock_actual, p_stock_minimo, p_descripcion);
END //
DELIMITER ;

-- 8. Procedimiento Almacenado para Agregar un Tipo de Producto

DELIMITER //
CREATE PROCEDURE AgregarTipoProducto(
    IN p_nombre VARCHAR(50)
)
BEGIN
    INSERT INTO TiposProductos (nombre)
    VALUES (p_nombre);
END //
DELIMITER ;

9. Procedimiento Almacenado para Obtener Ventas por Cliente

DELIMITER //
CREATE PROCEDURE ObtenerVentasPorCliente(
    IN p_id_cliente INT
)
BEGIN
    SELECT * FROM Ventas WHERE id_cliente = p_id_cliente;
END //
DELIMITER ;

10.Procedimiento Almacenado para Calcular Total Ventas

DELIMITER //
CREATE PROCEDURE CalcularTotalVentas()
BEGIN
    SELECT SUM(total) AS TotalVentas FROM Ventas WHERE fecha_venta BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();
END //
DELIMITER ;

11. Procedimiento Almacenado para Listar Empleados Activos

DELIMITER //
CREATE PROCEDURE ListarEmpleadosActivos()
BEGIN
    SELECT * FROM Empleados WHERE estado = 'Activo';
END //
DELIMITER ;

12. Procedimiento Almacenado para Obtener Proveedores Activos

DELIMITER //
CREATE PROCEDURE ListarProveedoresActivos()
BEGIN
    SELECT * FROM Proveedores WHERE estado = 'Activo';
END //
DELIMITER ;

13. Procedimiento Almacenado para Actualizar Stock de Insumos

DELIMITER //
CREATE PROCEDURE ActualizarStockInsumos(
    IN p_id_insumo INT,
    IN p_nueva_cantidad DECIMAL(10,2)
)
BEGIN
    UPDATE Insumos
    SET stock_actual = p_nueva_cantidad
    WHERE id_insumo = p_id_insumo;
END //
DELIMITER ;

14. Procedimiento Almacenado para Grabar Auditoría

DELIMITER //
CREATE PROCEDURE GrabarAuditoria(
    IN p_tabla_afectada VARCHAR(100),
    IN p_id_referencia INT,
    IN p_accion ENUM('INSERT', 'UPDATE', 'DELETE'),
    IN p_columna_modificada VARCHAR(100),
    IN p_valor_antiguo VARCHAR(255),
    IN p_valor_nuevo VARCHAR(255),
    IN p_usuario VARCHAR(100)
)
BEGIN
    INSERT INTO Auditoria (tabla_afectada, id_referencia, accion, fecha, usuario, columna_modificada, valor_antiguo, valor_nuevo)
    VALUES (p_tabla_afectada, p_id_referencia, p_accion, NOW(), p_usuario, p_columna_modificada, p_valor_antiguo, p_valor_nuevo);
END //
DELIMITER ;

15. Procedimiento para Registrar Uso de Insumos

DELIMITER //
CREATE PROCEDURE RegistrarUsoInsumos(
    IN p_id_produccion INT,
    IN p_id_insumo INT,
    IN p_cantidad DECIMAL(10,2),
    IN p_fecha_uso DATE
)
BEGIN
    INSERT INTO UsoInsumos (id_produccion, id_insumo, cantidad, fecha_uso)
    VALUES (p_id_produccion, p_id_insumo, p_cantidad, p_fecha_uso);
END //
DELIMITER ;

16. Procedimiento para Registrar Uso de Maquinaria

DELIMITER //
CREATE PROCEDURE RegistrarUsoMaquinaria(
    IN p_id_produccion INT,
    IN p_id_maquinaria INT,
    IN p_fecha_uso DATE,
    IN p_horas_uso DECIMAL(5,2)
)
BEGIN
    INSERT INTO UsoMaquinaria (id_produccion, id_maquinaria, fecha_uso, horas_uso)
    VALUES (p_id_produccion, p_id_maquinaria, p_fecha_uso, p_horas_uso);
END //
DELIMITER ;

17. Procedimiento para Listar Inventario Bajo

DELIMITER //
CREATE PROCEDURE ListarInventarioBajo()
BEGIN
    SELECT * FROM Insumos WHERE stock_actual < stock_minimo;
END //
DELIMITER ;

18. Procedimiento para Crear un Reporte de Producción

DELIMITER //
CREATE PROCEDURE ReporteProduccionPorFecha(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    SELECT * FROM Produccion 
    WHERE fecha_inicio BETWEEN p_fecha_inicio AND p_fecha_fin;
END //
DELIMITER ;

19. Procedimiento para Buscar Clientes por Nombre

DELIMITER //
CREATE PROCEDURE BuscarClientesPorNombre(
    IN p_nombre VARCHAR(100)
)
BEGIN
    SELECT * FROM Clientes WHERE nombre LIKE CONCAT('%', p_nombre, '%');
END //
DELIMITER ;

20. Procedimiento para Actualizar Datos de un Proveedor

DELIMITER //
CREATE PROCEDURE ActualizarProveedor(
    IN p_id_proveedor INT,
    IN p_nombre_empresa VARCHAR(150),
    IN p_contacto VARCHAR(100),
    IN p_estado ENUM('Activo', 'Inactivo')
)
BEGIN
    UPDATE Proveedores
    SET nombre_empresa = p_nombre_empresa,
        contacto = p_contacto,
        estado = p_estado
    WHERE id_proveedor = p_id_proveedor;
END //
DELIMITER ;

SHOW PROCEDURE STATUS WHERE Db = 'Agricola';-- 1. Procedimiento Almacenado para Procesar Ventas

DELIMITER //
CREATE PROCEDURE ProcesarVenta(
    IN p_id_cliente INT,
    IN p_id_produccion INT,
    IN p_fecha_venta DATE,
    IN p_cantidad DECIMAL(10,2),
    IN p_precio_unitario DECIMAL(10,2)
)
BEGIN
    DECLARE v_id_venta INT;

    -- Insertar la venta en la tabla Ventas
    INSERT INTO Ventas (id_cliente, id_produccion, fecha_venta, cantidad, precio_unitario)
    VALUES (p_id_cliente, p_id_produccion, p_fecha_venta, p_cantidad, p_precio_unitario);

    SET v_id_venta = LAST_INSERT_ID();

-- Insertar detalles de venta a partir de la producción
    INSERT INTO DetallesVenta (id_venta, id_producto, cantidad, precio_unitario)
    SELECT v_id_venta, id_producto, p_cantidad, p_precio_unitario 
    FROM Produccion WHERE id_produccion = p_id_produccion;

    -- Actualizar el inventario
    CALL ActualizarInventario(p_id_produccion, p_cantidad);
END //
DELIMITER ;

-- 2. Procedimiento Almacenado para Actualizar Inventario

DELIMITER //
CREATE PROCEDURE ActualizarInventario(
    IN p_id_produccion INT,
    IN p_cantidad DECIMAL(10,2)
)
BEGIN
    DECLARE v_id_producto INT;

    -- Obtener el id_producto de la producción
    SELECT id_producto INTO v_id_producto
    FROM Produccion WHERE id_produccion = p_id_produccion;

    -- Actualizar el stock actual del insumo
    UPDATE Insumos 
    SET stock_actual = stock_actual - p_cantidad 
    WHERE id_insumo = v_id_producto;
END //
DELIMITER ;

-- 3. Procedimiento Almacenado para Registrar Nuevos Proveedores

DELIMITER //
CREATE PROCEDURE RegistrarProveedor(
    IN p_nombre_empresa VARCHAR(150),
    IN p_contacto VARCHAR(100),
    IN p_estado ENUM('Activo', 'Inactivo')
)
BEGIN
    INSERT INTO Proveedores (nombre_empresa, contacto, estado)
    VALUES (p_nombre_empresa, p_contacto, p_estado);
END //
DELIMITER ;

-- 4. Procedimiento Almacenado para Registrar Nuevos Empleados

DELIMITER //
CREATE PROCEDURE RegistrarEmpleado(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_fecha_nacimiento DATE,
    IN p_id_tipo_empleado INT,
    IN p_fecha_contratacion DATE,
    IN p_salario DECIMAL(10,2)
)
BEGIN
    INSERT INTO Empleados (nombre, apellido, fecha_nacimiento, id_tipo_empleado, fecha_contratacion, salario)
    VALUES (p_nombre, p_apellido, p_fecha_nacimiento, p_id_tipo_empleado, p_fecha_contratacion, p_salario);
END //
DELIMITER ;

-- 5. Procedimiento Almacenado para Actualizar Estado de Maquinaria

DELIMITER //
CREATE PROCEDURE ActualizarEstadoMaquinaria(
    IN p_id_maquinaria INT,
    IN p_nuevo_estado INT
)
BEGIN
    UPDATE Maquinaria
    SET id_estado = p_nuevo_estado
    WHERE id_maquinaria = p_id_maquinaria;
END //
DELIMITER ;

-- 6. Procedimiento Almacenado para Registrar el Mantenimiento de Maquinaria

DELIMITER //
CREATE PROCEDURE RegistrarMantenimiento(
    IN p_id_maquinaria INT,
    IN p_fecha_ultimo_mantenimiento DATE,
    IN p_proxima_revision DATE
)
BEGIN
    UPDATE Maquinaria
    SET fecha_ultimo_mantenimiento = p_fecha_ultimo_mantenimiento,
        proxima_revision = p_proxima_revision
    WHERE id_maquinaria = p_id_maquinaria;
END //
DELIMITER ;

-- 7. Procedimiento Almacenado para Agregar un Insumo

DELIMITER //
CREATE PROCEDURE AgregarInsumo(
    IN p_nombre VARCHAR(100),
    IN p_id_unidad_medida INT,
    IN p_stock_actual DECIMAL(10,2),
    IN p_stock_minimo DECIMAL(10,2),
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO Insumos (nombre, id_unidad_medida, stock_actual, stock_minimo, descripcion)
    VALUES (p_nombre, p_id_unidad_medida, p_stock_actual, p_stock_minimo, p_descripcion);
END //
DELIMITER ;

-- 8. Procedimiento Almacenado para Agregar un Tipo de Producto

DELIMITER //
CREATE PROCEDURE AgregarTipoProducto(
    IN p_nombre VARCHAR(50)
)
BEGIN
    INSERT INTO TiposProductos (nombre)
    VALUES (p_nombre);
END //
DELIMITER ;

9. Procedimiento Almacenado para Obtener Ventas por Cliente

DELIMITER //
CREATE PROCEDURE ObtenerVentasPorCliente(
    IN p_id_cliente INT
)
BEGIN
    SELECT * FROM Ventas WHERE id_cliente = p_id_cliente;
END //
DELIMITER ;

10.Procedimiento Almacenado para Calcular Total Ventas

DELIMITER //
CREATE PROCEDURE CalcularTotalVentas()
BEGIN
    SELECT SUM(total) AS TotalVentas FROM Ventas WHERE fecha_venta BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();
END //
DELIMITER ;

11. Procedimiento Almacenado para Listar Empleados Activos

DELIMITER //
CREATE PROCEDURE ListarEmpleadosActivos()
BEGIN
    SELECT * FROM Empleados WHERE estado = 'Activo';
END //
DELIMITER ;

12. Procedimiento Almacenado para Obtener Proveedores Activos

DELIMITER //
CREATE PROCEDURE ListarProveedoresActivos()
BEGIN
    SELECT * FROM Proveedores WHERE estado = 'Activo';
END //
DELIMITER ;

13. Procedimiento Almacenado para Actualizar Stock de Insumos

DELIMITER //
CREATE PROCEDURE ActualizarStockInsumos(
    IN p_id_insumo INT,
    IN p_nueva_cantidad DECIMAL(10,2)
)
BEGIN
    UPDATE Insumos
    SET stock_actual = p_nueva_cantidad
    WHERE id_insumo = p_id_insumo;
END //
DELIMITER ;

14. Procedimiento Almacenado para Grabar Auditoría

DELIMITER //
CREATE PROCEDURE GrabarAuditoria(
    IN p_tabla_afectada VARCHAR(100),
    IN p_id_referencia INT,
    IN p_accion ENUM('INSERT', 'UPDATE', 'DELETE'),
    IN p_columna_modificada VARCHAR(100),
    IN p_valor_antiguo VARCHAR(255),
    IN p_valor_nuevo VARCHAR(255),
    IN p_usuario VARCHAR(100)
)
BEGIN
    INSERT INTO Auditoria (tabla_afectada, id_referencia, accion, fecha, usuario, columna_modificada, valor_antiguo, valor_nuevo)
    VALUES (p_tabla_afectada, p_id_referencia, p_accion, NOW(), p_usuario, p_columna_modificada, p_valor_antiguo, p_valor_nuevo);
END //
DELIMITER ;

15. Procedimiento para Registrar Uso de Insumos

DELIMITER //
CREATE PROCEDURE RegistrarUsoInsumos(
    IN p_id_produccion INT,
    IN p_id_insumo INT,
    IN p_cantidad DECIMAL(10,2),
    IN p_fecha_uso DATE
)
BEGIN
    INSERT INTO UsoInsumos (id_produccion, id_insumo, cantidad, fecha_uso)
    VALUES (p_id_produccion, p_id_insumo, p_cantidad, p_fecha_uso);
END //
DELIMITER ;

16. Procedimiento para Registrar Uso de Maquinaria

DELIMITER //
CREATE PROCEDURE RegistrarUsoMaquinaria(
    IN p_id_produccion INT,
    IN p_id_maquinaria INT,
    IN p_fecha_uso DATE,
    IN p_horas_uso DECIMAL(5,2)
)
BEGIN
    INSERT INTO UsoMaquinaria (id_produccion, id_maquinaria, fecha_uso, horas_uso)
    VALUES (p_id_produccion, p_id_maquinaria, p_fecha_uso, p_horas_uso);
END //
DELIMITER ;

17. Procedimiento para Listar Inventario Bajo

DELIMITER //
CREATE PROCEDURE ListarInventarioBajo()
BEGIN
    SELECT * FROM Insumos WHERE stock_actual < stock_minimo;
END //
DELIMITER ;

18. Procedimiento para Crear un Reporte de Producción

DELIMITER //
CREATE PROCEDURE ReporteProduccionPorFecha(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    SELECT * FROM Produccion 
    WHERE fecha_inicio BETWEEN p_fecha_inicio AND p_fecha_fin;
END //
DELIMITER ;

19. Procedimiento para Buscar Clientes por Nombre

DELIMITER //
CREATE PROCEDURE BuscarClientesPorNombre(
    IN p_nombre VARCHAR(100)
)
BEGIN
    SELECT * FROM Clientes WHERE nombre LIKE CONCAT('%', p_nombre, '%');
END //
DELIMITER ;

20. Procedimiento para Actualizar Datos de un Proveedor

DELIMITER //
CREATE PROCEDURE ActualizarProveedor(
    IN p_id_proveedor INT,
    IN p_nombre_empresa VARCHAR(150),
    IN p_contacto VARCHAR(100),
    IN p_estado ENUM('Activo', 'Inactivo')
)
BEGIN
    UPDATE Proveedores
    SET nombre_empresa = p_nombre_empresa,
        contacto = p_contacto,
        estado = p_estado
    WHERE id_proveedor = p_id_proveedor;
END //
DELIMITER ;

SHOW PROCEDURE STATUS WHERE Db = 'Agricola';