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
CREATE SCHEMA IF NOT EXISTS `FreeArt` DEFAULT CHARACTER SET utf8 ;
USE `FreeArt` ;

-- -----------------------------------------------------
-- Table `FreeArt`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FreeArt`.`artist` ;

CREATE TABLE IF NOT EXISTS `FreeArt`.`artist` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `birth_date` DATE NOT NULL,
  `death_date` DATE NULL,
  `nationality` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FreeArt`.`artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FreeArt`.`artwork` ;

CREATE TABLE IF NOT EXISTS `FreeArt`.`artwork` (
  `artwork_id` INT NOT NULL AUTO_INCREMENT,
  `artist_id` INT NULL,
  `art_title` VARCHAR(60) NOT NULL,
  `art_year` INT(4) NOT NULL,
  `art_genre` VARCHAR(45) NULL,
  `art_type` VARCHAR(45) NULL,
  PRIMARY KEY (`artwork_id`),
  INDEX `artist_id_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `artist_id`
    FOREIGN KEY (`artist_id`)
    REFERENCES `FreeArt`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FreeArt`.`keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FreeArt`.`keyword` ;

CREATE TABLE IF NOT EXISTS `FreeArt`.`keyword` (
  `keyword_id` INT NOT NULL AUTO_INCREMENT,
  `keyword` VARCHAR(45) NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE INDEX `keyword_UNIQUE` (`keyword` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FreeArt`.`artwork_keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FreeArt`.`artwork_keyword` ;

CREATE TABLE IF NOT EXISTS `FreeArt`.`artwork_keyword` (
  `artwork_id` INT NOT NULL,
  `keyword_id` INT NOT NULL,
  PRIMARY KEY (`artwork_id`, `keyword_id`),
  INDEX `keyword_id_idx` (`keyword_id` ASC) VISIBLE,
  CONSTRAINT `artwork_id`
    FOREIGN KEY (`artwork_id`)
    REFERENCES `FreeArt`.`artwork` (`artwork_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `keyword_id`
    FOREIGN KEY (`keyword_id`)
    REFERENCES `FreeArt`.`keyword` (`keyword_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `FreeArt`.`artist`
-- -----------------------------------------------------
START TRANSACTION;
USE `FreeArt`;
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (1, 'Leonardo', 'da Vinci', '1452-04-15', '1519-05-02', 'Italian');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (2, 'Vincent', 'van Gogh', '1853-03-30', '1890-07-29', 'Dutch');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (3, 'Pablo', 'Picasso', '1881-10-25', '1973-04-08', 'Spanish');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (4, 'Claude', 'Monet', '1840-11-14', '1926-12-05', 'French');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (5, 'Michelangelo', 'Buonarroti', '1475-03-06', '1564-02-18', 'Italian');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (6, 'Frida', 'Kahlo', '1907-07-06', '1954-07-13', 'Mexican');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (7, 'Johannes', 'Vermeer', '1632-10-31', '1675-12-16', 'Dutch');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (8, 'Henri', 'Matisse', '1869-12-31', '1954-11-03', 'French');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (9, 'Georgia', 'O\'Keeffe', '1887-11-15', '1986-03-06', 'American');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (10, 'Salvador', 'Dali', '1904-05-11', '1989-01-23', 'Spanish');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (11, 'Edvard', 'Munch', '1863-12-12', '1944-01-23', 'Norwegian');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (12, 'Andy', 'Warhol', '1928-08-06', '1987-02-22', 'American');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (13, 'Gustav', 'Klimt', '1862-07-14', '1918-02-06', 'Austrian');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (14, 'Grant', 'Wood', '1891-02-13', '1942-02-12', 'American');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (15, 'Joan', 'Miro', '1893-04-20', '1983-12-25', 'Spanish');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (16, 'Rembrandt', 'van Rijn', '1606-07-15', '1669-10-04', 'Dutch');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (17, 'Francisco', 'Goya', '1746-03-30', '1828-04-16', 'Spanish');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (18, 'Giovanni Battista', 'Piranesi', '1720-10-04', '1778-11-09', 'Italian');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (19, 'Auguste', 'Rodin', '1840-11-12', '1917-11-17', 'French');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (20, 'Gian Lorenzo', 'Bernini', '1598-12-07', '1680-11-28', 'Italian');
INSERT INTO `FreeArt`.`artist` (`artist_id`, `first_name`, `last_name`, `birth_date`, `death_date`, `nationality`) VALUES (21, 'Constantin', 'Brancusi', '1876-02-19', '1957-03-16', 'Romanian');

COMMIT;


-- -----------------------------------------------------
-- Data for table `FreeArt`.`artwork`
-- -----------------------------------------------------
START TRANSACTION;
USE `FreeArt`;
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (1, 1, 'Mona Lisa', 1503, 'Renaissance', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (2, 1, 'The Last Supper', 1498, 'Renaissance', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (3, 2, 'The Starry Night', 1889, 'Post-Impressionism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (4, 2, 'Sunflowers', 1888, 'Post-Impressionism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (5, 3, 'Guernica', 1937, 'Cubism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (6, 3, 'Les Demoiselles d\'Avignon', 1907, 'Cubism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (7, 4, 'Water Lilies series', 1926, 'Impressionism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (8, 4, 'Impression, Sunrise', 1872, 'Impressionism', 'Painting');
-- INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (9, 5, 'David', 1504, 'Renaissance', 'Sculpture');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (9, 5, 'David', 1504, 'Renaissance', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (10, 5, 'The Creation of Adam', 1512, 'Renaissance', 'Fresco');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (11, 6, 'The Two Fridas', 1939, 'Surrealism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (12, 6, 'Self-Portrait with Thorn Necklace and Hummingbird ', 1940, 'Surrealism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (13, 7, 'Girl with a Pearl Earring', 1665, 'Baroque', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (14, 7, 'The Milkmaid', 1658, 'Baroque', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (15, 8, 'The Dance', 1910, 'Fauvism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (16, 9, 'Jimson Weed/White Flower No. 1', 1932, 'Precisionism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (17, 9, 'Black Iris III', 1926, 'Precisionism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (18, 10, 'The Persistence of Memory', 1931, 'Surrealism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (19, 11, 'The Scream', 1893, 'Symbolism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (20, 12, 'Campbell\'s Soup Cans', 1962, 'Pop Art', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (21, 12, 'Marilyn Diptych', 1962, 'Pop Art', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (22, 13, 'The Kiss', 1908, 'Symbolism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (23, 14, 'Daughters of Revolution', 1932, 'Regionalism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (24, 15, 'The Tilled Field', 1924, 'Surrealism', 'Painting');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (25, 16, 'The Three Crosses', 1653, 'Baroque', 'Etching');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (26, 17, 'The Sleep of Reason Produces Monsters', 1799, 'Romanticism', 'Etching');
-- INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (27, 18, 'The Arch of Titus', 1756, 'Neoclassicism', 'Etching');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (27, 18, 'The Arch of Titus', 1756, 'Neoclassicism', 'Etchiing');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (28, 19, 'The Thinker', 1902, 'Modernism', 'Sculpture');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (29, 20, 'Apollo and Daphne', 1625, 'Baroque', 'Sculpture');
INSERT INTO `FreeArt`.`artwork` (`artwork_id`, `artist_id`, `art_title`, `art_year`, `art_genre`, `art_type`) VALUES (30, 21, 'Bird in Space', 1930, 'Modernism', 'Sculpture');

COMMIT;


-- -----------------------------------------------------
-- Data for table `FreeArt`.`keyword`
-- -----------------------------------------------------
START TRANSACTION;
USE `FreeArt`;
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (1, 'Portrait');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (2, 'smile');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (3, 'iconic');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (4, 'Biblical');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (5, 'apostles');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (6, 'Landscape');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (7, 'night sky');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (8, 'Still life');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (9, 'flowers');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (10, 'War');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (11, 'destruction');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (12, 'Avant-garde');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (13, 'provocative');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (14, 'light');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (15, 'Harbor');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (16, 'sunrise');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (17, 'Marble');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (18, 'surreal');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (19, 'nature');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (20, 'Milk');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (21, 'Dance');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (22, 'Scream');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (23, 'Consumerism');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (24, 'Celebrity');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (25, 'Love');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (26, 'Abstract');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (27, 'crucifixion');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (28, 'Dream');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (29, 'Rome');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (30, 'ancient ruins');
INSERT INTO `FreeArt`.`keyword` (`keyword_id`, `keyword`) VALUES (31, 'Pensive');

COMMIT;


-- -----------------------------------------------------
-- Data for table `FreeArt`.`artwork_keyword`
-- -----------------------------------------------------
START TRANSACTION;
USE `FreeArt`;
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (1, 1);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (1, 2);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (1, 3);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (2, 5);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (2, 4);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (2, 3);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (3, 6);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (3, 7);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (4, 8);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (4, 9);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (5, 10);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (5, 11);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (6, 12);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (6, 13);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (7, 6);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (7, 14);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (8, 15);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (8, 16);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (9, 17);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (9, 4);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (9, 3);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (10, 4);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (10, 3);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (11, 1);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (11, 18);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (12, 1);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (12, 19);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (13, 1);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (13, 14);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (14, 20);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (15, 21);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (16, 9);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (17, 9);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (18, 18);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (19, 22);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (19, 3);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (20, 23);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (20, 3);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (21, 24);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (22, 25);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (23, 1);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (24, 26);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (24, 6);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (25, 4);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (25, 27);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (26, 28);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (26, 18);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (27, 29);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (27, 30);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (28, 31);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (29, 17);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (30, 26);
INSERT INTO `FreeArt`.`artwork_keyword` (`artwork_id`, `keyword_id`) VALUES (30, 19);

COMMIT;

