-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bootsshop_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bootsshop_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bootsshop_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bootsshop_db` ;

-- -----------------------------------------------------
-- Table `bootsshop_db`.`product_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bootsshop_db`.`product_categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_description` VARCHAR(95) NULL,
  `created_from_ip` VARCHAR(45) NULL,
  `updated_from_ip` VARCHAR(45) NULL,
  `date_created` DATETIME NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bootsshop_db`.`product_brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bootsshop_db`.`product_brands` (
  `brand_id` INT NOT NULL AUTO_INCREMENT,
  `brand_description` VARCHAR(45) NULL,
  `created_from_ip` VARCHAR(45) NULL,
  `updated_from_ip` VARCHAR(45) NULL,
  `date_created` DATETIME NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`brand_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bootsshop_db`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bootsshop_db`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(245) NULL,
  `product_category_id` INT NULL,
  `product_model` VARCHAR(45) NULL,
  `product_brand_id` INT NULL,
  `tag_line` VARCHAR(245) NULL,
  `features_description` TEXT NULL,
  `product_price` DECIMAL NULL DEFAULT 0,
  `qty_at_hand` INT NULL DEFAULT 0,
  `editorial_reviews` TEXT NULL,
  `created_from_ip` VARCHAR(45) NULL,
  `updated_from_ip` VARCHAR(45) NULL,
  `date_created` DATETIME NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_products_product_categories_idx` (`product_category_id` ASC),
  INDEX `fk_products_product_brands1_idx` (`product_brand_id` ASC),
  CONSTRAINT `fk_products_product_categories`
    FOREIGN KEY (`product_category_id`)
    REFERENCES `bootsshop_db`.`product_categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_product_brands1`
    FOREIGN KEY (`product_brand_id`)
    REFERENCES `bootsshop_db`.`product_brands` (`brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bootsshop_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bootsshop_db`.`users` (
  `user_id` VARCHAR(15) NOT NULL,
  `user_name` VARCHAR(45) NULL,
  `email_address` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `suspended` BIT NULL DEFAULT 0,
  `created_from_ip` VARCHAR(45) NULL,
  `updated_from_ip` VARCHAR(45) NULL,
  `date_created` DATETIME NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bootsshop_db`.`product_colours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bootsshop_db`.`product_colours` (
  `record_id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NULL,
  `colour` VARCHAR(75) NULL,
  `created_from_ip` VARCHAR(45) NULL,
  `updated_from_ip` VARCHAR(45) NULL,
  `date_created` DATETIME NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`record_id`),
  INDEX `fk_product_colours_products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_product_colours_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `bootsshop_db`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `bootsshop_db`.`product_images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bootsshop_db`.`product_images` (
  `image_id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NULL,
  `featured` BIT NULL DEFAULT 0,
  `image_path` VARCHAR(245) NULL,
  `created_from_ip` VARCHAR(45) NULL,
  `updated_from_ip` VARCHAR(45) NULL,
  `date_created` DATETIME NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`image_id`),
  INDEX `fk_product_images_products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_product_images_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `bootsshop_db`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `bootsshop_db`.`pages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bootsshop_db`.`pages` (
  `page_id` INT NOT NULL AUTO_INCREMENT,
  `meta_title` VARCHAR(45) NULL,
  `meta_description` VARCHAR(45) NULL,
  `meta_keywords` VARCHAR(45) NULL,
  `content` TEXT NULL,
  `created_from_ip` VARCHAR(45) NULL,
  `updated_from_ip` VARCHAR(45) NULL,
  `date_created` DATETIME NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`page_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `bootsshop_db`.`pages` (`meta_title`, `meta_description`, `meta_keywords`, `content`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('About us', 'Bootsshop is a CodeIgniter powered online store that you can use to buy electronic products onlin', 'bootsshop', '<p>Bootsshop about us content goes here</>', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`pages` (`meta_title`, `meta_description`, `meta_keywords`, `content`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('Delivery', 'Bootsshop can deliver the products that you buy to your doorstep', 'bootsshop delivery', '<p>Bootsshop delivery content goes here</>', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');

INSERT INTO `bootsshop_db`.`product_brands` (`brand_description`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('Fujifilm', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`product_brands` (`brand_description`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('Samsung', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`product_brands` (`brand_description`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('Apple', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');

INSERT INTO `bootsshop_db`.`product_categories` (`category_description`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('Electronics', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`product_categories` (`category_description`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('Clothes', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`product_categories` (`category_description`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('Books', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');

INSERT INTO `bootsshop_db`.`products` (`product_name`, `product_category_id`, `product_model`, `product_brand_id`, `tag_line`, `features_description`, `product_price`, `qty_at_hand`, `editorial_reviews`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('Fujifilm FinePix S2950 Digital Camera', '1', 'FinePix S2950HD', '1', '- (14MP, 18x Optical Zoom) 3-inch LCD', '14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode. Face Detection technology with Blink detection and Smile and shoot mode. 4 x AA batteries not included. WxDxH 110.2 ×81.4x73.4mm. Weight 0.341kg (excluding battery and memory card). Weight 0.437kg (including battery and memory card). ', '220', '34', '<h5>Manufacturer\'s Description </h5>', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`products` (`product_name`, `product_category_id`, `product_model`, `product_brand_id`, `tag_line`, `features_description`, `product_price`, `qty_at_hand`, `editorial_reviews`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('Scandisk', '1', 'FinePix S2950HD', '1', '- (14MP, 18x Optical Zoom) 3-inch LCD', '14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode. Face Detection technology with Blink detection and Smile and shoot mode. 4 x AA batteries not included. WxDxH 110.2 ×81.4x73.4mm. Weight 0.341kg (excluding battery and memory card). Weight 0.437kg (including battery and memory card). ', '220', '34', '<h5>Manufacturer\'s Description </h5>', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`products` (`product_name`, `product_category_id`, `product_model`, `product_brand_id`, `tag_line`, `features_description`, `product_price`, `qty_at_hand`, `editorial_reviews`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('Mini FinePix S2950 Digital Camera', '1', 'FinePix S2950HD', '1', '- (14MP, 18x Optical Zoom) 3-inch LCD', '14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode. Face Detection technology with Blink detection and Smile and shoot mode. 4 x AA batteries not included. WxDxH 110.2 ×81.4x73.4mm. Weight 0.341kg (excluding battery and memory card). Weight 0.437kg (including battery and memory card). ', '220', '34', '<h5>Manufacturer\'s Description </h5>', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');

INSERT INTO `bootsshop_db`.`product_images` (`product_id`, `featured`, `image_path`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('1', 1, 'assets\\frontend\\assets\\products\\large\\9.jpg', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`product_images` (`product_id`, `featured`, `image_path`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('1', 0, 'assets\\frontend\\assets\\products\\large\\10.jpg', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`product_images` (`product_id`, `featured`, `image_path`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('1', 0, 'assets\\frontend\\assets\\products\\large\\12.jpg', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`product_images` (`product_id`, `featured`, `image_path`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('2', 1, 'assets\\frontend\\assets\\products\\6.jpg', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`product_images` (`product_id`, `featured`, `image_path`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('2', 0, 'assets\\frontend\\assets\\products\\8.jpg', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`product_images` (`product_id`, `featured`, `image_path`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('2', 0, 'assets\\frontend\\assets\\products\\12.jpg', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`product_images` (`product_id`, `featured`, `image_path`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('3', 1, 'assets\\frontend\\assets\\products\\1.jpg', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`product_images` (`product_id`, `featured`, `image_path`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('3', 0, 'assets\\frontend\\assets\\products\\2.jpg', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');
INSERT INTO `bootsshop_db`.`product_images` (`product_id`, `featured`, `image_path`, `created_from_ip`, `updated_from_ip`, `date_created`, `date_updated`) VALUES ('3', 0, 'assets\\frontend\\assets\\products\\3.jpg', '127.0.0.1', '127.0.0.1', '2015-05-18', '2015-05-18');