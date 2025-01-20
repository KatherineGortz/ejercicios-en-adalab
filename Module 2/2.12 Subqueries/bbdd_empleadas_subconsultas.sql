-- Crear la base de datos
CREATE DATABASE bbdd_empleadas_subconsultas;

-- Usar la base de datos
USE bbdd_empleadas_subconsultas;

-- Crear la tabla 'empleadas'
CREATE TABLE empleadas (
    id_empleada INT PRIMARY KEY,
    salario INT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    pais VARCHAR(50)
);

-- Crear la tabla 'empleadas_en_proyectos'
CREATE TABLE empleadas_en_proyectos (
    id_empleada INT,
    id_proyecto INT,
    PRIMARY KEY (id_empleada, id_proyecto),
    FOREIGN KEY (id_empleada) REFERENCES empleadas(id_empleada) ON DELETE CASCADE
);

-- Insertar datos en la tabla 'empleadas'
INSERT INTO empleadas (id_empleada, salario, nombre, apellido, pais) VALUES
(1, 2500, 'Ana', 'González', 'España'),
(2, 4000, 'Maria', 'López', 'España'),
(3, 3000, 'Lucía', 'Ramos', 'España'),
(4, 5000, 'Elena', 'Bueno', 'España'),
(5, 1500, 'Rocío', 'García', 'Francia');

-- Insertar datos en la tabla 'empleadas_en_proyectos'
INSERT INTO empleadas_en_proyectos (id_empleada, id_proyecto) VALUES
(1, 1),  
(1, 2),
(2, 1),  
(3, 2),  
(3, 3),
(3, 5),  
(5, 3);  
