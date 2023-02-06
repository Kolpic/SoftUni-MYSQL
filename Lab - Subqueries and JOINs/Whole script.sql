# 1. Managers

SELECT 
    d.manager_id AS 'employee_id',
    CONCAT_WS(' ',e.first_name, e.last_name) AS 'full_name',
    d.department_id,
    d.name AS 'department_name'
FROM
    departments AS d
        JOIN
    employees AS e ON d.manager_id = e.employee_id
ORDER BY e.employee_id
LIMIT 5;

# 4. Higher Salary

SELECT 
    count(*) as 'count'
FROM
    employees AS e
WHERE
    e.salary > (SELECT 
            AVG(e.salary)
        FROM
            employees AS e);

# 2. Towns Addresses

SELECT 
    t.town_id AS 'town_id',
    t.name AS 'town_name',
    a.address_text AS 'address_text'
FROM
    addresses AS a
        JOIN
    towns AS t ON t.town_id = a.town_id
WHERE
    t.name IN ('San Francisco' , 'Sofia', 'Carnation')
ORDER BY t.town_id;

# 3. Employees Without Managers

SELECT 
    e.employee_id AS 'employee_id',
    e.first_name AS 'first_name',
    e.last_name AS 'last_name',
    e.department_id AS 'department_id',
    e.salary AS 'salary'
FROM
    employees AS e
WHERE
    manager_id IS NULL
ORDER BY e.employee_id;