USE EjemploJoins;

-- Listar los productos que no han sido vendidos.
SELECT p.nombre_producto
FROM productos p
LEFT JOIN ventas v ON V.id_producto = p.id_producto
WHERE v.id_venta IS NULL;

--  Encuentra Clientes con Pedidos en 2024 pero no en 2023

SELECT u.nombre
FROM usuarios u
LEFT JOIN pedidos p2024 ON u.id_usuario = p2024.id_usuario AND YEAR(p2024.fecha_pedido) = 2024
LEFT JOIN pedidos p2023 ON u.id_usuario = p2023.id_usuario AND YEAR(p2023.fecha_pedido) = 2023
WHERE p2024.fecha_pedido IS NOT NULL and p2023.fecha_pedido IS NULL;

 AND p.estado = 'Cancelado';
 
 SELECT u.nombre 
 FROM usuarios u 
 LEFT JOIN pedidos p ON u.id_usuario = p.id_usuario AND YEAR(p.fecha_pedido) = 2024 
 WHERE (p.fecha_pedido IS NULL OR YEAR(p.fecha_pedido) != 2023);

-- Identificar productos que están en un almacén pero no en otro, y viceversa.

-- Generar un ranking de vendedores basado en el total de ventas en un período específico.