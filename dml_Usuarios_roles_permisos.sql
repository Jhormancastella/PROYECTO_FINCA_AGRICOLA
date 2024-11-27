-- Crear usuario Administrador
CREATE USER 'useradmin'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON Agricola.* TO 'useradmin'@'localhost'; -- Acceso total a toda la base de datos
FLUSH PRIVILEGES;

-- Crear usuario Contador
CREATE USER 'usercontador'@'localhost' IDENTIFIED BY '123';
GRANT SELECT ON Agricola.ventas TO 'usercontador'@'localhost';
GRANT SELECT ON Agricola.produccion TO 'usercontador'@'localhost';
GRANT SELECT ON Agricola.auditoria TO 'usercontador'@'localhost';
FLUSH PRIVILEGES;

-- Crear usuario Vendedor
CREATE USER 'uservendedor'@'localhost' IDENTIFIED BY '123';
GRANT SELECT, INSERT, UPDATE ON Agricola.ventas TO 'uservendedor'@'localhost';
GRANT SELECT ON Agricola.productos TO 'uservendedor'@'localhost';
GRANT SELECT ON Agricola.clientes TO 'uservendedor'@'localhost';
FLUSH PRIVILEGES;

-- Crear usuario Encargado de Finca
CREATE USER 'userencargado'@'localhost' IDENTIFIED BY '123';
GRANT SELECT, INSERT, UPDATE ON Agricola.finca TO 'userencargado'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Agricola.sectores TO 'userencargado'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Agricola.produccion TO 'userencargado'@'localhost';
FLUSH PRIVILEGES;

-- Crear usuario Supervisor
CREATE USER 'usersupervisor'@'localhost' IDENTIFIED BY '123';
GRANT SELECT, INSERT, UPDATE ON Agricola.maquinaria TO 'usersupervisor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Agricola.insumos TO 'usersupervisor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Agricola.usomaquinaria TO 'usersupervisor'@'localhost';
FLUSH PRIVILEGES;

-- Aplicar cambios
FLUSH PRIVILEGES;

revoke all privileges on . from 'useradmin'@'localhost';
flush privileges;

SELECT User, Host FROM mysql.user;

DROP USER 'useradmin'@'localhost';
DROP USER 'usercontador'@'localhost';
DROP USER 'uservendedor'@'localhost';
DROP USER 'userencargado'@'localhost';
DROP USER 'usersupervisor'@'localhost';