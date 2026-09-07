-- create dim table for star schema
CREATE TABLE analytics.dim_date(
      order_date_key int           not null, -- surrogate key: yyyyMMDD integer
      full_date      date          not null,
      year           int           not null,
      month_number   int           not null,
      month_name     varchar(20)   not null,
      quarter        int           not null,
      day_of_week    VARCHAR(20)   not null,
      is_weekend     BIT           not null
      );

--populate the above dim-date table for sales 
INSERT INTO analytics.dim_date
SELECT 
   cast(format(dt, 'yyyyMMdd') as int) as order_date_key, dt as full_date,
   YEAR(dt) as year, MONTH(dt) as month_number,
   datename (month , dt) as month_name ,
   datepart( quarter ,dt) as quarter ,
   datename (weekday  , dt) as day_of_week,
   CASE when DATEPART(weekday, dt) in (1,7) then 1 else 0 end as is_weekend
from(
   select
    dateadd(
            day,
            cast(value as int),
            cast('2023-01-01' as date )
            )as dt 
   from generate_series(0,730)     
   ) as dates;

   select* from analytics.dim_date;