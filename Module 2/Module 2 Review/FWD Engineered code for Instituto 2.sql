-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema instituto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema instituto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `instituto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema instituto2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema instituto2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `instituto2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `instituto` ;

-- -----------------------------------------------------
-- Table `instituto`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instituto`.`alumnos` (
  `numero_expediente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(75) NOT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`numero_expediente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `instituto`.`profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instituto`.`profesores` (
  `dni` VARCHAR(9) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `instituto`.`modulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instituto`.`modulos` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre_modulo` VARCHAR(50) NOT NULL,
  `profesores_dni` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`codigo`, `profesores_dni`),
  INDEX `fk_modulos_profesores1_idx` (`profesores_dni` ASC) VISIBLE,
  CONSTRAINT `fk_modulos_profesores1`
    FOREIGN KEY (`profesores_dni`)
    REFERENCES `instituto`.`profesores` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `instituto`.`modulos_has_alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instituto`.`modulos_has_alumnos` (
  `modulos_codigo` INT NOT NULL,
  `alumnos_numero_expediente` INT NOT NULL,
  PRIMARY KEY (`modulos_codigo`, `alumnos_numero_expediente`),
  INDEX `fk_modulos_has_alumnos_alumnos1_idx` (`alumnos_numero_expediente` ASC) VISIBLE,
  INDEX `fk_modulos_has_alumnos_modulos_idx` (`modulos_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_modulos_has_alumnos_modulos`
    FOREIGN KEY (`modulos_codigo`)
    REFERENCES `instituto`.`modulos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_modulos_has_alumnos_alumnos1`
    FOREIGN KEY (`alumnos_numero_expediente`)
    REFERENCES `instituto`.`alumnos` (`numero_expediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `instituto2` ;

-- -----------------------------------------------------
-- Table `instituto2`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instituto2`.`alumnos` (
  `numero_expediente` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(75) NOT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`numero_expediente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `instituto2`.`profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instituto2`.`profesores` (
  `dni` VARCHAR(9) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `instituto2`.`modulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instituto2`.`modulos` (
  `codigo` VARCHAR(15) NOT NULL,
  `nombre_modulo` VARCHAR(50) NOT NULL,
  `profesores_dni` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`codigo`, `profesores_dni`),
  INDEX `fk_modulos_profesores1_idx` (`profesores_dni` ASC) VISIBLE,
  CONSTRAINT `fk_modulos_profesores1`
    FOREIGN KEY (`profesores_dni`)
    REFERENCES `instituto2`.`profesores` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `instituto2`.`modulos_has_alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instituto2`.`modulos_has_alumnos` (
  `modulos_codigo` VARCHAR(15) NOT NULL,
  `alumnos_numero_expediente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`modulos_codigo`, `alumnos_numero_expediente`),
  INDEX `fk_modulos_has_alumnos_alumnos1_idx` (`alumnos_numero_expediente` ASC) VISIBLE,
  INDEX `fk_modulos_has_alumnos_modulos_idx` (`modulos_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_modulos_has_alumnos_modulos`
    FOREIGN KEY (`modulos_codigo`)
    REFERENCES `instituto2`.`modulos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_modulos_has_alumnos_alumnos1`
    FOREIGN KEY (`alumnos_numero_expediente`)
    REFERENCES `instituto2`.`alumnos` (`numero_expediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
