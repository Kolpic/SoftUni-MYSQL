CREATE DATABASE `car_rental`;

USE `car_rental`;

CREATE TABLE `categories` (
   id INT PRIMARY KEY AUTO_INCREMENT,
   category VARCHAR(20) NOT NULL,
   daily_rate INT,
   weekly_rate INT,
   monthly_rate INT,
   weekend_rate INT
);

INSERT INTO `categories` (`category`)
VALUES ("Daily drive"),
       ("Off - road"),
       ("Speed car");
       
CREATE TABLE `cars` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    plate_number VARCHAR(15) NOT NULL,
    make INT,
    model VARCHAR(12),
    car_year INT,
    category_id VARCHAR(20) NOT NULL,
    doors INT,
    picture BLOB,
    car_condition VARCHAR(20),
    avaliable BOOLEAN
);

INSERT INTO `cars` (`plate_number`, `category_id`)
VALUES ("PB 0966 KP", "Daily drive"),
	   ("PB KOLPIC PB", "Speed car"),
       ("PB 1535 CT", "Daily drive");
       
CREATE TABLE `employees` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    title VARCHAR(10),
    notes VARCHAR(255)
);

INSERT INTO `employees` (`first_name`, `last_name`)
VALUES ("Jovani", "Bokacho"),
	   ("Emrah", "Mohamed"),
       ("Ivan", "Grozdev");
       
CREATE TABLE `customers` (
	id INT PRIMARY KEY AUTO_INCREMENT,
    driver_licence_number VARCHAR(15),
    full_name VARCHAR (20) NOT NULL,
    address VARCHAR (20),
    city VARCHAR (20),
    zip_code INT,
    notes VARCHAR (255)
);

INSERT INTO `customers` (`full_name`)
VALUES ("Gencho"),
       ("Gogo"),
       ("Asparuh");
       
CREATE TABLE `rental_orders` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    car_id INT,
    car_condition VARCHAR(255),
    tank_level INT,
    kilometrage_start INT,
    kilometrage_end INT,
    total_kilometrage INT,
    start_date DATE,
    end_date DATE,
    total_days INT,
    rate_applied INT,
    tax_rate INT,
    order_status INT,
    notes VARCHAR(255)
);

INSERT INTO `rental_orders` (`employee_id`, `customer_id`)
VALUES (5482,4226),
	   (789621,88525),
       (77777,88888);