USE tienda;

-- Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number;

-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.

SELECT employees.employee_number, employees.first_name, employees.last_name, COUNT(customers.customer_number) AS CustomerCount
FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number, employees.first_name, employees.last_name
HAVING CustomerCount > 8;

-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN.

SELECT employees.first_name, employees.last_name, customers.country, COUNT(DISTINCT country) AS CountryCount
FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.first_name, employees.last_name
HAVING CountryCount > 1;

-- Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.

SELECT employee_number, first_name, last_name, customers.customer_number
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;

-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.
SELECT employee_number, first_name, last_name, COUNT(customers.customer_number) AS CustomerCount
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number, employees.first_name, employees.last_name
HAVING CustomerCount > 8;

-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN.

SELECT first_name, last_name, customers.country, COUNT(DISTINCT country) AS CountryCount
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.first_name, employees.last_name
HAVING CountryCount > 1;


