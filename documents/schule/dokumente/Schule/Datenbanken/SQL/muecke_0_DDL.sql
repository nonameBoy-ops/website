CREATE SCHEMA IF NOT EXISTS `muecke_0` DEFAULT CHARACTER SET utf8 ;
USE `muecke_0` ;

-- -----------------------------------------------------
-- Table `muecke_0`.`orte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muecke_0`.`orte` ;

CREATE  TABLE IF NOT EXISTS `muecke_0`.`orte` (
  `ortnr_pk` INT(11) NOT NULL ,
  `plz` VARCHAR(5) NULL DEFAULT NULL ,
  `ort` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`ortnr_pk`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `muecke_0`.`kunden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muecke_0`.`kunden` ;

CREATE  TABLE IF NOT EXISTS `muecke_0`.`kunden` (
  `kundennr` INT(11) NOT NULL ,
  `firma` VARCHAR(45) NULL DEFAULT NULL ,
  `strasse` VARCHAR(45) NULL DEFAULT NULL ,
  `ortnr_fk` INT(11) NOT NULL ,
  `telefon` VARCHAR(45) NULL ,
  PRIMARY KEY (`kundennr`) ,
 # INDEX `fk_kunden_orte1_idx` (`ortnr_fk` ASC) ,
  CONSTRAINT `fk_kunden_orte1`
    FOREIGN KEY (`ortnr_fk` )
    REFERENCES `muecke_0`.`orte` (`ortnr_pk` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `muecke_0`.`auftraege`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muecke_0`.`auftraege` ;

CREATE  TABLE IF NOT EXISTS `muecke_0`.`auftraege` (
  `auftragsnr` INT(11) NOT NULL ,
  `auftragsdatum` DATE NULL DEFAULT NULL ,
  `kundennr` INT(11) NOT NULL ,
  PRIMARY KEY (`auftragsnr`) ,
  INDEX `fk_auftraege_kunden1_idx` (`kundennr` ASC) ,
  CONSTRAINT `fk_auftraege_kunden1`
    FOREIGN KEY (`kundennr` )
    REFERENCES `muecke_0`.`kunden` (`kundennr` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `muecke_0`.`fertigerzeugnisse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muecke_0`.`fertigerzeugnisse` ;

CREATE  TABLE IF NOT EXISTS `muecke_0`.`fertigerzeugnisse` (
  `fertigerznr` INT(11) NOT NULL ,
  `bezeichnung` VARCHAR(45) NULL DEFAULT NULL ,
  `lagerbestand` INT(11) NULL DEFAULT NULL ,
  `herstellkosten` DOUBLE NULL DEFAULT NULL ,
  PRIMARY KEY (`fertigerznr`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `muecke_0`.`auftragspositionen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muecke_0`.`auftragspositionen` ;

CREATE  TABLE IF NOT EXISTS `muecke_0`.`auftragspositionen` (
  `auftragsposnr` INT(11) NOT NULL ,
  `auftragsnr` INT(11) NOT NULL ,
  `posnr` INT(11) NULL DEFAULT NULL ,
  `fertigerznr` INT(11) NOT NULL ,
  `menge` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`auftragsposnr`) ,
  INDEX `fk_auftragspositionen_fertigerzeugnisse1_idx` (`fertigerznr` ASC) ,
  INDEX `fk_auftragspositionen_auftraege1_idx` (`auftragsnr` ASC) ,
  CONSTRAINT `fk_auftragspositionen_fertigerzeugnisse1`
    FOREIGN KEY (`fertigerznr` )
    REFERENCES `muecke_0`.`fertigerzeugnisse` (`fertigerznr` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auftragspositionen_auftraege1`
    FOREIGN KEY (`auftragsnr` )
    REFERENCES `muecke_0`.`auftraege` (`auftragsnr` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
