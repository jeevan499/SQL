use sakila;

select * from film_text where title like 'RUSH%';
select * from film_text where title like '%LORD%';

select * from customer 
where income > 60000 and
	(name like 's%' or name like 'A%');
select * from country;

select * from payment limit 5;

select count(*) from payment 
where payment_date between '2005-05-25' and '2005-06-30';
select  extract(year from payment_date) as payment_year , 
		sum(amount) as "Total_amount"
from payment
group by payment_year;

select year(curdate());
select now();
select curdate() Today;

select date_format(curdate(), '%a-%b-%Y');
SELECT DATE_ADD("2021-06-04", INTERVAL -2 MONTH);
SELECT DATE_FORMAT(curdate(),'%D %y %a %d %m %b %j');
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
select payment_id, customer_id, date_format(payment_date, '%d-%b-%Y')
from payment
limit 5;
