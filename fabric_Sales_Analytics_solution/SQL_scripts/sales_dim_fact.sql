-- saving all the other dim_cutomer,product,region and the fact_sales in analytics schema 
CREATE TABLE analytics.dim_customer AS
    SELECT *
    FROM Lh_sales.dbo.dim_customer;

CREATE TABLE analytics.dim_product AS
    SELECT *
    FROM Lh_sales.dbo.dim_product;

CREATE TABLE analytics.dim_region AS
    SELECT *
    FROM Lh_sales.dbo.dim_region;

CREATE TABLE analytics.fact_sales AS
    SELECT *
    FROM Lh_sales.dbo.fact_sales;