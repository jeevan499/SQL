drop database if exists interview;
create database interview;
# he will ask you to create a table with 5 inputs
create table employee(
emp_id int primary key auto_increment,
emp_name varchar(20) not null,
contact_number varchar(10) not null,
age varchar(5),
doj datetime );

# he will tell you to add some extra column 
alter table employee add column gender char(1) default 'm';

insert into employee values(01,'jeevan raj','9141919300',23,'2021-12-12','m'),
							(02,'navya',549894555,26,'2021-03-28','f'),
                            (03,'amrutha',56454546,21,'2021-03-21','f'),
                            (04,'mitasmita',444646551,25,'2020-04-25','f'),
                            (05,'kiran',9844555153,28,'2020-12,05','m');

select * from employee;


# we want to create a salary column itseems
alter table employee add column salary varchar(10);

update employee set salary =45000 ;
# we must increment 5% of salary 
update employee set salary =salary+salary*0.05 where gender ='m';



