# PROYECTO_FINCA_AGRICOLA

## Descripción del Proyecto
El objetivo del proyecto es diseñar y desarrollar una base de datos que permita gestionar de manera eficiente todas las operaciones relacionadas con la producción agrícola de una finca. Esta finca produce diferentes productos, como aguacates, maíz, leche, entre otros, y maneja múltiples aspectos como la gestión de empleados, maquinaria, ventas, inventarios y relaciones con proveedores y clientes.

## Requisitos del Sistema
- MySQL Installer versión 8.0.40
- MySQL Workbench

## Instalación y Configuración
1. **Crear la base de datos**: Ejecutar el archivo `ddl.sql` para crear la estructura de la base de datos.
2. **Cargar datos iniciales**: Ejecutar el archivo `dml.sql` para insertar datos en las tablas correspondientes.
3. **Ejecutar consultas**: Utilizar los archivos `dql_select.sql`, `dql_procedimientos.sql`, `dql_funciones.sql`, `dql_triggers.sql`, para ejecutar los procedimientos, funciones, triggers que se han creado.

## Estructura de la Base de Datos

1. **Ubicacion**: Almacena las ubicaciones de las fincas.
2. **Finca**: Información general de la finca.
3. **TiposEmpleados**: Clasificación de tipos de empleados.
4. **EstadosMaquinaria**: Estados posibles para la maquinaria.
5. **TiposProductos**: Clasificación de tipos de productos.
6. **UnidadesMedida**: Unidades de medida para los insumos.
7. **Empleados**: Datos de los empleados.
8. **EmpleadosContactos**: Información de contacto para cada empleado.
9. **Maquinaria**: Información sobre la maquinaria utilizada en la finca.
10. **Insumos**: Insumos disponibles para las operaciones.
11. **Proveedores**: Datos sobre proveedores y sus contactos.
12. **ContactoProveedores**: Información de contacto para los proveedores.
13. **ProveedoresInsumos**: Relación entre proveedores e insumos.
14. **Sectores**: Información sobre los sectores dentro de las fincas.
15. **CertificacionesFinca**: Certificaciones obtenidas por las fincas.
16. **Productos**: Información sobre los productos disponibles.
17. **Produccion**: Información sobre la producción agrícola.
18. **UsoInsumos**: Registro del uso de insumos en producción.
19. **UsoMaquinaria**: Registro del uso de maquinaria en producción.
20. **Clientes**: Datos de los clientes.
21. **ClientesContactos**: Información de contacto para cada cliente.
22. **Ventas**: Registro de las ventas realizadas.
23. **DetallesVenta**: Detalles de cada venta.
24. **Auditoria**: Registro de cambios en las tablas.
25. **Roles**: Rol del usuario en el sistema.
26. **Permisos**: Permisos asignados a los roles.
27. **Usuarios**: Información sobre los usuarios del sistema.
28. **Usuarios_Roles**: Relación entre usuarios y roles.
29. **Roles_Permisos**: Relación entre roles y permisos.

## Ejemplos de Consultas
```sql
-- Lista las fincas y su ubicación
SELECT f.id_finca, f.nombre, u.descripcion AS ubicacion 
FROM Finca f 
JOIN Ubicacion u ON f.id_ubicacion = u.id_ubicacion;

-- Cuenta el número de fincas según su estado
SELECT estado, COUNT(*) AS total_fincas 
FROM Finca 
GROUP BY estado;

-- Obtiene la finca con mayor área
SELECT id_finca, nombre, area_total_hectareas 
FROM Finca 
ORDER BY area_total_hectareas DESC 
LIMIT 1;

-- Información sobre empleados y sus tipos
SELECT e.id_empleado, e.nombre, e.apellido, te.nombre_cargo 
FROM Empleados e 
JOIN TiposEmpleados te ON e.id_tipo_empleado = te.id_tipo_empleado;
```
## Otras consultas que se encuentra en los documentos son

Sudconsultas, Procedimientos, Funciones, Triggers, Roles de Usuario y Permisos
Procedimientos: Se han creado para facilitar la producción y gestión de inventarios.
Funciones: Funciones para calcular totales de producción y ventas.
Triggers: Para mantener la integridad en la auditoría de cambios en datos críticos.
Roles de Usuario y Permisos
Admin: Puede realizar todas las acciones.
Empleado: Puede acceder solo a información básica y registros de su actividad.
Gerente: Acceso a informes y registros de ventas.
Contador: Acceso a informes financieros.
Mantenimiento: Acceso a información sobre maquinaria y mantenimiento.

## Contribuciones

Jhorman Jesus castellanos Morales: Diseño de la base de datos y tablas.

Jaider Adrian Perez Vega : Implementación de procedimientos y funciones.



## Contacto

Para cualquier consulta sobre el proyecto, por favor contacta a:

Correo: jesusjhorman123@gmail.com

Correo: perezjaider473@gmail.com
```sql
---------------------------------------------------------------------------
repositorio
    ├── ddl.sql -- creacion de las tablas y base de datos 
    ├── dml.sql introduccion de las inserciones 
    ├── dql_select.sql -- las 100 primeras consultas subconsultas
    ├── dql_procedimientos.sql -- los 20 procedimientos 
    ├── dql_funciones.sql -- las 20 funciones
    ├── dql_triggers.sql -- los 20 triggers
    ├── README.md 
    ├── diagramaER.jpg 
    ├── diagramaEA.jpg 
--------------------------------------------------------------------------
```
