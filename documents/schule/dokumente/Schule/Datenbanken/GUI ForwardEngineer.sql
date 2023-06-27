-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema modell
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `modell` ;

-- -----------------------------------------------------
-- Schema modell
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `modell` ;
USE `modell` ;

-- -----------------------------------------------------
-- Table `modell`.`orte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modell`.`orte` ;

CREATE TABLE IF NOT EXISTS `modell`.`orte` (
  `ortnr_pk` INT NOT NULL,
  `plz` VARCHAR(5) NULL,
  `ort` VARCHAR(45) NULL,
  PRIMARY KEY (`ortnr_pk`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modell`.`kunden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modell`.`kunden` ;

CREATE TABLE IF NOT EXISTS `modell`.`kunden` (
  `kundennr_pk` INT NOT NULL,
  `firma` VARCHAR(45) NULL,
  `strasse` VARCHAR(45) NULL,
  `orte_fk` INT NOT NULL,
  PRIMARY KEY (`kundennr_pk`),
  CONSTRAINT `fk_kunden_orte`
    FOREIGN KEY (`orte_fk`)
    REFERENCES `modell`.`orte` (`ortnr_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modell`.`fertigerzeugnisse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modell`.`fertigerzeugnisse` ;

CREATE TABLE IF NOT EXISTS `modell`.`fertigerzeugnisse` (
  `fertigerznr_pk` INT NOT NULL,
  `bezeichnung` VARCHAR(45) NULL,
  `lagerbestand` INT NULL,
  `herstellkosten` DOUBLE NULL,
  PRIMARY KEY (`fertigerznr_pk`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modell`.`auftragspositionen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modell`.`auftragspositionen` ;

CREATE TABLE IF NOT EXISTS `modell`.`auftragspositionen` (
  `auftragsposnr_pk` INT NOT NULL,
  `posnr` INT NULL,
  `menge` INT NULL,
  `fertigerzeugnisse_fertigerzeugnissnr_fk` INT NOT NULL,
  PRIMARY KEY (`auftragsposnr_pk`),
  CONSTRAINT `fk_auftragspositionen_fertigerzeugnisse1`
    FOREIGN KEY (`fertigerzeugnisse_fertigerzeugnissnr_fk`)
    REFERENCES `modell`.`fertigerzeugnisse` (`fertigerznr_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modell`.`auftraege`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modell`.`auftraege` ;

CREATE TABLE IF NOT EXISTS `modell`.`auftraege` (
  `auftragsnr_pk` INT NOT NULL,
  `auftragsdatum` DATE NULL,
  `kundennr_fk` INT NOT NULL,
  `auftragspositionen_auftragsposnr_fk` INT NOT NULL,
  PRIMARY KEY (`auftragsnr_pk`),
  CONSTRAINT `fk_auftraege_kunden1`
    FOREIGN KEY (`kundennr_fk`)
    REFERENCES `modell`.`kunden` (`kundennr_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auftraege_auftragspositionen1`
    FOREIGN KEY (`auftragspositionen_auftragsposnr_fk`)
    REFERENCES `modell`.`auftragspositionen` (`auftragsposnr_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;