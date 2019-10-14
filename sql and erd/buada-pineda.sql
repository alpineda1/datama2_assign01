-- MySQL Script generated by MySQL Workbench
-- Mon Oct 14 14:30:13 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `emp_fname` VARCHAR(45) NOT NULL,
  `emp_mi` VARCHAR(45) NOT NULL,
  `emp_lname` VARCHAR(45) NOT NULL,
  `emp_cont` VARCHAR(45) NOT NULL,
  `emp_add` VARCHAR(45) NOT NULL,
  `emp_eadd` VARCHAR(45) NOT NULL,
  `team_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `id` INT NOT NULL,
  `cust_fname` VARCHAR(45) NULL,
  `cust_mi` VARCHAR(45) NULL,
  `cust_lname` VARCHAR(45) NULL,
  `cust_cont` VARCHAR(45) NULL,
  `cust_add` VARCHAR(45) NULL,
  `cust_eadd` VARCHAR(45) NULL,
  `cust_num` VARCHAR(45) NULL,
  `cust_job` VARCHAR(45) NULL,
  `payment_id` INT NOT NULL,
  `orders_order_num` INT NOT NULL,
  `Employee_id` INT NOT NULL,
  PRIMARY KEY (`id`, `payment_id`, `orders_order_num`, `Employee_id`),
  INDEX `fk_customer_Employee1_idx` (`Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_Employee1`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `mydb`.`Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payment` (
  `id` INT NOT NULL,
  `payment_type` VARCHAR(45) NULL,
  `payment_amt` VARCHAR(45) NULL,
  `payment_date` VARCHAR(45) NULL,
  `customer_id` INT NOT NULL,
  `customer_payment_id` INT NOT NULL,
  `customer_orders_order_num` INT NOT NULL,
  `customer_Employee_id` INT NOT NULL,
  PRIMARY KEY (`id`, `customer_id`, `customer_payment_id`, `customer_orders_order_num`, `customer_Employee_id`),
  INDEX `fk_payment_customer1_idx` (`customer_id` ASC, `customer_payment_id` ASC, `customer_orders_order_num` ASC, `customer_Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_customer1`
    FOREIGN KEY (`customer_id` , `customer_payment_id` , `customer_orders_order_num` , `customer_Employee_id`)
    REFERENCES `mydb`.`customer` (`id` , `payment_id` , `orders_order_num` , `Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `id` INT NOT NULL,
  `order_date` VARCHAR(45) NOT NULL,
  `order_desc` VARCHAR(45) NOT NULL,
  `order_pick_up` VARCHAR(45) NOT NULL,
  `order_drop_off` VARCHAR(45) NOT NULL,
  `order_is_complete` VARCHAR(45) NOT NULL,
  `id` VARCHAR(45) NOT NULL,
  `customer_id` INT NOT NULL,
  `customer_payment_id` INT NOT NULL,
  `customer_orders_order_num` INT NOT NULL,
  `customer_Employee_id` INT NOT NULL,
  PRIMARY KEY (`id`, `customer_id`, `customer_payment_id`, `customer_orders_order_num`, `customer_Employee_id`),
  INDEX `fk_orders_customer1_idx` (`customer_id` ASC, `customer_payment_id` ASC, `customer_orders_order_num` ASC, `customer_Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customer1`
    FOREIGN KEY (`customer_id` , `customer_payment_id` , `customer_orders_order_num` , `customer_Employee_id`)
    REFERENCES `mydb`.`customer` (`id` , `payment_id` , `orders_order_num` , `Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(45) NOT NULL,
  `item_col` VARCHAR(45) NOT NULL,
  `item_qty` VARCHAR(45) NOT NULL,
  `item_color` VARCHAR(45) NOT NULL,
  `bldg_num` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`building` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bldg_name` VARCHAR(45) NOT NULL,
  `bldg_add` VARCHAR(45) NOT NULL,
  `bldg_zip` VARCHAR(45) NOT NULL,
  `id` VARCHAR(45) NULL,
  `customer_id` INT NOT NULL,
  `customer_payment_id` INT NOT NULL,
  `customer_orders_order_num` INT NOT NULL,
  PRIMARY KEY (`id`, `customer_id`, `customer_payment_id`, `customer_orders_order_num`),
  INDEX `fk_building_customer1_idx` (`customer_id` ASC, `customer_payment_id` ASC, `customer_orders_order_num` ASC) VISIBLE,
  CONSTRAINT `fk_building_customer1`
    FOREIGN KEY (`customer_id` , `customer_payment_id` , `customer_orders_order_num`)
    REFERENCES `mydb`.`customer` (`id` , `payment_id` , `orders_order_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `emp_fname` VARCHAR(45) NOT NULL,
  `emp_mi` VARCHAR(45) NULL,
  `emp_lname` VARCHAR(45) NOT NULL,
  `emp_cont` VARCHAR(45) NOT NULL,
  `emp_add` VARCHAR(45) NOT NULL,
  `emp_eadd` VARCHAR(45) NOT NULL,
  `team_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`team1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`team1` (
  `id` INT NOT NULL,
  `team_name` VARCHAR(45) NULL,
  `team_type` VARCHAR(45) NULL,
  `` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vehicle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `veh_color` VARCHAR(45) NOT NULL,
  `veh_brand` VARCHAR(45) NOT NULL,
  `veh_plate_num` VARCHAR(45) NOT NULL,
  `emp_lname` VARCHAR(45) NOT NULL,
  `emp_fname` VARCHAR(45) NOT NULL,
  `Employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vehicle_Employee1_idx` (`Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_vehicle_Employee1`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `mydb`.`Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`transaction` (
  `id` INT NOT NULL,
  `tran_type` VARCHAR(45) NULL,
  `tran_date` VARCHAR(45) NULL,
  `cust_id` VARCHAR(45) NULL,
  `emp_id` VARCHAR(45) NULL,
  `order_id` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`team` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `team_name` VARCHAR(45) NOT NULL,
  `team_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `team_name_UNIQUE` (`team_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vehicle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `veh_color` VARCHAR(45) NOT NULL,
  `veh_brand` VARCHAR(45) NOT NULL,
  `veh_plate_num` VARCHAR(45) NOT NULL,
  `emp_lname` VARCHAR(45) NOT NULL,
  `emp_fname` VARCHAR(45) NOT NULL,
  `Employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vehicle_Employee1_idx` (`Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_vehicle_Employee1`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `mydb`.`Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`transactions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tran_type` VARCHAR(45) NOT NULL,
  `tran_date` VARCHAR(45) NOT NULL,
  `cust_lname` VARCHAR(45) NOT NULL,
  `emp_lname` VARCHAR(45) NOT NULL,
  `order_type` VARCHAR(45) NOT NULL,
  `Employee_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Employee_id`),
  INDEX `fk_transactions_Employee1_idx` (`Employee_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_transactions_Employee1`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `mydb`.`Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`team_has_Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`team_has_Employee` (
  `id` VARCHAR(45) NOT NULL,
  `team_id` INT NOT NULL,
  `Employee_id` INT NOT NULL,
  INDEX `fk_team_has_Employee_Employee1_idx` (`Employee_id` ASC) VISIBLE,
  INDEX `fk_team_has_Employee_team1_idx` (`team_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_team_has_Employee_team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `mydb`.`team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_has_Employee_Employee1`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `mydb`.`Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_details` (
  `orders_id` INT NULL,
  `item_id` INT NULL,
  `id` INT NULL,
  INDEX `fk_orders_has_item_item2_idx` (`item_id` ASC) VISIBLE,
  INDEX `fk_orders_has_item_orders2_idx` (`orders_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_orders_has_item_orders2`
    FOREIGN KEY (`orders_id`)
    REFERENCES `mydb`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_item_item2`
    FOREIGN KEY (`item_id`)
    REFERENCES `mydb`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vehicle_has_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vehicle_has_orders` (
  `vehicle_id` INT NOT NULL,
  `vehicle_Employee_id` INT NOT NULL,
  `orders_id` INT NOT NULL,
  `orders_customer_id` INT NOT NULL,
  `orders_customer_payment_id` INT NOT NULL,
  `orders_customer_orders_order_num` INT NOT NULL,
  `orders_customer_Employee_id` INT NOT NULL,
  PRIMARY KEY (`vehicle_id`, `vehicle_Employee_id`, `orders_id`, `orders_customer_id`, `orders_customer_payment_id`, `orders_customer_orders_order_num`, `orders_customer_Employee_id`),
  INDEX `fk_vehicle_has_orders_orders1_idx` (`orders_id` ASC, `orders_customer_id` ASC, `orders_customer_payment_id` ASC, `orders_customer_orders_order_num` ASC, `orders_customer_Employee_id` ASC) VISIBLE,
  INDEX `fk_vehicle_has_orders_vehicle1_idx` (`vehicle_id` ASC, `vehicle_Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_vehicle_has_orders_vehicle1`
    FOREIGN KEY (`vehicle_id` , `vehicle_Employee_id`)
    REFERENCES `mydb`.`vehicle` (`id` , `Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_has_orders_orders1`
    FOREIGN KEY (`orders_id` , `orders_customer_id` , `orders_customer_payment_id` , `orders_customer_orders_order_num` , `orders_customer_Employee_id`)
    REFERENCES `mydb`.`orders` (`id` , `customer_id` , `customer_payment_id` , `customer_orders_order_num` , `customer_Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
