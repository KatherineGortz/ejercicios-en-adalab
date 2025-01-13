-- Repaso modulo 2 --

-- Listar todos los datos de los profesores--
SELECT *
FROM profesores;


-- Mostrar los nombres y teléfonos de todos los profesores --

SELECT nombre, telefono
FROM profesores;

-- Listar todos los módulos impartidos en el instituto --
SELECT nombre_modulo
FROM modulos;

-- Mostrar el nombre y apellidos de todos los alumnos --
SELECT nombre, apellidos
FROM alumnos;

-- Listar todos los números de expediente de los alumnos matriculados --
SELECT DISTINCT alumnos_numero_expediente
FROM modulos_has_alumnos;

-- Buscar un profesor por su DNI (por ejemplo, 12345678A) --
SELECT *
FROM profesores
WHERE dni = '12345678A';

-- 
-- Mostrar todos los módulos cuyo nombre contenga la palabra "Matemáticas" --
SELECT nombre_modulo
FROM modulos
WHERE nombre_modulo LIKE '%matematicas%';

-- Listar los alumnos nacidos después del año 2005 --
SELECT *
from alumnos
WHERE fecha_nacimiento > '2005-12-31';

-- Obtener todas las matrículas realizadas en un módulo específico (por ejemplo, módulo MOD101)--
SELECT *
FROM modulos_has_alumnos
WHERE modulos_codigo = 'MOD101';

-- Listar todos los módulos impartidos por un profesor específico (por ejemplo, DNI 12345678A)--
SELECT nombre_modulo
FROM modulos
WHERE profesores_dni ='12345678A';

SELECT `nombre_modulo`
FROM `modulos`
WHERE `profesores_dni` = '12345678A';


-- Listar a los alumnos ordenados por apellidos de forma ascendente --

SELECT apellidos
FROM alumnos
ORDER BY apellidos ASC;









