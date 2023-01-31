USE HRDB;

SELECT * FROM employees;

CREATE TABLE customer (
	customer_id INT PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50)
)

ALTER TABLE customer ADD employee_id INT NOT NULL

ALTER TABLE customer ADD CONSTRAINT fk_emp_id FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO customer VALUES 
(1, 'John', 'Freeman', 1),
(2, 'May', 'Rice', 5),
(3, 'Peter', 'Bolt', 6),
(4, 'John', 'Johnson', 6),
(5, 'Floyd', 'Mayweather', 1)

use HRDB;
SELECT * FROM customer

SELECT c.first_name AS customer_first_name,
	c.last_name AS customer_last_name,
	e.first_name AS employee_first_name,
	e.last_name AS employee_last_name
FROM 
	customer c
FULL OUTER JOIN employees e ON c.customer_id = e.employee_id;


DECLARE @v_sal INT;
DECLARE @v_new_sal INT;

SET @v_sal = (SELECT salary FROM employees WHERE employee_id = 1)
SET @v_new_sal = @v_sal + 1000;

PRINT @v_new_sal

UPDATE 
	employees
	SET salary = @v_new_sal
	WHERE employee_id = 2.

SELECT * FROM employees
SELECT * FROM departments

INSERT INTO departments VALUES (1, 'test', 1)