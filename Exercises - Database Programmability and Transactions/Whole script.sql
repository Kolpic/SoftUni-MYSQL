# 1. Employees with Salary Above 35000

DELIMITER $$

CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN 

  SELECT 
    first_name, last_name
FROM
    employees
WHERE
    salary > 35000
ORDER BY first_name , last_name , employee_id;

END $$

CALL usp_get_employees_salary_above_35000;

# 2. Employees with Salary Above Number

DELIMITER $$

CREATE PROCEDURE usp_get_employees_salary_above(wanted_salary DECIMAL(9,4))
BEGIN
      
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    salary >= wanted_salary
ORDER BY first_name , last_name , employee_id;
      
END$$

CALL usp_get_employees_salary_above(45000);

# 3. Town Names Starting With

DELIMITER $$

CREATE PROCEDURE usp_get_towns_starting_with(starting_string VARCHAR(10))
BEGIN
    # DECLARE starting_string_wanted VARCHAR(10);
    DECLARE string_from_town VARCHAR(10);
SELECT 
    `name`
FROM
    towns
WHERE
    `name` LIKE CONCAT(starting_string, '%')
ORDER BY `name`;
    
END$$

CALL usp_get_towns_starting_with('b');

# 4. Employees from Town

DELIMITER $$

CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(50))
BEGIN

SELECT 
    e.first_name, e.last_name
FROM
    employees AS e
        JOIN
    addresses AS ad ON e.address_id = ad.address_id
        JOIN
    towns AS t ON ad.town_id = t.town_id
WHERE
    t.`name` = town_name
ORDER BY e.first_name , e.last_name , e.employee_id;

END$$

CALL usp_get_employees_from_town('Sofia');

# 5. Salary Level Function

DELIMITER $$

CREATE FUNCTION ufn_get_salary_level(salary_to_check DECIMAL(19,4))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN

     DECLARE salary_level VARCHAR(10);
     
     IF salary_to_check < 30000 THEN SET salary_level := 'Low';
     ELSEIF salary_to_check >= 30000 AND salary_to_check <= 50000 THEN SET salary_level := 'Average';
     ELSE SET salary_level := 'High';
     END IF;
     RETURN salary_level;
     
END$$

SELECT ufn_get_salary_level(60000);

# 6. Employees by Salary Level

DELIMITER $$

CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(10))
BEGIN
     
     SELECT `first_name`, `last_name` FROM `employees` as e
     WHERE ufn_get_salary_level(e.`salary`) = salary_level
     ORDER BY `first_name` DESC, `last_name` DESC;
      
END$$

CALL usp_get_employees_by_salary_level('High');

# 7. Define Function

DELIMITER $$

CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS INT
DETERMINISTIC
BEGIN
     
     RETURN word REGEXP (CONCAT('^[', set_of_letters, ']+$'));
     
END$$

SELECT ufn_is_word_comprised('oistmia','Sofia');

# 8. Find Full Name

DELIMITER $$

CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
 
     SELECT 
    CONCAT(first_name, ' ', last_name) AS 'full_name'
FROM
    account_holders
ORDER BY `full_name` , id;
 
END$$

CALL usp_get_holders_full_name();

# 8. People with Balance Higher Than

DELIMITER $$

CREATE PROCEDURE usp_get_holders_with_balance_higher_than(supplied_number DECIMAL(19,4))
BEGIN
     
SELECT 
    `first_name`, `last_name`
FROM
    `account_holders` AS ah
        LEFT JOIN
    `accounts` AS a ON ah.`id` = a.`account_holder_id`
GROUP BY `first_name` , `last_name`, account_holder_id
HAVING SUM(a.`balance`) > supplied_number
ORDER BY a.`account_holder_id`;
     
END$$

CALL usp_get_holders_with_balance_higher_than(7000);

# 10. Future Value Function

DELIMITER $$

CREATE FUNCTION ufn_calculate_future_value(sum DECIMAL(19,4), yearly_interest_rate DOUBLE, number_of_years INT)
RETURNS DECIMAL(19,4)
DETERMINISTIC
BEGIN
     
     DECLARE result DECIMAL(19,4);
     DECLARE middle_sum DOUBLE;
     
     SET middle_sum := 1 + yearly_interest_rate;
     
	 SET result := sum * (POW(middle_sum,number_of_years));
     
     RETURN result;
     
END$$

SELECT ufn_calculate_future_value(1000, 0.5, 5);

# 11. Calculating Interest

DELIMITER $$

CREATE PROCEDURE usp_calculate_future_value_for_account(id INT, rate DECIMAL(19,4))
BEGIN 
     
SELECT 
    a.id AS 'account_id',
    ah.first_name,
    ah.last_name,
    a.balance AS 'current_balance',
    ufn_calculate_future_value( a.balance, rate, 5) AS 'balance_in_5_years'
FROM
    accounts AS a
        JOIN
    account_holders AS ah ON ah.id = a.account_holder_id
WHERE
    a.id = id;
     
END$$

CALL usp_calculate_future_value_for_account(1, 0.1);

# 12. Deposit Money

DELIMITER $$

CREATE PROCEDURE usp_deposit_money(account_id INT, money_amount DECIMAL(19,4))
BEGIN 
     
     START TRANSACTION;
     
     IF (money_amount <= 0) THEN
     ROLLBACK;
     
     ELSE 
     UPDATE `accounts` 
     SET 
    `balance` = `balance` + money_amount;
     COMMIT;
     
     END IF;	
     
END$$

CALL usp_deposit_money(1,180);

# 13. Withdraw Money

DELIMITER $$

CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DECIMAL(19,4))
BEGIN
     
     START TRANSACTION;
     
     IF (money_amount <= 0 || (SELECT `balance` FROM `accounts` WHERE `id` = account_id) < money_amount) THEN ROLLBACK;
     ELSE UPDATE `accounts` SET balance = balance - money_amount WHERE id = account_id; 
     COMMIT;
     END IF;
END$$

CALL usp_withdraw_money(11,10);

# 14. Money Transfer

DELIMITER $$

CREATE PROCEDURE usp_transfer_money(from_account_id INT, to_account_id INT, amount DECIMAL(19,4))
BEGIN
     
     START TRANSACTION;
     
     IF 
        (amount <= 0 || 
          (SELECT `balance` FROM `accounts` WHERE `id` = from_account_id) < amount || 
            from_account_id = to_account_id ||
             (SELECT COUNT(`id`) FROM `accounts` WHERE id = from_account_id) <> 1 || 
                (SELECT COUNT(`id`) FROM `accounts` WHERE id = to_account_id) <> 1)
     
     THEN ROLLBACK;
     ELSE 
     
     UPDATE `accounts` SET balance = balance + amount WHERE id = to_account_id; 
     UPDATE `accounts` SET balance = balance - amount WHERE id = from_account_id;
     
     COMMIT;
     END IF;
     
END$$

CALL usp_transfer_money(1, 2, 183);

# 15. Log Accounts Trigger

CREATE TABLE `logs` (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    old_sum DECIMAL(19 , 4 ) NOT NULL,
    new_sum DECIMAL(19 , 4 ) NOT NULL
);

DELIMITER $$

CREATE TRIGGER tr_after_update_balance
AFTER UPDATE 
ON `accounts`
FOR EACH ROW
BEGIN
     
     INSERT INTO `logs`(account_id, old_sum, new_sum)
     VALUES(
            OLD.id,
            OLD.balance,
            NEW.balance);
     
END$$

# 16. Emails Trigger

CREATE TABLE notification_emails (
    id INT PRIMARY KEY AUTO_INCREMENT,
    recipient INT NOT NULL,
    subject TEXT NOT NULL,
    body TEXT NOT NULL
);

DELIMITER $$

CREATE TRIGGER tr_notification_emails_after_insert
AFTER INSERT
ON `logs`
FOR EACH ROW
BEGIN
     
     INSERT INTO notification_emails(recipient, subject, body)
     VALUES(
           NEW.`account_id`,
           CONCAT('Balance change for account: ', NEW.`account_id`),
           CONCAT('On ', NOW(), ' your balance was changed from ', NEW.`old_sum`, ' to ', NEW.`new_sum`,'.'));
     
END$$

DROP TRIGGER tr_notification_emails_after_inser;