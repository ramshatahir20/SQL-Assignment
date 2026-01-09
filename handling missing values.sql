USE ASSIGNMENT;
CREATE TABLE customer_data (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(30),
    Monthly_Sales INT,
    Income INT,
    Region VARCHAR(20)
);

INSERT INTO customer_data (Customer_ID, Name, City, Monthly_Sales, Income, Region) VALUES
(101, 'Rahul Mehta', 'Mumbai', 12000, 65000, 'West'),
(102, 'Anjali Rao', 'Bengaluru', NULL, NULL, 'South'),
(103, 'Suresh Iyer', 'Chennai', 15000, 72000, 'South'),
(104, 'Neha Singh', 'Delhi', NULL, NULL, 'North'),
(105, 'Amit Verma', 'Pune', 18000, 58000, NULL),
(106, 'Karan Shah', 'Ahmedabad', NULL, 61000, 'West'),
(107, 'Pooja Das', 'Kolkata', 14000, NULL, 'East'),
(108, 'Riya Kapoor', 'Jaipur', 16000, 69000, 'North');

-- Q8. A) Identify affected rows
SELECT *
FROM customer_data
WHERE Region IS NULL;

-- B) Show the dataset after deletion
SELECT *
FROM customer_data
WHERE Region IS NOT NULL;

-- C)Mention how many records were lost
SELECT COUNT(*) AS records_lost
FROM customer_data
WHERE Region IS NULL;

-- Q9 Handle missing values in Monthly_Sales using:
-- Forward Fill
-- Tasks:
-- A) Apply forward fill
SELECT
    Customer_ID,
    Name,
    Monthly_Sales AS Before_Fill,
    COALESCE(
        Monthly_Sales,
        LAG(Monthly_Sales) OVER (ORDER BY Customer_ID)
    ) AS After_Forward_Fill
FROM customer_data;

-- Q10. A)Create Income_Missing_Flag (0 = present, 1 = missing)
SELECT
    Customer_ID,
    Name,
    City,
    Monthly_Sales,
    Income,
    Region,
    CASE
        WHEN Income IS NULL THEN 1
        ELSE 0
    END AS Income_Missing_Flag
FROM customer_data;

-- C)Count how many customers have missing income
SELECT COUNT(*) AS Missing_Income_Count
FROM customer_data
WHERE Income IS NULL;
