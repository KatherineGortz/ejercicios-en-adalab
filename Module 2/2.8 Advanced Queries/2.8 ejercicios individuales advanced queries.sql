USE tienda;

--  Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.--

SELECT MIN(customer_number) AS LowestCustNum
FROM customers
LowestCustNum;

-- Selecciona el limite de crédito medio para los clientes de España.--

SELECT MAX(credit_limit)
FROM customers;

-- Selecciona el numero de clientes en Francia. --

SELECT COUNT(country)
FROM customers;

-- Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323.--

SELECT *
FROM customers
WHERE sales_rep_employee_number = '1323';

SELECT *, MAX(credit_limit)
FROM customers
GROUP BY sales_rep_employee_number
HAVING sales_rep_employee_number = '1323';

-- ¿Cuál es el número máximo de empleado de la tabla customers?--

SELECT MAX(sales_rep_employee_number)
FROM customers;

-- Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno.--

SELECT sales_rep_employee_number, COUNT(customer_name)
FROM customers
GROUP BY sales_rep_employee_number;

-- Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.--
SELECT sales_rep_employee_number, COUNT(customer_name)
FROM customers
GROUP BY sales_rep_employee_number
HAVING NumCust > 7;

-- BONUS elecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. 
-- Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos.

SELECT sales_rep_employee_number, COUNT(customer_name),
	CASE WHEN COUNT(*) > 7 THEN 'AltoRendimiento'
    END AS EtiquetaAltoRend
FROM customers
GROUP BY sales_rep_employee_number;



-- Selecciona el número de clientes en cada país.--
SELECT country, COUNT(*)
FROM customers
GROUP BY country;

-- Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.
SELECT country, COUNT(*)
FROM customers
GROUP BY country
HAVING COUNT(customer_name) >= 3;




