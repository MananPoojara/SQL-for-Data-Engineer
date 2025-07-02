--Joins 
CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL
);

CREATE TABLE salaries (
  id INT PRIMARY KEY,
  employee_id INTEGER NOT NULL,
  salary INTEGER NOT NULL
);


INSERT INTO employees (id,name, department)
VALUES (1,'John Smith', 'Sales'),
       (2,'Jane Doe', 'Marketing'),
       (3,'Bob Brown', 'Sales'),
       (5,'Sarah Anderson', 'Marketing');

INSERT INTO salaries (id,employee_id, salary)
VALUES (1, 1, 50000),
       (2, 2, 60000),
       (3, 3, 70000),
	    (4, 4, 80000);

--------------------------------------------------------
--INNER JOIN (JOIN)

SELECT * FROM employees as e --alias 
INNER JOIN salaries as s ON e.id = s.employee_id;

SELECT e.name, e.department, s.salary FROM employees as e --alias 
INNER JOIN salaries as s ON e.id = s.employee_id;

--------------------------------------------------------
-- Left join 
SELECT * FROM employees as e --alias 
LEFT JOIN salaries as s ON e.id = s.employee_id;

SELECT e.name, e.department, s.salary FROM employees as e --alias 
LEFT OUTER JOIN salaries as s ON e.id = s.employee_id;

----------------------------------------------------------
--RIGHT JOIN
SELECT * FROM employees as e --alias 
RIGHT JOIN salaries as s ON e.id = s.employee_id;

SELECT e.name, e.department, s.salary FROM employees as e --alias 
RIGHT OUTER JOIN salaries as s ON e.id = s.employee_id;

------------------------------------------------------------
-- Full Outer join (full join)

SELECT * FROM employees as e --alias 
FULL OUTER JOIN salaries as s ON e.id = s.employee_id;

SELECT e.name, e.department, s.salary FROM employees as e --alias 
FULL OUTER JOIN salaries as s ON e.id = s.employee_id;

-------------------------------------------------------------
--Cross Join


SELECT e.name, e.department, s.salary FROM employees as e --alias 
CROSS JOIN salaries as s;


