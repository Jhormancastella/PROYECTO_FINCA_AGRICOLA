-- mostar la ubicacion de la finca

SELECT f.id_finca, f.nombre, u.descripcion AS ubicacion 
FROM Finca f 
JOIN Ubicacion u ON f.id_ubicacion = u.id_ubicacion;

-- mostar el estado de la finca

SELECT estado, COUNT(*) AS total_fincas 
FROM Finca 
GROUP BY estado;

-- Obtenerel area de la finca 

SELECT id_finca, nombre, area_total_hectareas 
FROM Finca 
ORDER BY area_total_hectareas DESC 
LIMIT 1;

-- mostar el nombre de la finca

SELECT f.id_finca, f.nombre 
FROM Finca f 
WHERE f.id_ubicacion = 1;  

-- Obtener información sobre fincas

SELECT id_finca, nombre, area_total_hectareas, descripcion 
FROM Finca 
WHERE estado = 'Activa';

-- Consultas sobre Empleados y Tipos de Empleados

SELECT e.id_empleado, e.nombre, e.apellido, te.nombre_cargo 
FROM Empleados e 
JOIN TiposEmpleados te ON e.id_tipo_empleado = te.id_tipo_empleado;

-- Contar empleados en cada tipo

SELECT te.nombre_cargo, COUNT(*) AS total_empleados 
FROM Empleados e 
JOIN TiposEmpleados te ON e.id_tipo_empleado = te.id_tipo_empleado 
GROUP BY te.nombre_cargo;

-- Listar empleados activos con su salario

SELECT id_emnombre, apellido, salario 
FROM Empleados 
WHERE estado = 'Activo';

-- Obtener el empleado con el salario más alto

SELECT id_empleado, nombre, apellido, salario 
FROM Empleados 
ORDER BY salario DESC 
LIMIT ;

-- Buscar empleados por nombre o apellido

SELECT id_empleado, nombre, apellido 
FROM Empleados 
WHERE nombre LIKE '%Juan%' OR apellido LIKE '%Pérez%';  -- Ejemplo de búsqueda
Consultas sobre Insumos

-- Listar insumos con bajo stock mínimo

SELECT id_insumo, nombre, stock_actual, stock_minimo 
FROM Insumos 
WHERE stock_actual < stock_minimo;

-- Obtener insumos activos

SELECT id_insumo, nombre, stock_actual 
FROM Insumos 
WHERE estado = 'Activo';

-- Contar insumos por estado

SELECT estado, COUNT(*) AS total_insumos 
FROM Insumos 
GROUP BY estado;
Buscar insumos por nombre:

SELECT id_insumo, nombre 
FROM Insumos 
WHERE nombre LIKE '%fertilizante%';  -- Búsqueda de ejemplo

-- Listar insumos y sus respectivas unidades de medida

SELECT i.id_insumo, i.nombre, um.nombre AS unidad_medida 
FROM Insumos i 
JOIN UnidadesMedida um ON i.id_unidad_medida = um.id_unidad;
Consultas sobre Proveedores
Listar todos los proveedores activos:

SELECT id_proveedor, nombre_empresa, estado 
FROM Proveedores 
WHERE estado = 'Activo';

-- Contar proveedores por estado

SELECT estado, COUNT(*) AS total_proveedores 
FROM Proveedores 
GROUP BY estado;

-- Buscar proveedores por nombre

SELECT id_proveedor, nombre_empresa 
FROM Proveedores 
WHERE nombre_empresa LIKE '%Agro%';  -- Búsqueda de ejemplo

-- Listar proveedores y sus contactos

SELECT p.id_proveedor, p.nombre_empresa, cp.valor AS contacto 
FROM Proveedores p 
JOIN ContactoProveedores cp ON p.id_proveedor = cp.id_proveedor;

-- Obtener información de contacto de un proveedor

SELECT id_proveedor, tipo_contacto, valor 
FROM ContactoProveedores 
WHERE id_proveedor = 1;  -- Cambia el ID del proveedor según necesidad
Consultas sobre Producción

-- Listar producción por finca y sector

SELECT p.id_produccion, f.nombre AS finca, s.nombre_sector, p.cantidad_producida 
FROM Produccion p 
JOIN Finca f ON p.id_finca = f.id_finca 
JOIN Sectores s ON p.id_sector = s.id_sector;

-- Contar la producción por estado

SELECT estado_produccion, COUNT(*) AS total_producciones 
FROM Produccion 
GROUP BY estado_produccion;

-- Producción finalizada durante un mes específico

SELECT id_produccion, fecha_inicio, fecha_fin, cantidad_producida 
FROM Produccion 
WHERE estado_produccion = 'Finalizada' AND MONTH(fecha_fin) = 8 AND YEAR(fecha_fin) = 2023;  -- Mes y año de ejemplo

-- Obtener el total de producción por empleado

SELECT e.nombre, e.apellido, SUM(p.cantidad_producida) AS total_producido 
FROM Produccion p 
JOIN Empleados e ON p.id_empleado = e.id_empleado 
GROUP BY e.id_empleado;

-- Producción planificada por finca y sector 

SELECT p.id_produccion, f.nombre AS finca, s.nombre_sector, p.cantidad_producida 
FROM Produccion p 
JOIN Finca f ON p.id_finca = f.id_finca 
JOIN Sectores s ON p.id_sector = s.id_sector 
WHERE p.estado_produccion = 'Planificada';
Consultas sobre Ventas

-- Listar todas las ventas y sus clientes

SELECT v.id_venta, c.nombre, c.apellido, v.cantidad, v.total 
FROM Ventas v 
JOIN Clientes c ON v.id_cliente = c.id_cliente;

-- Total de ventas por cliente


SELECT c.nombre, c.apellido, SUM(v.total) AS total_ventas 
FROM Ventas v 
JOIN Clientes c ON v.id_cliente = c.id_cliente 
GROUP BY c.id_cliente;

-- Filtrar ventas por fecha

SELECT id_venta, cantidad, total, fecha_venta 
FROM Ventas 
WHERE fecha_venta BETWEEN '2023-08-01' AND '2023-08-31';

-- Obtener el cliente con más compras

SELECT c.nombre, c.apellido, COUNT(v.id_venta) AS total_compras 
FROM Ventas v 
JOIN Clientes c ON v.id_cliente = c.id_cliente 
GROUP BY c.id_cliente 
ORDER BY total_compras DESC 
LIMIT 1;

-- Listar ventas junto a sus detalles

SELECT v.id_venta, dv.id_producto, dv.cantidad, dv.precio_unitario, v.fecha_venta 
FROM Ventas v 
JOIN DetallesVenta dv ON v.id_venta = dv.id_venta;

-- Consultas sobre Detalles de Ventas y Uso de Insumos etallar productos vendidos en una venta específica:

SELECT dv.id_producto, dv.cantidad, dv.precio_unitario 
FROM DetallesVenta dv 
WHERE dv.id_venta = 1;  -- Cambiar el ID de la venta según necesidad

-- Total de insumos utilizados en la producción

SELECT SUM(u.cantidad) AS total_insumos 
FROM UsoInsumos u 
JOIN Produccion p ON u.id_produccion = p.id_produccion;

-- Insumos utilizados en una producción específica

SELECT i.nombre, u.cantidad 
FROM UsoInsumos u 
JOIN Insumos i ON u.id_insumo = i.id_insumo 
WHERE u.id_produccion = 1;  -- Cambiar el ID de la producción según necesidad
-- Uso de maquinaria para producción específica

SELECT m.nombre, um.horas_uso 
FROM UsoMaquinaria um 
JOIN Maquinaria m ON um.id_maquinaria = m.id_maquinaria 
WHERE um.id_produccion = 1;  -- Cambiar el ID de la producción según necesidad

-- Listar maquinaria que no se usa actualmente

SELECT id_maquinaria, nombre, estado 
FROM Maquinaria 
WHERE id_estado = 2;  -- Inactivo
Consultas sobre Auditoría

-- Listar entradas de auditoría recientes

SELECT * 
FROM Auditoria 
ORDER BY fecha DESC 
LIMIT 10;

-- Buscar auditoría por tabla específica

SELECT * 
FROM Auditoria 
WHERE tabla_afectada = 'Produccion';

-- Contar auditorías por tipo de acción

SELECT accion, COUNT(*) AS total 
FROM Auditoria 
GROUP BY accion;

-- ntradas de auditoría de un usuario específico

SELECT * 
FROM Auditoria 
WHERE usuario = 'admin';  -- Cambiar el nombre de usuario para buscar

-- Auditoría de cambios en la tabla Insumos

SELECT * 
FROM Auditoria 
WHERE tabla_afectada = 'Insumos'
ORDER BY fecha DESC;
Consultas combinadas y más complejas

-- Producción total y total vendido por producto

SELECT p.nombre, SUM(pr.cantidad_producida) AS total_producido, SUM(v.cantidad) AS total_vendido 
FROM Productos p 
LEFT JOIN Produccion pr ON p.id_producto = pr.id_producto 
LEFT JOIN Ventas v ON p.id_producto = v.id_producto 
GROUP BY p.id_producto;

-- Total de ingresos y costos por finca

SELECT f.nombre AS finca, 
       (SELECT SUM(total) FROM Ventas v JOIN Produccion pr ON v.id_produccion = pr.id_produccion WHERE pr.id_finca = f.id_finca) AS ingresos,
       (SELECT SUM(u.cantidad) FROM UsoInsumos u JOIN Produccion pr ON u.id_produccion = pr.id_produccion WHERE pr.id_finca = f.id_finca) AS costos
FROM Finca f;

-- Ventas mensuales por finca

SELECT f.nombre, MONTH(v.fecha_venta) AS mes, SUM(v.total) AS total_ventas 
FROM Ventas v 
JOIN Produccion p ON v.id_produccion = p.id_produccion 
JOIN Finca f ON p.id_finca = f.id_finca 
GROUP BY f.id_finca, mes;

-- Resumen de insumos y sus proveedores

SELECT i.nombre AS insumo, p.nombre_empresa, u.cantidad AS cantidad
FROM Insumos i 
JOIN ProveedoresInsumos pi ON i.id_insumo = pi.id_insumo 
JOIN Proveedores p ON pi.id_proveedor = p.id_proveedor;

-- Producción total de cada finca:

SELECT f.nombre, SUM(pr.cantidad_producida) AS total_producido 
FROM Produccion pr 
JOIN Finca f ON pr.id_finca = f.id_finca 
GROUP BY f.id_finca;

-- Consultas de resumen y estadísticas btener la cantidad total de productos vendidos:

SELECT SUM(cantidad) AS total_vendidos 
FROM Ventas;

-- Listar fincas junto a la producción total realizada:

SELECT f.nombre, SUM(p.cantidad_producida) AS total_producido 
FROM Finca f 
LEFT JOIN Produccion p ON f.id_finca = p.id_finca 
GROUP BY f.id_finca;

-- Cantidad media de productos vendidos por venta:

SELECT AVG(cantidad) AS media_vendida 
FROM Ventas;
-- Total de productos y su estado:

SELECT estado, COUNT(*) AS total_productos 
FROM Productos 
GROUP BY estado;

-- Resumen de ventas por cliente y por tipo de producto:

SELECT cliente, tipo_producto, SUM(cantidad) AS total_vendido 
FROM Ventas v 
JOIN Productos p ON v.id_producto = p.id_producto 
GROUP BY cliente, tipo_producto;

-- Consultas adicionales ltimas certificaciones obtenidas por una finca:

SELECT f.nombre, cf.nombre_certificacion, cf.fecha_obtencion 
FROM CertificacionesFinca cf 
JOIN Finca f ON cf.id_finca = f.id_finca 
ORDER BY cf.fecha_obtencion DESC 
LIMIT 5;

-- Productos que se cultivan en un sector específico:

SELECT p.nombre 
FROM Productos p 
JOIN Produccion pr ON p.id_producto = pr.id_producto 
WHERE pr.id_sector = 1;  -- Cambiar ID de sector

-- Estado del stock de insumos y sus proveedores:

SELECT i.nombre, i.stock_actual, p.nombre_empresa 
FROM Insumos i 
JOIN ProveedoresInsumos pi ON i.id_insumo = pi.id_insumo 
JOIN Proveedores p ON pi.id_proveedor = p.id_proveedor 
WHERE i.stock_actual < i.stock_minimo;

-- Costos de producción por finca:

SELECT f.nombre, SUM(u.cantidad) AS total_costos 
FROM UsoInsumos u 
JOIN Produccion p ON u.id_produccion = p.id_produccion 
JOIN Finca f ON p.id_finca = f.id_finca 
GROUP BY f.id_finca;

-- Total de maquinaria en uso y estado:

SELECT m.nombre, m.estado, COUNT(um.id_uso) AS total_usos 
FROM Maquinaria m 
LEFT JOIN UsoMaquinaria um ON m.id_maquinaria = um.id_maquinaria 
GROUP BY m.id_maquinaria;
Más consultas

-- Último uso de cada tipo de maquinaria:

SELECT m.nombre, MAX(um.fecha_uso) AS ultimo_uso 
FROM Maquinaria m 
LEFT JOIN UsoMaquinaria um ON m.id_maquinaria = um.id_maquinaria 
GROUP BY m.id_maquinaria;

-- Consulta de todos los empleados y sus contactos:

SELECT e.nombre, e.apellido, ec.valor AS contacto 
FROM Empleados e 
JOIN EmpleadosContactos ec ON e.id_empleado = ec.id_empleado;

-- Ventas realizadas en los últimos 30 días:

SELECT v.id_venta, v.fecha_venta, v.total 
FROM Ventas v 
WHERE v.fecha_venta >= CURDATE() - INTERVAL 30 DAY;

-- Obtener información de una finca específica y su producción:

SELECT f.nombre, f.area_total_hectareas, SUM(pr.cantidad_producida) AS total_producido 
FROM Finca f 
LEFT JOIN Produccion pr ON f.id_finca = pr.id_finca 
WHERE f.id_finca = 1  -- Cambiar ID según lo necesario
GROUP BY f.id_finca;

-- ¿Cuántos empleados han sido contratados en cada tipo de cargo?

SELECT te.nombre_cargo, COUNT(e.id_empleado) AS total_contratados 
FROM Empleados e 
JOIN TiposEmpleados te ON e.id_tipo_empleado = te.id_tipo_empleado 
GROUP BY te.id_tipo_empleado;

-- Algunas consultas interesadas en el rendimiento roducción mensual por finca:

SELECT f.nombre, MONTH(pr.fecha_inicio) AS mes, SUM(pr.cantidad_producida) AS total_producido 
FROM Produccion pr 
JOIN Finca f ON pr.id_finca = f.id_finca 
GROUP BY f.id_finca, mes;

-- Comparativa de ingresos y costos:

SELECT f.nombre, 
       (SELECT SUM(total) FROM Ventas v JOIN Produccion p ON v.id_produccion = p.id_produccion WHERE p.id_finca = f.id_finca) AS ingresos,
       (SELECT COUNT(u.cantidad) FROM UsoInsumos u JOIN Produccion p ON u.id_produccion = p.id_produccion WHERE p.id_finca = f.id_finca) AS costos
FROM Finca f;
-- Lista de maquinaria y días desde su último mantenimiento:

SELECT nombre, DATEDIFF(CURDATE(), fecha_ultimo_mantenimiento) AS dias_desde_mantenimiento 
FROM Maquinaria;

-- Ventas desde un cliente específico:

SELECT v.fecha_venta, v.cantidad, v.precio_unitario, v.total 
FROM Ventas v 
WHERE v.id_cliente = 1;  -- Cambiar el ID según se necesite

-- Consultar insumos que se han utilizado en producción:

SELECT DISTINCT i.nombre 
FROM UsoInsumos u 
JOIN Insumos i ON u.id_insumo = i.id_insumo;

-- Consulta de maquinaria por estado con detalles:

SELECT m.nombre, m.modelo, es.descripcion AS estado 
FROM Maquinaria m 
JOIN EstadosMaquinaria es ON m.id_estado = es.id_estado;

-- Producción y ventas por sector:

SELECT s.nombre_sector, SUM(pr.cantidad_producida) AS total_producido, SUM(v.cantidad) AS total_vendido 
FROM Sectores s 
LEFT JOIN Produccion pr ON s.id_sector = pr.id_sector 
LEFT JOIN Ventas v ON pr.id_produccion = v.id_produccion 
GROUP BY s.id_sector;

-- Filtrar clientes por tipo de contacto:

SELECT c.nombre, c.apellido, cc.tipo_contacto, cc.valor 
FROM Clientes c 
JOIN ClientesContactos cc ON c.id_cliente = cc.id_cliente 
WHERE cc.tipo_contacto = 'Teléfono';  -- Cambiar el tipo de contacto según se necesite

-- Listar todos los sectores y su estado:

SELECT codigo_sector, nombre_sector, estado 
FROM Sectores;

-- Productos cultivados en una finca determinada:

SELECT p.nombre 
FROM Productos p 
JOIN Produccion pr ON p.id_producto = pr.id_producto 
WHERE pr.id_finca = 1;  -- Cambiar el ID según la finca deseada

-- Comparación de producción con venta por producto:

SELECT p.nombre, SUM(pr.cantidad_producida) AS total_producido, SUM(v.cantidad) AS total_vendido
FROM Productos p 
LEFT JOIN Produccion pr ON p.id_producto = pr.id_producto 
LEFT JOIN Ventas v ON p.id_producto = v.id_producto 
GROUP BY p.id_producto;

-- Total de insumos utilizados en producción para cada tipo:

SELECT it.nombre, SUM(u.cantidad) AS total_utilizado 
FROM UsoInsumos u 
JOIN Insumos i ON u.id_insumo = i.id_insumo 
JOIN TiposProductos it ON i.id_tipo_producto = it.id_tipo_producto 
GROUP BY it.id_tipo_producto;

-- Ranking de fincas por producción total:

SELECT f.nombre, SUM(pr.cantidad_producida) AS total_producido 
FROM Finca f 
JOIN Produccion pr ON f.id_finca = pr.id_finca 
GROUP BY f.id_finca 
ORDER BY total_producido DESC;

-- Costos medios de producción por finca:

SELECT f.nombre, AVG(u.cantidad) AS costo_medio 
FROM UsoInsumos u 
JOIN Produccion p ON u.id_produccion = p.id_produccion 
JOIN Finca f ON p.id_finca = f.id_finca 
GROUP BY f.id_finca;

-- Búsqueda de maquinaria en base al modelo:

SELECT m.nombre, m.modelo 
FROM Maquinaria m 
WHERE m.modelo LIKE '%JD%';  -- Cambiar el modelo para buscar

-- Consultas de proveedores por insumos:

SELECT i.nombre AS insumo, p.nombre_empresa 
FROM Insumos i 
JOIN ProveedoresInsumos pi ON i.id_insumo = pi.id_insumo 
JOIN Proveedores p ON pi.id_proveedor = p.id_proveedor;

-- Última producción registrada por finca:

SELECT f.nombre, MAX(pr.fecha_inicio) AS ultima_produccion 
FROM Finca f 
JOIN Produccion pr ON f.id_finca = pr.id_finca 
GROUP BY f.id_finca;

-- Listar ventas por mes y año:

SELECT YEAR(v.fecha_venta) AS anio, MONTH(v.fecha_venta) AS mes, SUM(v.total) AS total_ventas 
FROM Ventas v 
GROUP BY anio, mes;

-- Filtrar productos por disponibilidad en stock:

SELECT p.nombre, i.stock_actual 
FROM Productos p 
JOIN Insumos i ON p.id_producto = i.id_producto 
WHERE i.stock_actual > 100;  -- Cambiar el umbral según necesidad

-- Historial de mantenimiento para maquinaria:

SELECT m.nombre, m.modelo, m.fecha_ultimo_mantenimiento 
FROM Maquinaria m 
WHERE m.fecha_ultimo_mantenimiento IS NOT NULL;

-- Consultar insumos utilizados en una producción específica:


SELECT i.nombre, u.cantidad 
FROM UsoInsumos u 
JOIN Insumos i ON u.id_insumo = i.id_insumo 
WHERE u.id_produccion = 1;  -- Cambia el ID de producción según necesidad

-- Empleados involucrados en una producción específica:

SELECT e.nombre, e.apellido 
FROM Produccion p 
JOIN Empleados e ON p.id_empleado = e.id_empleado 
WHERE p.id_produccion = 1;  -- Cambia el ID de producción según necesidad

-- Proyectos agrícolas (si existieran en el futuro) en base a los insumos utilizados:

SELECT DISTINCT i.nombre 
FROM UsoInsumos u 
JOIN Insumos i ON u.id_insumo = i.id_insumo;

-- Empleados con sus contactos numéricos:

SELECT e.nombre, e.apellido, ec.valor 
FROM Empleados e 
JOIN EmpleadosContactos ec ON e.id_empleado = ec.id_empleado 
WHERE ec.tipo_contacto = 'Teléfono';

-- Clientes con más de una compra:

SELECT c.nombre, c.apellido, COUNT(v.id_venta) AS total_compras 
FROM Clientes c 
JOIN Ventas v ON c.id_cliente = v.id_cliente 
GROUP BY c.id_cliente 
HAVING COUNT(v.id_venta) > 1;

-- Buscar productos en particular en las ventas:

SELECT v.id_venta, dv.id_producto, p.nombre 
FROM Ventas v 
JOIN DetallesVenta dv ON v.id_venta = dv.id_venta 
JOIN Productos p ON dv.id_producto = p.id_producto 
WHERE p.nombre LIKE '%tomate%';  -- Cambiar el nombre para buscar

-- Consultar maquinaria según el tipo:

SELECT * 
FROM Maquinaria 
WHERE id_estado = (SELECT id_estado FROM EstadosMaquinaria WHERE descripcion = 'Activo');  -- Estado activo

-- Resumen de costos operativos por finca:

SELECT f.nombre, SUM(u.cantidad) AS total_costos 
FROM UsoInsumos u 
JOIN Produccion p ON u.id_produccion = p.id_produccion 
JOIN Finca f ON p.id_finca = f.id_finca 
GROUP BY f.id_finca;

-- Expresiones para ventas realizadas en los últimos meses:

SELECT MONTH(v.fecha_venta) AS mes, SUM(v.total) AS total_ventas 
FROM Ventas v 
WHERE v.fecha_venta >= NOW() - INTERVAL 3 MONTH 
GROUP BY mes;

-- Consulta de empleados por salario:

SELECT nombre, apellido, salario 
FROM Empleados 
WHERE salario > 1500.00;  -- Cambiar el umbral para buscar

-- Detallar maquinaria con próxima revisión:

SELECT m.nombre, m.modelo, m.proxima_revision 
FROM Maquinaria m 
WHERE m.proxima_revision < CURDATE() + INTERVAL 30 DAY;  -- Próxima revisión dentro de los próximos 30 días

-- Resumen de contactos de proveedores por tipo:

SELECT tipo_contacto, COUNT(*) AS total 
FROM ContactoProveedores 
GROUP BY tipo_contacto;

-- Resumen de insumos según estado:

SELECT estado, COUNT(*) AS total 
FROM Insumos 
GROUP BY estado;

-- Ventas de un producto específico en el último año:

SELECT v.fecha_venta, v.cantidad 
FROM Ventas v 
JOIN DetallesVenta dv ON v.id_venta = dv.id_venta 
WHERE dv.id_producto = 1 AND v.fecha_venta >= CURDATE() - INTERVAL 1 YEAR;  -- Cambiar ID de producto

-- Resumir producción y ventas por tipo de cultivo:

SELECT tp.nombre, SUM(pr.cantidad_producida) AS total_producido, SUM(v.cantidad) AS total_vendido 
FROM TiposProductos tp 
LEFT JOIN Productos p ON tp.id_tipo_producto = p.id_tipo_producto 
LEFT JOIN Produccion pr ON p.id_producto = pr.id_producto 
LEFT JOIN Ventas v ON p.id_producto = v.id_producto 
GROUP BY tp.id_tipo_producto;

Consultas de auditoría específicas por fecha: pendientes para modificar y ajustar y quitar el * 

SELECT * 
FROM Auditoria 
WHERE fecha >= '2023-01-01' AND fecha < '2023-12-31';

-- Mostrar fincas en mantenimiento y su información:

SELECT * 
FROM Finca 
WHERE estado = 'En Mantenimiento';

-- Consultar si algún empleado ha sido dado de baja en el último mes:

SELECT * 
FROM Empleados 
WHERE estado = 'Inactivo' AND fecha_contratacion <= NOW() - INTERVAL 1 MONTH;

-- Total de insumos utilizados por tipo:

SELECT i.nombre, SUM(u.cantidad) AS cantidad_utilizada 
FROM UsoInsumos u 
JOIN Insumos i ON u.id_insumo = i.id_insumo 
GROUP BY i.id_insumo;

-- Promedio de producción por sector en una finca específica:

sql SELECT s.nombre_sector, AVG(pr.cantidad_producida) AS promedio_produccion FROM Sectores s JOIN Produccion pr ON s.id_sector = pr.id_sector WHERE pr.id_finca = 1 -- Cambia el ID según la finca deseada GROUP BY s.id_sector;


-- Contar el número de empleados activos por tipo:

SELECT te.nombre_cargo, COUNT(*) AS total_empleados 
FROM Empleados e 
JOIN TiposEmpleados te ON e.id_tipo_empleado = te.id_tipo_empleado 
WHERE e.estado = 'Activo' 
GROUP BY te.id_tipo_empleado;

-- Obtener el total de insumos por estado:

SELECT COUNT(*) AS total_insumos, estado 
FROM Insumos 
GROUP BY estado;

-- Contar el total de producciones por finca:

SELECT f.nombre, COUNT(*) AS total_producciones 
FROM Produccion p 
JOIN Finca f ON p.id_finca = f.id_finca 
GROUP BY f.id_finca;

-- Obtener el porcentaje de cultivables por tipo de cultivo:

SELECT tp.nombre, (COUNT(*) / (SELECT COUNT(*) FROM Productos) * 100) AS porcentaje 
FROM Productos p 
JOIN TiposProductos tp ON p.id_tipo_producto = tp.id_tipo_producto 
GROUP BY tp.id_tipo_producto;

-- Total de ventas por cada producto:

SELECT p.nombre, SUM(v.total) AS total_ventas 
FROM Ventas v 
JOIN DetallesVenta dv ON v.id_venta = dv.id_venta 
JOIN Productos p ON dv.id_producto = p.id_producto 
GROUP BY p.id_producto;

-- Obtener el promedio de producción por empleado:

SELECT e.nombre, e.apellido, AVG(p.cantidad_producida) AS promedio_produccion 
FROM Produccion p 
JOIN Empleados e ON p.id_empleado = e.id_empleado 
GROUP BY e.id_empleado;

-- Listar las certificaciones y su cantidad por finca:

SELECT f.nombre, COUNT(cf.id_certificacion) AS total_certificaciones 
FROM Finca f 
LEFT JOIN CertificacionesFinca cf ON f.id_finca = cf.id_finca 
GROUP BY f.id_finca;

-- Contar el número de fincas por estado:

SELECT estado, COUNT(*) AS total_fincas 
FROM Finca 
GROUP BY estado;

-- Listar proveedores y la cantidad total de insumos que manejan:

SELECT p.nombre_empresa, COUNT(pi.id_insumo) AS total_insumos 
FROM Proveedores p 
LEFT JOIN ProveedoresInsumos pi ON p.id_proveedor = pi.id_proveedor 
GROUP BY p.id_proveedor;

-- Obtener el promedio de horas de uso de maquinaria:


SELECT m.nombre, AVG(um.horas_uso) AS promedio_horas 
FROM UsoMaquinaria um 
JOIN Maquinaria m ON um.id_maquinaria = m.id_maquinaria 
GROUP BY m.id_maquinaria;

-- Contar el total de ventas por cliente:

SELECT c.nombre, c.apellido, COUNT(v.id_venta) AS total_ventas 
FROM Ventas v 
JOIN Clientes c ON v.id_cliente = c.id_cliente 
GROUP BY c.id_cliente;

-- Contar la cantidad total de maquinaria en cada estado:

SELECT em.descripcion, COUNT(*) AS total_maquinaria 
FROM Maquinaria m 
JOIN EstadosMaquinaria em ON m.id_estado = em.id_estado 
GROUP BY em.id_estado;


