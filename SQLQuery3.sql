USE AdventureWorks;

CREATE TABLE Employees(
	EmpID int,
	Designation varchar(50),
	Age int,
	PRIMARY KEY (EmpID)
)

INSERT INTO Employees VALUES 
(7, 'Marketing Specialist', 24),
(8, 'Marketing Specialist', 53)
;

SELECT * FROM Employees;

SELECT EmpID, UPPER(Designation) AS "Employee's Title", DATEDIFF(yy, Age, getdate()) AS BirthDate  FROM Employees WHERE Designation = 'Marketing Specialist' OR Designation = 'Marketing Manager';