-- Crear la base de datos 'bbdd_alumnas' si no existe
CREATE DATABASE IF NOT EXISTS bbdd_alumnas;

-- Usar la base de datos 'bbdd_alumnas'
USE bbdd_alumnas;

-- Crear la tabla 'alumnas'
CREATE TABLE IF NOT EXISTS alumnas (
    id_alumna INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    direccion VARCHAR(255),
    ciudad VARCHAR(100),
    pais VARCHAR(100),
    PRIMARY KEY (id_alumna)
);

-- Insertar los datos en la tabla 'alumnas'
INSERT INTO alumnas (nombre, apellido, email, telefono, direccion, ciudad, pais) VALUES
('Ana', 'González', 'ana@adalab.es', '654785214', 'Calle Alumna 1', 'Madrid', 'España'),
('Maria', 'López', 'maria@adalab.es', '689656322', 'Calle Alumna 2', 'Barcelona', 'España'),
('Lucía', 'Ramos', 'lucia@adalab.es', '674459123', 'Calle Alumna 3', 'Valencia', 'España'),
('Elena', 'Bueno', 'elena@adalab.es', '628546577', 'Calle Alumna 4', 'Bilbao', 'España'),
('Rocío', 'García', 'rocio@adalab.es', '616365624', 'Calle Alumna 5', 'Paris', 'Francia');
