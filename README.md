# PROYECTO_FINCA_AGRICOLA
##
### Creacion de la base de datos en sql


```sql
CREATE DATABASE Agricola;

USE Agricola;

-- 1. Tablas maestras
CREATE TABLE Finca (
    id_finca INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    area_total_hectareas DECIMAL(10,2) NOT NULL,
    ubicacion VARCHAR(200) NOT NULL,
    altitud_msnm DECIMAL(8,2),
    tipo_clima VARCHAR(50),
    fecha_registro DATE NOT NULL,
    descripcion TEXT,
    datos_contacto TEXT,
    estado ENUM('Activa', 'En Mantenimiento', 'Inactiva') DEFAULT 'Activa'
);

CREATE TABLE TiposEmpleados (
    id_tipo_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cargo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE EstadosMaquinaria (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE TiposProductos (
    id_tipo_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE UnidadesMedida (
    id_unidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL UNIQUE,
    abreviatura VARCHAR(5) NOT NULL
);

-- 2. Recursos humanos
CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_tipo_empleado INT NOT NULL,
    fecha_contratacion DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo',
    FOREIGN KEY (id_tipo_empleado) REFERENCES TiposEmpleados(id_tipo_empleado)
);

CREATE TABLE ContactoEmpleados (
    id_empleado INT,
    tipo_contacto ENUM('Teléfono', 'Email', 'Dirección') NOT NULL,
    valor VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_empleado, tipo_contacto),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

-- 3. Recursos materiales
CREATE TABLE Maquinaria (
    id_maquinaria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    año_compra INT NOT NULL,
    id_estado INT NOT NULL,
    fecha_ultimo_mantenimiento DATE,
    proxima_revision DATE,
    FOREIGN KEY (id_estado) REFERENCES EstadosMaquinaria(id_estado)
);

CREATE TABLE Insumos (
    id_insumo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_unidad_medida INT NOT NULL,
    stock_actual DECIMAL(10,2) NOT NULL,
    stock_minimo DECIMAL(10,2),
    descripcion TEXT,
    estado ENUM('Activo', 'Descontinuado') DEFAULT 'Activo',
    FOREIGN KEY (id_unidad_medida) REFERENCES UnidadesMedida(id_unidad)
);

CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_empresa VARCHAR(150) NOT NULL,
    contacto VARCHAR(100) NOT NULL,
    estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

CREATE TABLE ContactoProveedores (
    id_proveedor INT,
    tipo_contacto ENUM('Teléfono', 'Email', 'Dirección') NOT NULL,
    valor VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_proveedor, tipo_contacto),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE ProveedoresInsumos (
    id_proveedor INT NOT NULL,
    id_insumo INT NOT NULL,
    PRIMARY KEY (id_proveedor, id_insumo),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor),
    FOREIGN KEY (id_insumo) REFERENCES Insumos(id_insumo)
);

-- 4. Producción y operaciones
CREATE TABLE Sectores (
    id_sector INT PRIMARY KEY AUTO_INCREMENT,
    id_finca INT NOT NULL,
    codigo_sector VARCHAR(20) NOT NULL,
    nombre_sector VARCHAR(100) NOT NULL,
    area_hectareas DECIMAL(10,2) NOT NULL,
    tipo_suelo ENUM('Arcilloso', 'Arenoso', 'Franco', 'Calcáreo') NOT NULL,
    ubicacion_especifica VARCHAR(100),
    estado ENUM('Activo', 'En Descanso', 'En Mantenimiento') DEFAULT 'Activo',
    ph_suelo DECIMAL(4,2),
    pendiente_terreno VARCHAR(20),
    sistema_riego ENUM('Goteo', 'Aspersión', 'Superficial', 'Ninguno'),
    observaciones TEXT,
    fecha_ultimo_uso DATE,
    FOREIGN KEY (id_finca) REFERENCES Finca(id_finca)
);

CREATE TABLE CertificacionesFinca (
    id_certificacion INT PRIMARY KEY AUTO_INCREMENT,
    id_finca INT NOT NULL,
    nombre_certificacion VARCHAR(100) NOT NULL,
    fecha_obtencion DATE,
    FOREIGN KEY (id_finca) REFERENCES Finca(id_finca)
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_tipo_producto INT NOT NULL,
    id_unidad_medida INT NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_tipo_producto) REFERENCES TiposProductos(id_tipo_producto),
    FOREIGN KEY (id_unidad_medida) REFERENCES UnidadesMedida(id_unidad)
);

CREATE TABLE Produccion (
    id_produccion INT PRIMARY KEY AUTO_INCREMENT,
    id_finca INT NOT NULL,
    id_sector INT NOT NULL,
    id_producto INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    cantidad_producida DECIMAL(10,2),
    estado_produccion ENUM('Planificada', 'En Proceso', 'Finalizada', 'Cancelada') DEFAULT 'Planificada',
    observaciones TEXT,
    FOREIGN KEY (id_finca) REFERENCES Finca(id_finca),
    FOREIGN KEY (id_sector) REFERENCES Sectores(id_sector),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

CREATE TABLE UsoMaquinaria (
    id_uso INT PRIMARY KEY AUTO_INCREMENT,
    id_produccion INT NOT NULL,
    id_maquinaria INT NOT NULL,
    fecha_uso DATE NOT NULL,
    horas_uso DECIMAL(5,2) NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (id_produccion) REFERENCES Produccion(id_produccion),
    FOREIGN KEY (id_maquinaria) REFERENCES Maquinaria(id_maquinaria)
);

CREATE TABLE UsoInsumos (
    id_uso_insumo INT PRIMARY KEY AUTO_INCREMENT,
    id_produccion INT NOT NULL,
    id_insumo INT NOT NULL,
    cantidad DECIMAL(10,2) NOT NULL,
    fecha_uso DATE NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (id_produccion) REFERENCES Produccion(id_produccion),
    FOREIGN KEY (id_insumo) REFERENCES Insumos(id_insumo)
);

-- 5. Clientes y ventas
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    empresa VARCHAR(150),
    estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

CREATE TABLE ContactoClientes (
    id_cliente INT,
    tipo_contacto ENUM('Teléfono', 'Email', 'Dirección') NOT NULL,
    valor VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_cliente, tipo_contacto),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_produccion INT NOT NULL,
    fecha_venta DATE NOT NULL,
    cantidad DECIMAL(10,2) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_produccion) REFERENCES Produccion(id_produccion)
);
```
## seccion de las inserciones 
### inserciones para cada tablas 
```sql

```
