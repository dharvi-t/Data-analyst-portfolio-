--creating a stored procedure for the topn customers 
drop PROCEDURE if EXISTS analytics.usp_GetTopCustomers;
go 

CREATE PROCEDURE analytics.usp_GetTopCustomers
        @topN INT = 10 
AS
BEGIN 
    select top (@topN)
        customer_name,
        SUM(Revenue) as total_revenue,
        COUNT(order_id) as  total_orders
    from staging.silver_sales
    GROUP BY customer_name
    ORDER BY total_revenue DESC;
END ; 
GO
--default top 10 
EXEC analytics.usp_GetTopCustomers ;

-- top 5 custom
EXEC analytics.usp_GetTopCustomers @topN= 5 ;