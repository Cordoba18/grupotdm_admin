-- MySQL Script generated by MySQL Workbench
-- Mon Jan 15 15:39:49 2024
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
-- Table `grupo_tdm_db`.`themes_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`themes_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `theme_user` VARCHAR(45) NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `nit` VARCHAR(20) NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `id_company` INT NULL,
  `id_state` INT NOT NULL,
  `id_area` INT NULL,
  `id_chargy` INT NULL,
  `id_shop` INT NULL,
  `id_theme_user` INT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_companies1_idx` (`id_company` ASC),
  INDEX `fk_users_states1_idx` (`id_state` ASC),
  INDEX `fk_users_areas1_idx` (`id_area` ASC),
  INDEX `fk_users_charges1_idx` (`id_chargy` ASC),
  INDEX `fk_users_shops1_idx` (`id_shop` ASC),
  INDEX `fk_users_themes_users1_idx` (`id_theme_user` ASC),
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
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_themes_users1`
    FOREIGN KEY (`id_theme_user`)
    REFERENCES `grupo_tdm_db`.`themes_users` (`id`)
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


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`reasons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`reasons` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `reason` VARCHAR(45) NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`replenish_times`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`replenish_times` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `replenish_time` VARCHAR(45) NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_application` VARCHAR(45) NULL,
  `date_tomorrow` VARCHAR(45) NULL,
  `time_exit` VARCHAR(45) NULL,
  `time_return` VARCHAR(45) NULL,
  `id_user_collaborator` INT NULL,
  `id_user_boss` INT NULL,
  `id_user_reception` INT NULL,
  `observations` VARCHAR(500) NULL,
  `id_reason` INT NOT NULL,
  `id_replenish_time` INT NOT NULL,
  `id_state` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_permissions_users1_idx` (`id_user_collaborator` ASC),
  INDEX `fk_permissions_users2_idx` (`id_user_boss` ASC),
  INDEX `fk_permissions_users3_idx` (`id_user_reception` ASC),
  INDEX `fk_permissions_reason1_idx` (`id_reason` ASC),
  INDEX `fk_permissions_replenish_times1_idx` (`id_replenish_time` ASC),
  INDEX `fk_permissions_states1_idx` (`id_state` ASC),
  CONSTRAINT `fk_permissions_users1`
    FOREIGN KEY (`id_user_collaborator`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permissions_users2`
    FOREIGN KEY (`id_user_boss`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permissions_users3`
    FOREIGN KEY (`id_user_reception`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permissions_reason1`
    FOREIGN KEY (`id_reason`)
    REFERENCES `grupo_tdm_db`.`reasons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permissions_replenish_times1`
    FOREIGN KEY (`id_replenish_time`)
    REFERENCES `grupo_tdm_db`.`replenish_times` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permissions_states1`
    FOREIGN KEY (`id_state`)
    REFERENCES `grupo_tdm_db`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`proceedings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`proceedings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `proceeding` VARCHAR(45) NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`certificates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`certificates` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_proceeding` INT NOT NULL,
  `date` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `id_user_delivery` INT NOT NULL,
  `id_user_receives` INT NOT NULL,
  `id_user_reception` INT NULL,
  `general_remarks` VARCHAR(500) NULL,
  `image_exit` VARCHAR(45) NULL,
  `date_exit` VARCHAR(45) NULL,
  `image_delivery` VARCHAR(45) NULL,
  `date_delivery` VARCHAR(45) NULL,
  `id_state` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_departure_certificates_users1_idx` (`id_user_delivery` ASC),
  INDEX `fk_departure_certificates_users2_idx` (`id_user_receives` ASC),
  INDEX `fk_certificates_proceedings1_idx` (`id_proceeding` ASC),
  INDEX `fk_certificates_states1_idx` (`id_state` ASC),
  INDEX `fk_certificates_users1_idx` (`id_user_reception` ASC),
  CONSTRAINT `fk_departure_certificates_users1`
    FOREIGN KEY (`id_user_delivery`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_departure_certificates_users2`
    FOREIGN KEY (`id_user_receives`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_certificates_proceedings1`
    FOREIGN KEY (`id_proceeding`)
    REFERENCES `grupo_tdm_db`.`proceedings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_certificates_states1`
    FOREIGN KEY (`id_state`)
    REFERENCES `grupo_tdm_db`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_certificates_users1`
    FOREIGN KEY (`id_user_reception`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`type_components`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`type_components` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type_component` VARCHAR(45) NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`states_certificates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`states_certificates` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `state_certificate` VARCHAR(45) NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`origins_certificates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`origins_certificates` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `origin_certificate` VARCHAR(45) NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `serie` VARCHAR(45) NOT NULL,
  `image_serie` VARCHAR(500) NULL,
  `accessories` VARCHAR(100) NOT NULL,
  `id_type_component` INT NOT NULL,
  `id_state_certificate` INT NOT NULL,
  `id_origin_certificate` INT NOT NULL,
  `id_state` INT NOT NULL,
  `id_user` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_type_components1_idx` (`id_type_component` ASC),
  INDEX `fk_products_states_certificates1_idx` (`id_state_certificate` ASC),
  INDEX `fk_products_origins_certificates1_idx` (`id_origin_certificate` ASC),
  INDEX `fk_products_states1_idx` (`id_state` ASC),
  INDEX `fk_products_users1_idx` (`id_user` ASC),
  CONSTRAINT `fk_products_type_components1`
    FOREIGN KEY (`id_type_component`)
    REFERENCES `grupo_tdm_db`.`type_components` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_states_certificates1`
    FOREIGN KEY (`id_state_certificate`)
    REFERENCES `grupo_tdm_db`.`states_certificates` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_origins_certificates1`
    FOREIGN KEY (`id_origin_certificate`)
    REFERENCES `grupo_tdm_db`.`origins_certificates` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_states1`
    FOREIGN KEY (`id_state`)
    REFERENCES `grupo_tdm_db`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`rows_certificates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`rows_certificates` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_product` INT NOT NULL,
  `id_certificate` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rows_certificates_certificates1_idx` (`id_certificate` ASC),
  INDEX `fk_rows_certificates_products1_idx` (`id_product` ASC),
  CONSTRAINT `fk_rows_certificates_certificates1`
    FOREIGN KEY (`id_certificate`)
    REFERENCES `grupo_tdm_db`.`certificates` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rows_certificates_products1`
    FOREIGN KEY (`id_product`)
    REFERENCES `grupo_tdm_db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`califications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`califications` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `calification` INT NOT NULL,
  `comment` VARCHAR(100) NOT NULL,
  `id_ticket` INT NOT NULL,
  `id_user` INT NOT NULL,
  `date` VARCHAR(45) NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_califications_tickets1_idx` (`id_ticket` ASC),
  INDEX `fk_califications_users1_idx` (`id_user` ASC),
  CONSTRAINT `fk_califications_tickets1`
    FOREIGN KEY (`id_ticket`)
    REFERENCES `grupo_tdm_db`.`tickets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_califications_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`reports_certificate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`reports_certificate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(500) NULL,
  `image` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  `id_user` INT NOT NULL,
  `id_certificate` INT NOT NULL,
  `id_state` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reports_certificate_certificates1_idx` (`id_certificate` ASC),
  INDEX `fk_reports_certificate_states1_idx` (`id_state` ASC),
  INDEX `fk_reports_certificate_users1_idx` (`id_user` ASC),
  CONSTRAINT `fk_reports_certificate_certificates1`
    FOREIGN KEY (`id_certificate`)
    REFERENCES `grupo_tdm_db`.`certificates` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reports_certificate_states1`
    FOREIGN KEY (`id_state`)
    REFERENCES `grupo_tdm_db`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reports_certificate_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `grupo_tdm_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`images_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`images_products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(255) NOT NULL,
  `id_product` INT NOT NULL,
  `id_state` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_images_products_products1_idx` (`id_product` ASC),
  INDEX `fk_images_products_states1_idx` (`id_state` ASC),
  CONSTRAINT `fk_images_products_products1`
    FOREIGN KEY (`id_product`)
    REFERENCES `grupo_tdm_db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_images_products_states1`
    FOREIGN KEY (`id_state`)
    REFERENCES `grupo_tdm_db`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo_tdm_db`.`report_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo_tdm_db`.`report_products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `report` VARCHAR(500) NULL,
  `id_product` INT NOT NULL,
  `id_certificate` INT NOT NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_report_products_products1_idx` (`id_product` ASC),
  INDEX `fk_report_products_certificates1_idx` (`id_certificate` ASC),
  CONSTRAINT `fk_report_products_products1`
    FOREIGN KEY (`id_product`)
    REFERENCES `grupo_tdm_db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_products_certificates1`
    FOREIGN KEY (`id_certificate`)
    REFERENCES `grupo_tdm_db`.`certificates` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
