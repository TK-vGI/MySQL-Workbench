-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema FreeArt
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FreeArt
-- -----------------------------------------------------
/*
CREATE SCHEMA IF NOT EXISTS `FreeArt` DEFAULT CHARACTER SET utf8 ;
USE `FreeArt` ;
*/
-- -----------------------------------------------------
-- Table `FreeArt`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artist` ;

CREATE TABLE IF NOT EXISTS `artist` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `birth_date` DATE NOT NULL,
  `death_date` DATE,
  `nationality` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artist_id`));


-- -----------------------------------------------------
-- Table `FreeArt`.`artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artwork` ;

CREATE TABLE IF NOT EXISTS `artwork` (
  `artwork_id` INT NOT NULL AUTO_INCREMENT,
  `artist_id` INT NULL,
  `art_title` VARCHAR(45) NOT NULL,
  `art_year` INT(4) NOT NULL,
  `art_genre` VARCHAR(45) NULL,
  `art_type` VARCHAR(45) NULL,
  PRIMARY KEY (`artwork_id`),
  INDEX `artist_id_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `artist_id`
    FOREIGN KEY (`artist_id`)
    REFERENCES `artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `FreeArt`.`keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keyword` ;

CREATE TABLE IF NOT EXISTS `keyword` (
  `keyword_id` INT NOT NULL AUTO_INCREMENT,
  `keyword` VARCHAR(45) NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE INDEX `keyword_UNIQUE` (`keyword` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `FreeArt`.`artwork_keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artwork_keyword` ;

CREATE TABLE IF NOT EXISTS `artwork_keyword` (
  `artwork_id` INT NOT NULL,
  `keyword_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artwork_id`, `keyword_id`),
  INDEX `keyword_id_idx` (`keyword_id` ASC) VISIBLE,
  CONSTRAINT `artwork_id`
    FOREIGN KEY (`artwork_id`)
    REFERENCES `artwork` (`artwork_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `keyword_id`
    FOREIGN KEY (`keyword_id`)
    REFERENCES `keyword` (`keyword`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SHOW TABLES;
SHOW COLUMNS FROM artist;
SHOW COLUMNS FROM artwork;
SHOW COLUMNS FROM keyword;
SHOW COLUMNS FROM artwork_keyword;