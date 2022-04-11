## Creating Database
drop database if exists customer_info ;
create database customer_info;

## To Check the available databases in the server
show databases;

## Using the database to create table objects
USE customer_info;

## Creating Table
CREATE TABLE information (
	Cust_Id int Not Null ,
	Cust_name varchar(20) Not Null,
	Country varchar(20) Not Null,
	City varchar(20));

## Dropping a table.                
drop table information;   

## Drop table with if exists condition
drop table if exists information;             
                

										
## Adding data into tables                                        
insert into information values (1, 'Shan', "India","Bangalore");
insert into information values (2, "John","USA",null);
insert into information (Cust_id, Cust_name, Country) values (3, "Bill", "Canada");
insert into information values (4, 'James', "India","Bangalore");

## Retrieving the data from a table (it is the proceses of identifing and extracting the data from the database)
use customer_info;
select * from information ;

drop table if exists personal_info;
CREATE TABLE personal_info (
  Cust_id int Not Null,
  Name varchar(20) Not Null,
  Country varchar(20) Not Null,
  City varchar(20),
PRIMARY KEY (Cust_id)); 

## Alternate way to define Primary Key
CREATE TABLE personal_info (
Cust_id int Not Null primary key,
  Name varchar(20) Not Null,
  Country varchar(20) Not Null,
  City varchar(20)); 

insert into personal_info
select distinct * from information;              # distinct is used to write the unique values
  
insert into personal_info values (1, 'Shan', "India","Bangalore");
insert into personal_info values (2, "John","USA",null);
insert into personal_info (Cust_id, Name, Country) values (3, "Bill", "Canada");
insert into personal_info values (4, 'James', "India","Bangalore");

select * from personal_info;

## Foreign Key Example  (foregin key is nothing but it(foregin key column) should be a primary key in another table)
CREATE TABLE order_info (Order_id int PRIMARY KEY,
			Order_num int NOT NULL,
			Cust_id int,
			FOREIGN KEY (Cust_id) REFERENCES personal_info(Cust_id) );

select * from personal_info;
insert into order_info values (1, 1, 1);
insert into order_info values (2, 1, 3);
insert into order_info values (3,3,5);         #it shows an error because the cust_id is the foreign key in order_info table with references of personal_info table, so always we want to check it out the the data we are providing in foreign key column should be avaliable in the personal_info table(referencing column)
select * from order_info;
select * from personal_info;

drop table order_info;
create database dummy;
show databases;
drop database dummy;

## Will be used to drop the entire table with contents from the database.
## It will delete the structure.
drop table order_info;

## Truncate will be used to delete all the rows(records) in table.  
## The structure will not be deleted.
truncate table order_info;

## To change the column name.
alter table order_info change Order_id orderid int;        #if we want to change the column name then we use alter and change command
alter table order_info modify orderid smallint;            #if we want to change the data type then we use alter and modify command
describe order_info;                                       # we use describe check the data type,null values,key of the column(attributes)
describe personal_info;

alter table personal_info drop PRIMARY KEY;

alter table order_info add column quantity int not null;
alter table personal_info add column gender char(1) after Name;      # if you use add column it will add at the last so to over right it use after column name
select * from order_info;
select * from personal_info;

truncate table order_info;

describe order_info;

describe personal_info;

alter table personal_info drop PRIMARY KEY;

alter table order_info drop foreign key order_info_ibfk_1;          # droping the foreign key where we can have multiple foreign key so we are mentioning the name of the foreign key ibfk_1

alter table personal_info add primary key (cust_id);
alter table order_info add constraint fk_cust_id                      # if you are adding the foreign key you must add it as constraint
	foreign key (cust_id) references personal_info(cust_id);
    
alter table order_info modify cust_id int not null; 
select * from order_info;   

create table information_1 (
cust_id int not null,	
cust_name varchar(20) not null);

describe information_1;
alter table information_1 add column gender char(1) default 'M';
insert into information_1(cust_id, cust_name) values (1, 'Shan');
insert into information_1 values (2, 'Neha', 'F');

select * from information_1;

alter table information_1 drop column gender;


rename table information to details;             # the table name information is already exist so we cannot change 
rename table details to information;
# rename table information to information_1;

describe information_1;
alter table information_1 add primary key(cust_id);
alter table information_1 drop primary key;

alter table information_1 drop column gender;

describe order_info;
select * from order_info;

update order_info set
	quantity = 5;

# insert into order_info values (1, 2, 1, 5);
    
update order_info set
	quantity = quantity * 2
where orderid = 2;

update order_info set
	quantity = quantity + 2
where order_id = 2;

select * from personal_info;

update personal_info set
	gender = 'M';

update personal_info set
		name = 'Johnny'
where name = 'John';	

update personal_info set
		name = 'Shanmugam'
where cust_id = 1;	

update personal_info set
		Country = 'USA',
        city = 'Boston',
        name = 'William'
where cust_id = 2;	

update personal_info set
	cust_id = 5
where cust_id = 2;   

update personal_info set cust_id = 2 where cust_id = 5;
select * from order_info;

select * from personal_info;
select * from order_info; 
select * from order_info_backup;
describe order_info_backup;
delete from order_info where cust_id = 1;
update personal_info set
	cust_id = 2
where cust_id = 1;    

create table order_info_backup as
	select * from order_info;

create table order_info as
select * from order_info where 1 = 2;
delete from order_info;
insert into order_info select * from order_info_backup;
 
select * from order_info_backup; 
alter table order_info_backup add primary key (Orderid);
describe order_info_backup;
commit;                                      # we use commit statement to end your current table(transaaction) and making permanent all changes performed in the transaction(table) 

drop table if exists pfbackup;
create table pfbackup like personal_info;                      # It just create the table like personal_info  and record which are present in the personal_info will not be copyed
create table pfbackup as select * from personal_info;          # it create the table like personal_info and all the record and datatypes will be copied 
select * from pfbackup;
describe personal_info;

select cust_id, name, country from personal_info;

select cust_id, name, city, country from personal_info
where country = 'USA' or city = 'Bangalore';

select * from personal_info where city like '%ar%';
select * from personal_info where city in ("Boston","Bangalore");
insert into personal_info values (6,"Ajay","M","India","Bombay");

select * from personal_info;
use customer_info;

commit;
rename table information_1 to information1;
select * from information1;

create table t1 (
id tinyint,
col1 varchar(10),
col2 varchar(10));

desc t1;

insert into t1 values (1, '456','XYZ'), (2,"123","abc");

select * from t1;

update t1 set
	col1 = col2,
    col2 = col1;

