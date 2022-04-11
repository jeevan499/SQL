use customer_info;

## Scope of Views

## With check Option
drop table if exists t2;
create table t2 (
	name	varchar(20),
    country	varchar(20));
    
create or replace view usa_names as
		select name, country from t2
        where country = 'USA';

insert into usa_names values ('Bill','USA');
insert into usa_names values ('John','Canada');

select * from t2;
select * from usa_names; 

alter view usa_names as
	select name, country from t2
    where country = 'USA'
    with check option;

insert into usa_names values ('Amy','USA');    

## With CASCADED/LOCAL option

drop table if exists t1;
create table t1 (
	c int);

## Creating a view without any option
create or replace view v1 as
	select c from t1
    where c > 10;
    
insert into v1 values (5);   

select * from v1;

## Creating dependent view.  i.e., view from a view
create or replace view v2 as
	select c from v1
    with cascaded check option;
 
insert into v2 values (8); 
insert into v2 values (15);

## Creating another dependent view v2 based on v2
create or replace view v3 as
	select c from v2
    where c < 20;
    
insert into v3 values (8); 

insert into v3 values (30);  

alter view v2 as
	select c from v1
    with local check option;

insert into v2 values (5);    
insert into v3 values (8);