create database abb;
use abb;
create table emp(
emp_id int primary key auto_increment,
emp_name varchar(20) not null,
emp_age varchar(3));

create table department(
dept_id int primary key,
dept_name varchar(30),
emp_id int,
foreign key (emp_id) references emp (emp_id) on delete cascade );

create table customer(
cust_id int primary key,
cust_name varchar(20),
emp_id int,
foreign key (emp_id) references emp(emp_id) on delete set null);

insert into emp values(01,'jeevan',23),
					  (02,'kavya',24),
                      (03,'navya',27);
insert into department values(05,'sales',3),
							(07,'sales',2);
insert into customer values(02,'roopa',01),
							(03,'karna',03);
                            
delete from emp where emp_id =01;
select * from emp;
select * from department;

select * from customer;
delete from emp where emp_id= 2;
update customer set emp_id =3 where cust_id =2;

drop view if exists data;
create view data as select c.cust_id,c.cust_name,d.dept_id from customer c,department d where  c.emp_id=d.emp_id;
select * from data;

