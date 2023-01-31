CREATE DATABASE HRDB;

USE HRDB;

CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL
)

CREATE TABLE regions (
	region_id INT PRIMARY KEY,
	region_name VARCHAR (25) DEFAULT NULL
)

CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE locations (
	location_id INT PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE jobs (
	job_id INT PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL,
)

CREATE TABLE departments (
	department_id INT PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
)

ALTER TABLE employees ADD CONSTRAINT fk_job_id FOREIGN KEY (job_id) REFERENCES jobs (job_id)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE employees ADD CONSTRAINT fk_department_id FOREIGN KEY (department_id)
REFERENCES departments (department_id)
ON DELETE CASCADE ON UPDATE CASCADE;

/*ALTER TABLE employees ADD CONSTRAINT pk_manager_id PRIMARY KEY (manager_id); */

/* Drop constraint in a table */
ALTER TABLE DROP CONSTRAINT fk_manager_id;

CREATE TABLE dependents (
	dependent_id INT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
)


/*-------------------------- INSERT INTO TABLES ----------------------------*/

/* Region Table */
INSERT INTO regions VALUES 
(1, 'America'),
(2, 'Europe'),
(3, 'Australia'),
(4, 'Antatica'),
(5, 'Asia'),
(6, 'Africa'),
(7, 'Austria')

SELECT * FROM regions;

/* Countries Table */
INSERT INTO countries VALUES 
(1, 'Ghana', 6),
(2, 'Nigeria', 6),
(3, 'Togo', 6),
(4, 'China', 5),
(5, 'India', 5),
(6, 'Cameroon', 6),
(7, 'Israel', 5),
(8, 'Australia', 7),
(9, 'South Africa', 6),
(10, 'New York', 1),
(11, 'France', 2),
(12, 'Japan', 5),
(13, 'Mexico', 1),
(14, 'United Kingdom', 2),
(15, 'Maryland', 1)

SELECT * FROM countries;

/* Locations Table */
INSERT INTO locations VALUES 
(1, 'Akinsemoyin', '11001', 'Surulere', 'Lagos', 2),
(2, '10 Banjo', '11001', 'Kosofe', 'Lagos', 2),
(3, 'Charade', '98199', 'Seattle', 'Washington', 15),
(4, 'Arthur', NULL, 'Ketta', 'London', 14),
(5, NULL, NULL, 'Kings', NULL, 1),
(6, 'Ann Lane', '7960', 'New york', NULL, 10),
(7, 'Manor Station', '11377', 'New york', NULL, 10),
(8, 'Manor Station', '11377', '', NULL, 10),
(9, 'Third Dr.Jamestown', '11377', 'New york', NULL, 10),
(10, 'Akanni Ajiran', '11001', 'Eti-Osa', 'Lekki', 2),
(11, 'C M D Rd', '11001', 'Ikosi Ketu', 'Ikeja', 2),
(12, 'Awolowo Way', '2211', 'Ikeja', 'Lagos', 2),
(13, 'Alhaji Abdul Raufu Obitayo', '2211', 'Eti-Osa', 'Lagos', 2),
(14, 'Friday Morning Studios', '4001', 'Windermere', NULL, 6),
(15, 'Haneviim', '4701', 'Tel Aviv', 'Jerusalem', 7)
SELECT * FROM locations;

/* Jobs Table */
INSERT INTO jobs VALUES 
(1, 'Clerk Manager', 5000.00, 6000.00),
(2, 'Janitor', 2000.00, 4000.00),
(3, 'Stock Manager', 4000.00, 8000.00),
(4, 'Store Keeper', 1000.00, 3000.00),
(5, 'Merchandizer', 1000.00, 3000.00),
(6, 'Branch Manager', NULL, 10000.00),
(7, 'Janitor 2', 1000.00, 3000.00),
(8, 'Security', 3000.00, 6000.00),
(9, 'Administration Assitant', 2000.00, 4000.00),
(10, 'Accountant', 3400.00, 6200.00),
(11, 'Finance Manager', 5000.00, 10000.00),
(12, 'President', 100000.00, 150000.00),
(13, 'Programmer', 30000.00, 50000.00),
(14, 'Security Officer', 3000.00, 5000.00),
(15, 'Janitor', NULL, NULL)

SELECT * FROM jobs;

/* Employees Table */
INSERT INTO employees VALUES 
(1, 'Ife', 'Jeremiah', 'ife.jeremiah@interswitchng.com', '+234000099009', '2002-9-23', 13, 4000.00, 1001, 1),
(2, 'Zainab', 'Sanni', 'sanni@gmail.com', '+234000099009', '2005-5-23', 13, 3000.00, 1002, 11),
(3, 'John', 'Doe', 'johndoe@gmail.com', '+2340000999900', '2005-3-12', 15, 2000.00, 1010, 10),
(4, 'Esther', 'Smith', 'esthersmith@gmail.com', '+2340000999900', '2005-10-12', 12, 100000.00, 1000, 5),
(5, 'Jaye', 'Smith', 'jayesmith@gmail.com', '+2340000000', '2007-9-12', 11, 5000.00, 1100, 1),
(6, 'Philip', 'John', 'philipjohn@gmail.com', '+2340000000', '2007-11-12', 12, 13000.00, 1000, 3),
(7, 'John', 'Smith', 'johnsmith@gmail.com', '+2340003300', '2010-9-11', 15, 1000.00, 233, 2),
(8, 'Joshua', 'Kenny', 'joshuakenny@gmail.com', '+23420400000', '2007-9-2', 14, 5000.00, 1200, 12),
(9, 'Joseph', 'Ayo', 'josephayo@gmail.com', '+23420400000', '2007-9-20', 9, 2000.00, 1800, 13),
(10, 'Lau', 'Happin', 'lauhappin@gmail.com', '+234560985904', '2007-1-23', 9, 2000.00, 1800, 9),
(11, 'Anna', 'Smith', 'annasmith@gmail.com', '+234560985904', '2017-1-23', 1, 2000.00, 1200, 4),
(12, 'Claire', 'Josh', 'clairjosh@gmail.com', '+234560985904', '2007-1-1', 5, 1500.00, 100, 9),
(13, 'Ife', 'Johnson', 'ifejohnson@gmail.com', '+234560985904', '2018-1-12', 7, 1000.00, 1003, 4),
(14, 'Joshua', 'Honesty', 'joshuahonesty@gmail.com', '+234560985904', '2007-1-12', 5, 4000.00, 1100, 12),
(15, 'Jeremy', 'Josh', 'jeremyjosh@gmail.com', '+234560985904', '2007-1-12', 5, 1500.00, 100, 9)

SELECT * FROM employees;

/* Department Table */
INSERT INTO departments VALUES
(1, 'Marketing', 1),
(2, 'Production', 2),
(3, 'Purchase', 3),
(4, 'Public Relation', 4),
(5, 'Purchase', 3),
(6, 'Sales', 7),
(7, 'Operations', 7),
(8, 'Distribution', 14),
(9, 'Research and development', 2),
(10, 'Finance', 14),
(11, 'Distribution', 11),
(12, 'Management', 12),
(13, 'Sales', 13),
(14, 'Operations', 7),
(15, 'Security', 7)

SELECT * FROM departments;

/* Dependents Table */
INSERT INTO dependents VALUES 
(1, 'Jolly', 'Man', 'son', 3),
(2, 'Hans', 'Smith', 'son', 4),
(3, 'Esther', 'Joy', 'daugther', 5),
(4, 'John', 'Doe', 'son', 1),
(5, 'Jolly', 'Reg', 'daughther', 3),
(6, 'Ife', 'Johnson', 'son', 2),
(7, 'John', 'Freeman', 'son', 10),
(8, 'Musu', 'Mina', 'daughter', 4),
(9, 'Mina', 'Man', 'daughter', 3),
(10, 'Ife', 'Jeremiah', 'son', 13),
(11, 'Mina', 'Man', 'daughter', 3),
(12, 'Mina', 'Sans', 'wife', 6),
(13, 'John', 'Sina', 'husband', 15),
(14, 'John', 'Smith', 'son', 7),
(15, 'Sally', 'Anns', 'wife', 2)

SELECT * FROM dependents;

/* Create a view from employee table */
CREATE VIEW emp_view AS 
SELECT first_name, last_name, email, hire_date
FROM employees WHERE job_id < 10;

SELECT * FROM emp_view 

/* Create view from multiple tables */
CREATE VIEW department_jobs_view AS 
SELECT j.job_title, j.min_salary, j.max_salary, d.department_name, d.location_id
FROM departments d, jobs j WHERE j.job_id = d.department_id

SELECT * FROM department_jobs_view WHERE location_id IN (2)

SELECT * FROM department_jobs_view WHERE location_id < 5 ORDER BY min_salary, max_salary

SELECT * FROM department_jobs_view WHERE location_id < 5 ORDER BY min_salary

SELECT
	first_name, last_name, e.department_id, d.department_id, d.department_name
	FROM employees e
	INNER JOIN
	departments d ON d.department_id = e.department_id
	WHERE e.department_id IN (1, 2, 3) ORDER BY d.department_id

SELECT c.country_name,
	c.country_id,
	c.region_id,
	l.country_id,
	l.street_address,
	l.city
FROM 
	countries c
FULL OUTER JOIN locations l ON l.country_id = c.country_id

SELECT c.country_name,
	c.country_id,
	c.region_id,
	l.country_id,
	l.street_address,
	l.city
FROM 
	countries c
INNER JOIN locations l ON l.country_id = c.country_id

SELECT 
	CONCAT(e.first_name, ' ', e.last_name) AS employee,
	CONCAT(m.first_name, ' ', m.last_name) AS manager
FROM employees e
		LEFT JOIN
	employees m 
ON e.employee_id = m.manager_id
ORDER BY manager;

UPDATE employees
SET manager_id = 14
WHERE employee_id = 15

SELECT 
	job_title,
	location_id
FROM
	locations
	CROSS JOIN jobs

/*--------------------------------------------- PL/SQL Programming ------------------------------------------------*/

/* IF statement */
DECLARE @site_value INT;

SET @site_value = 15;

IF @site_value < 25
	PRINT 'Hello world';
ELSE
	PRINT 'Almost there';
GO

/* LOOP While - Statement*/
DECLARE @counter INT
SET @counter = 0
WHILE @counter <= 10

BEGIN
PRINT 'Hello there'
SET @counter = @counter + 1
END
GO

/*BREAK statement*/
DECLARE @counter INT
SET @counter = 0
WHILE @counter < 10
BEGIN 
	PRINT 'This is a while loop'
SET @counter = @counter + 1
IF (@counter = 5)
	BREAK
END
PRINT 'End of Loop'
GO

/* BREAK CONTINUE Statement */
DECLARE @site_value INT
SET @site_value = 0

WHILE @site_value <= 10
BEGIN 
	IF @site_value = 2
		BREAK
	ELSE
	BEGIN
		SET @site_value = @site_value + 1
		PRINT 'This is a while loop'
		CONTINUE
	END
END
PRINT 'Done while loop'
GO

/*SWITCH CASE */
SELECT location_id,
CASE WHEN location_id = 1
OR location_id = 2
OR location_id = 3
OR location_id = 4
OR location_id = 5 THEN 'USA'
WHEN location_id = 6 THEN 'Canada'
WHEN location_id = 7 THEN 'UK'
END 'departments'
FROM locations

SELECT * FROM departments

/* CURSOR */
DECLARE empCursor CURSOR FOR 
SELECT * FROM departments WHERE location_id = 5
OPEN empCursor;
FETCH NEXT FROM empCursor;
WHILE @@FETCH_STATUS = 0
BEGIN
FETCH NEXT FROM empCursor;
END;
CLOSE empCursor;
DEALLOCATE empCursor;
GO

DECLARE @dept_name varchar(50);
DECLARE @location_id varchar(50);
DECLARE empCursor SCROLL CURSOR FOR
SELECT department_name, location_id FROM departments WHERE location_id = 2;
OPEN empCursor;
FETCH ABSOLUTE 6 FROM empCursor INTO @dept_name, @location_id;
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT ('Department name:'+@dept_name + 'Location id '+@location_id);
FETCH PRIOR FROM empCursor INTO @dept_name, @location_id;
END;
CLOSE empCursor;
DEALLOCATE empCursor;
GO

SELECT department_name, location_id FROM departments WHERE location_id = 2;