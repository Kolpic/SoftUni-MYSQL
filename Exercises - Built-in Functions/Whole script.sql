# USEING soft_uni database
# 1. Find Names of All Employees by First Name

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    SUBSTRING(first_name, 1, 2) = 'Sa'
        OR 'sa'
ORDER BY id;

# 2. Find Names of All Employees by Last Name

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    last_name LIKE  '%ei%'
ORDER BY employee_id;

# 3. Find First Names of All Employess

SELECT 
    first_name
FROM
    employees
WHERE
    department_id IN (3 , 10)
        AND YEAR(hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id;

# 4. Find All Employees Except Engineers

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    job_title NOT LIKE '%Engineer%'
ORDER BY employee_id;

# 5. Find Towns with Name Length

SELECT 
    `name`
FROM
    towns
WHERE
    CHAR_LENGTH(name) = 5
        OR CHAR_LENGTH(name) = 6
ORDER BY `name`;

# 6. Find Towns Starting With

SELECT 
    town_id, name
FROM
    towns
WHERE
    SUBSTRING(name, 1, 1) IN ('M' , 'K', 'B', 'E')
ORDER BY name;

# 7. Find Towns Not Starting With

SELECT 
    *
FROM
    towns
WHERE
    name NOT LIKE 'R%' AND name NOT LIKE 'B%'
        AND name NOT LIKE 'D%'
ORDER BY name;

# 8. Create View Employees Hired After

CREATE VIEW v_employees_hired_after_2000 AS
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    YEAR(hire_date) > 2000;

# 9. Length of Last Name

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    CHAR_LENGTH(last_name) = 5;
    
# USING geography database
# 10. Countries Holding 'A'

SELECT 
    country_name, iso_code
FROM
    countries
WHERE
    country_name LIKE '%a%a%a%'
ORDER BY iso_code;

# 11. Mix of Peak and River Names

SELECT 
    peak_name,
    river_name,
    lower(CONCAT(peak_name, substring(river_name,2,CHAR_LENGTH(river_name)))) AS 'mix'
FROM
    peaks,
    rivers
WHERE
    SUBSTRING(peak_name,
        CHAR_LENGTH(peak_name),
        CHAR_LENGTH(peak_name)) = SUBSTRING(river_name, 1, 1)
ORDER BY mix;

#  USEING diablo database
# 12. Games from 2011 and 2012 Year

SELECT 
    name, date_format(start,'%Y-%m-%d')
FROM
    games
WHERE
    YEAR(start) = 2011 OR YEAR(start) = 2012
ORDER BY YEAR(start), month(start), day(start) , name
LIMIT 50;

# 13. User Email Providers

SELECT 
    user_name,
    SUBSTRING(email,
        LOCATE('@', email) + 1,
        CHAR_LENGTH(email)) AS 'email provider'
FROM
    users
ORDER BY SUBSTRING(email,
    LOCATE('@', email) + 1,
    CHAR_LENGTH(email)) , user_name;
    
# 14. Get Users with IP Address Like Pattern

SELECT 
    user_name, ip_address
FROM
    users
WHERE
    ip_address LIKE '___.1%.%.___'
ORDER BY user_name;

# 15. Show All Games with Duration

SELECT 
    name AS 'game',
    CASE
        WHEN HOUR(start) >= 0 AND HOUR(start) < 12 THEN 'Morning'
        WHEN HOUR(start) >= 12 AND HOUR(start) < 18 THEN 'Afternoon'
        ELSE 'Evening'
    END AS 'Part of the Day',
    CASE
        WHEN duration <= 3 THEN 'Extra Short'
        WHEN duration > 3 AND duration <= 6 THEN 'Short'
        WHEN duration > 6 AND duration <= 10 THEN 'Long'
        ELSE 'Extra Long'
    END AS 'Duration'
FROM
    games;

# USEING orders database
# 16. Orders Table

SELECT 
    product_name,
    order_date,
	adddate(order_date, interval 3 day) AS 'pay_due',
	adddate(order_date, interval 1 month)AS 'deliver_due'
FROM
    orders;
