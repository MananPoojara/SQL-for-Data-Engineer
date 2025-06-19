-- Constraints 

CREATE TABLE employee (
    emp_id INTEGER,
    emp_name TEXT,
    emp_salary NUMERIC(10, 2) -- here 10 is total num of digit and 2 is total decimal num
);


-- now we want the name and id of employee should be not null 
ALTER TABLE employee ALTER COLUMN emp_name SET NOT NULL;
ALTER TABLE employee ALTER COLUMN emp_id SET NOT NULL;

INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES 
(1, 'Manan', 20000),
-- (NULL, 'Rahul', 30000);
(2, 'Rahul', 30000)
-- ERROR : null value in column "emp_id" of relation "employee" violates not-null constraint

SELECT * FROM employee;

-- Now i Want that emp_name should be unique
--unique
ALTER TABLE employee ADD CONSTRAINT unique_empname UNIQUE(emp_name);
INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES 
(3, 'Rahul', 40000);
--ERROR : duplicate key value violates unique constraint "unique_empname"


-- Now i want primary key on emp_id
ALTER TABLE employee ADD CONSTRAINT primary_empid PRIMARY KEY(emp_id);
INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES 
(2, 'ABHI', 40000);
--duplicate key value violates unique constraint "primary_empid"
INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES 
(NULL, 'ABHI', 40000);
--null value in column "emp_id" of relation "employee" violates not-null constraint
