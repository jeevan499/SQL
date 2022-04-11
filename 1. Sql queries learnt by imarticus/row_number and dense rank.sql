drop database if exists company;
create database if not exists company;

use company;
create table emp_info(
emp_name varchar(20)  not null,
salary int not null);

show tables;
insert into emp_info values('jeevan raj',75000),('arya',25000),('babu',19000),('amrutha',25000),('mitasmita',19000),('raju',25000);

select salary,row_number() over(order by salary desc) from emp_info;
select salary,dense_rank() over(order by salary desc) from emp_info;
select * from (select salary,dense_rank() over (order by salary desc) top from emp_info) t where top =3 limit 1;



-- using row number  (finding the second higest salary)  (if we have any duplicate values we cannot use row number ) we must use dense ranking

select * from (select salary, row_number() over (order by salary desc) as 'salary_details' from emp_info ) t where salary_details =3;


select * from(select salary,dense_rank() over (order by salary desc) as 'top' from emp_info) t1 where  top =3 ;

select * from (select salary from emp_info group by salary order by salary desc limit 3) t order by salary limit 1;

# we use dense_rank to identify the top rank of the record
select * from (select salary,dense_rank() over (order by salary desc) top from emp_info ) t where salary =75000 limit 1;

