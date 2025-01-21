USE northwind;

-- 1. Extraed los pedidos con el máximo "order_date" para cada empleado.
-- Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. Para eso nos pide que lo hagamos con una query correlacionada. 

SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate
FROM Orders o1
WHERE OrderDate = (
    SELECT MAX(OrderDate)
    FROM Orders o2
    WHERE o2.EmployeeID = o1.EmployeeID
);

-- 2. Extraed el precio unitario máximo (unit_price) de cada producto vendido.
-- Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. De nuevo lo tendréis que hacer con queries correlacionadas.

SELECT ProductID, UnitPrice as max_unit_price_sold 
FROM products;

SELECT ProductID, UnitPrice
FROM Products p1
WHERE UnitPrice = (
    SELECT MAX(UnitPrice) as Max_Unit_Price_Sold
    FROM Products p2
    WHERE p2.ProductID = p1.ProductID
);

-- 3. Extraed información de los productos "Beverages"
-- En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto.
--  En concreto, tienen especial interés por los productos con categoría "Beverages". Devuelve el ID del producto, el nombre del producto y su ID de categoría.

SELECT p.ProductID, p.ProductName, p.CategoryID
FROM products p
WHERE p.CategoryID IN (SELECT c.CategoryID FROM categories c WHERE CategoryName = 'Beverages');


-- 4. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
-- Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales.

SELECT DISTINCT c.country
FROM customers c
WHERE c.country NOT IN (SELECT s.country FROM suppliers s);

-- 5. Extraer los clientes que compraron mas de 20 artículos "Grandma's Boysenberry Spread"
-- Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.

SELECT OrderID, Cus


