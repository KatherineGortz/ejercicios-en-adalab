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

SELECT c.city, c.customer_number, contact_first_name, contact_last_name
FROM customers c
WHERE city IN (
        SELECT MAX(COUNT(customer_name))
        FROM (SELECT COUNT(customer_name) AS Number
            FROM customers
            GROUP BY city) AS max_counts);
            
-- 4. Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. 
-- Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'

SELECT employee_number AS NumeroEmpleado, first_name as NombreEmpleado, last_name as ApellidoEmpleado
FROM employees
WHERE employee_number IN 
	(SELECT sales_rep_employee_number 
    FROM customers);
    
-- 5. Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no también una oficina de nuestra empresa para ello: 
-- Selecciona aquellas ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers,
 -- sin repeticiones, que no tengan una oficina en dicha ciudad de la tabla offices.
 
 SELECT c.city AS ciudades, c.customer_name AS  NombredelaEmpresa
 FROM customers c
 WHERE c.city NOT IN (SELECT o.city FROM offices o);
 
