-- Constraints 

CREATE TABLE employee (
    emp_id INTEGER,
    emp_name TEXT,
    emp_salary NUMERIC(10, 2) -- here 10 is total num of digit and 2 is total decimal num
);

-------------------------------------------------------------------------

-- now we want the name and id of employee should be not null 
ALTER TABLE employee ALTER COLUMN emp_name SET NOT NULL;
ALTER TABLE employee ALTER COLUMN emp_id SET NOT NULL;

INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES 
(1, 'Manan', 20000),
-- (NULL, 'Rahul', 30000);
(2, 'Rahul', 30000)
-- ERROR : null value in column "emp_id" of relation "employee" violates not-null constraint

SELECT * FROM employee;

-------------------------------------------------------------------------

-- Now i Want that emp_name should be unique
--unique
ALTER TABLE employee ADD CONSTRAINT unique_empname UNIQUE(emp_name);
INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES 
(3, 'Rahul', 40000);
--ERROR : duplicate key value violates unique constraint "unique_empname"

-------------------------------------------------------------------------

-- Now i want primary key on emp_id
ALTER TABLE employee ADD CONSTRAINT primary_empid PRIMARY KEY(emp_id);
INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES 
(2, 'ABHI', 40000);
--duplicate key value violates unique constraint "primary_empid"
INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES 
(NULL, 'ABHI', 40000);
--null value in column "emp_id" of relation "employee" violates not-null constraint

-------------------------------------------------------------------------

--Now i want name of employee whose salary is > 20000
ALTER TABLE employee ADD CONSTRAINT check_emp CHECK (emp_salary >= 20000);
-- now if i try to exceeds the limit of salary look what happen 
INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES 
(3, 'browsky', 10000)
--new row for relation "employee" violates check constraint "check_emp"
INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES 
(3, 'browsky', 40000) -- added

SELECT * FROM employee;

-------------------------------------------------------------------------

-- Now Let's Understand Foreign key 
--for example we have our EMP table now we have to make new table for demonstrating the foreign key concept 
CREATE TABLE employee_details (
    id INT primary key,
    emp_role TEXT,
    age NUMERIC,
    gender TEXT,
    FOREIGN KEY (id) REFERENCES employee (emp_id)
);

INSERT INTO employee_details (id, emp_role, age, gender) VALUES 
-- (1, 'IT MANAGER', 32, 'MALE')
(4, 'IT INTERN', 22, 'MALE'); --we dont have id 4 in emp table 
--insert or update on table "employee_details" violates foreign key constraint "employee_details_id_fkey"

SELECT * FROM employee_details;

-------------------------------------------------------------------------

-- let's understand Composite Key 
-- it's like giving multiple columns a primary key 
CREATE TABLE Student (
  student_id int,
  department_id int,
  name varchar(50),
  age int,
  gender varchar(10),
  PRIMARY KEY (employee_id, department_id) --composite key
);

-------------------------------------------------------------------------

-- another key called Unique Key
-- we use unique as constraint but here we use it as key 
CREATE TABLE Student (
  student_id int,
  department_id int,
  name varchar(50),
  email VARCHAR(50) UNIQUE, -- Unique key 
  age int,
  gender varchar(10),
  PRIMARY KEY (employee_id, department_id) --composite key
);

-------------------------------------------------------------------------

-- Another key Candidate Key
-- this key is use for uniquely identified columns table has multiple candidate keys 
CREATE TABLE Student (
  student_id int,
  department_id int,
  name varchar(50),
  email VARCHAR(50), 
  phone NUMERIC(20),
  age int,
  gender varchar(10),
  UNIQUE (email), -- Candidate Key
  UNIQUE (phone) -- Candidate Key
);

-------------------------------------------------------------------------

-- another key Super Key
-- it is combination of attributes that are unique in each row in table 
-- all candidate key is super key but not all super key is candidate key 
CREATE TABLE sales (
  sales_id int,
  product_id int,
  customer_id int,
  sales_date date,
  sales_amount decimal(10,2),
  PRIMARY KEY (sales_id),
  UNIQUE (product_id, customer_id, sales_date) --Super key
);

-------------------------------------------------------------------------

-- Last Alternate key 
-- think it is a backup key for primary key 
-- basically alternate key is a candidate key but not selected as primary key
CREATE TABLE students (
  id int,
  roll_no int,
  name varchar(50),
  age int,
  gender varchar(10),
  PRIMARY KEY (id),
  UNIQUE (roll_no)
);


