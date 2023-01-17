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
