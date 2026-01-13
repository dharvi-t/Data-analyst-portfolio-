
-- =============================================
-- File: advance_analysis.sql
-- Purpose: Business Analysis & Insights
-- Database: ecommerce_sql_casestudy
-- =============================================

use ecommerce_sql_case_study;
-- =========================================================
-- BUSINESS QUESTIONS
-- Q1. Is our revenue dependent on a small % of customers?
--  (Revenue Concentration Analysis)
-- =========================================================
WITH  customer_revenue AS (
			SELECT c.customer_id, 
            sum(f.revenue) AS total_revenue 
            FROM fact_orders AS f
            JOIN dim_customers AS c 
			   ON f.customer_id = c.customer_id
            JOIN dim_payments AS p
			   ON f.payment_id = p.payment_id 
			WHERE payment_status = 'success'
            GROUP BY c.customer_id  ),
	revenue_distribution AS (
		SELECT customer_id ,total_revenue ,
			SUM(total_revenue) OVER() AS overall_revenue,
            SUM(total_revenue) OVER(ORDER BY total_revenue DESC ) AS cumulative_revenue
		FROM customer_revenue )
        
SELECT customer_id ,total_revenue ,
       ROUND((cumulative_revenue/overall_revenue)*100,2) AS cumulative_percentage 
FROM revenue_distribution
ORDER BY total_revenue DESC;

-- ======================================================================================
-- A1.INSIGHTS -> “Revenue is not concentrated among a small customer segment;
--  the top 10 customers contributing less than 3% of total revenue.
--  it is broadly distributed, reducing dependency risk.”
-- ======================================================================================
/* Q2. Who are the top customers in each city by revenue? or 
   “If customers are spread out, are there local champions in each city?”
  This helps with: 1. City-wise marketing 2.Regionalsales strategy 3.Localized promotions  */ 
-- ======================================================================================

WITH cust_rev_per_city AS (
       SELECT
            c.customer_id ,
            sum(f.revenue) as cust_revenue ,
            c.city  
		FROM DIM_CUSTOMERS AS c
        JOIN  fact_orders AS f 
           ON  c.customer_id = f.customer_id
	    JOIN  dim_payments AS p
           ON p.payment_id = f.payment_id  
        WHERE  p.payment_status = 'success' 
		GROUP BY  c.customer_id , c.city 
        order by cust_revenue desc ),
ranked_customers AS (
		SELECT customer_id , city, cust_revenue ,
           ROW_NUMBER() OVER (
               PARTITION BY city 
               ORDER BY  cust_revenue desc) As rn
        FROM cust_rev_per_city	)
SELECT customer_id , city, cust_revenue 
FROM ranked_customers 
WHERE rn = 1 
ORDER BY cust_revenue desc;
-- which city generates more revenue (overall) ..? (city wise total revenue )
select c.city ,sum(f.revenue) as total_revenue 
from  dim_customers as c 
 JOIN  fact_orders AS f 
           ON  c.customer_id = f.customer_id 
group by c.city
order by total_revenue;
/*======================================================================================
A2. 1. Analysis shows that each city has a distinct top revenue-generating customer, 
      with no single customer dominating across regions. This indicates that revenue
      leadership is localized, suggesting the need for city-specific retention and 
      marketing strategies rather than a centralized VIP approach. 
   2. overall bangalore generates more revenue amoung all city but pune customer 187 
	 is the highest revenue generator among all the other city wise top customer .
======================================================================================*/

-- Q3. “Are our best-selling products also our highest-revenue products?( Product Revenue vs Volume Trade-off.)
-- HELPS IN 1. Pricing strategy , 2. Promotions , 3. Inventory planning
-- ### GRAIN = ONE ROW = ONE PRODUCT 
with product_performance as (
  select p.product_id , p.category ,
   sum(f.quantity) as total_volume ,
    sum(f.revenue) as total_revenue
  from fact_orders as f
  join dim_products as p 
     on f.product_id = p.product_id
  join dim_payments as pay
     on f.payment_id = pay.payment_id 
  where pay.payment_status = 'success'
  group by p.product_id ,p.category),
product_contribution as 
       ( select product_id , category ,
				total_revenue , total_volume,
				round(total_volume *100.0/sum(total_volume) over(partition by category), 2 )
                      as volume_percentage ,
                 round(total_revenue*100.0/sum(total_revenue) over(partition by category), 2 )
                      as revenue_percentage  
		from product_performance
       )
	select product_id , category ,
			total_revenue , total_volume,
            volume_percentage,revenue_percentage 
	from product_contribution
    order by revenue_percentage desc ;
-- =========================================================================================
 -- A3. No our best selling product (118-home)*PREMIUM PRICED PRODUCT* is not our highest revenue product
 -- that is (56-electronic)* POPULAR BUT LOW PRICE*
-- High-volume products are not always high-revenue products.
-- Revenue is driven by premium products, while volume is driven by lower-priced items. 
-- ============================================================================================

-- Q4. How do repeat buyers compare to one-time buyers in terms of customer base and revenue contribution?
-- (Repeat purchase & retention analysis)
-- grain = ONE ROW = ONE CUSTOMER
WITH customers_order AS ( 
			SELECT  f.customer_id , count(distinct f.order_id ) as order_count,
					SUM(f.revenue) AS total_revenue 
            FROM fact_orders  as f
            JOIN  dim_payments  as p
				ON f.payment_id = p.payment_id
			WHERE p.payment_status = 'success'
            GROUP BY  f.customer_id),
       customer_segment as( 
							SELECT  total_revenue,
								 CASE WHEN order_count=1 THEN 'one time buyer'
                                      ELSE 'Repeted buyer'
                                      END  as customer_type
                             FROM  customers_order)
	 
SELECT	customer_type,
 count(*) as customer_count, sum(total_revenue) as total_revenue,	
 ROUND(count(*)*100.0/ SUM(COUNT(*))OVER(),2) AS customer_percentage ,
 ROUND(sum(total_revenue)*100.0/ sum(SUM((total_revenue)))OVER(),2) AS revenue_percentage 
 FROM  customer_segment
 GROUP BY customer_type;
 
-- ==================================================================================================
/* A4.
 1.  The analysis shows that nearly all revenue(99.62%) comes from repeat buyers,
   with negligible contribution (0.38%)from one time buyers
2. indicating strong retention but limited first-time conversion volume.*/
-- ==================================================================================================

-- Q5. How can customers be segmented based on their lifetime revenue contribution? 
-- Customer Lifetime Value (CLV) segmentation
with clr as (
                SELECT f.customer_id ,sum(f.revenue) as lifetime_revenue ,
						COUNT(f.order_id) AS order_Count
				FROM FACT_ORDERS AS f 
                JOIN dim_payments as p 
					ON f.payment_id = p.payment_id
				where p.payment_status = 'success'
                group by f.customer_id 
			),
   CLV_segments as(         
			select customer_id, order_count, lifetime_revenue,
                CASE
					WHEN lifetime_revenue >= 30000 THEN 'High Value'
					WHEN lifetime_revenue BETWEEN 10000 AND 29999 THEN 'Medium Value'
					ELSE 'Low Value'
                    end as  CLV_segment
				FROM CLR )
SELECT   CLV_segment,  
	COUNT(customer_id) AS customer_count,
    ROUND(COUNT(customer_id) * 100.0 / SUM(COUNT(customer_id)) OVER (), 2) 
        AS customer_percentage,
    ROUND(SUM(lifetime_revenue), 2) AS total_revenue,
    ROUND(SUM(lifetime_revenue) * 100.0 / SUM(SUM(lifetime_revenue)) OVER (), 2)
        AS revenue_percentage
FROM clv_segments
GROUP BY clv_segment
ORDER BY total_revenue DESC;
-- =================================================================================================
/*  A5. “Customer revenue is primarily driven by medium-value customers, while a small 
high-value segment contributes disproportionately, highlighting opportunities for both 
retention and customer up-gradation strategies.” */
-- =================================================================================================
