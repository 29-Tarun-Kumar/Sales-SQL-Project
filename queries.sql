create database Tarun;
use Tarun;
show databases;
select database();
create table Sales
(
order_id int,
order_date date,
region varchar(50),
product varchar(50),
sales_amount int
);
show tables;
describe sales;
INSERT INTO sales (order_id, order_date, region, product, sales_amount)
SELECT 
row_num,
DATE_ADD('2025-01-01', INTERVAL row_num DAY),
ELT(1 + (row_num % 4), 'North', 'South', 'West', 'East'),
ELT(1 + (row_num % 3), 'Product A', 'Product B', 'Product C'),
1000 + (row_num * 10)
FROM (
    SELECT a.N + b.N * 10 + c.N * 100 + 1 AS row_num
    FROM 
    (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
    CROSS JOIN
    (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    CROSS JOIN
    (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) c
) numbers
WHERE row_num <= 500;
select count(*) from sales;
select * from sales limit 10;
select	sum(sales_amount) as total_sales from Sales;
select region, sum(sales_amount) as Total_Sales from sales group by region;
select product, sum(sales_amount) as total_sales from sales group by product;
select * from sales order by sales_amount desc limit 5;
select month(order_date) as month, sum(sales_amount) as total_sales from Sales group by month(order_date);
select count(*) from Sales where region="North" and product ="Product A";



