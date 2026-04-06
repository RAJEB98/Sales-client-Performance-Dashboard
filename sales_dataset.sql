create database sales_db;
use sales_db;

select *from sales_data;

ALTER TABLE SALES_DATASET
RENAME SALES_DATA;

##1.Total revenue?
SELECT SUM(REVENUE) AS TOTAL_REVENUE
FROM SALES_DATA;

##2.TOTAL PROFIT
SELECT SUM(PROFIT)
FROM SALES_DATA;

##3.Top 5 Clients by revenue?
select client_name,sum(revenue) as total_revenue
from sales_data
group by client_name
order by total_revenue desc
limit 3;

##4.Revenue by Region
select region,sum(revenue) as total_revenue
from sales_data
group by region;

##5.Revenue by Industry?
select industry,sum(revenue) as total_revenue
from sales_data
group by industry;

##6.Monthly Revenue Trend?
select month(order_date) as month,sum(revenue)
from sales_data
group by month(order_date);

##7.Sales Rep Performance
select sales_rep,sum(revenue)
from sales_data
group by (sales_rep) 
order by sum(revenue) desc;

##8.Average Order Value?
select avg(revenue) 
from sales_data;

##9.Highest Single Order?
select* 
from sales_data
order by revenue desc
limit 1;

##10.Lowest Profit Orders?
select *
from sales_data
order by profit asc
limit 3;

##11.Top Industry by Revenue
select industry,sum(revenue)
from sales_data
group by industry
order by sum(revenue) desc
limit 1;

##12. Running Total Revenue (Advanced)?
SELECT 
order_date,
SUM(revenue) OVER(ORDER BY order_date) AS running_total
FROM sales_data;

##13.Month-over-Month Growth?
SELECT 
MONTH(order_date) AS month,
SUM(revenue) AS revenue,
LAG(SUM(revenue)) OVER(ORDER BY MONTH(order_date)) AS prev_month
FROM sales_data
GROUP BY MONTH(order_date);

##14.Rank Sales Rep?
SELECT 
sales_rep,
SUM(revenue),
RANK() OVER(ORDER BY SUM(revenue) DESC) AS rn
FROM sales_data
GROUP BY sales_rep;