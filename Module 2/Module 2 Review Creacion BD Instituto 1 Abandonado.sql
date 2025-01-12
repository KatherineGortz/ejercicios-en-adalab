-- REPASO BASE DE DATOS 1--

CREATE SCHEMA instituto;

USE  instituto;

CREATE TABLE profesores (dni VARCHAR (9) PRIMARY KEY, 
nombre VARCHAR (50) NOT NULL,
direccion VARCHAR (200) DEFAULT NULL,
telefono VARCHAR(15) DEFAULT NULL);



CREATE TABLE modulos (codigo INT AUTO_INCREMENT PRIMARY KEY, nombre_modulo VARCHAR (50) NOT NULL);

ALTER TABLE profesores DROP FOREIGN KEY fk_constraint_dni;

ALTER TABLE modulos DROP PRIMARY KEY;

ALTER TABLE modulos DROP FOREIGN KEY FK_dni_profesores;
ALTER TABLE modulos MODIFY COLUMN codigo VARCHAR(10);

ALTER TABLE modulos DROP PRIMARY KEY;

ALTER TABLE modulos MODIFY COLUMN codigo INT;
ALTER TABLE modulos DROP PRIMARY KEY;
ALTER TABLE modulos MODIFY COLUMN codigo VARCHAR(10);
ALTER TABLE modulos ADD PRIMARY KEY (codigo);
ALTER TABLE modulos MODIFY COLUMN codigo VARCHAR(10) AUTO_INCREMENT;




ALTER TABLE modulos
MODIFY COLUMN codigo VARCHAR(10);

CREATE TABLE alumnos (numero_expediente INT AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR (50) NOT NULL, 
apellidos VARCHAR (75) NOT NULL, 
fecha_nacimiento DATE);  

INSERT INTO profesores (dni, nombre, direccion, telefono)
VALUES ('12345678A', 'Juan Pérez', 'Calle Mayor, 10', '600123456'),
('87654321B', 'María López', 'Avenida Sol, 45', '600654321'),
('45678912C', 'Carlos Gómez', 'Plaza Luna, 7', '600789123');

INSERT INTO modulos (codigo, nombre_modulo, dni_profesores)
VALUES
    ('MOD101', 'Matemáticas', '12345678A'),  -- Juan Pérez
    ('MOD102', 'Física', '87654321B'),      -- María López
    ('MOD103', 'Química', '45678912C'),     -- Carlos Gómez
    ('MOD104', 'Biología', '12345678A'),    
    ('MOD105', 'Historia', '87654321B');    
    
ALTER TABLE modulos
ADD COLUMN dni_profesores VARCHAR(9), 
ADD CONSTRAINT FK_dni_profesores
FOREIGN KEY (dni_profesores) REFERENCES profesores(dni);



