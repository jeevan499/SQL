drop database if exists office;
create database office;
create table employee_details(
employee_id int not null primary key,
employee_name varchar(20) not null,
employee_gender varchar(1) default ('m'),
salary varchar(10),
constraint chk_employee_gender check (employee_gender in ('m','f')));

create table personal_details(
employee_name varchar(20) not null,
employee_id int not null,
phone_number varchar(10) not null,
aadhar_number varchar(10) not null primary key,
foreign key (employee_id) references employee_details (employee_id));

insert into employee_details 
values(1,'jeevan raj','m',95000),(2,'amrutha','f',75000);
insert into employee_details values(3,'kiran','g',50000);

insert into employee_details(employee_id,employee_name,salary) values(4,'lavanya',30000);
insert into employee_details values(6,'manish','m',50000);
select * from employee_details;

alter table employee_details add constraint chk_employee_gender check (employee_gender  in ('m','f'));
select * from employee_details where not employee_gender regexp ('m|f');

delete employee_gender from employee_details where employee_id in (select employee_id from employee_details where not employee_gender regexp ('m|f'));

update employee_details set employee_gender ='m' where employee_id in (select employee_id from employee_details where not employee_gender regexp ('m|f'));


alter table employee_details drop constraint chk_employee_gender ;
describe employee_details;
update employee_details set employee_gender ='m' where employee_id =5;