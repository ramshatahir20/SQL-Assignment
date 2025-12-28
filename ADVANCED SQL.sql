CREATE DATABASE ADVANCED_SQL;
USE ADVANCED_SQL;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
INSERT INTO Products VALUES
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales VALUES
(1, 1, 4, '2024-01-05'),
(2, 2, 10, '2024-01-06'),
(3, 2, 2, '2024-01-10'),
(4, 4, 1, '2024-01-11');

WITH ProductRevenue AS (
    SELECT 
        p.ProductID,
        p.ProductName,
        SUM(p.Price * s.Quantity) AS TotalRevenue
    FROM Products p
    INNER JOIN Sales s
    ON p.ProductID = s.ProductID
    GROUP BY p.ProductID, p.ProductName
)
SELECT ProductID, ProductName, TotalRevenue
FROM ProductRevenue
WHERE TotalRevenue > 3000;

CREATE VIEW vw_CategorySummary AS
SELECT 
    Category,
    COUNT(ProductID) AS TotalProducts,
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;

CREATE VIEW vw_ProductDetails AS
SELECT ProductID, ProductName, Price
FROM Products;

UPDATE vw_ProductDetails
SET Price = 1500
WHERE ProductID = 1;

DELIMITER //

CREATE PROCEDURE GetProductsByCategory (
    IN p_Category VARCHAR(50)
)
BEGIN
    SELECT ProductID, ProductName, Category, Price
    FROM Products
    WHERE Category = p_Category;
END //

DELIMITER ;
CALL GetProductsByCategory('Electronics');

CREATE TABLE ProductArchive (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt TIMESTAMP
);

DELIMITER //

CREATE TRIGGER trg_AfterDelete_Products
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductArchive (
        ProductID,
        ProductName,
        Category,
        Price,
        DeletedAt
    )
    VALUES (
        OLD.ProductID,
        OLD.ProductName,
        OLD.Category,
        OLD.Price,
        CURRENT_TIMESTAMP
    );
END //

DELIMITER ;



