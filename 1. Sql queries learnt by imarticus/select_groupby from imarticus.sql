drop database if exists store_sales;
CREATE DATABASE store_sales; 
USE store_sales;

CREATE TABLE my_sales (month varchar(15), prod_name  VARCHAR(15), sales INT );

INSERT INTO my_sales VALUES('Jan', 'Fruits', 45000),
				('Jan', 'Vegetables', 67000),
				('Jan', 'Dairy', 55000),
				('Feb', 'Fruits', 42000),
				('Feb', 'Vegetables', 32000),
				('Feb', 'Dairy', 52000),
				('March', 'Fruits', 61000),
				('March', 'Vegetables', 43000),
				('March', 'Dairy', 92000);
           
select month, sum(sales) as "Total_Sales"
from my_sales 
group by month
having Total_Sales > 150000
order by Total_Sales desc;  
