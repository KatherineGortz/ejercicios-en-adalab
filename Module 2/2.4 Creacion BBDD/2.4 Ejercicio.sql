CREATE SCHEMA mi_ejercicio;
USE mi_ejercicio;

CREATE table empleadas(
id_empleada INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
salario INT,
nombre VARCHAR(30),
apellido VARCHAR(30),
pais VARCHAR(30)
);

CREATE TABLE personas (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT CHECK (edad > 16),
    ciudad varchar(255) DEFAULT 'Madrid'
);

CREATE TABLE empleadas_en_proyectos (
	id_empleada INT NOT NULL,
    id_proyecto INT NOT NULL,
    PRIMARY KEY (id_empleada, id_proyecto),
    CONSTRAINT FK_empleada_proyecto FOREIGN KEY (id_empleada)
		REFERENCES empleadas(id_empleada) ON DELETE CASCADE
)

