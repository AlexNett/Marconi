SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `quintab_project` DEFAULT CHARACTER SET utf8 ;
USE `quintab_project` ;

-- -----------------------------------------------------
-- Table `quintab_project`.`classe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quintab_project`.`classe` (
  `idclasse` INT(11) NOT NULL AUTO_INCREMENT,
  `classe` VARCHAR(45) NOT NULL,
  `sezione` VARCHAR(45) NOT NULL,
  `annoScolastico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idclasse`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quintab_project`.`tipoevento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quintab_project`.`tipoevento` (
  `idtipoevento` INT(11) NOT NULL AUTO_INCREMENT,
  `descrizione` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipoevento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quintab_project`.`oggetto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quintab_project`.`oggetto` (
  `idoggetto` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descrizione` VARCHAR(45) NOT NULL,
  `qr` BLOB NOT NULL,
  PRIMARY KEY (`idoggetto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quintab_project`.`macchina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quintab_project`.`macchina` (
  `idmacchina` INT(11) NOT NULL AUTO_INCREMENT,
  `qr` BLOB NOT NULL,
  PRIMARY KEY (`idmacchina`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quintab_project`.`ruolo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quintab_project`.`ruolo` (
  `idruolo` INT(11) NOT NULL AUTO_INCREMENT,
  `descrizione` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idruolo`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quintab_project`.`professore`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quintab_project`.`professore` (
  `idprofessore` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cognome` VARCHAR(45) NOT NULL,
  `ruolo_idruolo` INT(11) NOT NULL,
  PRIMARY KEY (`idprofessore`),
  INDEX `fk_professore_ruolo1_idx` (`ruolo_idruolo` ASC),
  CONSTRAINT `fk_professore_ruolo1`
    FOREIGN KEY (`ruolo_idruolo`)
    REFERENCES `quintab_project`.`ruolo` (`idruolo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quintab_project`.`sessione`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quintab_project`.`sessione` (
  `idsessione` INT(11) NOT NULL AUTO_INCREMENT,
  `datainizio` DATETIME NOT NULL,
  `datafine` DATETIME NOT NULL,
  `professore_idprofessore` INT(11) NOT NULL,
  PRIMARY KEY (`idsessione`),
  INDEX `fk_sessione_professore1_idx` (`professore_idprofessore` ASC),
  CONSTRAINT `fk_sessione_professore1`
    FOREIGN KEY (`professore_idprofessore`)
    REFERENCES `quintab_project`.`professore` (`idprofessore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quintab_project`.`gruppo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quintab_project`.`gruppo` (
  `idgruppo` INT(11) NOT NULL AUTO_INCREMENT,
  `macchina_idmacchina` INT(11) NOT NULL,
  `sessione_idsessione` INT(11) NOT NULL,
  PRIMARY KEY (`idgruppo`),
  INDEX `fk_gruppo_macchina1_idx` (`macchina_idmacchina` ASC),
  INDEX `fk_gruppo_sessione1_idx` (`sessione_idsessione` ASC),
  CONSTRAINT `fk_gruppo_macchina1`
    FOREIGN KEY (`macchina_idmacchina`)
    REFERENCES `quintab_project`.`macchina` (`idmacchina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gruppo_sessione1`
    FOREIGN KEY (`sessione_idsessione`)
    REFERENCES `quintab_project`.`sessione` (`idsessione`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quintab_project`.`evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quintab_project`.`evento` (
  `idevento` INT(11) NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `tipoevento_idtipoevento` INT(11) NOT NULL,
  `oggetto_idoggetto` INT(11) NOT NULL,
  `gruppo_idgruppo` INT(11) NOT NULL,
  PRIMARY KEY (`idevento`),
  INDEX `fk_evento_tipoevento1_idx` (`tipoevento_idtipoevento` ASC),
  INDEX `fk_evento_oggetto1_idx` (`oggetto_idoggetto` ASC),
  INDEX `fk_evento_gruppo1_idx` (`gruppo_idgruppo` ASC),
  CONSTRAINT `fk_evento_tipoevento1`
    FOREIGN KEY (`tipoevento_idtipoevento`)
    REFERENCES `quintab_project`.`tipoevento` (`idtipoevento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_oggetto1`
    FOREIGN KEY (`oggetto_idoggetto`)
    REFERENCES `quintab_project`.`oggetto` (`idoggetto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_gruppo1`
    FOREIGN KEY (`gruppo_idgruppo`)
    REFERENCES `quintab_project`.`gruppo` (`idgruppo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quintab_project`.`studente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quintab_project`.`studente` (
  `idstudente` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cognome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `classe_idclasse` INT(11) NOT NULL,
  PRIMARY KEY (`idstudente`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_studente_classe1_idx` (`classe_idclasse` ASC),
  CONSTRAINT `fk_studente_classe1`
    FOREIGN KEY (`classe_idclasse`)
    REFERENCES `quintab_project`.`classe` (`idclasse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quintab_project`.`gruppo_has_studente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quintab_project`.`gruppo_has_studente` (
  `gruppo_idgruppo` INT(11) NOT NULL,
  `studente_idstudente` INT(11) NOT NULL,
  PRIMARY KEY (`gruppo_idgruppo`, `studente_idstudente`),
  INDEX `fk_gruppo_has_studente_studente1_idx` (`studente_idstudente` ASC),
  INDEX `fk_gruppo_has_studente_gruppo1_idx` (`gruppo_idgruppo` ASC),
  CONSTRAINT `fk_gruppo_has_studente_gruppo1`
    FOREIGN KEY (`gruppo_idgruppo`)
    REFERENCES `quintab_project`.`gruppo` (`idgruppo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gruppo_has_studente_studente1`
    FOREIGN KEY (`studente_idstudente`)
    REFERENCES `quintab_project`.`studente` (`idstudente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
