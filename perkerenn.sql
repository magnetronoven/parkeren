-- MySQL Script generated by MySQL Workbench
-- 02/05/18 15:14:18
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema parkerenn
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema parkerenn
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `parkerenn` DEFAULT CHARACTER SET utf8 ;
USE `parkerenn` ;

-- -----------------------------------------------------
-- Table `parkerenn`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parkerenn`.`Users` ;

CREATE TABLE IF NOT EXISTS `parkerenn`.`Users` (
  `id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `achternaam` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parkerenn`.`TypeParking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parkerenn`.`TypeParking` ;

CREATE TABLE IF NOT EXISTS `parkerenn`.`TypeParking` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parkerenn`.`Bestellingen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parkerenn`.`Bestellingen` ;

CREATE TABLE IF NOT EXISTS `parkerenn`.`Bestellingen` (
  `id` INT NOT NULL,
  `userId` INT NOT NULL,
  `aankomsttijd` DATE NOT NULL,
  `vertrektijd` DATE NOT NULL,
  `type` INT NOT NULL,
  `kenteken` VARCHAR(10) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bestelling_type_idx` (`type` ASC),
  INDEX `fk_bestelling_users_idx` (`userId` ASC),
  CONSTRAINT `fk_bestelling_type`
    FOREIGN KEY (`type`)
    REFERENCES `parkerenn`.`TypeParking` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bestelling_users`
    FOREIGN KEY (`userId`)
    REFERENCES `parkerenn`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
