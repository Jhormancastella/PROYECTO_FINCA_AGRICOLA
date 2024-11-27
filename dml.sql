-- Inserciones en la tabla Ubicacion

INSERT INTO Ubicacion (descripcion, latitud, longitud) 
VALUES ('Ubicación Ejemplo', 9.123456, -84.123456);

-- Inserciones en la tabla Finca

INSERT INTO Finca (nombre, area_total_hectareas, altitud_msnm, tipo_clima, fecha_registro, descripcion, datos_contacto, estado, id_ubicacion)
VALUES
    ('Finca Diversa', 250.75, 1200.00, 'Subtropical', '2023-01-15', 'Finca dedicada a la producción diversificada de café, frutas tropicales, cacao, y verduras de altura.', 'Tel: 555-1234, Email: contacto@fincadiversa.com', 'Activa', 1);

-- Inserciones en la tabla CertificacionesFinca 

INSERT INTO CertificacionesFinca (id_finca, nombre_certificacion, fecha_obtencion)
VALUES
    (1, 'Certificación Orgánica', '2023-06-01'),
    (1, 'Fair Trade', '2023-08-15'),
    (1, 'Global GAP', '2022-11-20');

-- Inserciones en la tabla Sectores

INSERT INTO Sectores (id_finca, codigo_sector, nombre_sector, area_hectareas, tipo_suelo, ubicacion_especifica, estado, ph_suelo, pendiente_terreno, sistema_riego, observaciones, fecha_ultimo_uso)
VALUES
    (1, 'A01', 'Sector Café', 50.00, 'Arcilloso', 'Zona Norte', 'Activo', 6.5, 'Moderada', 'Goteo', 'Cultivo de café robusta y arábiga.', '2023-11-15'),
    (1, 'B02', 'Sector Frutales', 30.00, 'Franco', 'Zona Este', 'Activo', 7.0, 'Llana', 'Aspersión', 'Cultivo de aguacates, cítricos y plátanos.', '2024-01-20'),
    (1, 'C03', 'Sector Hortalizas', 40.00, 'Arenoso', 'Zona Sur', 'Activo', 6.2, 'Suave', 'Aspersión', 'Producción de tomates, pimientos y verduras de altura.', '2024-02-05'),
    (1, 'D04', 'Sector Descanso', 25.00, 'Franco', 'Zona Occidental', 'En Descanso', 6.8, 'Moderada', 'Ninguno', 'En proceso de recuperación y mejora de suelos.', NULL),
    (1, 'E05', 'Sector Cacao', 35.00, 'Franco', 'Zona Central', 'Activo', 6.3, 'Ligera', 'Goteo', 'Producción de cacao fino de altura.', '2024-01-15');
    
-- Inserciones en la tabla TiposEmpleados

INSERT INTO TiposEmpleados (nombre_cargo)
VALUES
    ('Fornalero'),
    ('Recolector'),
    ('Técnico Agrícola'),
    ('Ingeniero Agrónomo'),
    ('Supervisor de Cultivos'),
    ('Especialista en Riego'),
    ('Técnico en Mantenimiento de Maquinaria'),
    ('Encargado de Control de Calidad'),
    ('Analista de Suelos'),
    ('Especialista en Fertilización'),
    ('Técnico en Control de Plagas'),
    ('Operador de Maquinaria Agrícola'),
    ('Administrador de Finca'),
    ('Contador Agrícola'),
    ('Especialista en Comercialización'),
    ('Técnico en Post-Cosecha'),
    ('Encargado de Bodega'),
    ('Conductor de Transporte'),
    ('Técnico en Sistemas de Riego'),
    ('Especialista en Desarrollo de Cultivos'),
    ('Técnico en Certificación Orgánica'),
    ('Encargado de Vivero'),
    ('Técnico en Injerto'),
    ('Especialista en Nutrición Vegetal'),
    ('Técnico en Manejo de Compostaje'),
    ('Supervisor de Cosecha'),
    ('Técnico en Conservación de Suelos'),
    ('Especialista en Agricultura de Precisión'),
    ('Técnico en Manejo de Invernaderos'),
    ('Encargado de Logística'),
    ('Técnico en Sistemas de Monitoreo'),
    ('Especialista en Biodiversidad'),
    ('Técnico en Transformación de Productos'),
    ('Encargado de Mantenimiento'),
    ('Técnico en Energías Renovables'),
    ('Especialista en Desarrollo Sostenible'),
    ('Técnico en Gestión Ambiental'),
    ('Encargado de Compras'),
    ('Técnico en Trazabilidad'),
    ('Especialista en Marketing Agrícola'),
    ('Técnico en Empaquetado'),
    ('Encargado de Recursos Humanos'),
    ('Técnico en Seguridad Industrial'),
    ('Especialista en Capacitación'),
    ('Técnico en Sistemas de Información'),
    ('Encargado de Ventas'),
    ('Técnico en Análisis de Mercado'),
    ('Especialista en Exportaciones'),
    ('Técnico en Relaciones Comerciales');
    
 -- Inserciones en la tabla EstadosMaquinaria

INSERT INTO EstadosMaquinaria (descripcion)
VALUES
    ('Activo'),
    ('Inactivo'),
    ('En Reparación');

-- Inserciones en la tabla TiposProductos

INSERT INTO TiposProductos (nombre)
VALUES
    ('Frutas'),
    ('Cereales'),
    ('Verduras'),
    ('Café'),
    ('Cacao'),
    ('Hortalizas'),
    ('Tubérculos'),
    ('Legumbres'),
    ('Plantas Medicinales'),
    ('Especias'),
    ('Frutos Secos'),
    ('Granos'),
    ('Raíces'),
    ('Hierbas Aromáticas'),
    ('Flores'),
    ('Semillas'),
    ('Cultivos Energéticos'),
    ('Plantas Ornamentales'),
    ('Árboles Frutales'),
    ('Plantas de Vivero'),
    ('Abonos Verdes'),
    ('Cultivos de Cobertura'),
    ('Cítricos'),
    ('Cultivos Tropicales'),
    ('Cultivos de Altura'),
    ('Plantas Forestales'),
    ('Bambú'),
    ('Cultivos Industriales'),
    ('Plantas Textiles'),
    ('Ornamentales de Exportación'),
    ('Cultivos para Biocombustibles'),
    ('Hongos'),
    ('Suculentas'),
    ('Plantas Acuáticas'),
    ('Cultivos Hidropónicos'),
    ('Plantas Aromáticas'),
    ('Cultivos Experimentales'),
    ('Multiproposito'),
    ('Cultivos de Investigación'),
    ('Plantas Nativas'),
    ('Cultivos Sostenibles'),
    ('Variedades Orgánicas'),
    ('Cultivos de Conservación'),
    ('Plantas Promisorias'),
    ('Frutales Exóticos'),
    ('Cultivos Alternativos'),
    ('Plantas de Sombra'),
    ('Cultivos de Conservación Genética'),
    ('Plantas Bioindicadoras');

-- Inserciones en la tabla UnidadesMedida

INSERT INTO UnidadesMedida (nombre, abreviatura)
VALUES
    ('Kilogramos', 'kg'),
    ('Litros', 'L'),
    ('Toneladas', 't'),
    ('Gramos', 'g'),
    ('Unidades', 'u');

-- Inserciones en la tabla Empleados   

INSERT INTO Empleados (nombre, apellido, fecha_nacimiento, id_tipo_empleado, fecha_contratacion, salario, estado)
VALUES
('Juan', 'Pérez', '1985-03-12', 1, '2023-01-10', 1500.00, 'Activo'),
    ('Ana', 'García', '1990-07-24', 2, '2022-11-05', 1200.00, 'Activo'),
    ('Pedro', 'Martínez', '1988-05-10', 1, '2023-02-15', 1450.00, 'Activo'),
    ('Laura', 'González', '1992-08-20', 2, '2023-03-01', 1250.00, 'Activo'),
    ('Carlos', 'Ramírez', '1985-12-05', 3, '2021-09-15', 1600.00, 'Activo'),
    ('Sofía', 'Hernández', '1995-06-12', 2, '2022-10-25', 1350.00, 'Activo'),
    ('Miguel', 'López', '1990-01-15', 1, '2023-04-10', 1550.00, 'Activo'),
    ('Teresa', 'Pérez', '1987-07-30', 3, '2023-05-20', 1400.00, 'Activo'),
    ('Daniel', 'Romero', '1983-11-22', 1, '2023-06-30', 1600.00, 'Activo'),
    ('Clara', 'Torres', '1994-09-28', 2, '2022-12-05', 1300.00, 'Activo'),
    ('José', 'Morales', '1986-02-14', 3, '2023-01-22', 1700.00, 'Activo'),
    ('Marta', 'Vásquez', '1989-03-18', 1, '2023-07-15', 1500.00, 'Activo'),
    ('Javier', 'Castillo', '1991-10-05', 2, '2022-11-30', 1250.00, 'Activo'),
    ('Natalia', 'Salazar', '1993-04-25', 3, '2023-08-01', 1450.00, 'Activo'),
    ('Fernando', 'Cruz', '1984-12-15', 1, '2023-01-23', 1550.00, 'Activo'),
    ('Valentina', 'Ríos', '1996-05-02', 2, '2023-02-10', 1350.00, 'Activo'),
    ('Andrés', 'Mendoza', '1982-06-17', 3, '2023-03-25', 1600.00, 'Activo'),
    ('Isabella', 'Rivera', '1994-08-30', 1, '2023-04-05', 1500.00, 'Activo'),
    ('Gustavo', 'Guerrero', '1988-11-19', 2, '2023-05-15', 1250.00, 'Activo'),
    ('Lorena', 'Navarro', '1992-03-09', 3, '2022-10-12', 1300.00, 'Activo'),
    ('Julio', 'Rojas', '1989-07-11', 1, '2023-06-22', 1450.00, 'Activo'),
    ('Emma', 'Cervantes', '1995-02-15', 2, '2023-08-20', 1750.00, 'Activo'),
    ('Raúl', 'Sánchez', '1981-04-10', 1, '2023-08-15', 1675.00, 'Activo'),
    ('Victoria', 'Mora', '1993-12-04', 2, '2022-09-01', 1380.00, 'Activo'),
    ('Samuel', 'Hidalgo', '1987-08-18', 3, '2023-07-25', 1490.00, 'Activo'),
    ('Gabriela', 'Guerrero', '1994-11-29', 2, '2022-10-15', 1300.00, 'Activo'),
    ('Alberto', 'Ojeda', '1988-04-26', 1, '2023-12-13', 1580.00, 'Activo'),
    ('Claudia', 'Bermúdez', '1991-08-14', 3, '2023-11-10', 1420.00, 'Activo'),
    ('Hugo', 'Salinas', '1986-07-03', 1, '2023-05-23', 1375.00, 'Activo'),
    ('Patricia', 'Gómez', '1995-01-22', 2, '2022-11-21', 1300.00, 'Activo'),
    ('Andrés', 'Lozano', '1983-05-14', 3, '2023-03-16', 1600.00, 'Activo'),
    ('Nicolás', 'Fuentes', '1990-09-08', 2, '2023-05-12', 1450.00, 'Activo'),
    ('Beatriz', 'Alvarado', '1985-03-27', 1, '2023-01-30', 1280.00, 'Activo'),
    ('Iván', 'Ríos', '1997-11-11', 2, '2023-06-03', 1350.00, 'Activo'),
    ('Silvia', 'Canales', '1989-04-10', 3, '2023-02-28', 1525.00, 'Activo'),
    ('Mariano', 'Luna', '1984-08-22', 1, '2023-10-05', 1275.00, 'Activo'),
    ('Rocío', 'Ponce', '1992-06-18', 2, '2022-09-15', 1400.00, 'Activo'),
    ('Fabio', 'Acosta', '1986-12-09', 3, '2023-07-12', 1540.00, 'Activo'),
    ('Adriana', 'Delgado', '1991-05-16', 1, '2023-03-04', 1450.00, 'Activo'),
    ('Oscar', 'Cáceres', '1993-01-25', 2, '2023-08-30', 1280.00, 'Activo'),
    ('Ignacio', 'Ayala', '1987-07-30', 3, '2023-11-18', 1600.00, 'Activo'),
    ('Carmen', 'Torres', '1996-02-04', 1, '2023-09-22', 1390.00, 'Activo'),
    ('Diego', 'Soto', '1982-12-12', 2, '2023-12-02', 1425.00, 'Activo'),
    ('Mercedes', 'Vega', '1995-03-02', 3, '2022-06-17', 1475.00, 'Activo');

-- Inserciones en la tabla EmpleadosContactos  

INSERT INTO EmpleadosContactos (id_empleado, tipo_contacto, valor) VALUES
    (1, 'Teléfono', '3000000001'),
    (1, 'Email', 'juan.perez@example.com'),
    
    (2, 'Teléfono', '3000000002'),
    (2, 'Email', 'ana.garcia@example.com'),
    
    (3, 'Teléfono', '3000000003'),
    (3, 'Email', 'pedro.martinez@example.com'),
    
    (4, 'Teléfono', '3000000004'),
    (4, 'Email', 'laura.gonzalez@example.com'),
    
    (5, 'Teléfono', '3000000005'),
    (5, 'Email', 'carlos.ramirez@example.com'),
    
    (6, 'Teléfono', '3000000006'),
    (6, 'Email', 'sofia.hernandez@example.com'),
    
    (7, 'Teléfono', '3000000007'),
    (7, 'Email', 'miguel.lopez@example.com'),
    
    (8, 'Teléfono', '3000000008'),
    (8, 'Email', 'teresa.perez@example.com'),
    
    (9, 'Teléfono', '3000000009'),
    (9, 'Email', 'daniel.romero@example.com'),

    (10, 'Teléfono', '3000000010'),
    (10, 'Email', 'clara.torres@example.com'),

    (11, 'Teléfono', '3000000011'),
    (11, 'Email', 'jose.morales@example.com'),

    (12, 'Teléfono', '3000000012'),
    (12, 'Email', 'marta.vasquez@example.com'),

    (13, 'Teléfono', '3000000013'),
    (13, 'Email', 'javier.castillo@example.com'),

    (14, 'Teléfono', '3000000014'),
    (14, 'Email', 'natalia.salazar@example.com'),

    (15, 'Teléfono', '3000000015'),
    (15, 'Email', 'fernando.cruz@example.com'),

    (16, 'Teléfono', '3000000016'),
    (16, 'Email', 'valentina.rios@example.com'),

    (17, 'Teléfono', '3000000017'),
    (17, 'Email', 'andres.mendoza@example.com'),

    (18, 'Teléfono', '3000000018'),
    (18, 'Email', 'isabella.rivera@example.com'),

    (19, 'Teléfono', '3000000019'),
    (19, 'Email', 'gustavo.guerrero@example.com'),

    (20, 'Teléfono', '3000000020'),
    (20, 'Email', 'lorena.navarro@example.com'),

    (21, 'Teléfono', '3000000021'),
    (21, 'Email', 'julio.rojas@example.com'),

    (22, 'Teléfono', '3000000022'),
    (22, 'Email', 'emma.cervantes@example.com'),

    (23, 'Teléfono', '3000000023'),
    (23, 'Email', 'raul.sanchez@example.com'),

    (24, 'Teléfono', '3000000024'),
    (24, 'Email', 'victoria.mora@example.com'),

    (25, 'Teléfono', '3000000025'),
    (25, 'Email', 'samuel.hidalgo@example.com'),

    (26, 'Teléfono', '3000000026'),
    (26, 'Email', 'gabriela.guerrero@example.com'),

    (27, 'Teléfono', '3000000027'),
    (27, 'Email', 'alberto.ojeda@example.com'),

    (28, 'Teléfono', '3000000028'),
    (28, 'Email', 'claudia.bermudez@example.com'),

    (29, 'Teléfono', '3000000029'),
    (29, 'Email', 'hugo.salinas@example.com'),

    (30, 'Teléfono', '3000000030'),
    (30, 'Email', 'patricia.gomez@example.com'),

    (31, 'Teléfono', '3000000031'),
    (31, 'Email', 'andres.lozano@example.com'),

    (32, 'Teléfono', '3000000032'),
    (32, 'Email', 'nicolas.fuentes@example.com'),

    (33, 'Teléfono', '3000000033'),
    (33, 'Email', 'beatriz.alvarado@example.com'),

    (34, 'Teléfono', '3000000034'),
    (34, 'Email', 'ivan.rios@example.com'),

    (35, 'Teléfono', '3000000035'),
    (35, 'Email', 'silvia.canales@example.com'),

    (36, 'Teléfono', '3000000036'),
    (36, 'Email', 'mariano.luna@example.com'),

    (37, 'Teléfono', '3000000037'),
    (37, 'Email', 'rocio.ponce@example.com'),

    (38, 'Teléfono', '3000000038'),
    (38, 'Email', 'fabio.acosta@example.com'),

    (39, 'Teléfono', '3000000039'),
    (39, 'Email', 'adriana.delgado@example.com'),

    (40, 'Teléfono', '3000000040'),
    (40, 'Email', 'oscar.caceres@example.com'),

    (41, 'Teléfono', '3000000041'),
    (41, 'Email', 'ignacio.ayala@example.com'),

    (42, 'Teléfono', '3000000042'),
    (42, 'Email', 'carmen.torres@example.com'),

    (43, 'Teléfono', '3000000043'),
    (43, 'Email', 'diego.soto@example.com'),

    (44, 'Teléfono', '3000000044'),
    (44, 'Email', 'mercedes.vega@example.com');
    
-- Inserciones en la tabla Productos

INSERT INTO Productos (nombre, id_tipo_producto, id_unidad_medida, descripcion)
VALUES
	('Tomates', 1, 1, 'Tomates frescos para ensaladas.'),
    ('Zanahorias', 1, 1, 'Zanahorias tiernas cultivadas sin pesticidas.'),
    ('Lechugas', 1, 1, 'Lechugas crujientes y frescas.'),
    ('Espinacas', 1, 1, 'Espinacas orgánicas aptas para ensaladas.'),
    ('Cebollas', 1, 1, 'Cebollas dulces de alta calidad.'),
    ('Ajos', 1, 1, 'Ajos frescos con gran sabor.'),
    ('Pimientos', 1, 1, 'Pimientos dulces y picantes.'),
    ('Brócoli', 1, 1, 'Brócoli orgánico de cultivo propio.'),
    ('Calabacines', 1, 1, 'Calabacines frescos para guisos.'),
    ('Berenjenas', 1, 1, 'Berenjenas tiernas y sabrosas.'),
    ('Fresas', 1, 1, 'Fresas frescas, cultivadas sin químicos.'),
    ('Moras', 1, 1, 'Moras dulces y jugosas.'),
    ('Frambuesas', 1, 1, 'Frambuesas frescas para postres.'),
    ('Manzanas', 1, 1, 'Manzanas crujientes y jugosas.'),
    ('Peras', 1, 1, 'Peras dulces y aromáticas.'),
    ('Kiwis', 1, 1, 'Kiwis frescos de cultivo local.'),
    ('Naranjas', 1, 1, 'Naranjas dulces y jugosas.'),
    ('Limones', 1, 1, 'Limones frescos para jugos.'),
    ('Papayas', 1, 1, 'Papayas maduras de un sabor excepcional.'),
    ('Piñas', 1, 1, 'Piñas tropcales y dulces.'),
    ('Grosellas', 1, 1, 'Grosellas frescas para jaleas.'),
    ('Almendras', 2, 2, 'Almendras orgánicas, perfectas para snacks.'),
    ('Nueces', 2, 2, 'Nueces frescas y útiles para recetas.'),
    ('Cereales', 2, 3, 'Mezcla de varios cereales integrales.'),
    ('Arroz', 2, 3, 'Arroz de alta calidad y cultivo sostenible.'),
    ('Trigo', 2, 3, 'Trigo orgánico para panadería.'),
    ('Miel', 2, 4, 'Miel pura, cultivada localmente.'),
    ('Huevos', 2, 4, 'Huevos frescos de gallinas criadas libremente.'),
    ('Papas', 1, 1, 'Papas frescas para todo tipo de platos.'),
    ('Batatas', 1, 1, 'Batatas dulces y nutritivas.'),
    ('Jengibre', 1, 1, 'Jengibre fresco, ideal para cocina.'),
    ('Cúrcuma', 1, 1, 'Cúrcuma fresca para potenciar sabores.'),
    ('Aceitunas', 2, 4, 'Aceitunas frescas para ensaladas.'),
    ('Fresones', 1, 1, 'Fresones grandes y jugosos.'),
    ('Guayabas', 1, 1, 'Guayabas dulces y fragantes.'),
    ('Lentejas', 2, 3, 'Lentejas rojas y nutritivas.'),
    ('Frijoles', 2, 3, 'Frijoles orgánicos de alta calidad.'),
    ('Garbanzos', 2, 3, 'Garbanzos frescos y llenos de nutrientes.'),
    ('Cebollitas tiernas', 1, 1, 'Cebollitas tiernas ideales para asar.'),
    ('Rúcula', 1, 1, 'Rúcula fresca para ensaladas.'),
    ('Albahaca', 1, 1, 'Albahaca fresca, ideal para cocina italiana.'),
    ('Perejil', 1, 1, 'Perejil fresco, perfecto para guarniciones.'),
    ('Cilantro', 1, 1, 'Cilantro fresco para platillos mexicanos.'),
    ('Tomatillos', 1, 1, 'Tomatillos frescos, excelentes para salsas.'),
    ('Coco', 2, 5, 'Coco fresco, ideal para bebidas.'),
    ('Frutos del bosque', 1, 1, 'Mezcla de frutos del bosque frescos.'),
    ('Limón', 1, 1, 'Limones frescos y jugosos.'),
    ('Hierba de limón', 1, 1, 'Hierba de limón fresca para infusiones.');

-- Inserciones en la tabla Maquinaria

INSERT INTO Maquinaria (nombre, modelo, año_compra, id_estado, fecha_ultimo_mantenimiento, proxima_revision)
VALUES
    ('Tractor John Deere', 'JD2021', 2021, 1, '2023-07-01', '2024-01-15'),
    ('Pulverizador', 'PX400', 2020, 3, '2023-06-20', '2023-12-10'),
    ('Tractor Massey Ferguson', 'MF2020', 2020, 1, '2023-05-15', '2024-06-15'),
    ('Cosechadora Case IH', 'CX800', 2019, 1, '2023-03-10', '2024-04-10'),
    ('Cultivador', 'CULTIV-300', 2021, 1, '2023-02-25', '2024-05-25'),
    ('Fumigadora', 'FUMI200', 2022, 2, '2023-04-30', '2023-11-30'),
    ('Rodillo compactador', 'RC201', 2021, 1, '2023-03-15', '2024-03-01'),
    ('Cosechadora de maíz', 'CM2000', 2022, 1, '2023-06-05', '2024-09-05'),
    ('Tractor Kubota', 'KX057', 2020, 1, '2023-07-20', '2024-01-25'),
    ('Segadora', 'SEG-35', 2021, 1, '2023-08-18', '2024-02-15'),
    ('Retroexcavadora', 'REX-450', 2019, 3, '2023-09-10', '2024-03-30'),
    ('Tractor Fiat', 'F100', 2020, 1, '2023-10-01', '2024-04-01'),
    ('Tanque de agua', 'TA500', 2021, 1, '2023-06-15', '2024-07-10'),
    ('Máquina de ordeño', 'MO-01', 2022, 2, '2023-09-05', '2024-01-10'),
    ('Hormigonera', 'HM-350', 2020, 2, '2023-10-20', '2024-03-15'),
    ('Argolladora', 'ARG-99', 2018, 1, '2023-04-07', '2024-12-07'),
    ('Esparcidor de fertilizante', 'EF100', 2021, 1, '2023-08-22', '2024-05-22'),
    ('Maquina sembradora', 'S100', 2022, 1, '2023-02-05', '2024-02-20'),
    ('Empacadora de heno', 'EHE59', 2021, 1, '2023-09-15', '2024-06-15'),
    ('Tractor New Holland', 'T6050', 2021, 1, '2023-01-10', '2024-01-10'),
    ('Desmalezadora', 'DES90', 2022, 1, '2023-07-14', '2024-08-14'),
    ('Cargadora frontal', 'CF400', 2020, 1, '2023-11-03', '2024-05-03'),
    ('Pala compactadora', 'PC200', 2019, 3, '2023-04-12', '2024-09-20'),
    ('Fertilizadora', 'FERT-202', 2021, 1, '2023-03-07', '2024-06-07'),
    ('Tractor Valtra', 'N123', 2022, 1, '2023-09-01', '2024-12-01'),
    ('Grúas', 'G123', 2020, 1, '2023-05-01', '2024-02-01'),
    ('Tierra compactadora', 'TCX200', 2022, 1, '2023-05-18', '2024-05-18'),
    ('Tractor Agrícola', 'TA-901', 2019, 1, '2023-02-12', '2024-01-12'),
    ('Arado', 'AR200', 2021, 1, '2023-08-12', '2024-10-12'),
    ('Generador', 'GEN-4000', 2020, 2, '2023-04-01', '2024-08-01'),
    ('Barredora', 'BAR-25', 2021, 1, '2023-06-06', '2024-04-06'),
    ('Corta pasto', 'CP-150', 2022, 1, '2023-03-18', '2024-01-18'),
    ('Desbrozadora', 'DE-200', 2021, 2, '2023-07-02', '2024-05-02'),
    ('Poda de arbustos', 'PODA2023', 2022, 1, '2023-01-10', '2024-02-10'),
    ('Fertilizadora de maíz', 'FM2020', 2020, 1, '2023-06-15', '2024-03-15'),
    ('Cortadora de césped', 'CC-900', 2022, 1, '2023-11-01', '2024-08-01'),
    ('Maquinaria de construcción', 'MC2023', 2022, 3, '2023-09-15', '2024-12-15'),
    ('Tractor Case', '770N', 2020, 1, '2023-05-10', '2024-04-10'),
    ('Pulvimetro', 'PU200', 2021, 1, '2023-03-25', '2024-01-25'),
    ('Motocultor', 'MC-200', 2020, 2, '2023-07-14', '2024-04-14'),
    ('Galvanizador', 'GAL-101', 2022, 1, '2023-10-30', '2024-11-30'),
    ('Apilador', 'API-300', 2021, 1, '2023-06-20', '2024-09-20'),
    ('Hinólogo', 'HIN-99', 2022, 1, '2023-03-15', '2024-02-15'),
    ('Pulverizador de herbicidas', 'PH-500', 2020, 2, '2023-04-28', '2024-07-28'),
    ('Cosechadora de hortalizas', 'CH-300', 2021, 1, '2023-01-15', '2024-05-15'),
    ('Rastrillo', 'RAT201', 2022, 1, '2023-11-11', '2024-06-11'),
    ('Descompactadora', 'DD2021', 2020, 2, '2023-08-22', '2024-10-22'),
    ('Calibrador', 'CAL-700', 2021, 1, '2023-01-24', '2024-03-24'),
    ('Manta rotativa', 'MR2021', 2020, 1, '2023-02-15', '2024-04-15');

-- Inserciones en la tabla Productos  

INSERT INTO Productos (nombre, id_tipo_producto, id_unidad_medida, descripcion)
VALUES
	('Tomates', 1, 1, 'Tomates frescos para ensaladas.'),
    ('Zanahorias', 1, 1, 'Zanahorias tiernas cultivadas sin pesticidas.'),
    ('Lechugas', 1, 1, 'Lechugas crujientes y frescas.'),
    ('Espinacas', 1, 1, 'Espinacas orgánicas aptas para ensaladas.'),
    ('Cebollas', 1, 1, 'Cebollas dulces de alta calidad.'),
    ('Ajos', 1, 1, 'Ajos frescos con gran sabor.'),
    ('Pimientos', 1, 1, 'Pimientos dulces y picantes.'),
    ('Brócoli', 1, 1, 'Brócoli orgánico de cultivo propio.'),
    ('Calabacines', 1, 1, 'Calabacines frescos para guisos.'),
    ('Berenjenas', 1, 1, 'Berenjenas tiernas y sabrosas.'),
    ('Fresas', 1, 1, 'Fresas frescas, cultivadas sin químicos.'),
    ('Moras', 1, 1, 'Moras dulces y jugosas.'),
    ('Frambuesas', 1, 1, 'Frambuesas frescas para postres.'),
    ('Manzanas', 1, 1, 'Manzanas crujientes y jugosas.'),
    ('Peras', 1, 1, 'Peras dulces y aromáticas.'),
    ('Kiwis', 1, 1, 'Kiwis frescos de cultivo local.'),
    ('Naranjas', 1, 1, 'Naranjas dulces y jugosas.'),
    ('Limones', 1, 1, 'Limones frescos para jugos.'),
    ('Papayas', 1, 1, 'Papayas maduras de un sabor excepcional.'),
    ('Piñas', 1, 1, 'Piñas tropcales y dulces.'),
    ('Grosellas', 1, 1, 'Grosellas frescas para jaleas.'),
    ('Almendras', 2, 2, 'Almendras orgánicas, perfectas para snacks.'),
    ('Nueces', 2, 2, 'Nueces frescas y útiles para recetas.'),
    ('Cereales', 2, 3, 'Mezcla de varios cereales integrales.'),
    ('Arroz', 2, 3, 'Arroz de alta calidad y cultivo sostenible.'),
    ('Trigo', 2, 3, 'Trigo orgánico para panadería.'),
    ('Miel', 2, 4, 'Miel pura, cultivada localmente.'),
    ('Huevos', 2, 4, 'Huevos frescos de gallinas criadas libremente.'),
    ('Papas', 1, 1, 'Papas frescas para todo tipo de platos.'),
    ('Batatas', 1, 1, 'Batatas dulces y nutritivas.'),
    ('Jengibre', 1, 1, 'Jengibre fresco, ideal para cocina.'),
    ('Cúrcuma', 1, 1, 'Cúrcuma fresca para potenciar sabores.'),
    ('Aceitunas', 2, 4, 'Aceitunas frescas para ensaladas.'),
    ('Fresones', 1, 1, 'Fresones grandes y jugosos.'),
    ('Guayabas', 1, 1, 'Guayabas dulces y fragantes.'),
    ('Lentejas', 2, 3, 'Lentejas rojas y nutritivas.'),
    ('Frijoles', 2, 3, 'Frijoles orgánicos de alta calidad.'),
    ('Garbanzos', 2, 3, 'Garbanzos frescos y llenos de nutrientes.'),
    ('Cebollitas tiernas', 1, 1, 'Cebollitas tiernas ideales para asar.'),
    ('Rúcula', 1, 1, 'Rúcula fresca para ensaladas.'),
    ('Albahaca', 1, 1, 'Albahaca fresca, ideal para cocina italiana.'),
    ('Perejil', 1, 1, 'Perejil fresco, perfecto para guarniciones.'),
    ('Cilantro', 1, 1, 'Cilantro fresco para platillos mexicanos.'),
    ('Tomatillos', 1, 1, 'Tomatillos frescos, excelentes para salsas.'),
    ('Coco', 2, 5, 'Coco fresco, ideal para bebidas.'),
    ('Frutos del bosque', 1, 1, 'Mezcla de frutos del bosque frescos.'),
    ('Limón', 1, 1, 'Limones frescos y jugosos.'),
    ('Hierba de limón', 1, 1, 'Hierba de limón fresca para infusiones.');
    
-- Inserciones en la tabla Maquinaria

INSERT INTO Maquinaria (nombre, modelo, año_compra, id_estado, fecha_ultimo_mantenimiento, proxima_revision)
VALUES
    ('Tractor John Deere', 'JD2021', 2021, 1, '2023-07-01', '2024-01-15'),
    ('Pulverizador', 'PX400', 2020, 3, '2023-06-20', '2023-12-10'),
    ('Tractor Massey Ferguson', 'MF2020', 2020, 1, '2023-05-15', '2024-06-15'),
    ('Cosechadora Case IH', 'CX800', 2019, 1, '2023-03-10', '2024-04-10'),
    ('Cultivador', 'CULTIV-300', 2021, 1, '2023-02-25', '2024-05-25'),
    ('Fumigadora', 'FUMI200', 2022, 2, '2023-04-30', '2023-11-30'),
    ('Rodillo compactador', 'RC201', 2021, 1, '2023-03-15', '2024-03-01'),
    ('Cosechadora de maíz', 'CM2000', 2022, 1, '2023-06-05', '2024-09-05'),
    ('Tractor Kubota', 'KX057', 2020, 1, '2023-07-20', '2024-01-25'),
    ('Segadora', 'SEG-35', 2021, 1, '2023-08-18', '2024-02-15'),
    ('Retroexcavadora', 'REX-450', 2019, 3, '2023-09-10', '2024-03-30'),
    ('Tractor Fiat', 'F100', 2020, 1, '2023-10-01', '2024-04-01'),
    ('Tanque de agua', 'TA500', 2021, 1, '2023-06-15', '2024-07-10'),
    ('Máquina de ordeño', 'MO-01', 2022, 2, '2023-09-05', '2024-01-10'),
    ('Hormigonera', 'HM-350', 2020, 2, '2023-10-20', '2024-03-15'),
    ('Argolladora', 'ARG-99', 2018, 1, '2023-04-07', '2024-12-07'),
    ('Esparcidor de fertilizante', 'EF100', 2021, 1, '2023-08-22', '2024-05-22'),
    ('Maquina sembradora', 'S100', 2022, 1, '2023-02-05', '2024-02-20'),
    ('Empacadora de heno', 'EHE59', 2021, 1, '2023-09-15', '2024-06-15'),
    ('Tractor New Holland', 'T6050', 2021, 1, '2023-01-10', '2024-01-10'),
    ('Desmalezadora', 'DES90', 2022, 1, '2023-07-14', '2024-08-14'),
    ('Cargadora frontal', 'CF400', 2020, 1, '2023-11-03', '2024-05-03'),
    ('Pala compactadora', 'PC200', 2019, 3, '2023-04-12', '2024-09-20'),
    ('Fertilizadora', 'FERT-202', 2021, 1, '2023-03-07', '2024-06-07'),
    ('Tractor Valtra', 'N123', 2022, 1, '2023-09-01', '2024-12-01'),
    ('Grúas', 'G123', 2020, 1, '2023-05-01', '2024-02-01'),
    ('Tierra compactadora', 'TCX200', 2022, 1, '2023-05-18', '2024-05-18'),
    ('Tractor Agrícola', 'TA-901', 2019, 1, '2023-02-12', '2024-01-12'),
    ('Arado', 'AR200', 2021, 1, '2023-08-12', '2024-10-12'),
    ('Generador', 'GEN-4000', 2020, 2, '2023-04-01', '2024-08-01'),
    ('Barredora', 'BAR-25', 2021, 1, '2023-06-06', '2024-04-06'),
    ('Corta pasto', 'CP-150', 2022, 1, '2023-03-18', '2024-01-18'),
    ('Desbrozadora', 'DE-200', 2021, 2, '2023-07-02', '2024-05-02'),
    ('Poda de arbustos', 'PODA2023', 2022, 1, '2023-01-10', '2024-02-10'),
    ('Fertilizadora de maíz', 'FM2020', 2020, 1, '2023-06-15', '2024-03-15'),
    ('Cortadora de césped', 'CC-900', 2022, 1, '2023-11-01', '2024-08-01'),
    ('Maquinaria de construcción', 'MC2023', 2022, 3, '2023-09-15', '2024-12-15'),
    ('Tractor Case', '770N', 2020, 1, '2023-05-10', '2024-04-10'),
    ('Pulvimetro', 'PU200', 2021, 1, '2023-03-25', '2024-01-25'),
    ('Motocultor', 'MC-200', 2020, 2, '2023-07-14', '2024-04-14'),
    ('Galvanizador', 'GAL-101', 2022, 1, '2023-10-30', '2024-11-30'),
    ('Apilador', 'API-300', 2021, 1, '2023-06-20', '2024-09-20'),
    ('Hinólogo', 'HIN-99', 2022, 1, '2023-03-15', '2024-02-15'),
    ('Pulverizador de herbicidas', 'PH-500', 2020, 2, '2023-04-28', '2024-07-28'),
    ('Cosechadora de hortalizas', 'CH-300', 2021, 1, '2023-01-15', '2024-05-15'),
    ('Rastrillo', 'RAT201', 2022, 1, '2023-11-11', '2024-06-11'),
    ('Descompactadora', 'DD2021', 2020, 2, '2023-08-22', '2024-10-22'),
    ('Calibrador', 'CAL-700', 2021, 1, '2023-01-24', '2024-03-24'),
    ('Manta rotativa', 'MR2021', 2020, 1, '2023-02-15', '2024-04-15');   
    
-- Inserciones en la tabla Proveedores

INSERT INTO Proveedores (nombre_empresa, contacto, estado)
VALUES
    ('AgroSupply', 'Tel: 555-6789', 'Activo'),
    ('Maquinarias del Valle', 'Email: info@maquinas.com', 'Inactivo'),
    ('Fertilizantes Orgánicos S.A.', 'Tel: 555-1234, Email: ventas@fertilizantesorg.com', 'Activo'),
    ('Semillas Elite', 'Tel: 555-5678, Email: contacto@semillaselite.com', 'Activo'),
    ('Riegos Tecnificados', 'Tel: 555-9012, Email: soporte@riegostec.com', 'Activo'),
    ('Insumos Agrícolas del Sur', 'Tel: 555-3456, Email: ventas@insumosagricolas.com', 'Activo'),
    ('Maquinaria Agrícola Moderna', 'Tel: 555-7890, Email: ventas@maquinariamoderna.com', 'Activo'),
    ('Vivero Esperanza', 'Tel: 555-2345, Email: info@viveroesperanza.com', 'Activo'),
    ('Abonos y Cultivos', 'Tel: 555-6789, Email: contacto@abonosycultivos.com', 'Activo'),
    ('Herramientas Agrícolas del Norte', 'Tel: 555-4321, Email: ventas@herramientasagricolas.com', 'Activo'),
    ('Sistemas de Riego Inteligente', 'Tel: 555-8765, Email: soporte@riegosintelientes.com', 'Activo'),
    ('Fertilizantes Especializados', 'Tel: 555-2109, Email: ventas@fertiespecializados.com', 'Activo'),
    ('Viveros del Futuro', 'Tel: 555-5432, Email: contacto@viverosdelfuturo.com', 'Activo'),
    ('Equipos Agrícolas Avanzados', 'Tel: 555-9876, Email: ventas@equiposavanzados.com', 'Activo'),
    ('Control de Plagas Ecológico', 'Tel: 555-3210, Email: info@plagasecologicas.com', 'Activo'),
    ('Suministros Agrícolas Premium', 'Tel: 555-6543, Email: ventas@suministrospremium.com', 'Activo'),
    ('Tecnología en Riego', 'Tel: 555-7654, Email: soporte@tecnologiariego.com', 'Activo'),
    ('Semillas de Altura', 'Tel: 555-4567, Email: contacto@semillasdealtura.com', 'Activo'),
    ('Soluciones Agrícolas Integrales', 'Tel: 555-8901, Email: ventas@solucionesagricolas.com', 'Activo'),
    ('Herramientas de Precisión', 'Tel: 555-2345, Email: info@herramientasprecision.com', 'Activo'),
    ('Fertilizantes Biológicos', 'Tel: 555-6789, Email: ventas@fertibilogicos.com', 'Activo'),
    ('Sistemas de Monitoreo Agrícola', 'Tel: 555-4321, Email: soporte@monitoreoagricola.com', 'Activo'),
    ('Vivero Innovación', 'Tel: 555-8765, Email: contacto@viveroinnovacion.com', 'Activo'),
    ('Equipos de Post-Cosecha', 'Tel: 555-2109, Email: ventas@equipospostcosecha.com', 'Activo'),
    ('Control Biológico de Plagas', 'Tel: 555-5432, Email: info@controlbiologico.com', 'Activo'),
    ('Tecnología Agrícola Avanzada', 'Tel: 555-9876, Email: ventas@tecnologiaagricola.com', 'Activo'),
    ('Suministros de Riego Eficiente', 'Tel: 555-3210, Email: soporte@riegoeficiente.com', 'Activo'),
    ('Semillas Certificadas', 'Tel: 555-6543, Email: contacto@semillascertificadas.com', 'Activo'),
    ('Soluciones Agrícolas Sostenibles', 'Tel: 555-7654, Email: ventas@solucionessostenibles.com', 'Activo'),
    ('Herramientas Agrícolas Especializadas', 'Tel: 555-4567, Email: info@herramientasespecializadas.com', 'Activo'),
    ('Fertilizantes de Precisión', 'Tel: 555-8901, Email: ventas@fertiprecision.com', 'Activo'),
    ('Sistemas de Agricultura de Precisión', 'Tel: 555-2345, Email: soporte@agriculteraprecision.com', 'Activo'),
    ('Vivero Desarrollo', 'Tel: 555-6789, Email: contacto@viverodesarrollo.com', 'Activo'),
    ('Equipos de Transformación', 'Tel: 555-4321, Email: ventas@equipostransformacion.com', 'Activo'),
    ('Control Integrado de Plagas', 'Tel: 555-8765, Email: info@controlintegradoplagas.com', 'Activo'),
    ('Tecnología para Agricultura Orgánica', 'Tel: 555-2109, Email: ventas@tecnologiaorganica.com', 'Activo'),
    ('Suministros de Conservación de Suelos', 'Tel: 555-5432, Email: soporte@conservacionsuelos.com', 'Activo'),
    ('Semillas de Desarrollo Genético', 'Tel: 555-9876, Email: contacto@semillasdesarrollo.com', 'Activo'),
    ('Soluciones de Trazabilidad', 'Tel: 555-3210, Email: ventas@solucionestraza.com', 'Activo'),
    ('Herramientas de Agricultura Sostenible', 'Tel: 555-6543, Email: info@herramientassostenibles.com', 'Activo'),
    ('Fertilizantes Microbiológicos', 'Tel: 555-7654, Email: ventas@fertimicrobiologicos.com', 'Activo'),
    ('Sistemas de Energía Renovable', 'Tel: 555-4567, Email: soporte@energiarenovable.com', 'Activo'),
    ('Vivero Conservación', 'Tel: 555-8901, Email: contacto@viveroconservacion.com', 'Activo'),
    ('Equipos de Análisis de Suelos', 'Tel: 555-2345, Email: ventas@equipossuelos.com', 'Activo'),
    ('Control de Calidad Agrícola', 'Tel: 555-6789, Email: info@controlcalidad.com', 'Activo'),
    ('Tecnología de Gestión Agrícola', 'Tel: 555-4321, Email: ventas@gestionagricola.com', 'Activo');

-- Inserciones en la tabla Clientes

INSERT INTO Clientes (nombre, apellido, empresa, estado)
VALUES
    ('Carlos', 'López', 'Frutas del Sur', 'Activo'),
    ('María', 'Rodríguez', NULL, 'Inactivo'),
    ('Juan', 'Martínez', 'Supermercados Unidos', 'Activo'),
    ('Ana', 'García', 'Exportadora Gourmet', 'Activo'),
    ('Pedro', 'Sánchez', 'Restaurantes Gourmet', 'Activo'),
    ('Laura', 'Fernández', 'Procesadora de Alimentos', 'Activo'),
    ('Miguel', 'Ramírez', 'Tiendas Orgánicas', 'Activo'),
    ('Sofía', 'Pérez', 'Distribuidora Nacional', 'Activo'),
    ('Diego', 'Hernández', 'Cafeterías Especializadas', 'Activo'),
    ('Elena', 'Torres', 'Exportaciones Internacionales', 'Activo'),
    ('Andrés', 'Jiménez', 'Productos Ecológicos', 'Activo'),
    ('Isabel', 'Ruiz', 'Comercializadora Agrícola', 'Activo'),
    ('Ricardo', 'Morales', 'Mercados Mayoristas', 'Activo'),
    ('Carmen', 'Gómez', 'Cooperativa Agrícola', 'Activo'),
    ('José', 'Díaz', 'Restaurante Vegetariano', 'Activo'),
    ('Lucía', 'Álvarez', 'Tienda de Productos Naturales', 'Activo'),
    ('Fernando', 'Navarro', 'Importadora Gourmet', 'Activo'),
    ('Beatriz', 'Romero', 'Catering Especializado', 'Activo'),
    ('Javier', 'Molina', 'Centro de Distribución', 'Activo'),
    ('Daniela', 'Silva', 'Cafetería Artesanal', 'Activo'),
    ('Rafael', 'Castro', 'Tienda de Especialidades', 'Activo'),
    ('Marina', 'Ortiz', 'Exportadora de Cafés', 'Activo'),
    ('Daniel', 'Moreno', 'Restaurante Internacional', 'Activo'),
    ('Paula', 'Núñez', 'Distribuidora Gourmet', 'Activo'),
    ('Alberto', 'Vargas', 'Tienda de Producto Local', 'Activo'),
    ('Natalia', 'Ramos', 'Mercado de Agricultores', 'Activo'),
    ('Roberto', 'Gutiérrez', 'Procesadora de Café', 'Activo'),
    ('Andrea', 'Mendoza', 'Exportadora de Cacao', 'Activo'),
    ('Sergio', 'Herrera', 'Tienda de Productos Orgánicos', 'Activo'),
    ('Valentina', 'Aguilar', 'Restaurante de Autor', 'Activo'),
    ('Gabriel', 'Luna', 'Comercio Justo', 'Activo'),
    ('Mariana', 'Reyes', 'Desarrollo de Productos', 'Activo'),
    ('Ernesto', 'Castillo', 'Consultoría Alimentaria', 'Activo'),
    ('Claudia', 'Vega', 'Tienda Especializada', 'Activo'),
    ('Jorge', 'Blanco', 'Distribución Gourmet', 'Activo'),
    ('Patricia', 'Cortés', 'Importadora de Alimentos', 'Activo'),
    ('Manuel', 'Cruz', 'Comercializadora de Café', 'Activo'),
    ('Rosario', 'Campos', 'Restaurante Eco', 'Activo'),
    ('Héctor', 'Ríos', 'Mercado de Especialidades', 'Activo'),
    ('Alejandra', 'Domínguez', 'Procesadora Artesanal', 'Activo'),
    ('Raúl', 'Paredes', 'Exportadora de Productos', 'Activo'),
    ('Susana', 'Miranda', 'Tienda de Productos Locales', 'Activo'),
    ('Eduardo', 'Contreras', 'Distribuidora Especializada', 'Activo'),
    ('Mónica', 'Tapia', 'Comercio Especializado', 'Activo'),
    ('Francisco', 'Sepúlveda', 'Mercado Gourmet', 'Activo'),
    ('Liliana', 'Soto', 'Exportadora de Frutos', 'Activo'),
    ('Guillermo', 'Carrasco', 'Procesadora de Alimentos', 'Activo'),
    ('Yolanda', 'Araya', 'Tienda de Especialidades', 'Activo');

-- Inserciones en la tabla ClientesContactos

INSERT INTO ClientesContactos (id_cliente, tipo_contacto, valor)
VALUES
    (1, 'Teléfono', '3000000001'),
    (1, 'Email', 'carlos.lopez@gmail.com'),
    (1, 'Dirección', 'Calle Falsa 123, Bogotá, Colombia'),
    (2, 'Teléfono', '3000000002'),
    (2, 'Email', 'maria.rodriguez@gmail.com'),
    (2, 'Dirección', 'Avenida Siempre Viva 456, Medellín, Colombia'),
    (3, 'Teléfono', '3000000003'),
    (3, 'Email', 'juan.martinez@gmail.com'),
    (3, 'Dirección', 'Calle Comercio 789, Cali, Colombia'),
    (4, 'Teléfono', '3000000004'),
    (4, 'Email', 'ana.garcia@gmail.com'),
    (4, 'Dirección', 'Avenida Central 101, Barranquilla, Colombia'),
    (5, 'Teléfono', '3000000005'),
    (5, 'Email', 'pedro.sanchez@gmail.com'),
    (5, 'Dirección', 'Calle del Gourmet 102, Cartagena, Colombia'),
    (6, 'Teléfono', '3000000006'),
    (6, 'Email', 'laura.fernandez@gmail.com'),
    (6, 'Dirección', 'Calle Orgánica 103, Bucaramanga, Colombia'),
    (7, 'Teléfono', '3000000007'),
    (7, 'Email', 'miguel.ramirez@gmail.com'),
    (7, 'Dirección', 'Avenida Tierra 104, Pereira, Colombia'),
    (8, 'Teléfono', '3000000008'),
    (8, 'Email', 'sofia.perez@gmail.com'),
    (8, 'Dirección', 'Calle Central 105, Manizales, Colombia'),
    (9, 'Teléfono', '3000000009'),
    (9, 'Email', 'diego.hernandez@gmail.com'),
    (9, 'Dirección', 'Avenida del Café 106, Santa Marta, Colombia'),
    (10, 'Teléfono', '3000000010'),
    (10, 'Email', 'elena.torres@gmail.com'),
    (10, 'Dirección', 'Calle Internacional 107, Armenia, Colombia'),
    (11, 'Teléfono', '3000000011'),
    (11, 'Email', 'andres.jimenez@gmail.com'),
    (11, 'Dirección', 'Avenida Verde 108, Cúcuta, Colombia'),
    (12, 'Teléfono', '3000000012'),
    (12, 'Email', 'isabel.ruiz@gmail.com'),
    (12, 'Dirección', 'Calle Agro 109, Ibagué, Colombia'),
    (13, 'Teléfono', '3000000013'),
    (13, 'Email', 'ricardo.morales@gmail.com'),
    (13, 'Dirección', 'Avenida Mayorista 110, Villavicencio, Colombia'),
    (14, 'Teléfono', '3000000014'),
    (14, 'Email', 'carmen.gomez@gmail.com'),
    (14, 'Dirección', 'Calle Rural 111, Montería, Colombia'),
    (15, 'Teléfono', '3000000015'),
    (15, 'Email', 'jose.diaz@gmail.com'),
    (15, 'Dirección', 'Avenida Verde 112, Pasto, Colombia'),
    (16, 'Teléfono', '3000000016'),
    (16, 'Email', 'lucia.alvarez@gmail.com'),
    (16, 'Dirección', 'Calle Natural 113, Neiva, Colombia'),
    (17, 'Teléfono', '3000000017'),
    (17, 'Email', 'fernando.navarro@gmail.com'),
    (17, 'Dirección', 'Avenida Gourmet 114, Sincelejo, Colombia'),
    (18, 'Teléfono', '3000000018'),
    (18, 'Email', 'beatriz.romero@gmail.com'),
    (18, 'Dirección', 'Calle Catering 115, Valledupar, Colombia'),
    (19, 'Teléfono', '3000000019'),
    (19, 'Email', 'javier.molina@gmail.com'),
    (19, 'Dirección', 'Avenida Central 116, Quibdó, Colombia'),
    (20, 'Teléfono', '3000000020'),
    (20, 'Email', 'daniela.silva@gmail.com'),
    (20, 'Dirección', 'Calle Artesanal 117, Arauca, Colombia'),
    (21, 'Teléfono', '3000000021'),
    (21, 'Email', 'rafael.castro@gmail.com'),
    (21, 'Dirección', 'Avenida Especial 118, Bogotá, Colombia'),
    (22, 'Teléfono', '3000000022'),
    (22, 'Email', 'marina.ortiz@gmail.com'),
    (22, 'Dirección', 'Calle Café 119, San Andrés, Colombia'),
    (23, 'Teléfono', '3000000023'),
    (23, 'Email', 'daniel.moreno@gmail.com'),
    (23, 'Dirección', 'Avenida Internacional 120, Tumaco, Colombia'),
    (24, 'Teléfono', '3000000024'),
    (24, 'Email', 'paula.nunez@gmail.com'),
    (24, 'Dirección', 'Calle Gourmet 121, Leticia, Colombia'),
    (25, 'Teléfono', '3000000025'),
    (25, 'Email', 'alberto.vargas@gmail.com'),
    (25, 'Dirección', 'Calle Local 122, Valle de Cauca, Colombia'),
    (26, 'Teléfono', '3000000026'),
    (26, 'Email', 'natalia.ramos@gmail.com'),
    (26, 'Dirección', 'Avenida Agro 123, Norte de Santander, Colombia'),
    (27, 'Teléfono', '3000000027'),
    (27, 'Email', 'roberto.gutierrez@gmail.com'),
    (27, 'Dirección', 'Calle Café 124, Risaralda, Colombia'),
    (28, 'Teléfono', '3000000028'),
    (28, 'Email', 'andrea.mendoza@gmail.com'),
    (28, 'Dirección', 'Avenida Cacao 125, Vaupés, Colombia'),
    (29, 'Teléfono', '3000000029'),
    (29, 'Email', 'sergio.herrera@gmail.com'),
    (29, 'Dirección', 'Calle Orgánica 126, Caquetá, Colombia'),
    (30, 'Teléfono', '3000000030'),
    (30, 'Email', 'gabriel.luna@gmail.com'),
    (30, 'Dirección', 'Avenida Autor 127, Guainía, Colombia'),
    (31, 'Teléfono', '3000000031'),
    (31, 'Email', 'mariana.reyes@gmail.com'),
    (31, 'Dirección', 'Calle Desarrollo 128, Guaviare, Colombia'),
    (32, 'Teléfono', '3000000032'),
    (32, 'Email', 'ernesto.castillo@gmail.com'),
    (32, 'Dirección', 'Calle Alimentaria 129, Huila, Colombia'),
    (33, 'Teléfono', '3000000033'),
    (33, 'Email', 'claudia.vega@gmail.com'),
    (33, 'Dirección', 'Avenida Especializada 130, Tolima, Colombia'),
    (34, 'Teléfono', '3000000034'),
    (34, 'Email', 'jorge.blanco@gmail.com'),
    (34, 'Dirección', 'Calle Distribución 131, Chocó, Colombia'),
    (35, 'Teléfono', '3000000035'),
    (35, 'Email', 'patricia.cortes@gmail.com'),
    (35, 'Dirección', 'Calle Importación 132, Sucre, Colombia'),
    (36, 'Teléfono', '3000000036'),
    (36, 'Email', 'manuel.cruz@gmail.com'),
    (36, 'Dirección', 'Calle Café 133, César, Colombia'),
    (37, 'Teléfono', '3000000037'),
    (37, 'Email', 'rosario.campos@gmail.com'),
    (37, 'Dirección', 'Avenida Eco 134, La Guajira, Colombia'),
    (38, 'Teléfono', '3000000038'),
    (38, 'Email', 'hector.rios@gmail.com'),
    (38, 'Dirección', 'Calle Especialidad 135, Nariño, Colombia'),
    (39, 'Teléfono', '3000000039'),
    (39, 'Email', 'alejandra.dominguez@gmail.com'),
    (39, 'Dirección', 'Avenida Artesanal 136, Meta, Colombia'),
    (40, 'Teléfono', '3000000040'),
    (40, 'Email', 'raul.paredes@gmail.com'),
    (40, 'Dirección', 'Calle Exportación 137, Atlántico, Colombia'),
    (41, 'Teléfono', '3000000041'),
    (41, 'Email', 'susana.miranda@gmail.com'),
    (41, 'Dirección', 'Avenida Local 138, Córdoba, Colombia'),
    (42, 'Teléfono', '3000000042'),
    (42, 'Email', 'eduardo.contreras@gmail.com'),
    (42, 'Dirección', 'Calle Especializada 139, Bolívar, Colombia'),
    (43, 'Teléfono', '3000000043'),
    (43, 'Email', 'monica.tapia@gmail.com'),
    (43, 'Dirección', 'Avenida Comercial 140, Amazonas, Colombia'),
    (44, 'Teléfono', '3000000044'),
    (44, 'Email', 'francisco.sepulveda@gmail.com'),
    (44, 'Dirección', 'Calle Gourmet 141, Vichada, Colombia'),
    (45, 'Teléfono', '3000000045'),
    (45, 'Email', 'liliana.soto@gmail.com'),
    (45, 'Dirección', 'Avenida Frutos 142, Quindío, Colombia'),
    (46, 'Teléfono', '3000000046'),
    (46, 'Email', 'guillermo.carrasco@gmail.com'),
    (46, 'Dirección', 'Calle Alimentos 143, Putumayo, Colombia'),
    (47, 'Teléfono', '3000000047'),
    (47, 'Email', 'yolanda.araya@gmail.com'),
    (47, 'Dirección', 'Avenida Especialidades 144, Boyacá, Colombia'),
    (48, 'Teléfono', '3000000048'),
    (48, 'Email', 'ana.perez@gmail.com'),
    (48, 'Dirección', 'Calle Ecología 145, Santander, Colombia');
    
-- Inserciones en la tabla Insumos

INSERT INTO Insumos (nombre, id_unidad_medida, stock_actual, stock_minimo, descripcion, estado)
VALUES
    ('Fertilizante NPK', 1, 500.00, 100.00, 'Fertilizante de alta eficiencia.', 'Activo'),
    ('Insecticida Orgánico', 2, 200.00, 50.00, 'Ideal para cultivos sensibles.', 'Activo'),
    ('Abono Compost', 1, 750.00, 200.00, 'Abono orgánico para mejora de suelos.', 'Activo'),
    ('Pesticida Biológico', 2, 180.00, 50.00, 'Control de plagas ecológico.', 'Activo'),
    ('Semillas de Café Arábiga', 3, 100.00, 25.00, 'Semillas certificadas de alta calidad.', 'Activo'),
    ('Fungicida Orgánico', 2, 150.00, 40.00, 'Tratamiento contra hongos en cultivos.', 'Activo'),
    ('Fertilizante Líquido', 4, 300.00, 75.00, 'Nutrientes líquidos para riego.', 'Activo'),
    ('Semillas de Cacao Fino', 3, 80.00, 20.00, 'Variedades selectas de cacao.', 'Activo'),
    ('Microorganismos Benéficos', 1, 250.00, 50.00, 'Mejoradores de suelo biológicos.', 'Activo'),
    ('Repelente Natural de Insectos', 2, 120.00, 30.00, 'Protección ecológica para cultivos.', 'Activo'),
    ('Sal Mineral Agrícola', 1, 500.00, 100.00, 'Suplemento mineral para suelos.', 'Activo'),
    ('Bioestimulante Vegetal', 4, 180.00, 50.00, 'Estimulante de crecimiento orgánico.', 'Activo'),
    ('Semillas de Aguacate', 3, 70.00, 15.00, 'Variedades selectas de aguacate.', 'Activo'),
    ('Regulador de pH para Suelo', 4, 200.00, 50.00, 'Corrector de acidez de suelos.', 'Activo'),
    ('Micorrizas', 1, 150.00, 30.00, 'Hongos benéficos para raíces.', 'Activo'),
    ('Aceite Agrícola Mineral', 4, 250.00, 60.00, 'Lubricante y protector de maquinaria.', 'Activo'),
    ('Semillas de Tomate Injertado', 3, 90.00, 25.00, 'Tomates resistentes a enfermedades.', 'Activo'),
    ('Polímero Retenedor de Humedad', 1, 300.00, 75.00, 'Mejora retención de agua en suelos.', 'Activo'),
    ('Extracto de Neem', 2, 180.00, 40.00, 'Insecticida natural concentrado.', 'Activo'),
    ('Semillas de Pimiento', 3, 100.00, 25.00, 'Variedades de pimientos selectos.', 'Activo'),
    ('Calcio Foliar', 4, 200.00, 50.00, 'Suplemento nutricional para plantas.', 'Activo'),
    ('Trampa Cromática', 3, 150.00, 30.00, 'Control biológico de insectos.', 'Activo'),
    ('Semillas de Chiles', 3, 80.00, 20.00, 'Variedades de chiles gourmet.', 'Activo'),
    ('Aminoácidos Vegetales', 4, 220.00, 50.00, 'Bioestimulante orgánico.', 'Activo'),
    ('Kit de PH y Nutrientes', 5, 100.00, 25.00, 'Kit completo de análisis de suelo.', 'Activo'),
    ('Semillas de Plátano', 3, 70.00, 15.00, 'Variedades de plátano certificadas.', 'Activo'),
    ('Arcilla Agrícola', 1, 400.00, 100.00, 'Mejora estructura del suelo.', 'Activo'),
    ('Bacterias Promotoras de Crecimiento', 1, 180.00, 40.00, 'Mejoradores biológicos.', 'Activo'),
    ('Semillas de Cítricos', 3, 90.00, 25.00, 'Árboles frutales de alta calidad.', 'Activo'),
    ('Quelatos de Hierro', 4, 150.00, 30.00, 'Corrector de clorosis férrica.', 'Activo'),
    ('Abono Verde', 1, 250.00, 60.00, 'Cultivos de cobertura y mejora.', 'Activo'),
    ('Semillas de Árboles Nativos', 3, 60.00, 15.00, 'Especies de reforestación.', 'Activo'),
    ('Silicio Líquido', 4, 200.00, 50.00, 'Fortalecedor de defensas vegetales.', 'Activo'),
    ('Adherente Natural', 2, 180.00, 40.00, 'Mejora adherencia de productos.', 'Activo'),
    ('Semillas de Café Robusta', 3, 85.00, 20.00, 'Variedades resistentes.', 'Activo'),
    ('Azufre Agrícola', 1, 300.00, 75.00, 'Corrector de suelos alcalinos.', 'Activo'),
    ('Probióticos Vegetales', 1, 220.00, 50.00, 'Microorganismos benéficos.', 'Activo'),
    ('Semillas de Hortalizas de Altura', 3, 95.00, 25.00, 'Variedades adaptadas.', 'Activo'),
    ('Ácidos Húmicos', 4, 180.00, 40.00, 'Activador de suelos.', 'Activo'),
    ('Biofertilizante Foliar', 4, 250.00, 60.00, 'Nutrición foliar orgánica.', 'Activo'),
    ('Semillas de Cultivos Alternativos', 3, 75.00, 20.00, 'Variedades experimentales.', 'Activo'),
    ('Zeolita Agrícola', 1, 350.00, 80.00, 'Retenedor de nutrientes.', 'Activo'),
    ('Extracto de Algas', 4, 200.00, 50.00, 'Bioestimulante marino.', 'Activo'),
    ('Semillas de Flores Comestibles', 3, 65.00, 15.00, 'Variedades especiales.', 'Activo'),
    ('Magnesio Agrícola', 4, 180.00, 40.00, 'Corrector nutricional.', 'Activo'),
    ('Biocarbón', 1, 250.00, 60.00, 'Mejorador de suelos.', 'Activo');

--Inserciones en la tabla ProveedoresInsumos

INSERT INTO ProveedoresInsumos (id_proveedor, id_insumo)
VALUES
    (1, 1),  -- Proveedor 1 ofrece Fertilizante NPK
    (1, 2),  -- Proveedor 1 ofrece Insecticida Orgánico
    (1, 3),  -- Proveedor 1 ofrece Abono Compost
    (2, 4),  -- Proveedor 2 ofrece Pesticida Biológico
    (2, 5),  -- Proveedor 2 ofrece Semillas de Café Arábiga
    (2, 6),  -- Proveedor 2 ofrece Fungicida Orgánico
    (3, 7),  -- Proveedor 3 ofrece Fertilizante Líquido
    (3, 8),  -- Proveedor 3 ofrece Semillas de Cacao Fino
    (4, 9),  -- Proveedor 4 ofrece Microorganismos Benéficos
    (4, 10), -- Proveedor 4 ofrece Repelente Natural de Insectos
    (5, 11), -- Proveedor 5 ofrece Sal Mineral Agrícola
    (5, 12), -- Proveedor 5 ofrece Bioestimulante Vegetal
    (6, 13), -- Proveedor 6 ofrece Semillas de Aguacate
    (6, 14), -- Proveedor 6 ofrece Regulador de pH para Suelo
    (7, 15), -- Proveedor 7 ofrece Micorrizas
    (7, 16), -- Proveedor 7 ofrece Aceite Agrícola Mineral
    (8, 17), -- Proveedor 8 ofrece Semillas de Tomate Injertado
    (8, 18), -- Proveedor 8 ofrece Polímero Retenedor de Humedad
    (9, 19), -- Proveedor 9 ofrece Extracto de Neem
    (9, 20), -- Proveedor 9 ofrece Semillas de Pimiento
    (10, 21),-- Proveedor 10 ofrece Calcio Foliar
    (10, 22),-- Proveedor 10 ofrece Trampa Cromática
    (11, 23),-- Proveedor 11 ofrece Semillas de Chiles
    (11, 24),-- Proveedor 11 ofrece Aminoácidos Vegetales
    (12, 25),-- Proveedor 12 ofrece Kit de PH y Nutrientes
    (12, 26),-- Proveedor 12 ofrece Semillas de Plátano
    (13, 27),-- Proveedor 13 ofrece Arcilla Agrícola
    (13, 28),-- Proveedor 13 ofrece Bacterias Promotoras de Crecimiento
    (14, 29),-- Proveedor 14 ofrece Semillas de Cítricos
    (14, 30),-- Proveedor 14 ofrece Quelatos de Hierro
    (15, 31),-- Proveedor 15 ofrece Abono Verde
    (15, 32),-- Proveedor 15 ofrece Semillas de Árboles Nativos
    (16, 33),-- Proveedor 16 ofrece Silicio Líquido
    (16, 34),-- Proveedor 16 ofrece Adherente Natural
    (17, 35),-- Proveedor 17 ofrece Semillas de Café Robusta
    (17, 36),-- Proveedor 17 ofrece Azufre Agrícola
    (18, 37),-- Proveedor 18 ofrece Probióticos Vegetales
    (18, 38),-- Proveedor 18 ofrece Semillas de Hortalizas de Altura
    (19, 39),-- Proveedor 19 ofrece Ácidos Húmicos
    (19, 40),-- Proveedor 19 ofrece Biofertilizante Foliar
    (20, 41),-- Proveedor 20 ofrece Semillas de Cultivos Alternativos
    (20, 42),-- Proveedor 20 ofrece Zeolita Agrícola
    (21, 43),-- Proveedor 21 ofrece Extracto de Algas
    (21, 44),-- Proveedor 21 ofrece Semillas de Flores Comestibles
    (22, 45),-- Proveedor 22 ofrece Magnesio Agrícola
    (22, 46); -- Proveedor 22 ofrece Biocarbón

--Inserciones en la tabla produccion

INSERT INTO Produccion (id_finca, id_sector, id_producto, id_empleado, fecha_inicio, fecha_fin, cantidad_producida, estado_produccion, observaciones)
VALUES
    (1, 1, 1, 1, '2023-01-10', '2023-01-20', 500.00, 'Finalizada', 'Producción de tomates.'),
    (1, 1, 2, 2, '2023-01-21', NULL, 300.00, 'En Proceso', 'Producción de zanahorias.'),
    (1, 1, 3, 3, '2023-02-01', '2023-02-10', 400.00, 'Finalizada', 'Producción de lechugas.'),
    (1, 1, 4, 4, '2023-02-11', '2023-02-20', 350.00, 'En Proceso', 'Producción de espinacas.'),
    (1, 1, 5, 5, '2023-02-21', '2023-03-01', 450.00, 'Finalizada', 'Producción de cebollas.'),
    (1, 2, 6, 6, '2023-03-02', '2023-03-15', 300.00, 'En Proceso', 'Producción de ajos.'),
    (1, 2, 7, 7, '2023-03-16', NULL, 200.00, 'Planificada', 'Producción de pimientos.'),
    (1, 2, 8, 8, '2023-03-17', NULL, 250.00, 'Finalizada', 'Producción de brócoli.'),
    (1, 3, 9, 9, '2023-03-18', NULL, 300.00, 'En Proceso', 'Producción de calabacines.'),
    (1, 3, 10, 10, '2023-03-19', NULL, 150.00, 'Planificada', 'Producción de berenjenas.'),
    (1, 3, 11, 11, '2023-03-20', NULL, 200.00, 'Finalizada', 'Producción de fresas.'),
    (1, 3, 12, 12, '2023-03-21', NULL, 100.00, 'En Proceso', 'Producción de moras.'),
    (1, 3, 13, 13, '2023-03-22', NULL, 180.00, 'Finalizada', 'Producción de frambuesas.'),
    (1, 3, 14, 14, '2023-03-23', NULL, 250.00, 'En Proceso', 'Producción de manzanas.'),
    (1, 3, 15, 15, '2023-03-24', NULL, 300.00, 'Planificada', 'Producción de peras.'),
    (1, 3, 16, 16, '2023-03-25', NULL, 350.00, 'Finalizada', 'Producción de kiwis.'),
    (1, 3, 17, 17, '2023-03-26', NULL, 220.00, 'En Proceso', 'Producción de naranjas.'),
    (1, 3, 18, 18, '2023-03-27', NULL, 245.00, 'Planificada', 'Producción de limones.'),
    (1, 3, 19, 19, '2023-03-28', NULL, 280.00, 'Finalizada', 'Producción de papayas.'),
    (1, 1, 1, 1, '2023-01-10', '2023-01-20', 500.00, 'Finalizada', 'Producción de tomates.'),
    (1, 1, 1, 1, '2023-08-01', NULL, 50.00, 'Finalizada', 'Producción de tomates'),
    (1, 1, 1, 1, '2023-08-10', NULL, 30.00, 'Finalizada', 'Producción de zanahorias'),
    (1, 2, 3, 2, '2023-08-15', NULL, 20.00, 'Planificada', 'Producción de lechugas');

-- Inserciones en la tabla Ventas

INSERT INTO Ventas (id_cliente, id_produccion, fecha_venta, cantidad, precio_unitario)
VALUES
    (1, 1, '2023-09-01', 50.00, 2.00),   
    (2, 2, '2023-09-02', 30.00, 3.00),   
    (3, 3, '2023-09-03', 20.00, 2.50);

--Inserciones en la tabla DetallesVenta   

INSERT INTO DetallesVenta (id_venta, id_producto, cantidad, precio_unitario)
VALUES
    (LAST_INSERT_ID(), 1, 50, 2.00),  
    (LAST_INSERT_ID(), 2, 30, 3.00),  
    (LAST_INSERT_ID(), 3, 20, 2.50);

--Inserciones en la tabla UsoInsumos 

INSERT INTO UsoInsumos (id_produccion, id_insumo, cantidad, fecha_uso, observaciones)
VALUES
    (1, 1, 100.00, '2023-08-10', 'Uso de fertilizante NPK para tomates'), 
    (2, 2, 50.00, '2023-08-12', 'Uso de insecticida orgánico en zanahorias'),  
    (3, 3, 150.00, '2023-08-15', 'Uso de abono compost en lechugas');

--Inserciones en la tabla UsoMaquinaria     

INSERT INTO UsoMaquinaria (id_produccion, id_maquinaria, fecha_uso, horas_uso, observaciones)
VALUES
    (1, 1, '2023-08-10', 5.0, 'Uso diario'),  
    (1, 2, '2023-08-12', 3.0, 'Mantenimiento preventivo'),  
    (2, 3, '2023-08-15', 4.5, 'Reparación'); 

--Inserciones en la tabla ContactoProveedores

INSERT INTO ContactoProveedores (id_proveedor, tipo_contacto, valor)
VALUES
    (1, 'Teléfono', 'Tel: 555-6789'),
    (1, 'Email', 'contacto@agrosupply.com'),
    (1, 'Dirección', 'Calle 123, Ciudad Agraria'),

    (2, 'Teléfono', 'Tel: 555-4567'),
    (2, 'Email', 'info@maquinariasdelvalle.com'),
    (2, 'Dirección', 'Avenida 456, Ciudad Maquinaria'),

    (3, 'Teléfono', 'Tel: 555-1234'),
    (3, 'Email', 'ventas@fertilizantesorg.com'),
    (3, 'Dirección', 'Calle Comercio 789, Ciudad Verde'),

    (4, 'Teléfono', 'Tel: 555-5678'),
    (4, 'Email', 'contacto@semillaselite.com'),
    (4, 'Dirección', 'Campo de Semillas, Ciudad Semilla'),

    (5, 'Teléfono', 'Tel: 555-9012'),
    (5, 'Email', 'soporte@riegostec.com'),
    (5, 'Dirección', 'Zona de Riego, Ciudad Riego'),

    (6, 'Teléfono', 'Tel: 555-3456'),
    (6, 'Email', 'ventas@insumosagricolas.com'),
    (6, 'Dirección', 'Calle Agro 101, Ciudad Insumos'),

    (7, 'Teléfono', 'Tel: 555-7890'),
    (7, 'Email', 'ventas@maquinariamoderna.com'),
    (7, 'Dirección', 'Avenue of Machines 100, Ciudad Moderna'),

    (8, 'Teléfono', 'Tel: 555-2345'),
    (8, 'Email', 'info@viveroesperanza.com'),
    (8, 'Dirección', 'Calle Verde 200, Ciudad Esperanza'),

    (9, 'Teléfono', 'Tel: 555-6789'),
    (9, 'Email', 'contacto@abonosycultivos.com'),
    (9, 'Dirección', 'Camino de Abonos 123, Ciudad Cultivo'),

    (10, 'Teléfono', 'Tel: 555-4321'),
    (10, 'Email', 'ventas@herramientasagricolas.com'),
    (10, 'Dirección', 'Avenida de las Herramientas, Ciudad Agrícola'),

    (11, 'Teléfono', 'Tel: 555-8765'),
    (11, 'Email', 'soporte@riegostec.com'),
    (11, 'Dirección', 'Calle del Riego 123, Ciudad Riego'),

    (12, 'Teléfono', 'Tel: 555-2109'),
    (12, 'Email', 'ventas@fertiespecializados.com'),
    (12, 'Dirección', 'Avenida de Fertilizantes, Ciudad Especial'),

    (13, 'Teléfono', 'Tel: 555-5432'),
    (13, 'Email', 'contacto@viverosdelfuturo.com'),
    (13, 'Dirección', 'Calle Vivero, Ciudad Futuro'),

    (14, 'Teléfono', 'Tel: 555-9876'),
    (14, 'Email', 'ventas@equiposavanzados.com'),
    (14, 'Dirección', 'Palacio de Equipos, Ciudad Avanzada'),

    (15, 'Teléfono', 'Tel: 555-3210'),
    (15, 'Email', 'info@plagasecologicas.com'),
    (15, 'Dirección', 'Calle Biológica, Ciudad Ecológica'),

    (16, 'Teléfono', 'Tel: 555-6543'),
    (16, 'Email', 'ventas@suministrospremium.com'),
    (16, 'Dirección', 'Calle Premium, Ciudad Suministros'),

    (17, 'Teléfono', 'Tel: 555-7654'),
    (17, 'Email', 'soporte@tecnologiariego.com'),
    (17, 'Dirección', 'Calle Tecnología, Ciudad de Riego'),

    (18, 'Teléfono', 'Tel: 555-4567'),
    (18, 'Email', 'contacto@semillasdealtura.com'),
    (18, 'Dirección', 'Calle Semillas de Altura, Ciudad Alta'),

    (19, 'Teléfono', 'Tel: 555-8901'),
    (19, 'Email', 'ventas@solucionesagricolas.com'),
    (19, 'Dirección', 'Calle Soluciones, Ciudad Agrícola'),

    (20, 'Teléfono', 'Tel: 555-2345'),
    (20, 'Email', 'info@herramientassostenibles.com'),
    (20, 'Dirección', 'Calle Sostenible, Ciudad Herramientas'),

    (21, 'Teléfono', 'Tel: 555-6789'),
    (21, 'Email', 'ventas@fertibilogicos.com'),
    (21, 'Dirección', 'Calle Biológica 123, Ciudad Fertilizantes'),

    (22, 'Teléfono', 'Tel: 555-4321'),
    (22, 'Email', 'soporte@monitoreoagricola.com'),
    (22, 'Dirección', 'Calle Monitoreo, Ciudad Agrícola');


