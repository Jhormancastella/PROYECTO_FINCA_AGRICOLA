-- Función para Calcular el Rendimiento Promedio por Hectárea de cada Cultivo
DELIMITER $$

CREATE FUNCTION calcular_rendimiento_promedio(id_producto INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE rendimiento DECIMAL(10,2);

    SELECT AVG(cantidad_producida / (SELECT area_hectareas FROM Sectores WHERE id_sector = Produccion.id_sector))
    INTO rendimiento
    FROM Produccion
    WHERE id_producto = id_producto;

    RETURN rendimiento;
END $$

DELIMITER ;

-- Función para Estimar el Costo Operativo Total de la Finca en un Período de Tiempo Determinado

DELIMITER $$

CREATE FUNCTION costo_operativo_total(fecha_inicio DATE, fecha_fin DATE) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE costo_total DECIMAL(10,2);

    SELECT SUM(costo_operativo) INTO costo_total
    FROM (SELECT id_maquinaria * CostoPorMaquinaria AS costo_operativo
          FROM UsoMaquinaria 
          WHERE fecha_uso BETWEEN fecha_inicio AND fecha_fin) AS costos;

    RETURN costo_total;
END $$

DELIMITER ;

-- Función para Calcular la Cantidad Total Vendida de un Producto
DELIMITER $$

CREATE FUNCTION total_vendido(id_producto INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(cantidad) INTO total 
    FROM DetallesVenta 
    WHERE id_producto = id_producto;

    RETURN total;
END $$

DELIMITER ;

-- Función para Calcular el Rendimiento Anual de un Cultivo

DELIMITER $$

CREATE FUNCTION rendimiento_anual(id_producto INT, anio INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE rendimiento DECIMAL(10,2);

    SELECT SUM(cantidad_producida) INTO rendimiento 
    FROM Produccion 
    WHERE id_producto = id_producto AND YEAR(fecha_fin) = anio;

    RETURN rendimiento;
END $$

DELIMITER ;

-- Función para Calcular el Área Total de Cultivos Activos

DELIMITER $$

CREATE FUNCTION area_total_cultivos_activos() 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE area_total DECIMAL(10,2);

    SELECT SUM(area_hectareas) INTO area_total 
    FROM Sectores 
    WHERE estado = 'Activo';

    RETURN area_total;
END $$

DELIMITER ;

-- Función para Calcular el Costo Promedio de Insumos

DELIMITER $$

CREATE FUNCTION costo_promedio_insumos() 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE costo_promedio DECIMAL(10,2);

    SELECT AVG(stock_actual * precio_unitario) INTO costo_promedio 
    FROM Insumos;

    RETURN costo_promedio;
END $$

DELIMITER ;

-- Función para Calcular el Total de Ventas en un Período

DELIMITER $$

CREATE FUNCTION total_ventas(fecha_inicio DATE, fecha_fin DATE) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(total) INTO total 
    FROM Ventas 
    WHERE fecha_venta BETWEEN fecha_inicio AND fecha_fin;

    RETURN total;
END $$

DELIMITER ;

-- Función para Calcular el Rendimiento por Empleado

DELIMITER $$

CREATE FUNCTION rendimiento_por_empleado(id_empleado INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE rendimiento DECIMAL(10,2);

    SELECT SUM(cantidad_producida) / COUNT(DISTINCT id_produccion) INTO rendimiento 
    FROM Produccion 
    WHERE id_empleado = id_empleado;

    RETURN rendimiento;
END $$

DELIMITER ;

-- Función para Calcular el Promedio de Salarios por Tipo de Empleado

DELIMITER $$

CREATE FUNCTION promedio_salario_tipo(tipo_empleado INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10,2);

    SELECT AVG(salario) INTO promedio 
    FROM Empleados 
    WHERE id_tipo_empleado = tipo_empleado;

    RETURN promedio;
END $$

DELIMITER ;

-- Función para Calcular Días hasta la Próxima Revisión de Maquinaria


DELIMITER $$

CREATE FUNCTION dias_para_proxima_revision(id_maquinaria INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE dias INT;

    SELECT DATEDIFF(proxima_revision, NOW()) INTO dias 
    FROM Maquinaria 
    WHERE id_maquinaria = id_maquinaria;

    RETURN dias;
END $$

DELIMITER ;

-- Función para Obtener el ID del Proveedor con Mejor Desempeño

DELIMITER $$

CREATE FUNCTION proveedor_mejor_desempeno() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE id_proveedor INT;

    SELECT id_proveedor INTO id_proveedor 
    FROM ProveedoresInsumos 
    GROUP BY id_proveedor 
    ORDER BY COUNT(id_insumo) DESC 
    LIMIT 1;

    RETURN id_proveedor;
END $$

DELIMITER ;

-- Función para Calcular la Cantidad Promedio de Insumos Utilizados por Producción

DELIMITER $$

CREATE FUNCTION promedio_insumos_por_produccion(id_produccion INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10,2);

    SELECT AVG(cantidad) INTO promedio 
    FROM UsoInsumos 
    WHERE id_produccion = id_produccion;

    RETURN promedio;
END $$

DELIMITER ;

-- Función para Calcular el Tiempo Promedio de Uso de Maquinaria

DELIMITER $$

CREATE FUNCTION tiempo_promedio_uso_maquinaria(id_maquinaria INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10,2);

    SELECT AVG(horas_uso) INTO promedio 
    FROM UsoMaquinaria 
    WHERE id_maquinaria = id_maquinaria;

    RETURN promedio;
END $$

DELIMITER ;

-- Función para Calcular el Total de Insumos Activos

DELIMITER $$

CREATE FUNCTION total_insumos_activos() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total 
    FROM Insumos 
    WHERE estado = 'Activo';

    RETURN total;
END $$

DELIMITER ;

-- Función para Calcular Días Promedio de Mantenimiento por Maquinaria

DELIMITER $$

CREATE FUNCTION dias_promedio_mantenimiento(id_maquinaria INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE dias INT;

    SELECT AVG(DATEDIFF(fecha_ultimo_mantenimiento, NOW())) INTO dias 
    FROM Maquinaria 
    WHERE id_maquinaria = id_maquinaria;

    RETURN dias;
END $$

DELIMITER ;

-- Función para Calcular el Porcentaje de Ventas sobre la Producción Total

DELIMITER $$

CREATE FUNCTION porcentaje_ventas_total() 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_ventas DECIMAL(10,2);
    DECLARE total_produccion DECIMAL(10,2);

    SELECT SUM(total) INTO total_ventas FROM Ventas;
    SELECT SUM(cantidad_producida) INTO total_produccion FROM Produccion;

    RETURN (total_ventas / total_produccion) * 100;
END $$

DELIMITER ;

-- Función para Calcular la Tasa de Crecimiento Anual de Ventas

DELIMITER $$

CREATE FUNCTION tasa_crecimiento_ventas(anio INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ventas_anio_pasado DECIMAL(10,2);
    DECLARE ventas_anio_actual DECIMAL(10,2);

    SELECT SUM(total) INTO ventas_anio_pasado 
    FROM Ventas 
    WHERE YEAR(fecha_venta) = anio - 1;

    SELECT SUM(total) INTO ventas_anio_actual 
    FROM Ventas 
    WHERE YEAR(fecha_venta) = anio;

    RETURN ((ventas_anio_actual - ventas_anio_pasado) / ventas_anio_pasado) * 100;
END $$

DELIMITER ;

-- Función para Calcular el Promedio de Días entre Cultivos

DELIMITER $$

CREATE FUNCTION promedio_dias_entre_cultivos() 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10,2);

    SELECT AVG(DATEDIFF(fecha_fin, fecha_inicio)) INTO promedio 
    FROM Produccion;

    RETURN promedio;
END $$

DELIMITER ;

-- Función para Obtener el Insumo Más Utilizado en Producción

DELIMITER $$

CREATE FUNCTION insumo_mas_utilizado() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE id_insumo INT;

    SELECT id_insumo INTO id_insumo 
    FROM UsoInsumos 
    GROUP BY id_insumo 
    ORDER BY SUM(cantidad) DESC 
    LIMIT 1;

    RETURN id_insumo;
END $$

DELIMITER ;

-- Función para Obtener el Producto más Vendido

DELIMITER $$

CREATE FUNCTION producto_mas_vendido() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE id_producto INT;

    SELECT id_producto INTO id_producto 
    FROM DetallesVenta 
    GROUP BY id_producto 
    ORDER BY SUM(cantidad) DESC 
    LIMIT 1;

    RETURN id_producto;
END $$

DELIMITER ;