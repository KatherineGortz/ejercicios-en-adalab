create database tienda_nueva;

USE tienda_nueva;

CREATE TABLE empleadas (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT,
    ciudad VARCHAR(255) DEFAULT 'Madrid',
    PRIMARY KEY (id)
)

CREATE TABLE clientas (
    id_clienta INT PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL,
    email_cliente VARCHAR(100),
    fecha_registro DATE
);

CREATE TABLE productos (
    id_producto INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) DEFAULT NULL,
    color ENUM('rojo', 'amarillo', 'azul') DEFAULT NULL,
    precio INT DEFAULT NULL,
    stock FLOAT DEFAULT NULL,
    id_empleada INT,  -- Clave foránea que conecta con empleadas
    PRIMARY KEY (id_producto),
    CONSTRAINT fk_producto_empleada FOREIGN KEY (id_empleada)
        REFERENCES empleadas(id)
);