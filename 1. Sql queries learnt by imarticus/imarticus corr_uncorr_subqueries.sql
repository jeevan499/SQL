drop database if exists schooldb;
CREATE DATABASE schooldb;

USE schooldb; 

CREATE TABLE department
( 
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL, 
  capacity INT NOT NULL 
);

 INSERT INTO department 
  VALUES (1, 'English', 300), 
         (2, 'Computer', 450), 
         (3, 'Civil', 400),
         (4, 'Maths', 400),
         (5, 'History', 300);
         
CREATE TABLE student
(  
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  gender VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  dep_id INT NOT NULL    
);

INSERT INTO student
  VALUES (1, 'Jolly', 'Female', 20, 4), 
         (2, 'Jon', 'Male', 22, 3),
         (3, 'Sara', 'Female', 25, 4),
         (4, 'Laura', 'Female', 18, 2),
         (5, 'Alan', 'Male', 20, 3),
         (6, 'Kate', 'Female', 22, 2),
         (7, 'Joseph', 'Male', 18, 2),
         (8, 'Mice', 'Male', 23, 1),
         (9, 'Wise', 'Male', 21, 5),
         (10, 'Elis', 'Female', 27, 2);
         
         
select * from department;
select * from student;         

## Uncorrelated Sub-query            # uncorrelated sub-query :- relation between two different table (where outer query is of different table and inner query is of different table)
select * from department; 
 
SELECT * FROM
  student 
  WHERE dep_id not in
  (
    SELECT id from department WHERE id < 4
  ) order by name;  
  
  SELECT id from department WHERE name in ( 'Computer', 'Maths');
  select id from department where name like '%computer%' or name like '%maths%';
  select id from department where name regexp 'computer|maths';
  
## Correlated Subquery
select * from student;
SELECT   name, gender, mark, dep_id
  FROM     student Greater
  WHERE    mark >
  (SELECT   AVG (mark)
     FROM     student average
     WHERE      4 = average.dep_id) ;  
     
SELECT   name, gender, age, Greater.dep_id
  FROM     student Greater, 
  (SELECT  dep_id, AVG (age) avg_age
     FROM     student average
     group by dep_id) avg
     where Greater.dep_id = avg.dep_id and
			Greater.age > avg.avg_age;  
     
SELECT  dep_id, AVG (age) avg_age
     FROM     student average
     group by dep_id;
select dep_id, avg(age) from student
group by dep_id;     