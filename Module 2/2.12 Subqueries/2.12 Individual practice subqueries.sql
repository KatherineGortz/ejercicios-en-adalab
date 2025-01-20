USE bbdd_empleadas_subconsultas;

SELECT id_empleada, nombre, salario
FROM empleadas AS E1
WHERE EXISTS (
    SELECT *
    FROM empleadas AS E2
    WHERE E2.pais = E1.pais
        AND E2.id_empleada <> E1.id_empleada
);

SELECT id_empleada, 
        nombre, 
        apellido, 
        e1.salario, 
        e1.pais  
FROM empleadas AS e1  
WHERE e1.salario >= (
    SELECT AVG(e2.salario)  
    FROM empleadas AS e2  
    WHERE e1.pais = e2.pais)  
ORDER BY salario;  

USE tienda;

-- 1. Calcula el numero de clientes por cada ciudad.

SELECT COUNT(c.customer_name) as Number, C.city as City
FROM customers as c
GROUP BY c.city
ORDER BY c.city;

-- 2. Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes.
SELECT city, COUNT(customer_name) AS Number
FROM customers
GROUP BY city
HAVING COUNT(customer_name) = (
        SELECT MAX(Number)
        FROM (SELECT COUNT(customer_name) AS Number
            FROM customers
            GROUP BY city) AS max_counts);

-- 3. Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las clientas asignadas a la ciudad con mayor numero de clientas.

SELECT c.city, c.customer_number, contact_first_name, contact_last_name, COUNT(c.customer_name) AS Number
FROM customers c
GROUP BY c.city
HAVING COUNT(c.customer_name) = (
        SELECT MAX(Number)
        FROM (
            SELECT 
                COUNT(customer_name) AS Number
            FROM 
                customers
            GROUP BY 
                city
        ) AS max_counts
    );
