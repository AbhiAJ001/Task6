-- TASK 6: Sales Trend Analysis Using Aggregations
-- a. Use EXTRACT(MONTH FROM order_date) for month.
-- b. GROUP BY year/month.
-- c. Use SUM() for revenue.
-- d. COUNT(DISTINCT order_id) for volume.
-- e. Use ORDER BY for sorting.
-- f. Limit results for specific time periods.

-- 1. Monthly Revenue and Order Volume (Grouped by Year & Month)
SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- 2. Monthly Revenue and Volume for a Specific Year (e.g., 2023)
SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2023
GROUP BY order_year, order_month
ORDER BY order_month;

-- 3. Top 5 Revenue-Generating Months (All-Time)
SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY order_year, order_month
ORDER BY total_revenue DESC
LIMIT 5;

-- 4. Monthly Revenue and Volume Between Two Dates
SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY order_year, order_month
ORDER BY order_year, order_month;
