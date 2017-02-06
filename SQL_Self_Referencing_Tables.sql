-- SQL Self Referencing Tables
-- Example of self referencing table using the classic employee/manager relationship.
-- Example works in SQL Server Management Studio


-- Create Self Referencing Table


DROP TABLE employee


CREATE TABLE employee
(
	employee_id int IDENTITY(1,1) NOT NULL,
	name varchar(50) NOT NULL,
	position varchar(50) NOT NULL,
	manager_id int,
	CONSTRAINT employee_pk PRIMARY KEY (employee_id), 
	CONSTRAINT employee_fk FOREIGN KEY (manager_id) REFERENCES employee
) 


-- Inserting the employees
-- Note: As this is a new table I am able to predict what the id's of each employee will be


INSERT INTO employee
VALUES ('Bill', 'CEO', NULL),
	   ('Tom', 'Manager', 1),
	   ('Dick', 'Manager', 1),
	   ('Harry', 'Manager', 1),
	   ('Lenny', 'Worker', 2),
	   ('Carl', 'Worker', 2),
	   ('Moe', 'Worker', 3),
	   ('Joe', 'Worker', 3),
	   ('Peter', 'Worker', 4),
	   ('Paul', 'Worker', 4);


-- Query Self Referencing Tables


SELECT *
FROM employee


-- _______________


SELECT *
FROM employee
WHERE manager_id = 2


SELECT *
FROM employee
WHERE manager_id IS NULL


-- _________________


SELECT e.employee_id AS EmployeeNum, e.name AS EmployeeName, m.employee_id AS ManagerNum, m.name AS ManagerName
FROM employee e
JOIN employee m ON e.manager_id = m.employee_id


-- _______________
	
	
SELECT e.employee_id AS EmployeeNum, e.name AS EmployeeName, m.employee_id AS ManagerNum, m.name AS ManagerName
FROM employee e
JOIN employee m ON e.manager_id = m.employee_id
WHERE e.manager_id = 2


SELECT e.employee_id AS EmployeeNum, e.name AS EmployeeName, m.employee_id AS ManagerNum, m.name AS ManagerName
FROM employee e
JOIN employee m ON e.manager_id = m.employee_id
WHERE e.manager_id = 3


SELECT e.employee_id AS EmployeeNum, e.name AS EmployeeName, m.employee_id AS ManagerNum, m.name AS ManagerName
FROM employee e
JOIN employee m ON e.manager_id = m.employee_id
WHERE e.manager_id = 4


SELECT *
FROM employee
WHERE manager_id IS NULL
