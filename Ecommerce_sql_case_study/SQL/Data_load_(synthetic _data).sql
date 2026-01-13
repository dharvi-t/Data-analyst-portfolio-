show databases ;
use ecommerce_sql_case_study;
-- load the tables with generating the synthetic data 
-- 1.load number table 
INSERT INTO numbers (n)
SELECT a.n + b.n * 10 + c.n * 100 + 1
FROM
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
WHERE a.n + b.n * 10 + c.n * 100 < 1000;

select count(*)
from numbers;

-- 2. load customer table 
INSERT INTO dim_customers (customer_id, customer_name, city, signup_date)
SELECT
    n,
    CONCAT('Customer_', n),
    ELT(1 + (n % 5), 'Delhi', 'Mumbai', 'Bangalore', 'Hyderabad', 'Pune'),
    DATE_ADD('2024-01-01', INTERVAL (n % 365) DAY)
FROM numbers
WHERE n <= 1000;

SELECT COUNT(*) FROM dim_customers;
-- 3. load product table 

INSERT INTO dim_products (product_id, product_name, category, price)
SELECT
    n AS product_id,
    CONCAT('Product_', n) AS product_name,
    category,
    ROUND(
        CASE
            WHEN category = 'Electronics' THEN 500 + (n % 50) * 50
            WHEN category = 'Fashion'     THEN 300 + (n % 40) * 30
            WHEN category = 'Home'        THEN 200 + (n % 30) * 40
            WHEN category = 'Books'       THEN 100 + (n % 20) * 20
        END
    , 2) AS price
FROM (
    SELECT
        n,
        ELT(1 + (n % 4), 'Electronics', 'Fashion', 'Home', 'Books') AS category
    FROM numbers
    WHERE n <= 150
) t;

-- verify 
SELECT category, MIN(price), MAX(price)
FROM dim_products
GROUP BY category;

-- load date table 
INSERT INTO dim_date (date_id, order_date, month, year)
SELECT
    n,
    DATE_ADD('2024-01-01', INTERVAL n - 1 DAY),
    MONTH(DATE_ADD('2024-01-01', INTERVAL n - 1 DAY)),
    YEAR(DATE_ADD('2024-01-01', INTERVAL n - 1 DAY))
FROM numbers
WHERE n <= 365;
-- verify date table
SELECT COUNT(*) FROM dim_date;
-- load payment table 
INSERT INTO dim_payments VALUES
(1, 'UPI', 'SUCCESS'),
(2, 'Credit Card', 'SUCCESS'),
(3, 'Debit Card', 'SUCCESS'),
(4, 'Net Banking', 'SUCCESS'),
(5, 'UPI', 'FAILED');
-- verify
SELECT * FROM dim_payments;
-- load fact table (7000 rows)
INSERT INTO fact_orders
(order_id, customer_id, product_id, payment_id, date_id, quantity, revenue)
SELECT
    FLOOR(1 + RAND() * 3000),              -- order_id
    FLOOR(1 + RAND() * 1000),              -- customer_id
    p.product_id,                          -- valid product
    FLOOR(1 + RAND() * 5),                 -- payment_id
    FLOOR(1 + RAND() * 365),               -- date_id
    FLOOR(1 + RAND() * 4),                 -- quantity
    ROUND(FLOOR(1 + RAND() * 4) * p.price, 2)
FROM numbers n1
JOIN numbers n2
JOIN dim_products p
LIMIT 7000;
--  verify or sanity check 
SELECT COUNT(*) FROM fact_orders;    -- 7000
SELECT COUNT(*) FROM numbers;        -- 1000
SELECT COUNT(*) FROM dim_customers; -- 1000
SELECT COUNT(*) FROM dim_products;  -- 150
SELECT COUNT(*) FROM dim_date;      -- 365
