/* What are the different type of SQL Statements  or Commands in SQL
 There are 5 types of Statements or Commands in mysql
1) DDL (Data Defination Language)
2) DML (Data Manipulation Language)
3) DQL (Data Query Language)
4) DCL (Data Control Language)
5) TCL (Transaction Control Language)
*/

# Single line comment
-- single line comments 
/* 
Multiple line comments 
*/


/*     DDL(Data Defination Language)
i) DDL is a SQL Commands to define the database schema
ii) It is used to Create or Modify the Structure of the Database object in the DB.

Note:-
1) In DDL command you will always have the word Table
2) We don't use Where clause in DDL
3) You cannot use rollback statement to restore the data because it is autocommit 

There are totaly 5 commands in DDL
1) Create
2) Drop
3) Alter 
4) Truncate
5) Rename

Before inserting the records in the table you want to create new database and you want to use it then you want to create a table then insert the values 

*/

-- Let me check what are the database that are available in the schemas 
show databases;       # To display all the database that are available in database schemas

-- Create :- To Create a Table or DataBase
drop database imarticus_learning;               # If the Database imarticus_learning is present in the schemas then it will drop else it will throw an error
drop database if exists imarticus_learning;     # If the Database imarticus_learning is present in the schemas then it will drop else it will throw an warning message
create database Imarticus_Learning;      # creating a Database
create database if not exists Imarticus_Learning;     # If the database is already created then it will throw an error, Its an best to use this type of code
use Imarticus_Learning;                               # Once you have created a database you want to use those database 
create table students_info(              # Creating a Table, Note: I have not used any constraints here because i will explain constraints in later stages 
first_name varchar(25),
last_name varchar(20),
Age int,
Gender varchar(1),
location varchar(20));
show tables;                               # To display all the tables that are present in the database
describe students_info;                    # Describe is used to display column names, datatypes, constraints if exists

# Will create another table called employee
create table employee(
Employee_id int,
first_name varchar(25),
last_name varchar(20),
DOJ date);

show tables;             # If you want to view all the tables present Imarticus Learning database 
describe Employee;       

-- Drop :- Drop Table or Database
drop Table Employee;
show tables;                    # you can see here you have only one table because employee table has droped 

select * from students_info;

-- Alter :- To add column (or) to Modify the datatype (or modify the structure of the database)
alter table students_info add column Program varchar(20);     # To add new Column
alter table students_info add column contact_number char(10) after gender;   # to add new column after gender
alter table students_info modify contact_number varchar(12) ;    # modifing the structure of the table (uses only for modifing the data type)
alter table students_info add column student_id int first;       # Adding new column on first index position
alter table students_info drop column student_id;                # Droping a column


-- Truncate :- To Remove all the records in the table without affecting structure of the table and the integrity constraints will remains same
# Before using truncate command you must insert some values inside the table, So will learn deeper when we go to insert statement

-- Rename :- Renaming column name
select * from students_info;
alter table students_info rename column Age to DOB;    # This is one way of renaming the column name

-- Renaming Table Name
alter table students_info rename Students_Details;     # Renaming Table Name

-- The other way of changing the column name 
alter table students_Details change DOB Date_of_Birth date;      # Renaming DOB column to Date of Birth
alter table students_Details rename Students_info;     # Renaming Table Name

/* DML [Data Manipulation Language]
Data Manipulation Language used to Manipulate the data present 
in the Database

Note:- 
1) We Never use the word Table
2) We can use where condition in Update and Delete statement
3) DML command is not Autocommit you can use roll back statement to revoke it

There are totaly 3 commands in Mysql
1) Insert
2) Update
3) Delete
*/

-- Insert :- Insert command is used to insert a row (or) value into a Table
select * from students_info;

-- If you want to insert specific information 
insert into students_info(first_name, last_name, Gender, contact_number, location, Program) values('Jeevan','Raj','M',9141919300,'Bangalore','MySQL');    

-- If you want to insert all the information then neednot to mention the column details and you can insert multiple information by seperating with commas
insert into students_info values('Navya','Shree','1995-09-09','F',8073529011,'Bangalore','Python'),                            # Note always you want to insert the date in YYYY-MM-DD format
								('Kavya','Shree','1990-06-03','F',9019653630,'Mysore','MySQL'),
                                ('Kiran','khamitkar','1990-10-02','M',8022406930,'Kolar','Java');
                                  
select * from students_info;                                

-- Update :- Update is used to update a value in a perticular row
Update Students_info set Date_of_Birth='1989-10-02' where first_name='kiran';     # Will change the Date_of_Birth of Kiran to 1989-10-02
select * from students_info;

update students_info set Date_of_Birth = '0000-00-00' where Date_of_Birth is null;      # Filling the null values

-- Delete :- Delete is used to Delete Perticular Row
Delete from students_info where first_name='kiran';      # Now will delete all the records kiran

select * from students_info;

/* DQL [Data Query Language]
Data Query Language is used to fetch data from database

1) Select
*/

Select * from students_info where program='python';          # Will write a query to extract MySQL Program
select * from students_info where gender = 'm';


/* DCL [Data Control Language]                      # If you want to work on it go to server -> users and privileges -> Add account ->
Data Control Language is used to give privileages (permission) to the user to perform any operation in the database

1) Grant 
2) Revoke 

i) Create user in MySQL Server
ii) Grant and Revoke Permissions
         1. Use Imarticus_Learning;
         2. grant select on students_info to 'userone';
         3. revoke select on students_info from 'userone';
         4. grant create,delete,drop,select,insert,update,alter on students_info to 'userone','usertwo';
         5. revoke select,delete,drop,create,alter,insert,update on students_info from 'userone','usertwo';
         6. If you want to give all the privileges use sysdba (grant all to 'userone');
         
*/

-- Grant :- Granting a permission to the perticular user to perform some operation 

use Imarticus_Learning;
Grant Select                    # we are granting a permision to the userone to use the select statement on students_info table
on students_info 
to 'Userone';                      

Grant Select,insert             # we are granting a permision to the userone to use the select,insert statement on students_info table
on students_info
to 'Userone';

Revoke insert                   # we are raking back that permission by using revoke statement 
on students_info
from 'Userone';

select * from students_info;

-- Now will try to give permission for 2 users
Grant select,insert,update
on students_info
to 'Userone','Usertwo';

-- Now will give all the permission to the userone
Grant all
on students_info
to 'Userone';

-- Now again I am taking all the permission from the userone
Revoke all
on students_info
from 'Userone';

/* TCL  [Transaction Control Language]
ex:-i) If it is a Banking Sector the Money is debited from one account and credited to the other account
	ii) To manage changes made to data in a table by DML Statement

1) Commit
2) Roll Back
3) Save Point
*/

/* Commit :-
			i) To Permanently Save a Transaction
			ii) Changes made by Insert,Update,Delete (DML) are not permanent until you use commit statement

   Savepoint :-
			i) Used to temporarily save a transaction, So that you can rollback to that point.
            
   Rollback :- 
			i) Restores the Database to last commited state.
            ii) Rollback also used with savepoint to restore the database to the required save point name
*/
set autocommit = 0;            # Before using TCL you must set autocommit = 0 (false)
select * from students_info;
truncate table students_info;   # Truncate will remove all the records from the table but the structure and integrity constraint of the table remains same 
insert into students_info values('Karna','Prasad','1998-12-30','M',9141919311,'Bangalore','Python');
select * from students_info;
insert into students_info values('Jeevan','Raj','1998-12-30','M',9141919311,'Bangalore','Python');


-- Now will commit the transaction
commit;

# Now will remove details of karna from students_info table
delete from students_info where first_name='Karna';
select * from students_info;                               # You can see i have deleted the information of karna but i don't commit i will rollback the information

# Now will use rollback to restore karna's information to the database
rollback;
select * from students_info;                # Now you can see we have rollback the information of karna to the db

savepoint savepoint1_all_info;
update students_info set program='Tableau' where first_name='Jeevan';
savepoint savepoint2_all_info;

select * from students_info;
rollback to savepoint1_all_info;
select * from students_info;                   # You can see that we are rolling back to the savepoint 

# ----------------------------- Happy Learning we have finished with SQL Commands ---------------------------------------------- #




