-- Crear la base de datos

USE EjemploJoins;

-- Tabla de categorías
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
);

-- Tabla de productos+
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);


-- Tabla de usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha_pedido DATE NOT NULL,
    estado VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabla de almacén A
CREATE TABLE almacen_a (
    id_producto INT,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_producto)
);

-- Tabla de almacén B
CREATE TABLE almacen_b (
    id_producto INT,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_producto)
);

-- Tabla de vendedores
CREATE TABLE vendedores (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de ventas
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    fecha_venta DATE NOT NULL,
	id_vendedor INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
	FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);

-- Categorías
INSERT INTO categorias (nombre_categoria) VALUES
('Electrónica'),
('Ropa'),
('Alimentos'),
('Muebles');

-- Productos
INSERT INTO productos (nombre_producto, id_categoria) VALUES
('Teléfono', 1),
('Televisión', 1),
('Camisa', 2),
('Pantalón', 2),
('Manzanas', 3),
('Silla', 4),
('Mesa', 4);




-- Usuarios
INSERT INTO usuarios (nombre) VALUES
('Juan'),
('María'),
('Carlos'),
('Lucía');

-- Pedidos
INSERT INTO pedidos (id_usuario, fecha_pedido, estado) VALUES
(1, '2023-05-10', 'Completado'),
(1, '2024-02-12', 'Pendiente'),
(2, '2024-01-25', 'Cancelado'),
(3, '2023-12-15', 'Completado');

-- Almacén A
INSERT INTO almacen_a (id_producto, cantidad) VALUES
(1, 50),
(2, 30),
(3, 70);

-- Almacén B
INSERT INTO almacen_b (id_producto, cantidad) VALUES
(2, 40),
(3, 60),
(4, 80);

-- Vendedores
INSERT INTO vendedores (nombre) VALUES
('Pedro'),
('Ana'),
('Luis');


-- Ventas
INSERT INTO ventas (id_producto, cantidad, precio_unitario, fecha_venta, id_vendedor) VALUES
(1, 10, 500.00, '2024-01-05', 1),
(2, 5, 1200.00, '2024-01-10', 2),
(3, 15, 30.00, '2024-01-15', 1),
(5, 20, 2.50, '2024-01-20', 2);



