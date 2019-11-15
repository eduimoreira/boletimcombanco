-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema boletim
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema boletim
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `boletim` DEFAULT CHARACTER SET latin1 ;
USE `boletim` ;

-- -----------------------------------------------------
-- Table `boletim`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boletim`.`aluno` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(65) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `matricula` VARCHAR(11) NOT NULL,
  `fone` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `boletim`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boletim`.`curso` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(65) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `boletim`.`nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boletim`.`nota` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `n1` DOUBLE NOT NULL,
  `n2` DOUBLE NOT NULL,
  `n3` DOUBLE NOT NULL,
  `n4` DOUBLE NOT NULL,
  `stts` VARCHAR(45) NOT NULL,
  `media` DOUBLE NOT NULL,
  `notadarec` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `boletim`.`prof`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boletim`.`prof` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(65) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `fone` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `boletim`.`turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boletim`.`turno` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(65) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `boletim`.`unidadec`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boletim`.`unidadec` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(265) NOT NULL,
  `cargahoraria` VARCHAR(10) NOT NULL,
  `idNota` INT(10) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`id`, `idNota`),
  CONSTRAINT `Nota_UC`
    FOREIGN KEY (`id`)
    REFERENCES `boletim`.`nota` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `boletim`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boletim`.`turma` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(65) NOT NULL,
  `sala` VARCHAR(45) NOT NULL,
  `ano` VARCHAR(11) NOT NULL,
  `idAluno` INT(11) NOT NULL,
  `idCurso` INT(11) NOT NULL,
  `idUC` INT(11) NOT NULL,
  `idTurno` INT(11) NOT NULL,
  `idProf` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `idTurno`, `idProf`, `idAluno`, `idCurso`, `idUC`),
  CONSTRAINT `Aluno_turma`
    FOREIGN KEY (`idAluno`)
    REFERENCES `boletim`.`aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Curso_turma`
    FOREIGN KEY (`idCurso`)
    REFERENCES `boletim`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Prof_Turma`
    FOREIGN KEY (`idProf`)
    REFERENCES `boletim`.`prof` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Turno_Turma`
    FOREIGN KEY (`idTurno`)
    REFERENCES `boletim`.`turno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `UC_Turma`
    FOREIGN KEY (`idUC`)
    REFERENCES `boletim`.`unidadec` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
© 2019 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
