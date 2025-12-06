Use SuperstoreDB

-- ===========================================
-- WEEK 1 - DAY 1: BASIC SQL QUERIES
-- Student: [Nishant Jaiswal]
-- Date: [06-12-2025]
-- ===========================================

-- Query 1: See first 20 rows of data
SELECT TOP 20 * FROM Orders;

-- Query 2: How many total orders?

SELECT COUNT(*) FROM Orders;

-- Query 3: What are the unique regions?
SELECT DISTINCT(Region) FROM Orders;

-- Query 4: Find all orders with Sales over $1000
SELECT *
FROM Orders
WHERE Sales > 1000;

-- Query 5: Show only California orders
SELECT *
FROM Orders
WHERE State = 'California' ;

-- Query 6: Orders sorted by Sales (highest first)
SELECT * 
FROM Orders
ORDER BY Sales DESC ;

-- Query 7: Count how many orders in each Region
SELECT Region,Count(Region) AS TotalOrders
FROM Orders
GROUP BY Region ;

-- Query 8: What's the total Sales across all orders?
SELECT SUM(Sales) AS Total_sale
FROM Orders ;


-- Query 9: Find orders where Discount is greater than 0.2 (20%)

SELECT *
FROM Orders
WHERE Discount > 0.2 ;

-- Query 10: Show top 10 most profitable orders
SELECT TOP 10 *
FROM Orders
ORDER BY Profit DESC;