# Performing trigger operation 
# What is trigger 
# Trigger is a SQL code that automatically exicute in response to a certain event on a perticular table, Trigger are used to maintain data integrity

# Lets create a table called imarticus in this table will store student name, batch and individual subject name with marks will use trigger to automatically add total marks

drop table if exists imarticus;
create table imarticus(
student_name varchar(25),
mysql tinyint,
python tinyint,
ml tinyint,
batch tinyint default 24);

# we forgot to add the total marks in imarticus so will add it
alter table imarticus add column total_marks int after batch;

# Now will create trigger
create trigger trigger1 before insert on imarticus for each row set new.total_marks= new.mysql+new.python+new.ml;

# Now will insert the data 
insert into imarticus (student_name,mysql,python,ml) values('Jeevan',95,96,98),('shravani',80,86,90);
select * from imarticus;

# You can see the total marks is automatically executed 

# Now will create after insert trigger
# if we enter the data into imarticus table grades table should automatically executed with name and total marks

drop table if exists grades;
create table grades(
name varchar(25),
total_marks int);

drop trigger if exists trigger2;
create trigger trigger2 after insert on imarticus for each row insert into grades values(new.student_name,new.total_marks);

# Now i am inserting into imarticus it will automatically update in grade table
describe imarticus;
insert into imarticus(student_name,mysql,python,ml) values ('sam',60,80,75);

select * from imarticus;
select * from grades;

# to see the triggers 
show triggers in student;      # Syntax show triggers in database name

-- For more details you can refer below codes 

# Creating Trigger
drop database if exists student ;
create database student;
use student;
create table student_details(
id int not null primary key,
first_name varchar(30) not null,
batch varchar(10) not null,
marks varchar(3) not null);

insert into student_details values(1,'mamtha',24,70);
select * from student_details;

# Now will create a trigger when ever i am inserting the marks in the table it should automatically add 10 marks grase in marks column
create trigger grase_marks before insert on student_details for each row set new.marks=new.marks+10;

# now will check if the trigger is created or not by inserting some records 
insert into student_details values(2,'Jeevan',24,90),(3,'shravani',24,86);

select * from student_details;

# To see if the trigger is avaliable or not
show triggers in student;

# To Drop the trigger
drop trigger grase_marks;

create table final_marks(
total_marks int);

# Now will create After Trigger 

create trigger cal after insert on student_details for each row insert into final_marks values(new.marks);

insert into student_details values(4,'Pranav',24,45);
select * from student_details;
select * from final_marks;




















