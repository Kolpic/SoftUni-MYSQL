 USE `minions`;

CREATE TABLE `minions`(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  age INT
);

CREATE TABLE `towns`(
   town_id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(255)
);

ALTER TABLE `minions`
ADD COLUMN `town_id` INT NOT NULL,
ADD CONSTRAINT fk_minions_towns
FOREIGN KEY (`town_id`)
REFERENCES `towns`(`id`);