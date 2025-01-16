-- Crear la base de datos
CREATE DATABASE bbdd_empleadas_join;

-- Usar la base de datos
USE bbdd_empleadas_join;

-- Crear la tabla 'empleadas'
CREATE TABLE empleadas (
    id_empleada INT PRIMARY KEY,
    salario DECIMAL(10, 2),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    pais VARCHAR(50)
);

-- Insertar datos en la tabla 'empleadas'
INSERT INTO empleadas (id_empleada, salario, nombre, apellido, pais) VALUES
(1, 2500, 'Ana', 'González', 'España'),
(2, 4000, 'Maria', 'López', 'España'),
(3, 3000, 'Lucía', 'Ramos', 'España'),
(5, 1500, 'Rocío', 'García', 'Francia');

-- Crear la tabla 'empleadas_en_proyectos' como independiente
CREATE TABLE empleadas_en_proyectos (
    id_empleada INT,  
    id_proyecto INT,
    PRIMARY KEY (id_empleada, id_proyecto)  
);

-- Insertar datos en la tabla 'empleadas_en_proyectos'
INSERT INTO empleadas_en_proyectos (id_empleada, id_proyecto) VALUES
(2, 1), 
(3, 2), 
(5, 3), 
(4, 4); 

SELECT empleadas.nombre, empleadas.apellido, empleadas_en_proyectos.id_proyecto
FROM empleadas
LEFT JOIN empleadas_en_proyectos
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada;

SELECT empleadas.nombre, empleadas.apellido, empleadas_en_proyectos.id_proyecto   
FROM empleadas RIGHT JOIN empleadas_en_proyectos  
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada;  

SELECT A.nombre AS Nombre1, A.apellido AS Apellido1, A.salario AS Salario1, B.nombre AS Nombre2, B.apellido AS Apellido2, B.salario AS Salario2, A.pais  
FROM empleadas AS A, empleadas AS B  
WHERE A.id_empleada <> B.id_empleada  
AND A.pais = B.pais;  
