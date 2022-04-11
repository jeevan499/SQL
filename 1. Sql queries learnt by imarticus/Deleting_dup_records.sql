drop database if exists store_sales;

create database store_sales;

use store_sales;

drop table if exists Employee;
CREATE TABLE Employee
    ( 
    ID int not null primary key auto_increment, 
    FirstName Varchar(100), 
    LastName Varchar(100), 
    Country Varchar(100)
    );
    
    Insert into Employee (FirstName,LastName,Country )
		values('Raj','Gupta','India'),
                                ('Raj','Gupta','India'),
                                ('Mohan','Kumar','USA'),
                                ('James','Barry','UK'),
                                ('James','Barry','UK'),
                                ('James','Barry','UK');
select * from Employee;  


## Deleting the duplicates using group by and max()
start transaction;
select max(id) duplicate_ids from Employee
							group by FirstName, LastName, Country;
delete from Employee 
where id not in (select duplicate_ids from 
					 (select max(id) duplicate_ids from Employee
							group by FirstName, LastName, Country) t);    

select * from Employee; 
#rollback;
commit; 

#######
delete from Employee 
where id not in (select duplicate_ids from(select max(id) duplicate_ids from Employee
							group by FirstName, LastName, Country) t);  
#####
truncate table Employee;
select * from employee;
delete from employee;

Insert into Employee (FirstName,LastName,Country )
		values('Raj','Gupta','India'),
                                ('Raj','Gupta','India'),
                                ('Mohan','Kumar','USA'),
                                ('James','Barry','UK'),
                                ('James','Barry','UK'),
                                ('James','Barry','UK');
## Using Row_Number
delete from employee 
where id in (
select id from (SELECT 
	id, Firstname, lastname, country,
    ROW_NUMBER() OVER ( 
		PARTITION BY Firstname, lastname, country 
        ORDER BY Firstname, lastname, country
	) AS row_num 
FROM employee) t
where row_num > 1);  
        
select * from employee;                              
                                
## using CTE Table
delete from employee where id in (
WITH  dd
AS (SELECT ID, FirstName, 
           LastName, 
           Country, 
           ROW_NUMBER() OVER(PARTITION BY FirstName, 
                                          LastName, 
                                          Country
           ORDER BY ID) AS DuplicateCount
    FROM Employee)
select id from employeeCTE where duplicatecount > 1);
                        