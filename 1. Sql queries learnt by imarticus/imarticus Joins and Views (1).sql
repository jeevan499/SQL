drop database if exists  join_examples;
create database join_examples;

use join_examples;

## Creating Customer table
create table customer (
			cust_id int,
            cust_name varchar(20),
            contact_name varchar(20),
            city varchar(20),
            telephone varchar(10));
insert into customer values (101, 'John','Bill','New York','207998701'), 
							(102, 'Joe','Amy','New Jersey','207998702'),
                            (103, 'Gary','George','Chicago','207998703'),
							(104, 'Mark','Mark','Texas','207998705');
drop table if exists orders;                            
create table orders (
			cust_id int,
            order_id int,
            order_date date,
            shipper_id varchar(10));
insert into orders values (101, 1, '2020-10-10','A111'),
							(102,2,'2020-10-11','A112'),
 							(103,3,'2020-10-12','A113'), 
							(104,4,'2020-10-12','A114'),
							(104,5,'2020-10-14','A114');  
               
select * from customer;
select * from orders;

## Inner Join
select 
	c.cust_id,
    c.cust_name,
    c.contact_name,
    c.telephone,
    c.city,
    o.cust_id,
    o.order_id,
    o.order_date,
    o.shipper_id
from customer as c
inner join orders as o
on o.cust_id = c.cust_id;    
select * from orders;
## Right Join
insert into orders values (106, 6, '2020-10-18','A115'), (106, 7, '2020-10-19','A115');

select 
	c.cust_id,
    c.cust_name,
    c.contact_name,
    c.telephone,
    c.city,
    o.cust_id,
    o.order_id,
    o.order_date,
    o.shipper_id
from customer c
right join orders o 
on c.cust_id = o.cust_id;   

## Left Join
insert into customer values (105,'Amy','Joel','207998123','Boston');
select * from customer;

## Creating Customer table

drop table if exists customer;
create table customer (
			cust_id int,
            cust_name varchar(20),
            contact_name varchar(20),
            city varchar(20),
            telephone varchar(10));
insert into customer values (101, 'John','Bill','New York','207998701'), 
							(102, 'Joe','Amy','New Jersey','207998702'),
                            (103, 'Gary','George','Chicago','207998703'),
							(104, 'Mark','Mark','Texas','207998705');
        
drop table if exists orders  ; 
create table orders (
			cust_id int,
            order_id int,
            order_date date,
            shipper_id varchar(10));
insert into orders values (101, 1, '2020-10-10','A111'),
							(102,2,'2020-10-11','A112'),
 							(103,3,'2020-10-12','A113'), 
							(104,4,'2020-10-12','A114'),
							(104,5,'2020-10-14','A114');  
                            
## Inner Join
select 
	c.cust_id,
    c.cust_name,
    c.contact_name,
    c.telephone,
    c.city,
    o.order_date,
    o.shipper_id
from customer c
inner join orders o 
on o.cust_id = c.cust_id;    

## Right Join
insert into orders values (106, 6, '2020-10-18','A115'), (106, 7, '2020-10-19','A115');

select 
	c.cust_id,
    c.cust_name,
    c.contact_name,
    c.telephone,
    c.city,
    o.cust_id,
    o.order_id,
    o.order_date,
    o.shipper_id
from customer c
right join orders o 
on o.cust_id = c.cust_id;   

## Left Join
insert into customer values (105, 'Amy','Joel','207998123','Boston');

select 
	c.cust_id,
    c.cust_name,
    c.contact_name,
    c.telephone,
    c.city,
    o.order_id,
    o.order_date,
    o.shipper_id
from customer c
left join orders o 
on o.cust_id = c.cust_id;   

## Full Join
select 
	c.cust_id,
    c.cust_name,
    c.contact_name,
    c.telephone,
    c.city,
    o.cust_id, 
    o.order_id,
    o.order_date,
    o.shipper_id
from customer c
left join orders o 
on o.cust_id = c.cust_id   
union select c.cust_id, c.cust_name, c.contact_name,
    c.telephone, c.city, o.cust_id, o.order_id, o.order_date, o.shipper_id from customer c right join orders o on o.cust_id = c.cust_id;   

select * from customer c left join orders o  on c.cust_id= o.cust_id union select * from customer c right join orders o on c.cust_id = o.cust_id;

## Self Join
drop table if exists employee;
create table employee (
		emp_id int,
        emp_name varchar(20),
        emp_desig varchar(20),
        rep_manager	int);
        
insert into employee values (1, 'John','Manager',null),
							(2, 'Ajay','SoftEng',1),
                            (3, 'Amar','SoftEgn',1);
select * from employee;                           
select e1.emp_id, e1.emp_name, e1.emp_desig, mgr.emp_name Manager
from employee e1, employee mgr
where e1.rep_manager = mgr.emp_id;
select e1.emp_id, e1.emp_name, e1.emp_desig, e1.rep_manager from employee e1;

#or you can write the above equation like this 
select * from employee;
select e.emp_id,e.emp_name,e.emp_desig,m.emp_name as manager  from employee e inner join employee m on e.rep_manager =m.emp_id;

select * from manager;
# select emp_id manager_id, emp_name manager_name 

use customer_info;


## Horizontal View

select * from employee;

create or replace view manager as
	select * from employee
	where rep_manager is null;

select * from manager;

## Vertical View
create or replace view manager as
	select emp_id, emp_name from employee;

select * from manager;
    
## Row/Column Subset View    
create or replace view manager as
	select emp_id, emp_name from employee
	where rep_manager is null;

select emp_id, emp_name from manager;

## Join View
select * from employee;

create or replace view manager as
select e1.emp_id, e1.emp_name, e1.emp_desig, mgr.emp_name Manager
from employee e1
left join employee mgr on
 e1.rep_manager = mgr.emp_id;
 
 select * from manager;
 
## Groupby View
USE store_sales;

create or replace view monthly_sales_view as
select month, sum(sales) as "Total_Sales"
from my_sales 
group by month;

select * from monthly_sales_view;

use join_examples;

select cust_id, count(*) from orders
group by cust_id
having count(*) > 1;

select * from orders
where cust_id in (select cust_id                                   # we are using in because we have multiple records in the subquiree(output of inner quiree is the input of outer quiree)
from (select cust_id, count(*) from orders
	group by cust_id
    having count(*) > 1) t);

# same as above condition with easy method
select * from orders;  
select cust_id,order_id,order_date,shipper_id from orders where cust_id in (select cust_id from orders group by cust_id having count(cust_id)>1);

  
select cust_id, count(*) from orders
group by cust_id
having count(*) > 1;    
    
    select * from orders;