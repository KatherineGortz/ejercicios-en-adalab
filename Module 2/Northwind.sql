USE northwind;

SELECT EmployeeID, LastName, FirstName
FROM employees;

SELECT * 
FROM products
WHERE UnitPrice BETWEEN 0 AND 5;

SELECT * 
FROM products
WHERE UnitPrice IS NULL;

-- 7 -
SELECT * 
FROM products
WHERE UnitPrice < 15 AND ProductID <20;

-- 8 -

SELECT * 
FROM products
WHERE UnitPrice > 15 AND ProductID > 20;


-- 9 -
SELECT DISTINCT ShipCountry 
FROM orders;

-- 10 -
SELECT productID, ProductName, UnitPrice
FROM products
ORDER BY ProductID ASC
LIMIT 10;

-- 11 -
SELECT productID, ProductName, UnitPrice
FROM products
ORDER BY ProductID DESC
LIMIT 10;

-- 12 -
SELECT DISTINCT OrderID FROM `order details`;

-- 13 -
SELECT `orderID`, UnitPrice, quantity, (UnitPrice*quantity) AS ImporteTotal
FROM `order details`
ORDER BY ImporteTotal DESC
LIMIT 3;

-- 14 -
SELECT `orderID`, UnitPrice, quantity, (UnitPrice*quantity) AS ImporteTotal
FROM `order details`
ORDER BY ImporteTotal DESC
LIMIT 5
OFFSET 5;

-- 15 -
SELECT OrderID, ShippedDate, DATE_ADD(ShippedDate, INTERVAL 5 DAY) AS FechaRetrasada
FROM orders
WHERE ShippedDate IS NOT NULL;

-- 16 -
SELECT *
FROM products
WHERE UnitPrice BETWEEN 15 AND 50;

-- 17 -
SELECT *
FROM products
WHERE UnitPrice IN (18, 19, 20);