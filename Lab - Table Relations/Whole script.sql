# 1. Mountains and Peaks
CREATE DATABASE test;
USE test;

CREATE TABLE mountains(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL
);

CREATE TABLE peaks(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
`mountain_id` INT NOT NULL
);

ALTER TABLE peaks
ADD CONSTRAINT fk_peaks_mountains
FOREIGN KEY (`mountain_id`)
REFERENCES mountains(`id`);

INSERT INTO mountains(`id`, `name`) VALUES
(1,'Rila'),
(2,'Stara Planina'),
(3,'Rodopi');

INSERT INTO peaks(`id`,`name`,`mountain_id`) VALUES
(1,'Bogdan',2),
(2,'Musala',1),
(3,'Golqm Perelik',3);

# 2. Trip Organization

SELECT 
    v.driver_id,
    v.vehicle_type,
    CONCAT(c.first_name, ' ', c.last_name) AS 'driver_name'
FROM
    vehicles AS v
        JOIN
    campers AS c ON v.driver_id = c.id;
    
# 3. SoftUni Hiking

SELECT 
    r.starting_point AS 'route_starting_point',
    r.end_point AS 'route_ending_point',
    r.leader_id,
    CONCAT(c.first_name, ' ', c.last_name) AS 'leader_name'
FROM
    routes AS r
        JOIN
    campers AS c ON r.leader_id = c.id;

# 4. Delete Mountains

# 5. Project Management DB*

CREATE TABLE clients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(100)
);

CREATE TABLE projects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    project_leader_id INT
);

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    project_id INT
);

	alter table projects
	add constraint fk_projects_clients
	foreign key (client_id)
	references clients(id),
	ADD CONSTRAINT fk_projects_employees
	FOREIGN KEY (project_leader_id)
	REFERENCES employees(id);

	ALTER TABLE employees
	ADD CONSTRAINT fk_employess_projects
	FOREIGN KEY (project_id)
	REFERENCES projects(id);
