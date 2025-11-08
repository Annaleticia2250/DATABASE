-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sistema_academico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistema_academico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistema_academico` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `sistema_academico` ;

-- -----------------------------------------------------
-- Table `sistema_academico`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_academico`.`aluno` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `sobrenome` VARCHAR(45) NULL DEFAULT NULL,
  `data_de_nascimento` DATE NULL DEFAULT NULL,
  `cpf` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_aluno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_academico`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_academico`.`curso` (
  `curso_id` INT NOT NULL AUTO_INCREMENT,
  `ingles` VARCHAR(45) NOT NULL,
  `informatica` VARCHAR(45) NOT NULL,
  `administracao` VARCHAR(45) NOT NULL,
  `eletrotecnica` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`curso_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_academico`.`componente_curricular`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_academico`.`componente_curricular` (
  `id_componente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `carga_horaria` INT NOT NULL,
  `periodo` INT NOT NULL,
  `curso_curso_id` INT NOT NULL,
  PRIMARY KEY (`id_componente`),
  INDEX `fk_componente_curricular_curso1_idx` (`curso_curso_id` ASC) VISIBLE,
  CONSTRAINT `fk_componente_curricular_curso1`
    FOREIGN KEY (`curso_curso_id`)
    REFERENCES `sistema_academico`.`curso` (`curso_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_academico`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_academico`.`turma` (
  `turma_id` INT NOT NULL AUTO_INCREMENT,
  `sala` VARCHAR(45) NULL DEFAULT NULL,
  `horario` VARCHAR(100) NOT NULL,
  `professor` VARCHAR(45) NOT NULL,
  `componente_curricular_id_componente` INT NOT NULL,
  PRIMARY KEY (`turma_id`),
  INDEX `fk_turma_componente_curricular1_idx` (`componente_curricular_id_componente` ASC) VISIBLE,
  CONSTRAINT `fk_turma_componente_curricular1`
    FOREIGN KEY (`componente_curricular_id_componente`)
    REFERENCES `sistema_academico`.`componente_curricular` (`id_componente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_academico`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_academico`.`matricula` (
  `matricula_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_de_nascimento` INT NOT NULL,
  `nome_responsavel` VARCHAR(45) NULL DEFAULT NULL,
  `rg` INT NOT NULL,
  `aluno_id_aluno` INT NOT NULL,
  `turma_turma_id` INT NOT NULL,
  PRIMARY KEY (`matricula_id`),
  INDEX `fk_matricula_aluno1_idx` (`aluno_id_aluno` ASC) VISIBLE,
  INDEX `fk_matricula_turma1_idx` (`turma_turma_id` ASC) VISIBLE,
  CONSTRAINT `fk_matricula_aluno1`
    FOREIGN KEY (`aluno_id_aluno`)
    REFERENCES `sistema_academico`.`aluno` (`id_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_turma1`
    FOREIGN KEY (`turma_turma_id`)
    REFERENCES `sistema_academico`.`turma` (`turma_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
