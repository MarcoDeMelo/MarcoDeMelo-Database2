-- MySQL Workbench Forward Engineering
/*  
Assignment 1 Marco De Melo
*/
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
-- Table `mydb`.`Manufacturer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Manufacturer;
CREATE TABLE IF NOT EXISTS `mydb`.`Manufacturer` (
  `manufacturerCode` INT NOT NULL,
  `company_name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `account_number` VARCHAR(45) NULL,
  `street_name` VARCHAR(45) NULL,
  PRIMARY KEY (`manufacturerCode`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Brands`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Brands;
CREATE TABLE IF NOT EXISTS `mydb`.`Brands` (
  `brandID` INT NOT NULL,
  `manufacturerCode` INT NULL,
  `brand_name` VARCHAR(45) NULL,
  `quality_level` VARCHAR(45) NULL,
  
  PRIMARY KEY (`brandID`),
  
  FOREIGN KEY(manufacturerCode)
  REFERENCES Manufacturer(manufacturerCode)
  )
  
ENGINE = InnoDB;
DROP TABLE IF EXISTS Models;
-- -----------------------------------------------------
-- Table `mydb`.`Models`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Models` (
  `model_number` VARCHAR(45) NOT NULL,
  `brandID` INT NULL,
  `suggested_retail_price` DECIMAL(8,2) NULL,
  `store_retail_price` DECIMAL(8,2) NULL,
  `seatingCapacity` INT NULL,
  `manufactureDate` DATE NULL,
  PRIMARY KEY (`model_number`),
  
  FOREIGN KEY (brandID) 
  REFERENCES Brands(brandID)
  ) 
ENGINE = InnoDB;



DROP TABLE IF EXISTS CarUtilities;
-- -----------------------------------------------------
-- Table `mydb`.`Utilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CarUtilities` (
  `model_number` VARCHAR(45) NOT NULL,
  `horsepower` INT NULL,
  `fuelCapacity` DECIMAL(4,2) NULL,
  `transmissionType` VARCHAR(45) NULL,
  `fuelType` VARCHAR(45) NULL,
  `number_of_cylinders` INT NULL,
  FOREIGN KEY (model_number)
  REFERENCES Models(model_number)
  )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
/*STEP 2 INSERT DATA */

INSERT INTO `manufacturer` values
(1, 'Acme Inc.', '555-1234', 'A123', '123 Main St.'),
(2, 'Widget Co.', '555-5678', 'W456', '456 Elm St.'),
(3, 'Gizmo Corp.', '555-9101', 'G789', '789 Oak St.'),
(4, 'ABC Industries', '555-1212', 'ABC123', '321 Maple Ave.'),
(5, 'XYZ Manufacturing', '555-2323', 'XYZ456', '654 Pine St.'),
(6, 'Jones & Sons', '555-3434', 'J&S789', '987 Oak St.'),
(7, 'Smith Inc.', '555-4545', 'S123', '432 Elm St.'),
(8, 'Johnson Enterprises', '555-5656', 'JE456', '765 Main St.'),
(9, 'Miller & Co.', '555-6767', 'M789', '876 Oak St.');


Insert into `brands` values
(100, 1, 'Toyota', 'Premium'),
(101, 2, 'Honda', 'Premium'),
(102, 3, 'Kia', 'Economy'),
(103, 4, 'Lexus', 'Premium'),
(104, 5, 'Audi', 'Premium'),
(105, 6, 'Hyundai', 'Economy'),
(106, 7, 'Mercedes-Benz', 'Premium'),
(107, 8, 'Ford', 'Economy'),
(108, 9, 'Chevrolet', 'Economy'),
(109, 1, 'BMW', 'Premium'),
(110, 2, 'Skechers', 'Economy'),
(111, 3, 'Jaguar', 'Premium'),
(112, 4, 'Infiniti', 'Premium'),
(113, 5, 'Tesla', 'Luxury'),
(114, 6, 'Rolls-Royce', 'Luxury'),
(115, 7, 'Cadillac', 'Premium'),
(116, 8, 'Mazda', 'Economy'),
(117, 9, 'Jeep', 'Economy'),
(118, 1, 'Fiat', 'Economy'),
(119, 2, 'Acura', 'Premium'),
(120, 3, 'Bentley', 'Luxury'),
(121, 4, 'Volvo', 'Premium'),
(122, 5, 'Ferrari', 'Luxury'),
(123, 6, 'Gucci', 'Luxury'),
(124, 7, 'Bugatti', 'Luxury'),
(125, 8, 'McLaren', 'Luxury'),
(126, 9, 'Porsche', 'Luxury'),
(127, 1, 'Subaru', 'Premium'),
(128, 2, 'Maserati', 'Luxury'),
(129, 3, 'Land Rover', 'Luxury'),
(130, 4, 'Mercedes-AMG', 'Luxury');
       
       
Insert into `Models` values 
('RZ-001', 103, 33600.00, 33200.00, 4, '2021-06-15'),
('ZT-002', 111, 1500.00, 1200.00, 5, '2021-05-20'),
('TR-003', 128, 44700.00, 44500.00, 6, '2020-10-15'),
('FA-004', 124, 44900.00, 44700.00, 7, '2020-12-03'),
('DT-005', 118, 2000.00, 1700.00, 4, '2021-02-10'),
('XS-006', 114, 1100.00, 900.00, 3, '2020-10-30'),
('RT-007', 119, 1600.00, 1400.00, 5, '2020-09-28'),
('ZP-008', 121, 1400.00, 1200.00, 4, '2021-02-25'),
('YG-009', 105, 1300.00, 1100.00, 4, '2021-04-08'),
('WX-010', 127, 1500.00, 1300.00, 4, '2020-11-20'),
('AR-011', 107, 1000.00, 900.00, 4, '2021-01-05'),
('SR-012', 104, 1200.00, 1000.00, 4, '2020-10-15'),
('AS-013', 102, 1700.00, 1500.00, 6, '2021-03-14'),
('DF-014', 117, 1100.00, 900.00, 3, '2020-10-30'),
('QW-015', 110, 1300.00, 1100.00, 4, '2021-04-08'),
('BL-016', 129, 1500.00, 1300.00, 4, '2020-11-20'),
('PL-017', 115, 1600.00, 1400.00, 5, '2021-01-08'),
('GM-018', 125, 1000.00, 900.00, 2, '2021-03-01'),
('BD-019', 101, 3200.00, 3000.00, 4, '2021-06-15'),
('MN-020', 109, 44500.00, 44200.00, 5, '2021-05-20'),
('BT-021', 108, 3700.00, 3500.00, 6, '2020-12-28'),
('FX-022', 112, 1900.00, 1700.00, 7, '2020-12-03'),
('GT-023', 113, 2000.00, 1700.00, 4, '2021-02-10'),
('AA-024', 128, 500.00, 450.00, 2, '2022-01-01'),
('BT-025', 120, 1200.00, 1100.00, 4, '2021-11-15'),
('CG-026', 124, 700.00, 650.00, 3, '2021-10-05'),
('DR-027', 105, 1500.00, 1300.00, 6, '2022-01-30'),
('EK-028', 129, 1000.00, 900.00, 4, '2021-07-22'),
('FA-029', 119, 800.00, 700.00, 2, '2021-03-11'),
('GL-030', 101, 600.00, 550.00, 3, '2022-02-03');



INSERT INTO `CarUtilities` values 
('RZ-001', 220, 12.3, 'Automatic', 'Gasoline', 6),
('ZT-002', 140, 9.5, 'Manual', 'Gasoline', 4),
('TR-003', 300, 15.2, 'Manual', 'Hybrid', 8),
('FA-004', 180, 11.7, 'Automatic', 'Gasoline', 4),
('DT-005', 250, 13.5, 'Manual', 'Gasoline', 6),
('XS-006', 210, 12.0, 'Automatic', 'Gasoline', 4),
('RT-007', 170, 10.9, 'Manual', 'Diesel', 4),
('ZP-008', 270, 14.8, 'Automatic', 'Gasoline', 6),
('YG-009', 150, 9.8, 'Manual', 'Gasoline', 4),
('WX-010', 200, 12.5, 'Manual', 'Hybrid', 6),
('AR-011', 190, 11.2, 'Automatic', 'Hybrid', 4),
('SR-012', 160, 10.5, 'Automatic', 'Diesel', 4),
('AS-013', 280, 15.5, 'Manual', 'Gasoline', 8),
('DF-014', 230, 13.0, 'Automatic', 'Diesel', 6),
('PL-017', 220, 12.3, 'Manual', 'Gasoline', 6),
('GM-018', 150, 9.8, 'Automatic', 'Gasoline', 4),
('BD-019', 260, 14.2, 'Manual', 'Hybrid', 6),
('MN-020', 200, 12.5, 'Automatic', 'Gasoline', 4),
('BT-021', 240, 13.8, 'Manual', 'Gasoline', 6),
('FX-022', 190, 11.2, 'Automatic', 'Diesel', 4),
('GT-023', 250, 13.5, 'Manual', 'Gasoline', 6),
('AA-024', 170, 10.9, 'Automatic', 'Diesel', 4),
('BT-025', 180, 11.7, 'Manual', 'Gasoline', 4),
('CG-026', 300, 15.2, 'Automatic', 'Gasoline', 8),
('DR-027', 130, 8.7, 'Manual', 'Hybrid', 4),
('EK-028', 280, 15.5, 'Automatic', 'Diesel', 8),
('FA-029', 210, 12.0, 'Manual', 'Gasoline', 4),
('GL-030', 270, 14.8, 'Automatic', 'Diesel', 6);


/*STEP 3 Create Queries and Views */

/*1. */ 
DROP VIEW IF EXISTS LargeCapacityVehicles;
CREATE VIEW LargeCapacityVehicles AS
SELECT b.brand_name, m.model_number, m.store_retail_price, m.seatingCapacity
FROM Models m
INNER JOIN Brands b ON m.brandID = b.brandID
WHERE m.seatingCapacity >= 5;
/* SELECT * FROM LargeCapacityVehicles; */

/*2. */ 
DROP VIEW IF EXISTS HybridCars;
CREATE VIEW HybridCars AS
SELECT m.model_number, m.suggested_retail_price, m.store_retail_price, cu.fuelType
FROM Models m
INNER JOIN CarUtilities cu
ON m.model_number = cu.model_number
WHERE cu.fuelType = 'hybrid';
/* SELECT * FROM HybridCars; */

/*3. */ 
/*
SELECT m.Company_Name, COUNT(b.brandID) AS num_brands
FROM Manufacturer m
LEFT JOIN Brands b ON m.manufacturerCode = b.manufacturerCode
GROUP BY m.Company_Name
*/

/*4. */
DROP VIEW IF EXISTS manufacturerInfo;
CREATE VIEW manufacturerInfo AS
SELECT m.model_number, b.brand_name, mnf.company_name, cu.fuelType
FROM Models m
JOIN Brands b ON m.brandID = b.brandID
JOIN Manufacturer mnf ON b.manufacturerCode = mnf.manufacturerCode
JOIN CarUtilities cu ON m.model_number = cu.model_number
ORDER BY mnf.company_name, b.brand_name, m.model_number;
/*SELECT * FROM manufacturerInfo; */


/*5*/ 
DROP VIEW IF EXISTS ModelRetailPrices;
CREATE VIEW ModelRetailPrices AS
SELECT model_number, suggested_retail_price, store_retail_price
FROM Models
WHERE store_retail_price <= 35000;

/* SELECT * FROM ModelRetailPrices; */

/* 6 */
UPDATE Models
SET store_retail_price = store_retail_price * 1.2
WHERE store_retail_price <= 35000;
/* SELECT model_number, store_retail_price FROM Models; */ 