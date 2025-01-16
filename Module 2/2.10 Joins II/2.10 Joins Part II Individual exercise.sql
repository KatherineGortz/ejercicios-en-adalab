USE tienda;


-- 1. Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).

SELECT e.last_name, e.first_name, e.employee_number, c.customer_number
FROM employees e
LEFT JOIN customers c
ON e.employee_number = c.sales_rep_employee_number;

-- 2. Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).
SELECT c.customer_number, last_name, e.first_name, e.employee_number
FROM customers c
LEFT JOIN employees e
ON e.employee_number = c.sales_rep_employee_number;

-- 3. Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.

SELECT e.employee_number, e.last_name, e.first_name
FROM employees e
LEFT JOIN customers c
ON e.employee_number = c.sales_rep_employee_number
GROUP BY e.employee_number, e.last_name, e.first_name
HAVING COUNT(c.sales_rep_employee_number) > 8;

-- 4. Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN.

SELECT e.employee_number, e.last_name, e.first_name
FROM employees e
RIGHT JOIN customers c
ON e.employee_number = c.sales_rep_employee_number
GROUP BY e.employee_number, e.last_name, e.first_name
HAVING COUNT(c.sales_rep_employee_number) > 8;

-- 5. Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.

SELECT first_name, last_name, customers.country, COUNT(DISTINCT country) AS CountryCount
FROM employees
LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.first_name, employees.last_name
HAVING CountryCount > 1;