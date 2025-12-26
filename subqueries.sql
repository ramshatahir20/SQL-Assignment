CREATE DATABASE SUBQUERIES;

USE SUBQUERIES;

CREATE TABLE DepartmentDataset
(
department_id VARCHAR(4) PRIMARY KEY,
department_name VARCHAR(20),
location VARCHAR(20)
);

CREATE TABLE EmployeeDataset 
(
emp_id INT PRIMARY KEY ,
name VARCHAR(15),
department_id VARCHAR(4)  ,
salary INT,
 FOREIGN KEY (department_id) REFERENCES DepartmentDataset(department_id)
);

CREATE TABLE SalesDataset
(
sale_id INT PRIMARY KEY,
emp_id INT,
sale_amount INT,
sale_date DATE,
FOREIGN KEY(emp_id) REFERENCES EmployeeDataset(emp_id)
);

INSERT INTO EmployeeDataset(emp_id, name, department_id, salary)
VALUES (101,'Abhishek', 'D01', 62000),
(102,'Shubham', 'D01', 58000),
(103, 'Priya', 'D02', 67000),
(104, 'Rohit', 'D02', 64000),
(105, 'Neha', 'D03', 72000),
(106,'Aman', 'D03', 55000),
(107, 'Ravi', 'D04', 60000),
(108, 'Sneha', 'D04', 75000),
(109, 'Kiran', 'D05', 70000),
(110, 'Tanuja', 'D05', 65000);

INSERT INTO DepartmentDataset(department_id, department_name, location)
VALUES ('D01', 'Sales', 'Mumbai'),
('D02', 'Marketing', 'Delhi'),
('D03', 'Finance', 'Pune'),
('D04', 'HR', 'Bengaluru'),
('D05', 'IT', 'Hyderabad');

INSERT INTO SalesDataset(sale_id, emp_id, sale_amount, sale_date)
VALUES (201, 101, 4500, '2025-01-05'),
(202, 102, 7800, '2025-01-10'),
(203, 103, 6700, '2025-01-14'),
(204, 104, 12000, '2025-01-20'),
(205, 105, 9800, '2025-02-02'),
(206, 106, 105000, '2025-02-05'),
(207, 107, 3200, '2025-02-09'),
(208, 108, 5100, '2025-02-15'),
(209, 109, 3900, '2025-02-20'),
(210, 110, 7200, '2025-03-01');  

SELECT name FROM EmployeeDataset
WHERE salary>(SELECT AVG(salary) FROM EmployeeDataset);

SELECT * FROM EmployeeDataset
WHERE department_id=
(SELECT  department_id
FROM EmployeeDataset
GROUP BY department_id 
ORDER BY AVG(salary) DESC
LIMIT 1);

SELECT EmployeeDataset.name, EmployeeDataset.emp_id
FROM EmployeeDataset
INNER JOIN SalesDataset
ON EmployeeDataset.emp_id= SalesDataset.emp_id;

SELECT EmployeeDataset.name 
FROM employeedataset
WHERE salary> (SELECT salary FROM EmployeeDataset
WHERE name='Shubham')
;

SELECT emp_id, name
FROM employeedataset
WHERE department_id= (SELECT department_id
FROM employeedataset
WHERE name='Abhishek')
;

SELECT department_id, department_name
FROM departmentdataset
WHERE department_id IN (SELECT department_id 
FROM employeedataset
WHERE salary>60000)
;

SELECT salesdataset.emp_id, employeedataset.name
FROM employeedataset
INNER JOIN SalesDataset
ON employeedataset.emp_id= salesdataset.emp_id
WHERE salesdataset.sale_amount>(
SELECT AVG(sale_amount) 
FROM salesdataset)
;

SELECT salesdataset.sale_amount, employeedataset.emp_id
FROM employeedataset
JOIN salesdataset
ON employeedataset.emp_id= salesdataset.emp_id
WHERE employeedataset.salary>(
SELECT AVG(salary) 
FROM employeedataset)
;

SELECT salesdataset.emp_id, employeedataset.name
FROM employeedataset 
LEFT JOIN salesdataset
ON employeedataset.emp_id= salesdataset.emp_id
WHERE salesdataset.emp_id IS NULL
;

SELECT department_id, department_name
FROM departmentdataset
WHERE department_id IN (
SELECT department_id
FROM employeedataset
GROUP BY department_id
HAVING AVG(salary) > 55000)
;

SELECT departmentdataset.department_name
FROM departmentdataset
JOIN employeedataset
ON departmentdataset.department_id=employeedataset.department_id
JOIN salesdataset
ON employeedataset.emp_id= salesdataset.emp_id
GROUP BY departmentdataset.department_name
HAVING SUM(sale_amount)> 10000
;

SELECT employeedataset.emp_id, employeedataset.name
FROM employeedataset
JOIN salesdataset 
ON employeedataset.emp_id= salesdataset.emp_id
WHERE salesdataset.emp_id = (
 SELECT emp_id
 FROM salesdataset
 ORDER BY sale_amount DESC
 LIMIT 1 OFFSET 1)
 ;

SELECT name 
FROM employeedataset
WHERE salary>(
 SELECT MAX(Sale_amount)
 FROM salesdataset)
 ;
