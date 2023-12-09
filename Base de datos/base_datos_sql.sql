-- MySQL Script generated by MySQL Workbench
-- Fri Dec  8 18:36:51 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema grupo_tdm_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema grupo_tdm_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `grupo_tdm_db` DEFAULT CHARACTER SET utf8 ;
USE `grupo_tdm_db` ;

-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`states`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`states` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `state` VARCHAR(45) NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`companies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`companies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(100) NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`areas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `area` VARCHAR(100) NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`charges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`charges` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `chargy` VARCHAR(45) NOT NULL,
  `id_area` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_charges_areas_idx` (`id_area` ASC),
  CONSTRAINT `fk_charges_areas`
    FOREIGN KEY (`id_area`)
    REFERENCES `grupo_tdm_db`.`areas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`shops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`shops` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `shop` VARCHAR(100) NOT NULL,
  `id_company` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shops_companies1_idx` (`id_company` ASC),
  CONSTRAINT `fk_shops_companies1`
    FOREIGN KEY (`id_company`)
    REFERENCES `grupo_tdm_db`.`companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `nit` VARCHAR(20) NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `id_company` INT NULL,
  `id_state` INT NOT NULL,
  `id_area` INT NULL,
  `id_chargy` INT NULL,
  `id_shop` INT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_companies1_idx` (`id_company` ASC),
  INDEX `fk_users_states1_idx` (`id_state` ASC),
  INDEX `fk_users_areas1_idx` (`id_area` ASC),
  INDEX `fk_users_charges1_idx` (`id_chargy` ASC),
  INDEX `fk_users_shops1_idx` (`id_shop` ASC),
  CONSTRAINT `fk_users_companies1`
    FOREIGN KEY (`id_company`)
    REFERENCES `grupo_tdm_db`.`companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_states1`
    FOREIGN KEY (`id_state`)
    REFERENCES `grupo_tdm_db`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_areas1`
    FOREIGN KEY (`id_area`)
    REFERENCES `grupo_tdm_db`.`areas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_charges1`
    FOREIGN KEY (`id_chargy`)
    REFERENCES `grupo_tdm_db`.`charges` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_shops1`
    FOREIGN KEY (`id_shop`)
    REFERENCES `grupo_tdm_db`.`shops` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`directories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`directories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `code` VARCHAR(6) NULL,
  `directory` VARCHAR(30) NOT NULL,
  `date_create` VARCHAR(45) NOT NULL,
  `date_update` VARCHAR(45) NOT NULL,
  `id_user` INT NOT NULL,
  `id_state` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_directories_users1_idx` (`id_user` ASC),
  INDEX `fk_directories_states1_idx` (`id_state` ASC),
  CONSTRAINT `fk_directories_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_directories_states1`
    FOREIGN KEY (`id_state`)
    REFERENCES `grupo_tdm_db`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`files`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`files` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `file` VARCHAR(100) NOT NULL,
  `date_create` VARCHAR(45) NOT NULL,
  `date_update` VARCHAR(45) NOT NULL,
  `id_directory` INT NOT NULL,
  `id_state` INT NOT NULL,
  `id_user` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_files_states1_idx` (`id_state` ASC),
  INDEX `fk_files_users1_idx` (`id_user` ASC),
  INDEX `fk_files_directories1_idx` (`id_directory` ASC),
  CONSTRAINT `fk_files_states1`
    FOREIGN KEY (`id_state`)
    REFERENCES `grupo_tdm_db`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_files_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_files_directories1`
    FOREIGN KEY (`id_directory`)
    REFERENCES `grupo_tdm_db`.`directories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`files_modified`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`files_modified` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `file` VARCHAR(100) NOT NULL,
  `date_update` VARCHAR(45) NOT NULL,
  `id_file` INT NOT NULL,
  `id_user` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_files_modified_files1_idx` (`id_file` ASC),
  INDEX `fk_files_modified_users1_idx` (`id_user` ASC),
  CONSTRAINT `fk_files_modified_files1`
    FOREIGN KEY (`id_file`)
    REFERENCES `grupo_tdm_db`.`files` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_files_modified_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`priorities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`priorities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `priority` VARCHAR(45) NOT NULL,
  `hour` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`tickets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(1000) NOT NULL,
  `file` VARCHAR(200) NULL,
  `date_start` VARCHAR(45) NOT NULL,
  `date_finally` VARCHAR(45) NOT NULL,
  `id_priority` INT NOT NULL,
  `id_user_sender` INT NOT NULL,
  `id_user_destination` INT NOT NULL,
  `id_state` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tickets_states1_idx` (`id_state` ASC),
  INDEX `fk_tickets_users1_idx` (`id_user_sender` ASC),
  INDEX `fk_tickets_users2_idx` (`id_user_destination` ASC),
  INDEX `fk_tickets_priorities1_idx` (`id_priority` ASC),
  CONSTRAINT `fk_tickets_states1`
    FOREIGN KEY (`id_state`)
    REFERENCES `grupo_tdm_db`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_users1`
    FOREIGN KEY (`id_user_sender`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_users2`
    FOREIGN KEY (`id_user_destination`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_priorities1`
    FOREIGN KEY (`id_priority`)
    REFERENCES `grupo_tdm_db`.`priorities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(500) NOT NULL,
  `date` VARCHAR(45) NOT NULL,
  `id_user` INT NOT NULL,
  `id_ticket` INT NOT NULL,
  `id_state` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_users1_idx` (`id_user` ASC),
  INDEX `fk_comments_tickets1_idx` (`id_ticket` ASC),
  INDEX `fk_comments_states1_idx` (`id_state` ASC),
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_tickets1`
    FOREIGN KEY (`id_ticket`)
    REFERENCES `grupo_tdm_db`.`tickets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_states1`
    FOREIGN KEY (`id_state`)
    REFERENCES `grupo_tdm_db`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`codes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`codes` (
  `email` VARCHAR(100) NOT NULL,
  `code` VARCHAR(6) NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`report_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`report_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `report` VARCHAR(100) NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`reports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`reports` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(1000) NOT NULL,
  `id_user` INT NOT NULL,
  `id_report_detail` INT NOT NULL,
  `date` VARCHAR(45) NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reports_users1_idx` (`id_user` ASC),
  INDEX `fk_reports_report_details1_idx` (`id_report_detail` ASC),
  CONSTRAINT `fk_reports_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reports_report_details1`
    FOREIGN KEY (`id_report_detail`)
    REFERENCES `grupo_tdm_db`.`report_details` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
