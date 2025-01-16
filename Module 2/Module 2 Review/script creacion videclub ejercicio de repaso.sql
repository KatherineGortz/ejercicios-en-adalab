CREATE SCHEMA videoclub;

USE videoclub;

CREATE TABLE generos (
id_genero INT AUTO_INCREMENT PRIMARY KEY,
nombre_genero VARCHAR (100),
descripcion VARCHAR (255)
);

CREATE TABLE peliculas (
id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
duracion INT,
direccion VARCHAR (100),
id_genero INT,
fecha_estreno DATE,
FOREIGN KEY (id_genero) REFERENCES generos (id_genero) 
);

CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (100),
apellido VARCHAR (100),
direccion VARCHAR (255),
telefono VARCHAR (15),
email  VARCHAR (50),
fecha_registro DATE
);

CREATE TABLE alquileres (
id_alquiler INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT,
id_pelicula INT,
fecha_alquiler DATE,
fecha_devolucion DATE,
estado ENUM ('pendiente', 'devuelto'),
FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
FOREIGN KEY (id_pelicula) REFERENCES peliculas (id_pelicula)
);
 
 -- Modifica la columna email de la tabla clientes. Ahora queremos que tenga más capacidad de
-- caracteres y que no acepte nulos.--

ALTER TABLE clientes
MODIFY COLUMN email VARCHAR (100) NOT NULL;

-- Modifica la columna estado en la tabla alquileres. Queremos que siga aceptando solo los valores
-- ‘pendienteʼ y ‘devueltoʼ, pero que por defecto el valor sea ‘pendienteʼ.

ALTER TABLE alquileres
MODIFY COLUMN estado ENUM ('pendiente', 'devuelto') DEFAULT 'pendiente';

-- Añadir datos a la casede dastos --

INSERT INTO generos (nombre_genero, descripcion)
VALUES ('Acción', 'Películas llenas de emoción y aventuras'),
('Comedia', 'Películas para reír y disfrutar'),
('Drama', 'Películas emocionales y profundas'),
('Ciencia Ficción', 'Películas con elementos futuristas o tecnológicos');

INSERT INTO peliculas (nombre, duracion, direccion, id_genero, fecha_estreno)
VALUES ('Misión Rescate', 130, 'Ridley Scott', 4, '2015-10-02'),
('La Gran Aventura', 120, 'Chris Columbus', 1, '2001-06-22'),
('Reír o Llorar', 95, 'John Smith', 2, '2020-11-12'),
('Crisis Total', 110, 'Jane Doe', 3, '2019-05-15');

INSERT INTO clientes (nombre, apellido, direccion, telefono, email, fecha_registro)
VALUES ('Carlos', 'García', 'Av. Principal 123', '555-1234', 'carlos@example.com', '2023-01-15'),
('Lucía', 'Pérez', 'Calle Secundaria 45', '555-5678', 'lucia@example.com', '2023-02-20'),
('Miguel', 'Lopez', 'Av. Tercera 789', '555-9876', 'miguel@example.com', '2023-03-10');

INSERT INTO alquileres (id_cliente, id_pelicula, fecha_alquiler, fecha_devolucion, estado)
VALUES (1, 1, '2025-01-01', NULL, 'pendiente'),
(2, 2, '2025-01-03', '2025-01-07', 'devuelto'),
(3, 4, '2025-01-05', NULL, 'pendiente');

-- El cliente Carlos García ha cambiado de correo a carlos_garcia@example.com --

UPDATE clientes
SET email = 'carlos_garcia@example.com'
WHERE nombre = 'Carlos';

-- La clienta Lucía Pérez ya no quiere aparecer en nuestros registros. --

ALTER TABLE alquileres
DROP FOREIGN KEY alquileres_ibfk_1;

ALTER TABLE alquileres
ADD CONSTRAINT alquileres_ibfk_1
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
ON DELETE CASCADE;

DELETE FROM clientes
WHERE nombre = 'Lucía';

-- En la tabla géneros, queremos cambiar el nombre de la columna nombre_genero a genero. --

ALTER TABLE generos
RENAME COLUMN nombre_genero TO genero;

-- Haz las siguientes consultas en nuestra base de datos:
-- Muestra todos los datos de películas

SELECT *
FROM peliculas;

-- Muestra solo el nombre y la duración de películas

SELECT nombre, duracion
FROM peliculas;

-- Muestra los valores de películas donde el id_genero sea 4

SELECT *
FROM peliculas
WHERE id_genero = 4;


-- Muestra los clientes que se llamen ‘Carlosʼ --

SELECT *
FROM clientes
WHERE nombre = 'Carlos';

-- Muestra todas las películas ordenadas por fecha de estreno en orden ascendente y luego
-- descendente

SELECT *
FROM peliculas
ORDER BY fecha_estreno ASC;

SELECT *
FROM peliculas
ORDER BY fecha_estreno DESC;

-- Muestra los clientes ordenados por fecha de registro en orden descendente y ascendente

SELECT *
FROM clientes
ORDER BY fecha_registro ASC;

SELECT *
FROM clientes
ORDER BY fecha_registro DESC;

-- Muestra solo los 2 primeros registros de películas

SELECT *
FROM peliculas
LIMIT 2;

-- Muestra las películas que tengan como duración entre 90 y 120 minutos

SELECT *
FROM peliculas
WHERE 90 <= duracion AND duracion <= 120;

-- Obtén las películas que tengan una dur de más de 100 minutos o que su id_genero sea 1
SELECT *
FROM peliculas
WHERE duracion >= 100 AND id_genero = 1;

-- Obtén los alquileres cuya fecha_devolucion no sea nula

SELECT *
FROM alquileres
WHERE fecha_devolucion IS NOT NULL;

-- Muestra los géneros distintos de la columna géneros

SELECT DISTINCT genero
FROM generos;






