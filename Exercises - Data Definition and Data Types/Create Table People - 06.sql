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

