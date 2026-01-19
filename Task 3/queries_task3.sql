/*
---------------------------------------------------------------------------
Task 3: SQL Basics - Superstore Sales Analysis
Author: Ambar Kumar
Date: 2024-05-21
Dataset: Sample - Superstore.csv
Description: This script creates the database structure and performs
             filtering, sorting, and aggregations to analyze sales data.
---------------------------------------------------------------------------
*/

-- ==========================================
-- STEP 1: PREPARE DATA STRUCTURE
-- ==========================================

-- Drop the table if it exists to start fresh
DROP TABLE IF EXISTS superstore_sales;

-- Create table with data types matching the CSV columns
CREATE TABLE superstore_sales (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales DECIMAL(10, 4),
    quantity INT,
    discount DECIMAL(4, 2),
    profit DECIMAL(10, 4)
);

-- ==========================================
-- STEP 2: IMPORT DATA
-- ==========================================
-- NOTE: Import the "Sample - Superstore.csv" file using your SQL Client's 
-- Import Wizard (e.g., MySQL Workbench or PgAdmin).
-- Ensure date formats (MM/DD/YYYY) are mapped correctly during import.


-- ==========================================
-- STEP 3: VERIFICATION
-- ==========================================

-- Verify that all 9994 records were imported correctly
SELECT COUNT(*) AS total_records FROM superstore_sales;

-- Preview the first 5 rows to check data integrity
SELECT * FROM superstore_sales LIMIT 5;


-- ==========================================
-- STEP 4: FILTERING AND SORTING
-- ==========================================

-- Objective: Find top 10 highest value orders in the 'Technology' category
SELECT 
    order_id, 
    order_date, 
    product_name, 
    sales 
FROM superstore_sales 
WHERE category = 'Technology' 
ORDER BY sales DESC 
LIMIT 10;


-- ==========================================
-- STEP 5: AGGREGATIONS (SUMMARY REPORT)
-- ==========================================

-- Objective: Monthly Sales Report (Grouping by Region and Category)
SELECT 
    region,
    category,
    SUM(sales) AS total_sales,
    AVG(profit) AS avg_profit,
    COUNT(order_id) AS total_orders
FROM superstore_sales 
GROUP BY region, category
ORDER BY region, total_sales DESC;


-- ==========================================
-- STEP 6: HAVING CLAUSE
-- ==========================================

-- Objective: Filter to show only Sub-Categories with total sales > $100,000
SELECT 
    sub_category, 
    SUM(sales) AS total_sales,
    SUM(quantity) AS total_items_sold
FROM superstore_sales 
GROUP BY sub_category 
HAVING SUM(sales) > 100000
ORDER BY total_sales DESC;


-- ==========================================
-- STEP 7: ADVANCED FILTERING (LIKE & BETWEEN)
-- ==========================================

-- Objective: Find specific customers (Pattern Search)
-- Searching for customers whose names start with 'A'
SELECT DISTINCT customer_name, segment 
FROM superstore_sales 
WHERE customer_name LIKE 'A%'
ORDER BY customer_name
LIMIT 10;

-- Objective: Date Range Analysis
-- Find all sales occurring in the calendar year 2016
SELECT 
    order_id, 
    order_date, 
    customer_name, 
    sales 
FROM superstore_sales 
WHERE order_date BETWEEN '2016-01-01' AND '2016-12-31'
ORDER BY order_date ASC;