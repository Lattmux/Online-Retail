-- Online Retail Dataset project
-- task

SELECT 
    count(*)
FROM
    online_retail;

SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS purchase_frequency,
    CASE
        WHEN COUNT(DISTINCT InvoiceNo) = 1 THEN 'OneTime-purchase'
        WHEN COUNT(DISTINCT InvoiceNo) BETWEEN 2 AND 6 THEN 'Repeat-purchase'
        ELSE 'High-purchase'
    END AS Customer_Segmentation
FROM
    online_retail
GROUP BY CustomerID;

-- (B) Provide insights into how much revenue is generated from each segment 



with CTE_Example as (
SELECT 
    InvoiceNo,
    Description,
    CustomerID,
    Country,
    (Quantity * UnitPrice) AS Revenue
FROM
    online_retail
GROUP BY InvoiceNo , Description , CustomerID , Country , Revenue)

select *
from CTE_Example;


-- (2) Top 10 Most Purchased Products
-- (A)  Identify the top 10 most purchased products based on total quantity sold.

SELECT 
    Description, SUM(Quantity) AS total_quantity_sold
FROM
    online_retail
GROUP BY Description
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- (B) Provide a breakdown of which countries purchase these products the most.

SELECT 
    Country, Description, SUM(Quantity) AS total_quantity_sold
FROM
    online_retail
GROUP BY Country , Description
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- (3)  Revenue Analysis by Country
-- (A) Calculate total sales revenue for each country

SELECT 
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_sales_revenue
FROM
    online_retail
GROUP BY Country
ORDER BY Total_sales_revenue;

-- top 5 countries with higest total revenue

SELECT 
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_sales_revenue
FROM
    online_retail
GROUP BY Country
ORDER BY Total_sales_revenue DESC
LIMIT 5;

-- (B) Provide insights into customer behavior in these countries

SELECT 
    COUNT(*),
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_sales_revenue
FROM
    online_retail
GROUP BY Country
ORDER BY Total_sales_revenue DESC
LIMIT 5;

-- (4)  Monthly Sales Performance
-- (A) Analyze monthly sales data to identify seasonal trends

SELECT 
    YEAR(InvoiceDate) AS Year,
    MONTHNAME(InvoiceDate) AS Month_name,
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_sale
FROM
    online_retail
GROUP BY Year , Month_name
ORDER BY total_sale;

-- (5)  Customer Lifetime Value (CLV) Analysis
-- (A) Calculate the Customer Lifetime Value (CLV) by analyzing the total revenue 

SELECT 
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_revenue
FROM
    online_retail
GROUP BY CustomerID
ORDER BY Total_revenue;

-- (B)  Identify the top 5 customers based on total sales value

SELECT 
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_revenue
FROM
    online_retail
GROUP BY CustomerID
ORDER BY Total_revenue DESC
LIMIT 5;

-- (6) Product Performance Analysis by Category
-- (B) Analyze which product categories

SELECT 
    CASE
        WHEN Description LIKE '%BLUE%' THEN 'BLUES'
        WHEN Description LIKE '%CREAM%' THEN 'CREAMS'
        WHEN Description LIKE '%ROSE%' THEN 'ROSES'
        WHEN Description LIKE '%GREEN%' THEN 'GREENS'
        ELSE 'OTHER'
    END AS product_categories,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_revenue
FROM
    online_retail
GROUP BY product_categories
ORDER BY Total_revenue;






                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          

