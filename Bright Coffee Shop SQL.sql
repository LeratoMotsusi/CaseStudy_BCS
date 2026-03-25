
-----------------------------------------------------------------
--BRIGHT COFFEE SHOP CODING
----------------------------------------------------------------

---1.Running the entire table
SELECT *
FROM brightcoffeeshop.default.bcshop;


---2.Checking the date range
SELECT 
    MIN(transaction_date) AS Minimum_Date,
    MAX(transaction_date) AS Maximum_Date 
FROM brightcoffeeshop.default.bcshop;


---3.Checking the different store locations
SELECT DISTINCT store_location
FROM brightcoffeeshop.default.bcshop;

---4.Checking products sold at our stores -9 different product types
SELECT DISTINCT product_category
FROM brightcoffeeshop.default.bcshop;

---5.Checking products types sold at our stores - 29 different product types
SELECT DISTINCT product_type
FROM brightcoffeeshop.default.bcshop;

---5.Checking product detail sold at our stores - 80 different product categories 
SELECT DISTINCT product_detail
FROM brightcoffeeshop.default.bcshop;

---6.Checking for NULLS in various columns
SELECT *
FROM brightcoffeeshop.default.bcshop
WHERE unit_price IS NULL
OR transaction_qty IS NULL
OR transaction_date IS NULL;


---7. Checking lowest and highest unit price
SELECT 
    MIN(unit_price) AS Lowest_unit_price,
    MAX(unit_price) AS Highest_unit_price
FROM brightcoffeeshop.default.bcshop;


---8. Extrascting the day and  month names
SELECT 
    transaction_date,
    Dayname(transaction_date) AS Day_name,
    Monthname(transaction_date) AS Month_name
FROM brightcoffeeshop.default.bcshop;


---9.Calculating the Revenue
SELECT unit_price,
       transaction_qty,
       unit_price*transaction_qty AS Revenue


FROM brightcoffeeshop.default.bcshop;


SELECT *
FROM brightcoffeeshop.default.bcshop;


---10. Combining functions to get a clean and enhanced data set
SELECT 
        transaction_id,
        transaction_date,
        transaction_time,
        transaction_qty,
        store_id,
        store_location,
        product_id,
        unit_price,
        product_category,
        product_type,
        product_detail,
---Adding columns to enhance the table for better insights
---New column added 1
        Dayname(transaction_date) AS Day_name,
---New column added 2
        Monthname(transaction_date) AS Month_name,
---New column added 3
        Dayofmonth(transaction_date) AS Date_of_month,
---New column added 4 - Determing weekday/weekend
    CASE
        WHEN Dayname(transaction_date) IN ('Sun','Sat') THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_classification,    
---New column added 5 - Time buckets
CASE
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '05:00:00' AND '08:59:59' THEN '01.Rush Hour'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '09:00:00' AND '11:59:59' THEN '02.Mid Morning'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '15:59:59' THEN '03.Afternoon'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '16:00:00' AND '18:00:00' THEN '04.Rush Hour'
        ELSE '05.Night'
    END AS Time_classification,
---New column added 6 - Spend buckets
CASE
        WHEN (transaction_qty*unit_price) <=50 THEN '01.Low Spender'
        WHEN (transaction_qty*unit_price) BETWEEN 51 AND 200 THEN '02.Medium Spender'
        WHEN (transaction_qty*unit_price) BETWEEN 201 AND 300 THEN '03. Moreki'
        ELSE '04.Blesser'
    END AS Spend_bucket,
---New column added 7 - Revenue
    transaction_qty*unit_price AS Revenue
    FROM brightcoffeeshop.default.bcshop;







SELECT 
    MIN(unit_price*transaction_qty) AS Lowest_unit_price,
    MAX(unit_price*transaction_qty) AS Highest_unit_price
FROM brightcoffeeshop.default.bcshop;
















