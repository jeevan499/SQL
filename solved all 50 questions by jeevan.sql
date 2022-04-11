# code is written by jeevan raj if their is any corrections in script kindly tell me          -----> sharing is caring 
use org;
select * from worker;
select position('a' in 'manju');
select instr(first_name,binary 'ab') from worker where first_name ='amitabh';


# sql is not case sensitive so you can use upper or lower case i will be using the lower case for all the commands use based on your convenience

# Q-1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table Using The Alias Name As <WORKER_NAME>.
select * from worker;
select first_name as worker_name from worker;

#Q-2. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case.
select upper(first_name) from worker;

# Q-3. Write An SQL Query To Fetch Unique Values Of DEPARTMENT From Worker Table.
select * from worker;
select distinct(department) from worker;

# Q-4. Write An SQL Query To Print The First Three Characters Of  FIRST_NAME From Worker Table.
select substring(first_name ,1,3) from worker;

# Q-5. Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name Column ‘Amitabh’ From Worker Table.
select position('h' in 'amitabh');
select instr(first_name,binary 'ab') from worker where first_name ='amitabh';

# Q-6. Write An SQL Query To Print The FIRST_NAME From Worker Table After Removing White Spaces From The Right Side.
select rtrim(first_name) from worker;

# Q-7. Write An SQL Query To Print The DEPARTMENT From Worker Table After Removing White Spaces From The Left Side.
select ltrim(department) from worker ;

# Q-8. Write An SQL Query That Fetches The Unique Values Of DEPARTMENT From Worker Table And Prints Its Length.
select distinct(length(department)) from worker;

# Q-9. Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing ‘a’ With ‘A’.
select first_name from worker;
select replace(first_name,'a','A') from worker;

# Q-10. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them.
select * from worker;
select concat(first_name,' ',last_name) as complete_name from worker;

# Q-11. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending.
select * from worker order by first_name;

# Q-12. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending And DEPARTMENT Descending.
select * from worker order by first_name asc,department desc; 

# Q-13. Write An SQL Query To Print Details For Workers With The First Name As “Vipul” And “Satish” From Worker Table.
select * from worker where first_name in ('vipul','satish');

# Q-14. Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” And “Satish” From Worker Table.
select * from worker where first_name not in ('vipul','satish');

# Q-15. Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As “Admin”.
select * from worker where department ='admin';

# Q-16. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
select * from worker where first_name like '%a%';
select * from worker where first_name regexp 'a';

# Q-17. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
select * from worker where first_name like '%a';
select * from worker where first_name regexp 'a$';

# Q-18. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘H’ And Contains Six Alphabets.
select * from worker where first_name like '_____h';

# Q-19. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.
select * from worker where salary between 100000 and 500000;

# Q-20. Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.

select * from worker where joining_date like '%2014-02%';
use org;
select * from worker where year(joining_date)=2014 and month(joining_date)=2;

# Q-21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
select count(*) from worker where department ='admin';

# Q-22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000.
select concat(first_name,last_name) as 'worker name' from worker where salary between 50000 and 100000;
select concat(first_name,last_name) as 'worker name' from worker where salary>=50000 and salary<=100000;

# Q-23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
select department,count(*) as no_of_worker from worker group by department order by no_of_worker desc;

# Q-24. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
select * from worker where worker_id in (select worker_ref_id from title where worker_title='manager');
select * from title;
select * from worker w inner join title t on w.WORKER_ID=t.WORKER_REF_ID where WORKER_TITLE ='manager';

SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

# Q-25. Write An SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.
select worker_title,AFFECTED_FROM from title group by WORKER_TITLE,AFFECTED_FROM having count(*) >1;

# Q-26. Write An SQL Query To Show Only Odd Rows From A Table.
select * from worker where mod(worker_id,2)!=0;

# Q-27. Write An SQL Query To Show Only Even Rows From A Table.
select * from worker where mod(worker_id,2)=0;

# Q-28. Write An SQL Query To Clone A New Table From Another Table.
create table clone  like title;

# Q-29. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select * from worker where worker_id in(select worker_ref_id from title);

# Q-30. Write An SQL Query To Show Records From One Table That Another Table Does Not Have.
select * from worker where worker_id not in (select WORKER_REF_ID from bonus);


# Q-31. Write An SQL Query To Show The Current Date And Time.
select now();

# Q-32. Write An SQL Query To Show The Top N (Say 5) Records Of A Table.
select * from worker order by worker_id limit 5;

# Q-33. Write An SQL Query To Determine The Nth (Say N=5) Highest Salary From A Table.
select * from worker group  by salary order by salary desc limit 4,1;
select * from worker;


# Q-34. Write An SQL Query To Determine The 5th Highest Salary Without Using TOP Or Limit Method.
select salary from worker w1 where 4=(select count(distinct(w2.salary)) from worker w2 where w2.salary>w1.salary);
select salary from worker group by salary order by salary desc limit  4,1;
select salary from worker group by salary order by salary desc;


# Q-35. Write An SQL Query To Fetch The List Of Employees With The Same Salary.
select distinct w.worker_id,w.first_name,w.last_name from worker w,worker w1 where w.salary =w1.salary and w.worker_id!=w1.worker_id; 

select * from worker where salary in(select salary from worker group by salary having count(salary)>1);

# Q-36. Write An SQL Query To Show The Second Highest Salary From A Table.
select max(salary) from worker where salary<(select max(salary) from worker);

select * from worker group by salary order by salary desc limit 1,1;

# Q-37. Write An SQL Query To Show One Row Twice In Results From A Table.
select * from worker union all select * from worker;

# Q-38. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select * from worker where worker_id in (select worker_ref_id from bonus);

# Q-39. Write An SQL Query To Fetch The First 50% Records From A Table.
select * from worker where WORKER_ID <=(select count(worker_id)/2 from worker);
select * from worker;

# Q-40. Write An SQL Query To Fetch The Departments That Have Less Than Five People In It.
select department,count(*) from worker group by department having count(*)<5;

# Q-41. Write An SQL Query To Show All Departments Along With The Number Of People In There.
select department,count(*) from worker group by department;

#Q-42. Write An SQL Query To Show The Last Record From A Table.
select * from worker order by WORKER_ID desc limit 1; 

# Q-43. Write An SQL Query To Fetch The First Row Of A Table.
select * from worker limit 1;

# Q-44. Write An SQL Query To Fetch The Last Five Records From A Table.
select * from worker order by worker_id desc limit 5 ;
select * from worker where worker_id in (select * from (select WORKER_ID from worker order by WORKER_ID desc limit 5)as t ) order by worker_id ; 


# Q-45. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
select department,max(salary) from worker group by department;

# Q-46. Write An SQL Query To Fetch Three Max Salaries From A Table.
select * from worker order by salary desc limit 3;

# Q-47. Write An SQL Query To Fetch Three Min Salaries From A Table.
select * from worker order by salary asc limit 3;

# Q-48. Write An SQL Query To Fetch Nth Max Salaries From A Table. say 6
select salary from worker group by salary limit 5,1;

# Q-49. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid 
select department,sum(salary) from worker group by department;

# Q-50. Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary.
select concat(first_name,last_name),department,salary from worker group by salary order by salary desc ;

select concat(first_name,last_name),department,max(salary) from worker group by department;


-- krishnayak interview questions
-- question 1
-- List the keywords below in order of their occurence in a query 
# ex:- 1)groupby 2)order by 3)select 4)where 5)from 6)limit 7)having
select * from worker where department='admin' group by department having salary >50000 order by salary limit 1;
# this should be the order 1)select 2)from 3)where 4)group by 5)having 6)order by 7)limit

-- question 2
# find first 5 char from a first_name 
select left(first_name,5) as first_five_char from worker;

-- question 3
# Mask a column such that the last few characters are converted to * 
# use imarticus database and perform mask operation on contact details of student_info table display only ending 3 number rest to be masked by *
select * from worker;
use imarticus;
select * from student_info;
select student_id,student_name,student_age,location,concat('*******',right(contact_details,3)) as contact_details from student_info;

-- question 4
# find the 3rd to 6th character of a column
use org;
select * from worker;
select substring(first_name,4,3) from worker;

-- question 5
-- retrieve name of employee who have salary greater than what vishal has 

select first_name,salary from worker where salary>(select salary from worker where first_name='vishal');
select * from worker;

-- question 6
-- same query as 5th question but save that query output in a view
create view  salary_records as select first_name,salary from worker where salary>(select salary from worker where first_name='vishal');

select * from salary_records;

-- question 7
select * from worker;
create table projects(
project_id int primary key auto_increment,
project_name varchar(35) not null,
worker_id int,
foreign key (worker_id) references worker(worker_id));

insert into projects values(1,'Property Price Prediction',1),(2,'Car Price Prediction',1),(3,'titanic survival prediction',4),(4,'diabetes predicion',5);

# question (let say, you have employee details in worker table and project details in projects table
# Question: find the list of employees that are assigned to some projects 
# Question: find the total list of employees along with their respective project name (Employees with no project details should have thier project as null)

select w.first_name,w.last_name,project_name from worker w inner join projects p using (worker_id);

select * from worker w left join projects p using (worker_id);

# question 8
# let say you have wifi_id,wifi_speed,date
# question1. find the average wifi speed for each wifi 
# question2. find the average wifi speed for each wifi in the last 2year

create table wifi_info(
wifi_id int,
wifi_speed int not null,
wifi_date date);

insert into wifi_info values
			(1,49,'2020/05/03'),(2,53,'2021/06/30'),
            (1,73,'2021/09/01'),(3,89,'2021/12/03'),
            (1,112,'2021/12/21'),(2,149,'2022/01/01');
select avg(wifi_speed),wifi_id from wifi_info group by wifi_id;

select avg(wifi_speed),wifi_id,wifi_date from wifi_info where wifi_date >= date_add(sysdate(),interval -1 year) group by wifi_id,extract(year from wifi_date) order by wifi_date desc;

# creating new database to work on new interview questions

drop database if exists test_db;
create database if not exists test_db;
use test_db;

CREATE table worker(
worker_id varchar(10),
first_name varchar(100), 
last_name varchar(100),
salary int,
joining_date datetime,
department varchar(10));

INSERT INTO worker values ("001", "Monika", "Arora", 100000, '2014-02-20 09:00:00', "HR");
INSERT INTO worker values ("002", "Niharika", "Verma", 80000, '2014-06-11 09:00:00', "Admin");
INSERT INTO worker values ("003", "Vishal", "Singhal", 300000, '2014-02-20 09:00:00', "HR");
INSERT INTO worker values ("004", "Amitabh", "Singh", 500000, '2014-02-20 09:00:00', "Admin");
INSERT INTO worker values ("005", "Vivek", "Bhati", 500000, '2014-06-11 09:00:00', "Admin");
INSERT INTO worker values ("006", "Vipul", "Diwan", 200000, '2014-06-11 09:00:00', "Account");
INSERT INTO worker values ("007", "Satish", "Kumar", 75000, '2014-01-20 09:00:00', "Account");
INSERT INTO worker values ("008", "Geetika Chauhan", "Arora", 90000, '2014-04-11 09:00:00', "Admin");

CREATE table bonus(
worker_ref_id int,
bonus_date datetime,
bonus_amt int);

CREATE table title(
worker_ref_id int,
worker_title varchar(100), 
affected_from datetime);



INSERT INTO bonus values (1,'2016-02-20 00:00:00',5000);
INSERT INTO bonus values (2,'2016-06-11 00:00:00',3000);
INSERT INTO bonus values (3,'2016-02-20 00:00:00',4000);
INSERT INTO bonus values (1,'2016-02-20 00:00:00',4500);
INSERT INTO bonus values (2,'2016-06-11 00:00:00',3500);


INSERT INTO title values (1,'Manager','2016-02-20 00:00:00');
INSERT INTO title values (2,'Executive','2016-06-11 00:00:00');
INSERT INTO title values (8,'Executive','2016-06-11 00:00:00');
INSERT INTO title values (5,'Manager','2016-06-11 00:00:00');
INSERT INTO title values (4,'Asst. Manager','2016-06-11 00:00:00');
INSERT INTO title values (7,'Executive','2016-06-11 00:00:00');
INSERT INTO title values (6,'Lead','2016-06-11 00:00:00');
INSERT INTO title values (3,'Lead','2016-06-11 00:00:00');


show tables;
-- question 1 
select * from worker;
-- write an sql query to fetch'first_name' from worker table in upper case
select upper(first_name) from worker;

# question 2
-- write an sql query to fetch unique values of department from worker table 
select distinct(department) as department from worker;

# question 3
-- write an sql query to print the first three characters of first_name from worker table
select substring(first_name,1,3) from worker;

# question 4
-- write an sql query to find the position of the alphabet('a') in first name column 'Amitabh' from worker table
select instr(first_name,'a') from worker where first_name='Amitabh';

# question 5
-- write an sql query that fetches the unique values of Department from worker table and prints its length
select distinct(department),length(department) from worker ;
select distinct(length(department)) from worker;

# question 6
-- write an sql query to print details of the workers whose first_name contains 'a'

select * from worker where first_name like '%a%';
select * from worker where first_name regexp 'a';

# question 7
-- write an sql query to print details of the workers whose first_name ends with 'h' and contains six alphabates.
select * from worker where first_name like '_____h';

# question 8
-- write an sql query to fetch the no of workers for each department in the descending order 

select department,count(worker_id) as No_of_worker from worker group by department order by No_of_worker desc;

# question 9
-- write an sql query to print details of the workers who are also managers

select * from worker where worker_id in (select worker_ref_id from title where worker_title='Manager');
select * from title where worker_title like 'manager';

# question 10
-- write an sql query to show only odd rows from a table
select * from worker where mod(worker_id,2)<>0;

# question 11
-- write an sql query to show only even rows from a table
select * from worker where mod(worker_id,2)=0;

# question 12
-- write a sql query to show the current date and time
select now();

# question 13
-- write and sql query to show the top n(say 5) records of a table
select * from worker limit 5;

# question 14
-- write an sql query to determine the nth (say n=5)  higest salary from a table
select * from worker group by salary order by salary desc limit 4,1;

# question 15     vvvimp
-- write an sql query to determine 5th higest salary without using top or limit method
select salary from worker w1 where 4=(select count(distinct(w2.salary)) from worker w2 where w2.salary>w1.salary);

# question 16

-- write an sql query to fetch the list of employees with the same salary
select first_name, salary from worker group by salary having count(salary)>1;
select * from worker;
select first_name, salary from worker where salary in (select salary from worker group by salary having count(salary)>1);

# writing the same query in another way
select distinct w.worker_id,w.first_name,w.salary from worker w, worker w1 where w.salary =w1.salary and w.worker_id != w1.worker_id;

# question 17
# write a sql query to show the second higest salary from a table

select max(salary) from worker where salary<(select max(salary) from worker);

# writing the same query in another way
select salary from worker group by salary order by salary desc limit 1,1;

# question 18
-- write a sql query to fetch the first 50% records from a table 

select * from worker where worker_id <=(select count(worker_id)/2 from worker) ;

# question 19
-- write an sql query to fetch the departments that have less than five people in it.

select department,count(worker_id) as No_of_workers from worker group by department having count(worker_id) <5;

# question 20
-- write an sql query to print the name of employees having the higest salary in each department

select * from worker;
select first_name,salary,department from worker group by department order by salary desc ;

