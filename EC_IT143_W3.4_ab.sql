File: EC_IT143_W3.4_ab.sql
-- Author: Ahadzie Bismark
-- Course: IT 143 – Introduction to Databases
-- Assignment: 3.4 Adventure Works—Create Answers
-- Date: July 2025
-- Estimated Run Time: <10 seconds per query
-- Description: This SQL script contains answers to 8 user-generated questions 
-- using the AdventureWorks sample database. Each question is listed in a comment 
-- along with the original author’s name.

-- ============================================================
-- Question 1: Business User - Marginal Complexity
-- Author: Jane Doe
-- "List all product names and their list prices."
SELECT Name, ListPrice
FROM Production.Product;

-- ============================================================
-- Question 2: Business User - Marginal Complexity
-- Author: Ahadzie Bismark
-- "Show the first and last names of employees who are married."
SELECT FirstName, LastName, MaritalStatus
FROM HumanResources.Employee e
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
WHERE MaritalStatus = 'M';

-- ============================================================
-- Question 3: Business User - Moderate Complexity
-- Author: Samuel Aidoo
-- "Which customers placed orders in 2022, and how many orders did each place?"
SELECT c.CustomerID, COUNT(so.SalesOrderID) AS OrderCount
FROM Sales.Customer c
JOIN Sales.SalesOrderHeader so ON c.CustomerID = so.CustomerID
WHERE YEAR(so.OrderDate) = 2022
GROUP BY c.CustomerID;

-- ============================================================
-- Question 4: Business User - Moderate Complexity
-- Author: Blessing Owusu
-- "List the top 5 most expensive products and their list prices."
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

-- ============================================================
-- Question 5: Business User - Increased Complexity
-- Author: Kwame Boateng
-- "Which products have never been sold?"
SELECT p.Name
FROM Production.Product p
LEFT JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
WHERE sod.ProductID IS NULL;

-- ============================================================
-- Question 6: Business User - Increased Complexity
-- Author: Naomi Adu
-- "What are the average, minimum, and maximum list prices for each product category?"
SELECT pc.Name AS CategoryName,
       AVG(p.ListPrice) AS AvgPrice,
       MIN(p.ListPrice) AS MinPrice,
       MAX(p.ListPrice) AS MaxPrice
FROM Production.Product p
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name;

-- ============================================================
-- Question 7: Metadata Question (System Info Schema View)
-- Author: Isaac Mensah
-- "List all tables in the database."
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- ============================================================
-- Question 8: Metadata Question (System Info Schema View)
-- Author: Lydia Owusu
-- "Which columns exist in the 'Person' table?"
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Person';
