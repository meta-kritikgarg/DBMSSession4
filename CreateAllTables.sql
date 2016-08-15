DROP DATABASE IF EXISTS LibraryInformationSystem;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `LibraryInformationSystem` DEFAULT CHARACTER SET latin1 ;
USE `LibraryInformationSystem` ;

-- -----------------------------------------------------
-- Table `LibraryInformationSystem`.`authers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `LibraryInformationSystem`.`authers` (
  `auther_id` INT NOT NULL AUTO_INCREMENT ,
  `auther_nm` VARCHAR(70) NULL ,
  PRIMARY KEY (`auther_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibraryInformationSystem`.`publisher`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `LibraryInformationSystem`.`publisher` (
  `publisher_id` INT NOT NULL AUTO_INCREMENT,
  `publisher_nm` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`publisher_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibraryInformationSystem`.`subjects`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `LibraryInformationSystem`.`subjects` (
  `subjects_id` INT NOT NULL AUTO_INCREMENT,
  `subject_nm` VARCHAR(90) NULL ,
  PRIMARY KEY (`subjects_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibraryInformationSystem`.`titles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `LibraryInformationSystem`.`titles` (
  `title_id` INT NOT NULL AUTO_INCREMENT ,
  `title_nm` VARCHAR(100) NULL ,
  `pub_id` INT NOT NULL ,
  `subjects_id` INT NOT NULL ,
  `titlescol` VARCHAR(45) NULL ,
  PRIMARY KEY (`title_id`) ,
  CONSTRAINT `fk_Title_Publisher`
    FOREIGN KEY (`pub_id` )
    REFERENCES `LibraryInformationSystem`.`publisher` (`publisher_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Title_subjects1`
    FOREIGN KEY (`subjects_id` )
    REFERENCES `LibraryInformationSystem`.`subjects` (`subjects_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `LibraryInformationSystem`.`title_auther`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `LibraryInformationSystem`.`title_auther` (
  `auther_id` INT NOT NULL ,
  `title_id` INT NOT NULL ,
  PRIMARY KEY (`auther_id`, `title_id`) ,
  CONSTRAINT `fk_Auther_has_Title_Auther1`
    FOREIGN KEY (`auther_id` )
    REFERENCES `LibraryInformationSystem`.`authers` (`auther_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Auther_has_Title_Title1`
    FOREIGN KEY (`title_id` )
    REFERENCES `LibraryInformationSystem`.`titles` (`title_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `LibraryInformationSystem`.`books`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `LibraryInformationSystem`.`books` (
  `accession_no` INT NOT NULL AUTO_INCREMENT ,
  `title_id` INT NOT NULL ,
  `purchase_dt` DATETIME NOT NULL ,
  `price` INT NULL ,
  `status` VARCHAR(45) NULL ,
  PRIMARY KEY (`accession_no`) ,
  CONSTRAINT `fk_books_Title1`
    FOREIGN KEY (`title_id` )
    REFERENCES `LibraryInformationSystem`.`titles` (`title_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `LibraryInformationSystem`.`members`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `LibraryInformationSystem`.`members` (
  `members_id` INT NOT NULL AUTO_INCREMENT,
  `member_nm` VARCHAR(75) NOT NULL ,
  `addressline1` VARCHAR(100) NULL ,
  `addressline2` VARCHAR(100) NULL ,
  `category` VARCHAR(45) NULL ,
  PRIMARY KEY (`members_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibraryInformationSystem`.`book_issue`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `LibraryInformationSystem`.`book_issue` (
  `issue_dt` DATETIME NOT NULL ,
  `accession_no` INT NOT NULL ,
  `member_id` INT NOT NULL ,
  `due_dt` DATETIME NULL ,
  PRIMARY KEY (`issue_dt`, `accession_no`, `member_id`) ,
  CONSTRAINT `fk_book_issue_books1`
    FOREIGN KEY (`accession_no` )
    REFERENCES `LibraryInformationSystem`.`books` (`accession_no` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_issue_member1`
    FOREIGN KEY (`member_id` )
    REFERENCES `LibraryInformationSystem`.`members` (`members_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `LibraryInformationSystem`.`book_return`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `LibraryInformationSystem`.`book_return` (
  `return_dt` DATETIME NOT NULL ,
  `issue_dt` DATETIME NULL ,
  `accession_no` INT NOT NULL ,
  `member_id` INT NOT NULL ,
  PRIMARY KEY (`return_dt`, `accession_no`, `member_id`) ,
  CONSTRAINT `fk_book_return_books1`
    FOREIGN KEY (`accession_no` )
    REFERENCES `LibraryInformationSystem`.`books` (`accession_no` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_return_member1`
    FOREIGN KEY (`member_id` )
    REFERENCES `LibraryInformationSystem`.`members` (`members_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
