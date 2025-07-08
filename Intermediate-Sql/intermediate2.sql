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


-------------------------------------------------------------
-- Self Join 
CREATE TABLE Employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    emp_manager_id INTEGER
);

INSERT INTO Employee (emp_name, emp_manager_id) VALUES
('John', NULL),
('Jane', 1),
('Bob', 2),
('Alice', 2),
('Mike', 3);

SELECT * FROM employee;

-- Now we want to achive employeename with their manager we can use self join 
SELECT e1.emp_name, e2.emp_name AS manager_name
FROM employee e1
LEFT JOIN employee e2 ON e1.emp_manager_id = e2.emp_id;

----------------------------------------------------------------------------------
-- ORDER BY CALUSE
SELECT * FROM salaries 
ORDER BY salary DESC;

CREATE TABLE customer_orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50),
order_date DATE,
order_amount DECIMAL(10,2)
);

INSERT INTO customer_orders (order_id, customer_name, order_date, order_amount)
VALUES
(1, 'John', '2021-01-01', 100),
(2, 'Jane', '2021-01-02', 200),
(3, 'John', '2021-01-03', 50),
(4, 'Jane', '2021-01-04', 300),
(5, 'John', '2021-01-05', 150);

SELECT customer_name, order_date, order_amount FROM customer_orders
ORDER BY order_amount ASC;

-----------------------------------------------------------------------------------
-- GROUP BY 
INSERT INTO customer_orders (order_id, customer_name, order_date, order_amount)
VALUES
(6, 'Alice', '2021-01-06', 250);

SELECT customer_name, SUM(order_amount) AS total_order_amount FROM customer_orders
GROUP BY customer_name  ORDER BY SUM(order_amount) DESC;

---------------------------------------------------------------------------HAVING CALUSE 

SELECT customer_name, SUM(order_amount) FROM customer_orders
GROUP BY customer_name
HAVING SUM(order_amount) > 260;

-------------------------------------------------------------------------

-- AGGREGATION FUNCTIONS

SELECT * FROM sales

--COUNT
SELECT COUNT(*) FROM sales; --return 5 for rows

SELECT product, COUNT(quantity) AS total_quantity FROM sales
GROUP BY product; --if we use aggregation we have to use groupby 


--SUM 
SELECT SUM(revenue) FROM sales;

SELECT product, SUM(revenue) AS total_revenue FROM sales
GROUP BY product;

--AVG 
SELECT AVG(revenue) AS average_revenue FROM sales;

SELECT product, AVG(quantity) AS avg_quantity FROM sales
GROUP BY product ORDER BY AVG(quantity) ASC;

-- MIN
SELECT MIN(quantity) FROM sales;

SELECT product, MIN(quantity) AS min_qunatity FROM sales
GROUP BY product;

--MAX
SELECT MAX(quantity) FROM sales;

SELECT product, MAX(quantity) AS min_qunatity FROM sales
GROUP BY product;