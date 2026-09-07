--analytic_view for refrence 
CREATE  VIEW analytics.vw_sales_by_region AS 
SELECT 
   region,
   format(order_date,'yyyy-MM') as year_month,
   SUM(Revenue) as total_revenue,
   round(avg(Revenue),2) as avg_order_value ,
   COUNT(order_id) as total_orders
FROM staging.silver_sales
group by region,
format(order_date, 'yyyy-MM');

select*
FROM analytics.vw_sales_by_region 
ORDER BY year_month , region;