
CREATE SCHEMA bbdd_empleadas;

USE bbdd_empleadas;

CREATE TABLE bbdd_empleadas.empleadas (
    id SERIAL PRIMARY KEY,      
    salario FLOAT,      
    nombre VARCHAR(50) NOT NULL,          
    apellido VARCHAR(50),        
    email VARCHAR(100) UNIQUE,  
    telefono INT,        
    ciudad VARCHAR(50),         
    pais VARCHAR(50)             
);

-- Insertar datos en la tabla 'empleadas'
INSERT INTO empleadas (id, salario, nombre, apellido, email, telefono, ciudad, pais) VALUES
(1, 2500, 'Ana', 'González', 'ana@adalab.es', '654785214', 'Madrid', 'España'),
(2, 4000, 'Maria', 'López', 'maria@adalab.es', '689656322', 'Barcelona', 'España'),
(3, 3000, 'Lucía', 'Ramos', 'lucia@gmail.com', '674459123', 'Valencia', 'España'),
(4, 5000, 'Elena', 'Bueno', 'elena@adalab.es', '628546577', 'Bilbao', 'España'),
(5, 1500, 'Rocío', 'García', 'rocio@gmail.com', '616365624', 'París', 'Francia');