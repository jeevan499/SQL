/* What is Windows Function
A WINDOW function in SQL is like a virtual "window" that slides through your query result set. 
It enables you to perform calculations on a specific subset of rows related to each row in the result, 
offering a dynamic way to analyze and manipulate data, often used for tasks like running totals or ranking. */

# Various taske that can be peformed using Windows Function 
-- 1. row_number()
-- 2. rank()
-- 3. dense_rank()
-- 4. lag()
-- 5. lead()
-- 6. first_value()
-- 7. last_value()
-- 8. nth_value()
-- 9. ntile()
-- 10. percent_rank()
-- 11. cume_dist()

drop database if exists windows_function;
create database if not exists windows_function;
use windows_function;
drop table if exists employee;
create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);
COMMIT;

show tables;
select * from employee;

-- ------------------------------------------------------------------------------------------------------------------------------------------

-- Fetch the first 2 employees from each department to join the company.
select * from (select *,row_number() over(partition by dept_name order by emp_id asc) as rn from employee) t where t.rn <3;

-- Fetch the top 3 employees in each department earning the max salary.
select * from (select *,dense_rank() over(partition by dept_name order by salary desc) as dr from employee) t where t.dr <4;

-- Checking the different between rank, dense_rnk and row_number window functions:
select * from (select *,row_number() over(partition by dept_name order by salary desc) rn,
rank() over (partition by dept_name order by salary desc) ran,
dense_rank() over(partition by dept_name order by salary desc) dr from employee) t;


-- fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee.
select * from employee;
select *,case when salary<Previous_salary then 'lower' when salary =Previous_salary then 'equal to' when salary>Previous_salary then 'Higher'  else null end 'Salary Range' from 
(select *,lag(salary) over (partition by dept_name) Previous_salary from employee) previous;

-- fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee and its next employee.

select *,lag(salary) over(partition by dept_name order by salary desc) Previous_salary,
lead(salary) over(partition by dept_name order by salary desc) Next_salary from employee;

-- Write query to display the most expensive product under each category (corresponding to each record)
select * from product;
select *,first_value(product_name) over(partition by product_category order by price desc) Most_expensive_Product_over_category from product;

-- Write query to display the least expensive product under each category (corresponding to each record)
select *,last_value(product_name) over(partition by product_category order by price desc 
range between unbounded preceding and unbounded following) least_expensive_product from product  order by product_category ;

-- Write query to display the Most Expensive Product and least expensive product under each category (corresponding to each record)
select *,first_value(product_name) over(partition by product_category order by price desc) as 'Most_Expenseive_Product',
last_value(product_name) over(partition by product_category order by price desc range between unbounded preceding and unbounded following) as 'Least Expensive_Product'
from product order by product_category asc;


-- Alternate way to write SQL query using Window functions    (to consise the code)
select *,first_value(product_name) over w as 'Most Expensive Product',
last_value(product_name) over w as 'Least Expensive Product' from product
window w as(partition by product_category order by price range between unbounded preceding and unbounded following);

-- Write query to display the Second most expensive product under each category.
select *,first_value(product_name) over w as 'Most Expensive Product',
last_value(product_name) over w as 'Least Expensive Product',
nth_value(product_name,2) over w as 'Second Most Expensive Product'
 from product window w as(partition by product_category order by price range between unbounded preceding and unbounded following);

-- Write a query to segregate all the expensive phones, mid range phones and the cheaper phones.
select *,case when segregate=1 then 'Expensive Phones' when segregate =2 then 'Mid Range Phone' when segregate=3 then 'Low Price Phone' end Range_of_Phone from (select *,ntile(3) over(order by price desc) as segregate
from product where product_category='Phone')t ;


-- Query to fetch all products which are constituting the first 30% 
-- of the data in products table based on price.
select *,round(Cumulative_Distribution*100,2) as cum from (select *,cume_dist() over(order by price) Cumulative_Distribution
 from product) t where Cumulative_Distribution*100 <=30;


-- Query to identify how much percentage more expensive is "Galaxy Z Fold 3" when compared to all products.
select * from (select *,cume_dist() over(order by price) dist,round(cume_dist() over(order by price) *100,2) cum_dist_per from product) t where t.product_name='Galaxy Z Fold 3';
select * from (select *,percent_rank() over(order by price) Percentage from product)t where t.product_name="Galaxy Z Fold 3";



