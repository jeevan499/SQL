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
			

          
# finding the sum of sales by month which is greater than 150000 and display in the higest values
select month,sum(sales) as total_sales from my_sales group by month having total_sales>150000 order by total_sales desc;   # it is jeevan code



# it is leacture code
select month, sum(sales) as "Total_Sales"
from my_sales 
group by month
having Total_Sales > 150000
order by Total_Sales desc;  
     