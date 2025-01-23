create database adidassales_powerbi;
use adidassales_powerbi;
select * from adidas_sales;

--kpi requirnment

--find total adidas sales

select sum([total sales]) as total_sales from adidas_sales;

-- find the total operating profit
select sum(round([operating profit],0)) as total_operatingprofit from adidas_sales;

--find the total unit sold
select sum([units sold]) as total_units from adidas_sales;

--find the average price unit

select avg([price per unit]) as avg_price from adidas_sales;

--find the average marign operating

WITH total_margin_cte AS (
    SELECT SUM([operating margin]) AS total_margin FROM adidas_sales
)
SELECT 
    AVG(([operating margin] / total_margin) * 100) AS average_percentage
FROM adidas_sales, total_margin_cte;

-- find the total sales by month

select year([invoice date]) as year_sales,month([invoice date]) as month_sales, sum([total sales]) as total_sales from adidas_sales
group by
year([invoice date]),month([invoice date])
order by year([invoice date]),month([invoice date]) asc;


--find the region and year& monthly wise sales

select year([invoice date]) as year_sales,month([invoice date]) as month_sales, sum([total sales]) as total_sales from adidas_sales
where region='south' --region wise sales
group by
year([invoice date]),month([invoice date])
order by year([invoice date]),month([invoice date]) asc;

--find the total sales by region 

select sum([total sales]) as total_sales from adidas_sales  where region='northeast' -- region wise sales;

-- calculate total sales by product

select sum([total sales]) as total_sales from adidas_sales where Product= "Women's  Apparel"; --product wise 

-- calculate total sales by retailer
select * from adidas_sales

select sum([total sales]) as total_sales from adidas_sales where Retailer='Foot Locker';

