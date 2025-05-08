
# Information about Union and Union All
drop database if exists IPL;
create database IPL;
use IPL;
create table Matches_info(
Player1 varchar(20),
Player2 varchar(20));

insert into Matches_info values('RCB','CSK'),
							   ('MI','HYD'),
                               ('DC','GT'),
                               ('KKR','RCB'),
                               ('MI','RR'),
                               ('GT','RCB');
select * from Matches_info;
# Difference between Union and Union All
select Player1 from Matches_info 
union 
select Player2 from Matches_info;

select Player1 from Matches_info 
union all
select Player2 from Matches_info;

select Players,count(Players) as No_of_Matches_Played from (
select Player1 as Players from Matches_info
union all 
select Player2 as Players from Matches_info) as t
group by Players having count(Players) > 2
;


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
            order_id int,
            order_date date,
            cust_id int,
            shipper_id varchar(10));
            
insert into orders(cust_id,Order_id,order_date,shipper_id) 
					 values (101, 1, '2020-10-10','A111'),
							(102,2,'2020-10-11','A112'),
 							(103,3,'2020-10-12','A113'), 
							(104,4,'2020-10-12','A114'),
							(104,5,'2020-10-14','A114');  
               
select * from customer;
select * from orders;

select c.cust_name,c.city,o.* from 
customer as c  join orders as o using(cust_id);

alter table customer change customer_id cust_id int;

select c.cust_name,c.city,o.* from customer as c
 join orders as o on c.customer_id = o.cust_id;

select c.cust_name,count(cust_name) as No_of_orders from customer as c
 join orders as o on c.customer_id = o.cust_id group by cust_name;
 
# Left Join

select cust_name,count(cust_name) as No_of_orders from customer c 
left join orders o using(cust_id)
group by cust_name having No_of_orders > 1;

select cust_id,cust_name,count(cust_name) as No_of_orders from customer c
 left join orders o using(cust_id)
 group by cust_name,cust_id having no_of_orders>1;




select c.* from customer c left join orders o using(cust_id) 
where o.cust_id is null;

select * from customer where cust_id not in
(select cust_id from orders group by cust_id);

# Print the customers details who have done more than 1 orders
select * from customer where cust_id =(
select cust_id from (
select cust_id,count(*) from orders group by cust_id having count(*)>1) t);

select * from customer where cust_id in (
select cust_id from (
select cust_id,count(*) from orders group by cust_id having count(*)>1) as t);

insert into orders values (7,'2020-10-21',103,'A115');

select * from customer c left join orders o using(cust_id)
union 
select * from customer c right join orders o using(cust_id);


select * from orders;

select cust_id,count(cust_id) No_of_times from orders 
group by cust_id having No_of_times >1;






# Right Join

select * from customer c Right join orders o using(cust_id);




select * from customer;


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

# You can write the same code in easy way
select c.*,o.* from customer c join orders o using(cust_id) ;

## Right Join    (Now will see which customer had not placed an order)
insert into customer values(105, 'Mical','Danil','Bangalore','9141919300'); 
select * from customer;
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

select * from orders;
select * from customer;




# Simpler way to perform right join
select c.*,o.* from orders o right join customer c using (cust_id);

# Get me only those records who have not placed any orders
select * from customer where cust_id not in(select cust_id from orders);


## Left Join
select c.*,o.* from customer c left Join orders o using(cust_id);

select * from orders;
select * from customer;
## Full Join
insert into orders values (6,'2020-10-21',108,'A115');

# Full outer join
select c.*,o.* from customer c left join orders o using(cust_id) 
union
select c.*,o.* from customer c right join orders o using(cust_id);


select c.*,o.* from customer c left join orders o using(cust_id) union all select c.*,o.* from customer c right join orders o using (cust_id);

## Self Join
drop table if exists employee;
create table employee (
		emp_id int,
        emp_name varchar(20),
        emp_desig varchar(20),
        resp_manager	int);
        
insert into employee values (1, 'Karthik','Manager',null),
							(2, 'Jeevan','Data_science_coach',1),
                            (3, 'Amar','analyst',2),
                            (4,'Aman','senior analyst',2),
                            (5,'Praveen','analyst',2),
                            (6,'Ramu','Sales',4);
						
select * from employee;                  
# write an sql query so that you want to display the manager name         
select e1.emp_id, e1.emp_name, e1.emp_desig, mgr.emp_name Manager
from employee e1, employee mgr
where e1.resp_manager = mgr.emp_id;
select e1.emp_id, e1.emp_name, e1.emp_desig, e1.resp_manager from employee e1;

#or you can write the above equation like this 
select * from employee;
select e.emp_id,e.emp_name,e.emp_desig,m.emp_name as manager  from employee e inner join employee m on e.resp_manager =m.emp_id;

select e.emp_id,e.emp_name,m.emp_name as manager_names from employee e inner join employee m on m.emp_id=e.resp_manager;
# cross Join
create table student_details(
st_id int,
st_name varchar(20));

create table subject_details(
sub_id int,
sub_name varchar(20),
marks int);

insert into student_details values(1,'Pooja'),(2,'Roopa'),(3,'Jagruti'),(4,'Jeevan');
insert into subject_details (sub_id,sub_name) values(1,'MySQL'),(2,'Python'),(3,'Stats'),(4,'Machine_learning');
select * from student_details;
select * from subject_details;

select st.*,su.* from student_details st 
cross join subject_details su order by st_id asc;


