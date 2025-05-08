# Case Statement in My Sql By Jeevan Raj
# Case are Nothing but contitional statement that allows you to perform conditional logic 
-- within SQL queries. It is often used to control the flow of the query and return different values 
-- based on specified conditions. it is like - if then else statement

/* Syntax
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE default_result
END

CASE: The keyword to start the CASE statement.
WHEN condition THEN result: Specifies a condition and the corresponding result if the condition is true.
ELSE default_result: Specifies the default result if none of the previous conditions are true.
END: The keyword to end the CASE statement.
*/


drop Database if exists restaurant;
create database restaurant;
use restaurant;
create table hotels(
id int not null primary key,
hotel_name varchar(30) not null,
rating varchar(2));

alter table hotels add column customer_gender varchar(2) after hotel_name;
select * from hotels;
insert into hotels values(1,'Shanthi Sagar','M',8),(2,'abc','f',6),(3,'MTR','f',7),(4,'xyz','m',3),(5,'maruthi','f',3);
select * from hotels;

# Now will create case statement 
select *,case when rating <5 then 'Standard Hotel' when rating <8 then 'Premium Hotel' else 'Luxury Hotel' end as Hotel_Review from hotels;

# will update the data to the table 
alter table hotels modify customer_gender varchar(10);
update hotels set customer_gender = case customer_gender when 'M' then 'Male' when 'f' then 'female' end ;

select * from hotels;

# Now will also add Hotel Review to the original table
alter table hotels add column Hotel_review varchar(30);

update hotels set Hotel_review = case when rating <5 then 'Standard Hotel' when rating <8 then 'Premium Hotel' else 'Luxury Hotel' end;

select * from hotels;

