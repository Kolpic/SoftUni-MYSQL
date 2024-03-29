# 1. One-To-One Relationship

CREATE TABLE people (
    `person_id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(20) NOT NULL,
    `salary` DECIMAL(9,2) NOT NULL,
    `passport_id` INT UNIQUE
);

CREATE TABLE passports (
    `passport_id` INT AUTO_INCREMENT PRIMARY KEY,
    `passport_number`  VARCHAR(50) UNIQUE NOT NULL
);

ALTER TABLE people
ADD CONSTRAINT fk_people_passports
FOREIGN KEY (passport_id)
REFERENCES passports(passport_id);

INSERT INTO passports(passport_id, passport_number)
VALUES ('101','N34FG21B'),
       ('102','K65LO4R7'),
       ('103','ZE657QP2');

INSERT INTO people(person_id,first_name, salary, passport_id)
VALUES ('1','Roberto',round('43300.00',2),'102'),
       ('2','Tom',round('56100.00',2),'103'),
       ('3','Yana',round('60200.00',2),'101');

# 2. One-To-Many Relationship

CREATE TABLE manufacturers (
    `manufacturer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) UNIQUE NOT NULL,
    `established_on` DATE NOT NULL
);

INSERT INTO manufacturers(name,established_on)
VALUES ('BMW','1916/03/01'),
       ('Tesla','2003/01/01'),
	   ('Lada','1966/05/01');
       
CREATE TABLE models (
    `model_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) UNIQUE NOT NULL,
    `manufacturer_id` INT
);

ALTER TABLE models
ADD CONSTRAINT fk_models_manufacturers
FOREIGN KEY (manufacturer_id)
REFERENCES manufacturers(manufacturer_id);

INSERT INTO models(model_id,name,manufacturer_id)
VALUES (101,'X1',1),
       (102,'i6',1),
       (103,'Model S',2),
       (104,'Model X',2),
       (105,'Model 3',2),
       (106,'Nova',3);
       
# 3. Many-To-Many Relationship

CREATE TABLE exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

INSERT INTO exams(exam_id, name)
VALUES (101,'Spring MVC'),
       (102,'Neo4j'),
       (103,'Oracle 11g');
       
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

INSERT INTO students(name)
VALUES ('Mila'),
	   ('Toni'),
       ('Ron');
       
CREATE TABLE students_exams (
    student_id INT,
    exam_id INT,
    
    CONSTRAINT pk_students_exams PRIMARY KEY (student_id , exam_id),
    
    CONSTRAINT fk_students_exams_student FOREIGN KEY (student_id)
        REFERENCES students (student_id),
        
    CONSTRAINT fk_students_exams_exams FOREIGN KEY (exam_id)
        REFERENCES exams (exam_id)
);

INSERT INTO students_exams(student_id, exam_id)
VALUES (1,101),
       (1,102),
       (2,101),
       (3,103),
       (2,102),
       (2,103);
       
# 4. Self-Referencing

CREATE TABLE teachers (
    `teacher_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `manager_id` INT
);


INSERT INTO `teachers`(`teacher_id`, `name`, `manager_id`)
VALUES (101,'John',NULL),
	   (102,'Maya',106),
       (103,'Silvia',106),
	   (104,'Ted',105),
       (105,'Mark',101),
	   (106,'Greta',101);
       
ALTER TABLE `teachers`
ADD CONSTRAINT fk
FOREIGN KEY (`manager_id`)
REFERENCES `teachers`(`teacher_id`);

# 5. Online Store Database

create database table_relations;

CREATE TABLE items (
    item_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    item_type_id INT(11)
);

CREATE TABLE order_items (
    order_id INT(11),
    item_id INT(11)
);

CREATE TABLE item_types (
    item_type_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE cities (
    city_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE customers (
    customer_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    birthday DATE,
    city_id INT(11)
);

CREATE TABLE orders (
    order_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    customer_id INT(11)
);

ALTER TABLE items
ADD CONSTRAINT fk_items_items_types
FOREIGN KEY (item_type_id)
REFERENCES item_types(item_type_id);

ALTER TABLE customers
ADD CONSTRAINT fk_customers_cities
FOREIGN KEY (city_id)
REFERENCES cities(city_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE order_items
ADD CONSTRAINT pk_order_id_item_id
PRIMARY KEY(order_id, item_id),

ADD CONSTRAINT fk_order_items_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id),

ADD CONSTRAINT fk_order_items_items
FOREIGN KEY (item_id)
REFERENCES items(item_id);

# 6. University Database
CREATE DATABASE university;

CREATE TABLE subjects (
    subject_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50)
);

CREATE TABLE agenda (
    student_id INT(11),
    subject_id INT(11)
);

CREATE TABLE majors (
    major_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE payments (
    payment_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    payment_date DATE,
    payment_amount DECIMAL(8 , 2 ),
    student_id INT(11)
);

CREATE TABLE students (
    student_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    student_number VARCHAR(12),
    student_name VARCHAR(50),
    major_id INT(11)
);

ALTER TABLE students
ADD CONSTRAINT fk_students_majors
FOREIGN KEY (major_id)
REFERENCES majors(major_id);

ALTER TABLE payments
ADD CONSTRAINT fk_payments_students
FOREIGN KEY (student_id)
REFERENCES students(student_id);

ALTER TABLE agenda
ADD CONSTRAINT pk_student_id_subject_id
PRIMARY KEY (student_id, subject_id),

ADD CONSTRAINT fk_agenda_students
FOREIGN KEY (student_id)
REFERENCES students(student_id),

ADD CONSTRAINT fk_agenda_subjects
FOREIGN KEY (subject_id)
REFERENCES subjects(subject_id);

# 9. Peaks in Rila

SELECT 
    mountain_range,
    peak_name AS 'peak_name',
    elevation AS 'peak_elevation'
FROM
    peaks AS p
        JOIN
    mountains AS m ON m.id = p.mountain_id
WHERE
    m.id = 17
ORDER BY peak_elevation DESC;