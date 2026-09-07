
-- creating schemas for all stages
CREATE schema staging;
CREATE schema analytics;
CREATE schema reporting;

-- checking if it works 
SELECT top 5* 
from staging.silver_sales;

--total_revenue ,total_orders  and avg_order by region
select region , SUM(Revenue) as total_revenue,
round(avg(Revenue),2) as avg_order_value ,
COUNT(order_id) as total_orders
FROM staging.silver_sales
group by region
ORDER BY total_revenue;