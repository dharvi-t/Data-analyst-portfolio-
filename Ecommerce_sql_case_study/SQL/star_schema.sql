-- database = ecommerce_sql_casestudy 
create  database ecommerce_sql_case_study;
use ecommerce_sql_case_study;
-- Creating Tables 
 -- create a row generating table as number (n)
 CREATE TABLE numbers (
    n INT PRIMARY KEY
);

  -- 1. customers table
CREATE TABLE dim_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);
-- 2.products table
CREATE TABLE dim_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
-- 3. payments table
CREATE TABLE dim_payments (
    payment_id INT PRIMARY KEY,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20)
);
-- 4. dates table
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    order_date DATE,
    month INT,
    year INT
);
-- Creating fact table (contains numeric values, metrics and foreign key to dimension table)
CREATE TABLE fact_orders (
    order_id INT,
    customer_id INT,
    product_id INT,
    payment_id INT,
    date_id INT,
    quantity INT,
    revenue DECIMAL(10,2),

    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
    FOREIGN KEY (payment_id) REFERENCES dim_payments(payment_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);
-- creating INDEXES to optimize customer-level revenue and retention analysis.
 -- Index 1: Customer-Based Analysis

CREATE INDEX idx_fact_customer
ON fact_orders(customer_id);

-- Index 2: Time-Based Analysis

CREATE INDEX idx_fact_date
ON fact_orders(date_id);

-- Index 3: Product Performance

CREATE INDEX idx_fact_product
ON fact_orders(product_id);
 
 -- Index 4: Payment Filtering
 
 CREATE INDEX idx_fact_payment
ON fact_orders(payment_id);
 
 show tables;
 show index from fact_orders;