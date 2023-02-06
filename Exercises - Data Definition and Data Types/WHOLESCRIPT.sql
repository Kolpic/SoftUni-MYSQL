 USE `minions`;

INSERT INTO `towns` (`id`,`name`)
VALUES (1,"Sofia"), (2,"Plovdiv"), (3,"Varna");

INSERT INTO `minions` (`id`,`name`,`age`,`town_id`)
VALUES (1,"Kevin",22,1), (2,"Bob",15,3),(3,"Steward",NULL,2);

TRUNCATE `minions`;

DROP TABLE `minions`;
DROP TABLE `towns`;

CREATE DATABASE `exercise`;

USE `exercise`;
CREATE TABLE `people`(
   id INT PRIMARY KEY AUTO_INCREMENT ,
   `name` VARCHAR(200) NOT NULL,
   picture BLOB,
   height DOUBLE(5,2),
   weight DOUBLE(5,2),
   gender CHAR(1) NOT NULL,
   birthdate DATE NOT NULL,
   biography TEXT
);

INSERT INTO `people` (`name`, `gender`, `birthdate`)
VALUES ("Galin", "m", DATE(NOW())),
	    ("Gergana","f",DATE(NOW())),
        ("Georgi","m",DATE(NOW())),
        ("Ivan","m",DATE(NOW())),
        ("Dragan","m",DATE(NOW()));
        
        
CREATE TABLE `users` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    profile_picture BLOB,
    last_login_time TIME,
    is_deleted enum("true", "false")
);

INSERT INTO `users` (`username`, `password`)
VALUES ("Kolpic","123456"),
       ("IamGosu","123456789"),
       ("Picatsu","123"),
       ("ZenLen","14789321"),
       ("Vanko1","123698741596357");


ALTER TABLE `users`
DROP PRIMARY KEY,
ADD PRIMARY KEY pk_users (`id`, `username`);

ALTER TABLE `users`
MODIFY COLUMN `last_login_time` DATETIME DEFAULT NOW();

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY `users` (`id`),
MODIFY COLUMN `username` VARCHAR(30) UNIQUE;

DROP DATABASE `exercise`;

CREATE DATABASE `Movies`;

USE `Movies`;
CREATE TABLE `directors` (
   id INT PRIMARY KEY AUTO_INCREMENT,
   director_name VARCHAR(10) NOT NULL,
   notes VARCHAR(255)
);

INSERT INTO `directors` (`director_name`)
VALUES ("Galin"),
	   ("Foncho"),
       ("Zelka"),
       ("Nakata"),
       ("Vesko");

CREATE TABLE `genres` (
   id INT PRIMARY KEY AUTO_INCREMENT,
   genre_name VARCHAR(10) NOT NULL,
   notes VARCHAR(255)
);

INSERT INTO `genres` (`genre_name`)
VALUES ("Minka"),
       ("Gerganka"),
       ("Stamatka"),
       ("Patka"),
       ("Corny");

CREATE TABLE `categories` (
     id INT PRIMARY KEY AUTO_INCREMENT,
     category_name VARCHAR(10) NOT NULL,
     notes VARCHAR(255)
);

INSERT INTO `categories` (`category_name`)
VALUES ("Games"),
       ("Food"),
       ("Drinks"),
       ("Activity"),
       ("Genders");

CREATE TABLE `movies` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    director_id INT,
    copyright_year YEAR,
    length INT,
    genre_id INT,
    category_id INT,
    rating INT,
    notes VARCHAR(255)
);

INSERT INTO `movies` (`title`)
VALUES ("Titanic"),
       ("Jurassic World"),
       ("Earth"),
       ("Freezed"),
       ("The island");
       
DROP DATABASE `Movies`;

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
       
DROP DATABASE `car_rental`;

CREATE DATABASE `soft_uni`;

USE `soft_uni`;

CREATE TABLE `towns` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `addresses` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    address_text VARCHAR(255) NOT NULL,
    town_id INT NOT NULL
);

CREATE TABLE `departments`(
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `employees`(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    first_name VARCHAR(255) NOT NULL, 
    middle_name VARCHAR(255) NOT NULL, 
    last_name VARCHAR(255) NOT NULL, 
    job_title VARCHAR(255) NOT NULL, 
    department_id INT NOT NULL, 
    hire_date DATE, 
    salary DECIMAL, 
    address_id INT NOT NULL
);

INSERT INTO `towns` (`name`)
VALUES ("Sofia"),
       ("Plovdiv"),
       ("Varna"),
       ("Burgas");
       
       INSERT INTO `departments` (`name`)
VALUES ("Engineering"), ("Sales"), ("Marketing"),
("Software Development"), ("Quality Assurance");

INSERT INTO `employees` (`first_name`, `middle_name`, `last_name`, `job_title`,
`department_id`, `hire_date`, `salary`)
VALUES ("Ivan","Ivanov","Ivanov",".NET Developer", 4 ,"2013-02-01", 3500.00),
	   ("Petar","Petrov","Petrov","Senior Engineer", 1 ,"2004-03-02", 4000.00),
       ("Maria ","Petrova","Ivanova","Intern", 5 ,"2016-08-28", 525.25),
       ("Georgi","Terziev","Ivanov","CEO", 2 ,"2007-12-09", 3000.00),
       ("Peter","Pan","Pan","Intern", 3 ,"2016-08-28", 599.88);


SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;


SELECT * FROM `towns`
ORDER BY `name`;

SELECT * FROM `departments`
ORDER BY `name`;

SELECT * FROM `employees`
ORDER BY `salary` DESC;



SELECT `name` FROM `towns`
ORDER BY `name`;

SELECT `name` FROM `departments`
ORDER BY `name`;

SELECT `first_name`, `last_name`, `job_title`, `salary` FROM `employees`
ORDER BY `salary` DESC;


UPDATE `employees`
SET `salary` = `salary` * 1.10;
SELECT `salary` FROM `employees`;