-- assingment problems 
/* Please answer the followings questions using the sample database Sakila which is part of MySQL installation.

Write an SQL script with queries that answer the following questions:
Which actors have the first name ‘Scarlett’
Which actors have the last name ‘Johansson’
How many distinct actors last names are there?
Which last names are not repeated?
Which last names appear more than once?
Which actor has appeared in the most films?
Is ‘Academy Dinosaur’ available for rent from Store 1?
Insert a record to represent Mary Smith renting ‘Academy Dinosaur’ from Mike Hillyer at Store 1 today .
When is ‘Academy Dinosaur’ due?
What is that average running time of all the films in the sakila DB?
What is the average running time of films by category?
Why does this query return the empty set?

select * from film natural join inventory;  */


-- 1) Which actors have the first name ‘Scarlett’
use sakila;
select * from actor where first_name = 'scarlett';
select * from actor where first_name like 'scarlett';
select * from actor where first_name regexp 'scarlett';
  
-- 2) Which actors have the last name ‘Johansson’
select * from actor where last_name = 'johansson';
select * from actor where last_name like 'johansson';
select * from actor where last_name regexp 'johansson';

-- 3) How many distinct actors last names are there?

select count(distinct(last_name)) from actor;

-- 4) Which last names are not repeated?

select last_name from actor group by last_name having count(last_name)=1;

-- 5) Which last names appear more than once?

select last_name from actor group by last_name having count(last_name)>1;

-- 6) Which actor has appeared in the most films?

select * from film_actor;

select concat(first_name,' ',last_name) as 'full name' from actor inner join film_actor using(actor_id) group by actor_id order by count(actor_id) desc limit 1;

-- 7) Is ‘Academy Dinosaur’ available for rent from Store 1?

select * from film;
select * from inventory;
select * from store;
select f.film_id,inventory_id,title,s.store_id from film as f inner join inventory as i using(film_id) inner join store as s using(store_id) where title = 'academy dinosaur' and store_id =1;

-- 8) Insert a record to represent Mary Smith renting ‘Academy Dinosaur’ from Mike Hillyer at Store 1 today .

insert into rental (rental_date,inventory_id,customer_id,staff_id) values(date(now()),1,1,1);

-- 9) When is ‘Academy Dinosaur’ due?

select * from rental;
select * from staff;
select * from film_actor;
select * from inventory;
select rental_date,f.title from  film f inner join inventory using(film_id) inner join staff using (store_id) inner join rental using(staff_id) where title= 'academy dinosaur';

-- checking out the rental duration
select * from film;
select rental_duration, title from film where title = 'academy dinosaur';

-- 10) What is that average running time of all the films in the sakila DB?

select avg(length) as 'average running time' from film ;

-- 11) What is the average running time of films by category?
select category_id,avg(length) from film inner join film_category using (film_id) group by category_id;

 -- 12) Why does this query return the empty set?

select * from film natural join inventory;