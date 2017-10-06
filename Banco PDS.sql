-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pds
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pds
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pds` DEFAULT CHARACTER SET utf8 ;
USE `pds` ;

-- -----------------------------------------------------
-- Table `pds`.`coordenador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`coordenador` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pds`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`curso` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  `coordenador_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_pa19bna93huihor0jox21mewk` (`coordenador_id` ASC),
  CONSTRAINT `FK_pa19bna93huihor0jox21mewk`
    FOREIGN KEY (`coordenador_id`)
    REFERENCES `pds`.`coordenador` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pds`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`disciplina` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  `curso_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_da9gikdh9y8mf853f732xebuq` (`curso_id` ASC),
  CONSTRAINT `FK_da9gikdh9y8mf853f732xebuq`
    FOREIGN KEY (`curso_id`)
    REFERENCES `pds`.`curso` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pds`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`aluno` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `matricula` INT(11) NOT NULL,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  `disciplina_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_jgguvythtkprq1i95bygf630b` (`disciplina_id` ASC),
  CONSTRAINT `FK_jgguvythtkprq1i95bygf630b`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `pds`.`disciplina` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pds`.`aluno_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`aluno_aluno` (
  `Aluno_id` BIGINT(20) NOT NULL,
  `monitor_id` BIGINT(20) NOT NULL,
  INDEX `FK_hrrk0vsyqvmq7ag7gca4y9y8e` (`monitor_id` ASC),
  INDEX `FK_qdrytshoaj6qkyft00dmtnp4n` (`Aluno_id` ASC),
  CONSTRAINT `FK_hrrk0vsyqvmq7ag7gca4y9y8e`
    FOREIGN KEY (`monitor_id`)
    REFERENCES `pds`.`aluno` (`id`),
  CONSTRAINT `FK_qdrytshoaj6qkyft00dmtnp4n`
    FOREIGN KEY (`Aluno_id`)
    REFERENCES `pds`.`aluno` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pds`.`sala`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`sala` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `dataFim` DATETIME NULL DEFAULT NULL,
  `dataInicio` DATETIME NULL DEFAULT NULL,
  `numero` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pds`.`monitoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`monitoria` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `diaFim` DATETIME NULL DEFAULT NULL,
  `diaInicio` DATETIME NULL DEFAULT NULL,
  `vaga` INT(11) NOT NULL,
  `disciplina_id` BIGINT(20) NULL DEFAULT NULL,
  `monitor_id` BIGINT(20) NULL DEFAULT NULL,
  `sala_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_abs5wofj86j8gej9q9u3l4wgc` (`disciplina_id` ASC),
  INDEX `FK_hipp4ekqaq84n938wvh967enw` (`monitor_id` ASC),
  INDEX `FK_bluq3qraw1kt63d9j9r1whjv4` (`sala_id` ASC),
  CONSTRAINT `FK_abs5wofj86j8gej9q9u3l4wgc`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `pds`.`disciplina` (`id`),
  CONSTRAINT `FK_bluq3qraw1kt63d9j9r1whjv4`
    FOREIGN KEY (`sala_id`)
    REFERENCES `pds`.`sala` (`id`),
  CONSTRAINT `FK_hipp4ekqaq84n938wvh967enw`
    FOREIGN KEY (`monitor_id`)
    REFERENCES `pds`.`aluno` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;