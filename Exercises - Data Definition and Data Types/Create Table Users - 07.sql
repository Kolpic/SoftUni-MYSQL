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

