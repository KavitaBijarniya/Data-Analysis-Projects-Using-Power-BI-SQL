USE ecommerce;

SELECT * FROM ecommerce_orders;

--What is the total revenue generated each month in 2024?
SELECT FORMAT(order_date, 'yyyy-MM') AS YearMonth,
       round(SUM(quantity * price),2)   AS Revenue
FROM   ecommerce_orders
WHERE  order_status = 'Delivered'
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY YearMonth;


--Which top 5 product categories generate the highest revenue?
SELECT  TOP 5 Category, ROUND(SUM(quantity*price), 2) AS Revenue
FROM ecommerce_orders
WHERE order_status = 'Delivered'
GROUP BY category
ORDER BY Revenue DESC;

--Which cities have the highest order cancellation rate?
SELECT city,
(SUM(CASE WHEN order_status =  'Cancelled' THEN 1 ELSE 0 END)*1.0/COUNT(order_id))*100 AS Cancellation_rate
FROM ecommerce_orders
GROUP BY city
ORDER BY Cancellation_rate DESC;

--Who are the top 10 customers by total spending?
SELECT TOP 10 customer_id, ROUND(SUM(quantity*price),2) as Revenue
FROM ecommerce_orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
ORDER BY Revenue DESC;

--What percentage of orders are paid using UPI, Card, and COD?
SELECT 
(SUM(CASE WHEN payment_method =  'COD' THEN 1 ELSE 0 END)*1.0/COUNT(order_id))*100 AS COD_PCT,
(SUM(CASE WHEN payment_method =  'UPI' THEN 1 ELSE 0 END)*1.0/COUNT(order_id))*100 AS UPI_PCT,
(SUM(CASE WHEN payment_method =  'Card' THEN 1 ELSE 0 END)*1.0/COUNT(order_id))*100 AS COD_PCT
FROM ecommerce_orders;

--Which 10 products are sold the most by quantity?
SELECT TOP 10 product_id, SUM(quantity) AS Unit_Sold
FROM ecommerce_orders
WHERE order_status = 'Delivered'
GROUP BY product_id
ORDER BY Unit_Sold DESC;

--What is the return rate for each product category?
SELECT category,
ROUND((SUM(case when order_status = 'Returned' THEN 1 ELSE 0 END)*1.0/COUNT(order_id))*100, 2) AS Return_Rate 
FROM ecommerce_orders
GROUP BY category
ORDER BY Return_Rate DESC;


--Compare revenue growth month-over-month.
WITH month_revenue AS(
SELECT FORMAT(order_date, 'yyyy-MM') AS YearMonth, ROUND(SUM(quantity*price),2) AS Revenue
FROM ecommerce_orders
WHERE order_status = 'Delivered'
GROUP BY FORMAT(order_date, 'yyyy-MM')
)
SELECT YearMonth, Revenue,
LAG(Revenue) OVER(ORDER BY YearMonth) AS prev_revenue,
ROUND((Revenue - LAG(Revenue) OVER(ORDER BY YearMonth))/NULLIF(LAG(Revenue) OVER(ORDER BY YearMonth), 0)*100, 2 ) AS MoM_PCT
FROM month_revenue;

