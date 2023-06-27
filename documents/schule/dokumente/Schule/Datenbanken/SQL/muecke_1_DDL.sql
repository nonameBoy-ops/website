-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `muecke_1`
  CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `muecke_1`;
-- -------------------------------------
-- Tables

DROP TABLE IF EXISTS `muecke_1`.`orte`;
CREATE TABLE `muecke_1`.`orte` (
  `ortnr` INT(10) NOT NULL,
  `plz` VARCHAR(5) NULL,
  `ort` VARCHAR(50) NULL,
  PRIMARY KEY (`ortnr`)
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS `muecke_1`.`personal`;
CREATE TABLE `muecke_1`.`personal` (
  `personalnr` INT(10) NOT NULL,
  `name` VARCHAR(20) NULL,
  `vorname` VARCHAR(15) NULL,
  `geschlecht` VARCHAR(1) NULL,
  `durchwahl` VARCHAR(3) NULL,
  `ortnr` INT(10) NOT NULL,
  `strasse` VARCHAR(25) NULL,
  `gebtag` DATE NULL,
  `eintritt` DATE NULL,
  `steuerklasse` VARCHAR(5) NULL,
  `gehalt` DOUBLE NULL,
  `kostnr` VARCHAR(2) NULL,
  PRIMARY KEY (`personalnr`),
  INDEX `OrtePERSONAL` (`ortnr`),
  CONSTRAINT `OrtePERSONAL` FOREIGN KEY `OrtePERSONAL` (`ortnr`)
    REFERENCES `muecke_1`.`orte` (`ortnr`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_general_ci;



SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------------------------------------------------
-- EOF

