CREATE DATABASE practice;

USE practice;
CREATE TABLE Customers (
  CustomerID INT AUTO_INCREMENT PRIMARY KEY,
  CustomerName VARCHAR(50),
  City VARCHAR(20)
  );
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount INT,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
  );
  CREATE TABLE Payments (
    PaymentID VARCHAR(5) PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount INT,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
    );
    
    CREATE TABLE Employees (
      EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
      EmployeeName VARCHAR(50),
      ManagerID INT
      );

INSERT INTO Customers (CustomerName, City)
  VALUES ('John Smith', 'New York'),
  ('Mary Johnson','Chicago'),
  ('Peter Adams', 'Los Angeles'),
  ('Nancy Miller','Houston'),
  ('Robert White', 'Miami'),
  ('Unknown Customer', 'Unknown')
  ;
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
    VALUES (101,1,'2024-10-01',250),
    (102,2,'2024-10-05',300),
    (103,1,'2024-10-07',150),
    (104,3,'2024-10-10',450),
    (105,6,'2024-10-12',450)
    ;
   INSERT INTO Payments (PaymentID,CustomerID, PaymentDate, Amount)
    VALUES ('P001',1,'2024-10-02',250),
           ('P002',2,'2024-10-06',300),
           ('P003',3,'2024-10-11',450),
           ('P004',4,'2024-10-15',200)
           ;
  INSERT INTO Employees (EmployeeName, ManagerID)
     VALUES ('Alex Green',NULL),
     ('Brian Lee',1),
     ('Carol Ray',1),
     ('David Kim',2),
     ('Eva Smith',2)
     ;
     
SELECT Customers.CustomerID, Customers.CustomerName
FROM Customers
INNER JOIN Orders on Customers.CustomerID= Orders.CustomerID;

SELECT Customers.CustomerName, Customers.CustomerID, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID= Orders.CustomerID;

SELECT Customers.CustomerID, Customers.CustomerName, Orders. OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
RIGHT JOIN Orders on Customers.CustomerID= Orders.CustomerID;

SELECT Customers.CustomerID, Customers.CustomerName, Orders. OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
RIGHT JOIN Orders on Customers.CustomerID= Orders.CustomerID

UNION

SELECT Customers.CustomerID, Customers.CustomerName, Orders. OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
LEFT JOIN Orders on Customers.CustomerID= Orders.CustomerID;

SELECT *
FROM Customers 
LEFT JOIN Orders on Customers.CustomerID= Orders.CustomerID
WHERE Orders.OrderID IS NULL;

SELECT *
FROM Customers 
INNER JOIN Payments on Customers.CustomerID= Payments.CustomerID
LEFT JOIN Orders ON Customers.CustomerID=Orders.OrderID
WHERE Orders.OrderID IS NULL;

SELECT *
FROM Customers CROSS JOIN Orders;

SELECT *
FROM Customers 
LEFT JOIN Orders ON Customers.CustomerID=Orders.CustomerID
LEFT JOIN Payments ON Customers.CustomerID=Payments.CustomerID;

SELECT *
FROM Customers 
INNER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
INNER JOIN Payments ON Customers.CustomerID=Payments.CustomerID;












          
             
  


  

