CREATE DATABASE AdventureWorks;

USE AdventureWorks;

CREATE TABLE Employee (
	EmployeeID int,
	PRIMARY KEY (EmployeeID),
)

DROP TABLE Employee;

INSERT INTO Employee VALUES (001)

SELECT * FROM Employee;

CREATE TABLE EmployeeReimbursements (
	RimID int,
	EmployeeID int,
	Amount money CHECK (Amount > 0),
	RimType varchar(20) CHECK (RimType in ('Medical', 'Cash', 'Local')),
	Pending_with varchar(30) NOT NULL,
	CONSTRAINT FK_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	PRIMARY KEY (RimID),
	
)

DROP TABLE EmployeeReimbursements;

SELECT * FROM EmployeeReimbursements;

INSERT INTO EmployeeReimbursements VALUES (3, 001, 200, 'medical', '2 years')

