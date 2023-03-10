USE gdb023;
-- Request 1: 
-- Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.
SELECT DISTINCT(market) AS Markets_Atliq_Exc_APAC
FROM dim_customer
WHERE customer = "Atliq Exclusive" AND region = "APAC"
ORDER BY market;

-- Request 2:
-- What is the percentage of unique product increase in 2021 vs. 2020? 
-- The final output contains these fields: unique_products_2020, unique_products_2021, percentage_chg
WITH products_2020 AS (
SELECT COUNT(DISTINCT(p.product_code)) AS Unique_products_2020
FROM dim_product AS p
CROSS JOIN fact_sales_monthly AS s
ON p.product_code = s.product_code
WHERE fiscal_year = "2020"),

products_2021 AS (
SELECT COUNT(DISTINCT(p.product_code)) AS Unique_products_2021
FROM dim_product AS p
CROSS JOIN fact_sales_monthly AS s
ON p.product_code = s.product_code
WHERE fiscal_year = "2021")

SELECT Unique_products_2020, Unique_products_2021, 
	   ROUND(((Unique_products_2021 - Unique_products_2020) / Unique_products_2020) * 100 , 2) AS Percentage_chg
FROM products_2020,products_2021;

-- Request 3:
-- Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. 
-- The final output contains 2 fields: segment, product_count
SELECT segment AS Segment, COUNT(DISTINCT(product_code)) AS Product_count
FROM dim_product
GROUP BY Segment
ORDER BY Product_count DESC;

-- Request 4:
-- Which segment had the most increase in unique products in 2021 vs 2020? 
-- The final output contains these fields: segment, product_count_2020, product_count_2021, difference
WITH products_2020 AS(
SELECT p.segment AS Segment, COUNT(DISTINCT p.product_code) AS Product_counts_2020 
FROM dim_product AS p
JOIN fact_sales_monthly AS s
ON p.product_code = s.product_code
WHERE fiscal_year = "2020"
GROUP BY Segment
),
products_2021 AS(
SELECT p.segment AS Segment,COUNT(DISTINCT p.product_code) AS Product_counts_2021 
FROM dim_product AS p
JOIN fact_sales_monthly AS s
ON p.product_code = s.product_code
WHERE fiscal_year = "2021"
GROUP BY Segment
)

SELECT products_2020.Segment AS Segment,Product_counts_2020,Product_counts_2021, (Product_counts_2021 - Product_counts_2020) AS Diff 
FROM products_2020
JOIN products_2021
ON products_2020.Segment = products_2021.Segment
GROUP BY products_2020.Segment
ORDER BY Diff DESC;

-- Request 5:
-- Get the products that have the highest and lowest manufacturing costs. 
-- The final output should contain these fields: product_code, product, manufacturing_cost
SELECT p.product_code, product, manufacturing_cost
FROM dim_product AS p
JOIN fact_manufacturing_cost AS m
ON p.product_code = m.product_code
WHERE manufacturing_cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost) 
UNION
SELECT p.product_code, product, manufacturing_cost
FROM dim_product AS p
JOIN fact_manufacturing_cost AS m
ON p.product_code = m.product_code
WHERE manufacturing_cost = (SELECT  MIN(manufacturing_cost) FROM fact_manufacturing_cost); 

-- Request 6:
-- Generate a report which contains the top 5 customers who received an average high 
-- pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. 
-- The final output contains these fields: customer_code, customer, average_discount_percentage
SELECT c.customer_code, customer, ROUND(AVG(pre_invoice_discount_pct) * 100, 2) AS Avg_discount_percentage 
FROM dim_customer AS c
JOIN fact_pre_invoice_deductions AS d 
ON c.customer_code = d.customer_code
WHERE fiscal_year = 2021 AND market = "India"
GROUP BY customer, c.customer_code
ORDER BY Avg_discount_percentage DESC
LIMIT 5;

-- Request 7:
-- Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month . 
-- This analysis helps to get an idea of low and high-performing months and take strategic decisions. 
-- The final report contains these columns: Month, Year, Gross_sales_Amount
SELECT MONTH(date) AS Month, s.fiscal_year AS Year, ROUND(SUM(gross_price * sold_quantity),2) AS Gross_Sales_Amount
FROM fact_sales_monthly AS s
JOIN fact_gross_price AS g
ON s.product_code = g.product_code
JOIN dim_customer AS c
ON s.customer_code = c.customer_code
WHERE customer = "Atliq Exclusive"
GROUP BY Month,Year
ORDER BY Year ; 

-- Request 8: 
-- In which quarter of 2020, got the maximum total_sold_quantity? 
-- The final output contains these fields sorted by the total_sold_quantity, Quarter, total_sold_quantity
SELECT 
    CASE 
        WHEN (Month(date) >=9 AND Month(date)<=11) THEN 'Q1'
        WHEN (Month(date) >=3 AND Month(date)<=5) THEN 'Q3'
        WHEN (Month(date) >=6 AND Month(date)<=8) THEN 'Q4'
        ELSE 'Q2'
    END AS Quarter,
    SUM(sold_quantity) AS Total_sold_quantity
FROM
    fact_sales_monthly
WHERE
    fiscal_year = '2020'
GROUP BY Quarter
ORDER BY Total_sold_quantity DESC;

-- Request 9:
-- Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? 
-- The final output contains these fields: channel, gross_sales_mln, percentage
WITH Gross_Sales_Mln As (
SELECT c.channel AS Channel, ROUND(SUM(gross_price * sold_quantity) / 1000000 ,2) AS Gross_Sales_Amount_Mln
FROM fact_sales_monthly AS s
JOIN fact_gross_price AS g
ON s.product_code = g.product_code
JOIN dim_customer AS c
ON s.customer_code = c.customer_code
WHERE s.fiscal_year = "2021"
GROUP BY Channel
ORDER BY Channel DESC)

SELECT * , (Gross_Sales_Amount_Mln * 100) / SUM(Gross_Sales_Amount_Mln) OVER() AS Percentage
FROM Gross_Sales_Mln
ORDER BY Percentage DESC;

-- Request 10:
-- Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
-- The final output contains these fields: division, product_code, product, total_sold_quantity, rank_order
WITH division_product AS(
SELECT p.division, p.product_code, p.product, sum(sold_quantity) AS total_sold_quantity
FROM dim_product AS p
JOIN fact_sales_monthly AS s
ON p.product_code = s.product_code
WHERE fiscal_year = "2021" 
GROUP BY p.division, p.product_code, p.product),
ranking AS(
SELECT *, RANK() OVER(PARTITION BY division ORDER BY total_sold_quantity DESC) as Rank_order
FROM division_product) 

SELECT *
FROM ranking
WHERE Rank_order <= 3;