--Вывод суммы по полю Sales и полю Profit по месяцам за каждый год
select  
    extract (YEAR from order_date) as Year,
    extract(MONTH from order_date) as Month,
    sum(sales) as total_sales,
    sum(profit) as total_profit
from 
    orders o
group by 
    extract(YEAR from order_date),
    extract(MONTH from order_date)
order by 
    Year, Month;


 --Вывод суммы продаж по каждому региону 
select 
    region,
    sum(sales) as total_sales
from 
    orders o
group by 
    region;
   

--Вывод суммы продаж помесячно по сегментам покупателя 
select 
    extract(YEAR from  order_date) as Year,
    extract(MONTH from  order_date) as Month,
    segment,
    sum(sales) as total_sales
from  
    orders o
group by 
    extract(YEAR from order_date),
    extract(MONTH from order_date),
    segment
order by 
    Year, Month, segment;
    
   
--Вывод суммы продаж помесячно по категориям продукта
select 
    extract(YEAR from order_date) as Year,
    extract(MONTH from order_date) as Month,
    category,
    sum(sales) as total_sales
from 
    orders o
group by  
    extract(YEAR from order_date),
    extract(MONTH from order_date),
    category
order by 
    Year, Month, category;
    
   
--Доля продаж по сегментам покупателя
select
    segment,
    sum(sales) as total_sales,
    round((sum(sales) * 100.0) / (select sum(Sales) from orders o), 2) as sales_percent
from 
    orders o
group by 
    segment;
    
   
--Доля продаж по категории продукта 
select
    category,
    sum(sales) as total_sales,
    round((sum(sales) * 100.0) / (select sum(Sales) from orders o), 2) as sales_percent
from 
    orders o
group by 
    category; 