use sakila;

select * from film_text;
select * from film_text where title like 'RUSH%';     
select * from film_text where title like '%LORD%';

  
    
select * from country;

select * from payment limit 5;

# finding no of payment done between 2005-05-25 to 2005-06-30 from payment table

select count(*) from payment 
where payment_date between '2005-05-25' and '2005-06-30';

# find the payment year and total_amount based on years 

select  extract(year from payment_date) as payment_year , 
		sum(amount) as "Total_amount"
from payment
group by payment_year;

select year(curdate());                 # it prints only the year
select now();                           # it prints date and time
select curdate() Today;                 # it prints date , Today is nothing but its an alias

select date_format(curdate(), '%a-%b-%Y');                # where a = 3char of week ,b= 3char of month   date_formate is nothing but it asks in which format we want to display the date
SELECT DATE_ADD("2021-06-04", INTERVAL -2 MONTH);
SELECT DATE_FORMAT(curdate(),'%D %y %a %d %m %M %b %j');     # where D= 13th day of this month, y= 2num from the year,a= 3char from the week,d=date,m=month in number,b=3char in month,j= number of date from starting 
## to remove the duplicates 
## steps
## 1. select the duplicates and copy them in a new table
## create table temp_duplicates as 
##  select * from main_table m
##  where m.id (select id, count(*) from main_table m2
##			group by id
##            having count(*) > 1);

use sakila;
describe payment;

select * from payment limit 5;
select payment_id, customer_id, date_format(payment_date, '%d-%b-%Y') date
from payment
limit 5;
