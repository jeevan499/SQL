use customer_info;
drop table if exists t1;
drop table if exists t2;

create table t1 (
	id int not null,
	v1 char(1) not null default 'A');

insert into t1 values (1,'A'),
						(2,'B'),
                        (3,'C');
#insert into t1 values (8, 'D');                        
insert into t1(id) values (5),(6),(7);    
select * from t1;        

create table t2 (
	id int not null,
    v2 char(1) not null default 'A');     
    
insert into t2 values (1,'A'),
						(2,'B'),
                        (3,'B'),
                        (4,'C');
insert into t2(id) values (9),(8),(10); 

select id,v1 from t1;
select id,v2 from t2;   

## UNION Operator               # If you are using the union the duplicate record are not shown twice 
select * from t1
union
select * from t2;

select v1 from t1
union
select v2 from t2;

select count(*) from t1; 
select count(*) from t2;

select count(*) from 
(select * from t1
union
select * from t2) t;

## UNION ALL Operator                      # if we use union all the duplicate keys are shown howmany times it is represented
select * from t1
union all
select * from t2;

select count(*) from 
(select * from t1
union all
select * from t2) as t;

select * from t1 
where exists (select t2.id from t2
where t2.id = t1.id and
		t2.v2 = t1.v1);
        
select t1.id, t1.v1 from t1
inner join t2 on 
t1.id = t2.id and
t1.v1 = t2.v2 ;

        
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
    o.order_id,
    o.order_date,
    o.shipper_id
from customer c
right join orders o 
on o.cust_id = c.cust_id;   