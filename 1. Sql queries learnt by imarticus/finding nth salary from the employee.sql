drop database if exists emp;
create database emp;
use emp;
create table employee (
		emp_id int,
        emp_name varchar(20),
        salary	int);
insert into employee values(1,'jeevan',95000),(2,'amrutha',20000),(3,'veena',12000),(4,'manju',10000),(5,'malli',18000),(6,'bharath',22000);

#second higest salary from employee   (top keyword doesnot supports in my sql) 

#type 1 (using max )
select max(salary) as second_higest_salary from employee where salary <(select max(salary) from employee) ;     

#type 2 (using limit)
select salary from (select salary from employee order by salary desc limit 2)  as second_higest_salary  order by salary limit 1;


# select nth higest salary    (where n=5)
select emp_name,salary from (select emp_name,salary from employee order by salary desc limit 5 ) as emp order by salary limit 1;











