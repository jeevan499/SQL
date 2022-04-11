use sakila;
#1
describe actor;

select * from actor where first_name = 'Scarlett';

#2

select * from actor where last_name = 'Johansson';

#3

select count( distinct last_name) from actor;

#4

select last_name from actor
group by last_name
having count(last_name) <= 1;

#5

select last_name from actor
group by last_name
having count(last_name) > 1;

#6
select a.first_name, a.last_name
from actor a
where actor_id = (select actor_id from (
		select actor_id, count(*) from film_actor
		group by actor_id
		order by count(*) desc
		limit 1) t);

#7
select * from inventory i
where film_id in (select film_id from film 
			where title = 'Academy Dinosaur')
and	store_id = 1 and
not exists (select 1 from rental r
where r.inventory_id = i.inventory_id and
	r.return_date > now()); 
    
#8
desc rental;    

insert into rental (
	rental_date,
    inventory_id,
    customer_id,
    return_date,
    staff_id)
select now(), 
	min(i.inventory_id),
    c.customer_id,
    date_add(now(), interval f.rental_duration day),
    s.staff_id
from film f, inventory i, customer c, staff s
where 	f.title = 'Academy Dinosaur' and
		i.store_id = 1 and
		i.film_id = f.film_id and
		c.store_id = 1 and
		c.first_name = 'Mary' and c.last_name = 'Smith' and
		s.first_name = 'Mike' and s.last_name = 'Hillyer';

#9    
select return_date from rental 
where rental_id = (select max(rental_id) from rental);

# 10
select avg(length) from film;

#11
select fc.category_id, avg(f.length)
from film f
inner join film_category fc on
	fc.film_id = f.film_id
group by fc.category_id;  

  select * from film natural join inventory;