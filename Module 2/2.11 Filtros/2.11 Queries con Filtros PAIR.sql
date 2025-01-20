USE northwind;

-- 1. Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquellas compañías que están afincadas en ciudades que empiezan por "R" o "S". 
-- Necesita que le devolvamos la ciudad, el nombre de la compañía y el nombre de contacto.

SELECT City, CompanyName, ContactName
FROM customers
WHERE city LIKE 'R%' OR city like 'S%'
ORDER BY city, CompanyName;

-- 2. En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos que han hecho todas las ciudades que empiezan por "L".

SELECT c.City, c.CompanyName, c.ContactName, COUNT(o.orderID)
FROM customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE city LIKE 'L%'
GROUP BY c.CompanyName
ORDER BY c.CompanyName;

-- ELEANORA

SELECT c.City as Ciudad, c.CompanyName as Empresa, c.ContactName as Persona_Constacto, COUNT(o.OrderID) as Numero_Pedidos
FROM Customers c
JOIN Orders o on o.CustomerID=c.CustomerID
WHERE City LIKE 'L%'
GROUP BY c.CompanyName
ORDER BY c.CompanyName;

-- 3. Todos los clientes cuyo "country" no incluya "USA".
-- Nuestro objetivo es extraer los clientes que no sean de USA. Extraer el nombre de contacto, su país y el nombre de la compañía.

SELECT c.CompanyName, c.ContactName, c.Country
FROM customers c
WHERE Country NOT IN ('USA');

-- 4. Todos los clientes que no tengan una "A" en segunda posición en su nombre. Devolved unicamente el nombre de contacto.

SELECT c.ContactName
FROM customers c
WHERE c.ContactName NOT LIKE '_a%';

-- 5. Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y proveedores que tenemos en la bases de datos. 
-- Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o Cliente). 
-- Pero importante! No debe haber duplicados en nuestra respuesta. 
-- La columna Relationship no existe y debe ser creada como columna temporal. Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship.

SELECT c.City, c.CompanyName, c.ContactName, 'Cliente' AS Relationship
FROM customers c
WHERE c.City IS NOT NULL
UNION
SELECT s.City, s.CompanyName, s.ContactName, 'Proveedor' AS Relationship
FROM suppliers s
WHERE S.City IS NOT NULL
ORDER BY City;


-- 6. Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".

SELECT *
FROM categories
WHERE Description LIKE '%Sweet%' OR Description LIKE '%sweet%';

-- 7. Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la bases de datos:

-- 💡 Pista 💡 ¿Ambas tablas tienen las mismas columnas para nombre y apellido? Tendremos que combinar dos columnas usando concat para unir dos columnas.

SELECT CONCAT(e.LastName, ' ', e.FirstName) AS CombinedName
FROM employees e
UNION
SELECT c.ContactName
FROM customers c
ORDER BY CombinedName;
