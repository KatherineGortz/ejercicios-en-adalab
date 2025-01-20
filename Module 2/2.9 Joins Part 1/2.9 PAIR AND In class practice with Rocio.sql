USE northwind;

-- 1. Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. 
-- Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.

SELECT o.CustomerID, c.CompanyName, COUNT(o.OrderID), c.Country
FROM orders o
INNER JOIN customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.CompanyName
HAVING c.Country = 'UK';

--  2. La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. 
-- Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.

SELECT c.CompanyName as company, SUM(d.Quantity) as quantity, YEAR(o.OrderDate) as year
FROM customers c
JOIN orders o ON o.CustomerID = c.CustomerID
JOIN orderdetails d ON d.OrderID = o.OrderID
WHERE c.Country = 'UK'
GROUP BY c.CompanyName, YEAR(o.OrderDate)
ORDER BY c.CompanyName; 
 
-- 3. Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido, 
-- desde la central nos han pedido una consulta que indique el nombre de cada compañía cliente junto con cada pedido que han realizado y su fecha.

SELECT c.CompanyName as company, o.OrderID, o.OrderDate as date
FROM customers c
INNER JOIN orders o
ON c.CustomerID = o.CustomerID
ORDER BY company ASC;

-- 4. Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, 
-- nombre de la categoría y el nombre del producto, y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).

SELECT ct.CategoryID, ct.CategoryName, p.ProductName, SUM(dt.Quantity * dt.UnitPrice) AS TotalSales
FROM categories ct
INNER JOIN products p ON p.CategoryID = ct.CategoryID
INNER JOIN orderdetails dt ON dt.ProductID = p.ProductID
GROUP BY ct.CategoryID, ct.CategoryName, p.ProductName;

-- BONUS 5: Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva el nombre de todas las empresas cliente, los ID de sus pedidos y las fechas.

SELECT c.CompanyName, o.OrderID, o.OrderDate
FROM customers c
INNER JOIN orders o
ON c.CustomerID = o.CustomerID;

-- 6 Desde la oficina de Reino Unido (UK) nos solicitan información acerca del número de pedidos que ha realizado cada cliente del propio Reino Unido de cara a conocerlos mejor y poder adaptarse al mercado actual. 
-- Específicamente nos piden el nombre de cada compañía cliente junto con el número de pedidos.

SELECT c.CompanyName, COUNT(o.OrderID)
FROM customers c
INNER JOIN orders o
ON c.CustomerID = o.CustomerID
WHERE c.Country = 'UK'
GROUP BY c.CompanyName;

-- 7. Ejercicio de SELF JOIN: Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas las empleadas y sus supervisoras. 
-- Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas. Investiga el resultado, ¿sabes decir quién es el director?

SELECT A.FirstName as EmployeeName, A.LastName as EmployeeLastName, A.City as EmployeeCity, B.FirstName as SupervisorName, B.LastName as SupervisorLastName, B.City as SupervisorCity
FROM employees AS A, employees AS B
WHERE A.ReportsTo = B.EmployeeID;

-- In class practice with Rocio

SELECT c.CompanyName AS empresa, COUNT(DISTINCT o.OrderID) as pedidos_totales
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE c.City NOT IN ('Madrid', 'London')
GROUP BY c.CompanyName
HAVING pedidos_totales > 10
ORDER BY pedidos_totales DESC;