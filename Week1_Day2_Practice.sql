Use SuperstoreDB
--=========================
-- WEEK 1 - DAY 2: ADVANCED QUERIES
-- Student: Nishant Jaiswal
-- Date: 07-12-2025
--=========================

-- Query 11: Orders from West or East region
SELECT * FROM Orders WHERE Region IN ('West', 'East');

-- Query 12: Sales between $100 and $500
SELECT * FROM Orders WHERE Sales BETWEEN 100 AND 500;

-- Query 13: Orders from California OR Texas
SELECT * FROM Orders WHERE State IN ('California', 'Texas');

-- Query 14: Products in Technology category
SELECT * FROM Orders WHERE Category = 'Technology';

-- Query 15: Average sales by Category
SELECT Category, AVG(Sales) AS AvgCategorySales
FROM Orders
GROUP BY Category;

-- Query 16: Find cities starting with 'Los'
SELECT * FROM Orders WHERE City LIKE 'Los%';

-- Query 17: Count orders by Segment
SELECT Segment, COUNT(*) AS OrderCount
FROM Orders 
GROUP BY Segment;

-- Query 18: Total profit by Category (sorted)
SELECT Category, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY Category
ORDER BY TotalProfit DESC;

-- Query 19: Regions with total sales over $500,000
SELECT Region, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY Region
HAVING SUM(Sales) > 500000;

-- Query 20: Average discount by Region
SELECT Region, AVG(Discount) AS AvgDiscount
FROM Orders
GROUP BY Region;

-- Query 21: Orders with zero discount
SELECT * FROM Orders WHERE Discount = 0;

-- Query 22: Top 5 cities by total sales
SELECT TOP 5 City, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY City 
ORDER BY TotalSales DESC;

-- Query 23: Orders where Quantity >= 5
SELECT * FROM Orders WHERE Quantity >= 5;

-- Query 24: Calculate profit margin (Profit/Sales * 100)
-- Note: Handle divide-by-zero when Sales = 0
SELECT *,
    CASE
        WHEN Sales = 0 THEN NULL
        ELSE (Profit/Sales) * 100
    END AS ProfitMargin
FROM Orders;

-- Query 25: Find all negative profit orders (losses)
SELECT * FROM Orders WHERE Profit < 0;





--==================================
Use SuperstoreDB
--=========================
/*Multiple WHERE conditions (AND, OR)
BETWEEN, IN, LIKE operators
More aggregations (AVG, MIN, MAX)
HAVING clause
Calculated columns */
--=========================

-- Query 11: Orders from West or East region
--SELECT * FROM Orders WHERE Region IN ('West', 'East');
SELECT * FROM Orders WHERE Region ='West' or  Region='East';


-- Query 12: Sales between $100 and $500
SELECT * FROM Orders WHERE Sales BETWEEN 100 AND 500;

-- Query 13: Orders from California OR Texas

SELECT * 
FROM Orders
WHERE State IN ('California','Texas');

--SELECT * 
--FROM Orders
--WHERE State ='California' OR state= 'Texas';

-- Query 14: Products in Technology category

SELECT * 
FROM Orders
WHERE Category ='Technology';

-- Query 15: Average sales by Category

SELECT category,AVG(sales) AS AVG_CategorySales
FROM Orders
GROUP BY Category ;


-- Query 16: Find cities starting with 'Los'

SELECT *
FROM Orders
WHERE CITY LIKE 'Los%' ;

-- Query 17: Count orders by Segment

	SELECT Segment, 
		count(Segment) AS Count_Segment
	FROM Orders 
	Group By Segment ;
	-- Your way works, but COUNT(*) is standard:
SELECT Segment, COUNT(*) AS OrderCount
FROM Orders 
GROUP BY Segment;

-- Query 18: Total profit by Category (sorted)


SELECT Category , SUM(Profit) AS Total_CategoryProfit
FROM Orders
GROUP BY Category
ORDER BY Total_CategoryProfit DESC;

-- Query 19: Regions with total sales over $50,000

SELECT Region , SUM(Sales) AS Total_RegionSales
FROM Orders
GROUP BY Region
HAVING SUM(Sales) > 500000;

-- Query 20: Average discount by Region
SELECT Region,AVG(Discount) AS AVG_DisRegion
FROM Orders
GROUP BY Region ;

-- Query 21: Orders with zero discount
SELECT * FROM Orders
WHERE Discount =  0;


-- Query 22: Top 5 cities by total sales
SELECT TOP(5) City ,SUM(Sales) AS TotalSales
FROM Orders
GROUP BY City 
ORDER BY TotalSales DESC ;

-- Query 23: Orders where Quantity >= 5
SELECT * FROM Orders
WHERE Quantity >=5 ;

-- Query 24: Calculate profit margin (Profit/Sales * 100)

/*
--SELECT * ,
--((profit/sales)*100) AS Margin
--from Orders
Above code will fail sales data have 0 value
So use Case condition

*/
SELECT * ,
	CASE
		WHEN Sales = 0 THEN NULL
		ELSE (Profit/Sales)*100
	END AS ProfitMargin
FROM Orders;

-- Query 25: Find all negative profit orders (losses)

SELECT * FROM Orders
WHERE Profit < 0 ;