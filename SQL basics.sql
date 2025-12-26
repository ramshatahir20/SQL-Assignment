CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees(
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  department VARCHAR(50),
  salary INT,
  hire_date DATE
  );
  
  INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date)
VALUES (101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
(102, 'Riya', 'Kapoor', 'Sales', 75000, '2019-03-22'),
(103, 'Raj', 'Mehta', 'IT', 90000, '2018-07-11'),
(104, 'Neha', 'Verma', 'IT', 85000, '2021-09-01'),
(105, 'Arjun', 'Singh', 'Finance', 60000, '2022-02-10')
;

SELECT *FROM employees
ORDER BY salary ASC;

SELECT *FROM employees
ORDER BY department ASC, salary DESC;

SELECT first_name, last_name FROM employees
WHERE department= 'IT'
ORDER BY hire_date DESC
;

CREATE TABLE sales (
  sale_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(20),
  amount INT,
  sale_date DATE
  );

 INSERT INTO sales (customer_name, amount, sale_date)
  VALUES ('Aditi', 1500, '2024-08-01'),
  ('Rohan', 2200, '2024-08-03'),
  ('Aditi', 3500, '2024-09-05'),
  ('Meena', 2700, '2024-09-15'),
  ('Rohan', 3500, '2024-09-25');
  
   SELECT *FROM sales
ORDER BY amount DESC;

SELECT *FROM sales
WHERE customer_name= 'Aditi'
;








