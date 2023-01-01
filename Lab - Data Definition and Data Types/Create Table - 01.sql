#Create Table - 01
CREATE DATABASE `gamebar`;
USE gamebar;

CREATE TABLE `employees` (
     `id` INT AUTO_INCREMENT PRIMARY KEY,
     `first_name` VARCHAR(100) NOT NULL,
     `last_name` VARCHAR(100) NOT NULL
);

CREATE TABLE `categories` (
     `id` INT AUTO_INCREMENT PRIMARY KEY,
     `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `products` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `category_id` INT NOT NULL
);

# Insert Data In Tables - 02
USE gamebar;

INSERT INTO `employees`(`first_name`, `last_name`) VALUES ("Pesho","Peshov");
INSERT INTO `employees` (`first_name`, `last_name`) VALUES 
("Galin", "Petrov"),("Georgi", "Minkov");

# Alter Table - 03

ALTER TABLE `employees`
ADD COLUMN `middle_name` VARCHAR(100);  

# Modifying Columns - 05
ALTER TABLE `employees`
MODIFY COLUMN `middle_name` VARCHAR(100);

# Adding Constraints - 04
ALTER TABLE `products` 
ADD CONSTRAINT `fk_id_p_c`
  FOREIGN KEY (`category_id`)
  REFERENCES `categories` (`id`);



