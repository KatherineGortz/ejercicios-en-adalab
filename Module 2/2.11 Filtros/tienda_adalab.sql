-- Crear la base de datos
CREATE DATABASE tienda_adalab;

-- Usar la base de datos
USE tienda_adalab;

-- Crear la tabla 'clientes'
CREATE TABLE clientes (
    id_clientes INT PRIMARY KEY,
    id_proyecto INT,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    pais VARCHAR(50)
);

-- Insertar datos en la tabla 'clientes'
INSERT INTO clientes (id_clientes, id_proyecto, nombre, ciudad, pais) VALUES
(1, 1, 'HR Analytics ES', 'Madrid', 'España'),
(2, 2, 'Luxury Brands', 'París', 'Francia'),
(3, 3, 'Preservación Bosques', 'Lisboa', 'Portugal'),
(4, 4, 'Data Inc.', 'Berlín', 'Alemania'),
(5, 5, 'Data Italia', 'Roma', 'Italia');

-- Crear la tabla 'proyectos'
CREATE TABLE proyectos (
    id_proyecto INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    pais VARCHAR(50)
);

-- Insertar datos en la tabla 'proyectos'
INSERT INTO proyectos (id_proyecto, nombre, ciudad, pais) VALUES
(1, 'Predicción Salarios', 'Salamanca', 'España'),
(2, 'Agrupaciones Marcas', 'Brest', 'Francia'),
(3, 'Visualización Bosques', 'Manteigas', 'Portugal'),
(4, 'Corrección de datos', 'Berlín', 'Alemania'),
(5, 'Creación de data lake', 'Nápoles', 'Italia'),
(6, 'Gráficos avanzados', 'Buenos Aires', 'Argentina');