use movie_metadata;


select count(*) from movie_metadata;

select movie_title from movie_metadata
where movie_title like 'An%';

select title_id from movie_metadata limit 10;
alter table movie_metadata modify title_id varchar(20) not null;
alter table movie_metadata add primary key (title_id);

alter table movie_metadata modify movie_title varchar(100);
alter table movie_metadata add index title_idx (movie_title);

alter table movie_metadata modify country varchar(100);
alter table movie_metadata add index country_idx (country);

select country, movie_title, duration 
from movie_metadata
where country = 'India';

select * from movie_metadata where country='india';
alter table movie_metadata add index country_idx (country);              # index is used to increase the search speed insted of scaning entire table it scans the index first and gives u fast result 
alter table movie_metadata drop index country_idx;




desc movie_metadata;

alter table salesorders add index id_idx(id);

select id, count(id) from salesorders
group by id
having count(id) > 1;

alter table customer add index name_idx (cust_name);