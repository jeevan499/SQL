/*Subquery
A subquery is a query nested within another query
typically enclosed in parentheses and used to retrieve data 
that will be used in the main query's.*/
-- Always the inner query execute first and result of query will be sent to the outer query

use insurance;
select * from insurance;
/* 1. Retrieve the individuals who have charges greater 
than the average charges in their respective regions.*/

select * from insurance i1 where charges>
(select avg(charges) from insurance i2 where i1.region = i2.region);

-- 2. Find the average age of smokers with a BMI greater 
-- than the average BMI.

select smoker,avg(age) average_age from insurance where BMI >(select avg(bmi) from insurance)
 group by smoker;
 
 /* 3. Find the number of individuals in each region who have more than one child.*/
 select * from insurance;
select region, count(*) as no_of_individuals from insurance
where children>1 group by region;
-- (or)
select region, count(*) as no_of_individuals from (select * from insurance where 
children>1) t group by region;










