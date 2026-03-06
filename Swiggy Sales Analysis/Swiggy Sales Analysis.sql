use restaurant_db;

select * from Swiggy;


--Data Cleaning
--Check for NULL Values in Each Column
SELECT
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS null_state,
    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS null_city,
    SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS null_order_date,
    SUM(CASE WHEN Restaurant_Name IS NULL THEN 1 ELSE 0 END) AS null_restaurant,
    SUM(CASE WHEN Location IS NULL THEN 1 ELSE 0 END) AS null_location,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS null_category,
    SUM(CASE WHEN Dish_Name IS NULL THEN 1 ELSE 0 END) AS null_dish,
    SUM(CASE WHEN Price_INR IS NULL THEN 1 ELSE 0 END) AS null_price,
    SUM(CASE WHEN Rating IS NULL THEN 1 ELSE 0 END) AS null_rating,
    SUM(CASE WHEN Rating_Count IS NULL THEN 1 ELSE 0 END) AS null_rating_count
FROM Swiggy


--Blank/Empty String Check
--Detect fields containing blank values that may cause inaccurate analysis

SELECT
    SUM(CASE WHEN State = '' THEN 1 ELSE 0 END) AS blank_state,
    SUM(CASE WHEN City = '' THEN 1 ELSE 0 END) AS blank_city,
    SUM(CASE WHEN Order_Date = '' THEN 1 ELSE 0 END) AS blank_order_date,
    SUM(CASE WHEN Restaurant_Name = '' THEN 1 ELSE 0 END) AS blank_restaurant,
    SUM(CASE WHEN Location = '' THEN 1 ELSE 0 END) AS blank_location,
    SUM(CASE WHEN Category = '' THEN 1 ELSE 0 END) AS blank_category,
    SUM(CASE WHEN Dish_Name = '' THEN 1 ELSE 0 END) AS blank_dish,
    SUM(CASE WHEN Price_INR = '' THEN 1 ELSE 0 END) AS blank_price,
    SUM(CASE WHEN Rating = '' THEN 1 ELSE 0 END) AS blank_rating
FROM Swiggy




--Duplicate Detection
--Find duplicate rows using grouping on all business-critical columns


SELECT  State, City, Order_Date, Restaurant_Name, Location,
Category, Dish_Name, Price_INR, Rating, Rating_Count, COUNT(*) as CNT
FROM Swiggy
GROUP BY State, City, Order_Date, Restaurant_Name, Location,
Category, Dish_Name, Price_INR, Rating, Rating_Count
Having COUNT(*)>1  

--Delete Duplicate
WITH CTE AS(
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY State, City, Order_Date, Restaurant_Name, Location,
                            Category, Dish_Name, Price_INR, Rating, Rating_Count
               ORDER BY (SELECT NULL)
           ) AS rn
FROM Swiggy
)
DELETE FROM CTE WHERE rn > 1


--KPIs
--Total Orders
SELECT COUNT(*) AS Total_Orders
FROM Swiggy;

--Total Revenue (INR Million)
SELECT 
    round(SUM(Price_INR) / 1000000.0, 2) AS Total_Revenue_INR_Million
FROM Swiggy;

--Average Dish Price
SELECT 
    round(AVG(Price_INR), 2)  AS Avg_Dish_Price
FROM Swiggy;

--Average Rating
SELECT 
    round(AVG(Rating),2) AS Avg_Rating
FROM Swiggy
WHERE Rating IS NOT NULL;



--Date Based Analysis
--Monthly order trends
SELECT
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    DATENAME(MONTH, Order_Date) AS Month_Name,
    COUNT(*) AS Total_Orders,
	round(SUM(Price_INR),2) AS Total_Revenue
FROM Swiggy
GROUP BY 
    YEAR(Order_Date),
    MONTH(Order_Date),
    DATENAME(MONTH, Order_Date)
ORDER BY 
    Order_Year,
    Order_Month;

--Quarterly order trends
SELECT
    YEAR(Order_Date) AS Order_Year,
    DATEPART(QUARTER, Order_Date) AS Order_Quarter,
    COUNT(*) AS Total_Orders,
    round(SUM(Price_INR),2) AS Total_Revenue
FROM Swiggy
GROUP BY
    YEAR(Order_Date),
    DATEPART(QUARTER, Order_Date)
ORDER BY
    Order_Year,
    Order_Quarter;

--Year-wise growth
WITH yearly_data AS (
    SELECT
        YEAR(Order_Date) AS Order_Year,
        COUNT(*) AS Total_Orders,
        SUM(Price_INR) AS Total_Revenue
    FROM Swiggy
    GROUP BY YEAR(Order_Date)
)
SELECT * FROM yearly_data;


--Day-of-week patterns
SELECT
    DATENAME(WEEKDAY, Order_Date) AS Day_Name,
    DATEPART(WEEKDAY, Order_Date) AS Day_Number,
    COUNT(*) AS Total_Orders,
    round(SUM(Price_INR), 2) AS Total_Revenue
FROM Swiggy
GROUP BY
    DATENAME(WEEKDAY, Order_Date),
    DATEPART(WEEKDAY, Order_Date)
ORDER BY
    Day_Number;


-- Location Based Analysis
--Top 10 cities by order volume
SELECT TOP 10
    City,
    COUNT(*) AS Total_Orders,
    round(SUM(Price_INR),2) AS Total_Revenue
FROM Swiggy
GROUP BY City
ORDER BY Total_Orders DESC;

--Revenue contribution by states
SELECT
    State,
    round(SUM(Price_INR),2) AS Total_Revenue,
    COUNT(*) AS Total_Orders,
    ROUND(
        SUM(Price_INR) * 100.0 / SUM(SUM(Price_INR)) OVER (),
        2
    ) AS Revenue_Percentage
FROM Swiggy
GROUP BY State
ORDER BY Total_Revenue DESC;


-- Food Performance
--Top 10 restaurants by orders
SELECT TOP 10
    Restaurant_Name,
    COUNT(*) AS Total_Orders,
    SUM(Price_INR) AS Total_Revenue,
    round(AVG(CAST(Rating AS FLOAT)),2) AS Avg_Rating
FROM Swiggy
GROUP BY Restaurant_Name
ORDER BY Total_Orders DESC;

--Top categories (Indian, Chinese, etc.) & Orders + Avg Rating
SELECT
    Category,
    COUNT(*) AS Total_Orders,
    round(SUM(Price_INR),2) AS Total_Revenue,
    round(AVG(CAST(Rating AS FLOAT)),2) AS Avg_Rating
FROM Swiggy
GROUP BY Category
ORDER BY Total_Orders DESC;

--Most ordered dishes
SELECT TOP 10
    Dish_Name,
    COUNT(*) AS Total_Orders,
    round(SUM(Price_INR),2) AS Total_Revenue,
    round(AVG(CAST(Rating AS FLOAT)), 2) AS Avg_Rating
FROM Swiggy
GROUP BY Dish_Name
ORDER BY Total_Orders DESC;


--Customer Spending Insights
SELECT
    CASE 
        WHEN Price_INR < 100 THEN 'Under 100'
        WHEN Price_INR BETWEEN 100 AND 199 THEN '100–199'
        WHEN Price_INR BETWEEN 200 AND 299 THEN '200–299'
        WHEN Price_INR BETWEEN 300 AND 499 THEN '300–499'
        ELSE '500+'
    END AS Spend_Bucket,
    
    COUNT(*) AS Total_Orders
FROM Swiggy
GROUP BY
    CASE 
        WHEN Price_INR < 100 THEN 'Under 100'
        WHEN Price_INR BETWEEN 100 AND 199 THEN '100–199'
        WHEN Price_INR BETWEEN 200 AND 299 THEN '200–299'
        WHEN Price_INR BETWEEN 300 AND 499 THEN '300–499'
        ELSE '500+'
    END
ORDER BY Total_Orders DESC;


--Ratings Analysis
SELECT
    Rating,
    COUNT(*) AS Rating_count
FROM Swiggy
GROUP BY Rating
ORDER BY Rating DESC;









