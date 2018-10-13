-- MySQL Script generated by MySQL Workbench
-- Tue Sep 25 17:47:31 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dsgn
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dsgn
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dsgn` DEFAULT CHARACTER SET utf8 ;
USE `dsgn` ;

-- -----------------------------------------------------
-- Table `dsgn`.`designer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsgn`.`designer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `login` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `avaliacao` DECIMAL NULL,
  `bio` VARCHAR(1024) NULL,
  `especializacoes` VARCHAR(8000) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dsgn`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsgn`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `login` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `avaliacao` DECIMAL NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dsgn`.`projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsgn`.`projeto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` TINYINT GENERATED ALWAYS AS (1) VIRTUAL,
  `statusPagamento` TINYINT NOT NULL DEFAULT 0,
  `designer_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_projeto_designer1_idx` (`designer_id` ASC) VISIBLE,
  INDEX `fk_projeto_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_projeto_designer1`
    FOREIGN KEY (`designer_id`)
    REFERENCES `dsgn`.`designer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projeto_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `dsgn`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dsgn`.`mensagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsgn`.`mensagem` (
  `id` INT NOT NULL,
  `projeto_id` INT NOT NULL,
  `conteudo` VARCHAR(1027) NOT NULL,
  `emisor` VARCHAR(45) NOT NULL,
  INDEX `fk_mensagem_projeto1_idx` (`projeto_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_mensagem_projeto1`
    FOREIGN KEY (`projeto_id`)
    REFERENCES `dsgn`.`projeto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dsgn`.`proposta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsgn`.`proposta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `designer_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `titulo` VARCHAR(60) NOT NULL,
  `descricao` VARCHAR(1024) NULL,
  `pagamento` VARCHAR(45) NULL,
  INDEX `fk_designer_has_cliente_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_designer_has_cliente_designer1_idx` (`designer_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_designer_has_cliente_designer1`
    FOREIGN KEY (`designer_id`)
    REFERENCES `dsgn`.`designer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_designer_has_cliente_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `dsgn`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dsgn`.`imagemPortifolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsgn`.`imagemPortifolio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `caminho` VARCHAR(300) NOT NULL,
  `ordem` INT NULL,
  `designer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `caminho_UNIQUE` (`caminho` ASC) VISIBLE,
  INDEX `fk_imagemPortifolio_designer1_idx` (`designer_id` ASC) VISIBLE,
  CONSTRAINT `fk_imagemPortifolio_designer1`
    FOREIGN KEY (`designer_id`)
    REFERENCES `dsgn`.`designer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
