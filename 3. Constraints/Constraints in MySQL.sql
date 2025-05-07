# Constraints in My Sql 
# Constraints are nothing but its a set of rules and instrections that we want to fallow while inserting the records in to the table

#Type of Constraints
-- 1. Not Null Constraints
-- 2. Unique Constraints
-- 3. Primary Key Constraints
-- 4. Foreign Key Constraints 
-- 5. Check Constraints
-- 6. Default Constraints

/*

1. Not Null Constraint: The not null constraint ensures that a column does not contain any NULL values. 
It requires that the specified column(s) must have a value for each record in the table.

2. Unique Constraint: A unique constraint ensures that the values in the specified column(s) are unique,
Meaning no duplicate values are allowed.A unique constraint can allow NULL values. More than one unique constraint can exist on a single table.

3. Primary Key Constraint: A primary key constraint uniquely identifies each record in a table. 
PRIMARY KEY Constraint is a combination of NOT NULL and Unique constraints.
It ensures that the primary key column(s) have unique values and cannot contain NULL. 
Only one primary key can be defined per table.

4. Foreign Key Constraint: A foreign key constraint establishes a relationship between two or more tables. 
It ensures the referential integrity by enforcing that values in the foreign key column(s) of one table match values in the primary key column(s) of another table.
The table containing a foreign key is a child table, The table that has reference to is a Parent table

5. Check Constraint: A check constraint allows you to specify a condition that must be true for the values in a column. It provides additional validation or business rules on the data.

6. Default Constraint: A default constraint assigns a default value to a column if no value is provided during an insert operation. It ensures that a default value is used when a value is not explicitly specified.

These constraints help maintain data integrity and enforce certain rules on the tables in a database. They play a crucial role in ensuring the consistency and accuracy of the data stored in the database.
*/

drop database if exists constraints_learning;
create database constraints_learning;
use constraints_learning;

-- Creating the Customers table

CREATE TABLE Customers (
  Customer_id INT PRIMARY KEY AUTO_INCREMENT,             # we are using primary key and auto_increment as a constraint
  Cust_Name VARCHAR(100) NOT NULL,
  Gender ENUM('Male','Female') NOT NULL,
  Age int  Default 18 check(Age>=18) ,
  Email VARCHAR(100) UNIQUE,
  Address VARCHAR(200) NOT NULL);

-- Creating the Orders table
CREATE TABLE Orders (
  Order_id INT PRIMARY KEY AUTO_INCREMENT,
  Customer_id INT,
  Order_date DATE NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE);


CREATE TABLE Users(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL check	(email Like '%@gmail.com'));

# Will insert few records in Customers Table

insert into Customers values(1,'Jeevan Raj','Male',99,'jeevan.raj@gmail.com','vijaynagar');
insert into Customers values(1,'rahul','Male',28,'rahul.com','bapujinagar');     # It won't accept because customer_id is primary key
insert into Customers values(2,'rahul','M',28,'rahul.com','bapujinagar');        # It won't accept because gender accepts only Male or Female
insert into Customers values(2,'rahul','Male',10,'rahul.com','bapujinagar');     # It won't accepts because Age should be greater than or equal too 18
insert into Customers values(2,'rahul','Male',28,'rahul.com','bapujinagar');     # It accepts because it satisfice all the violation(condition)

select * from customers;

# Now will insert few records in Orders Table

insert into orders values(1,1,'2023-09-07'),(2,1,'2023-09-08');
insert into orders values(3,3,'2023-09-07');                     # 	It doesnot accepts because we don't have any customer with cust id =3 in customer table
insert into orders values(3,2,'2020-12-20'),(4,1,'2020-10-029');

select * from orders;

# Now let me remove customer id 2 in customers table
delete from customers where customer_id = 2;

-- Now let me print all the records from the customers table
select * from customers;

-- Now let me print all the records from the Orders table
select * from orders;        # Now you can see over here those records where customer_id = 2 in orders table which were related to customer table got deleted because we used foreign key as on delete cascade

-- Altering the foreign key constraint to ON DELETE SET NULL
ALTER TABLE Orders
DROP FOREIGN KEY orders_ibfk_1,
ADD CONSTRAINT FK_Orders_Customers
  FOREIGN KEY (customer_id)
  REFERENCES Customers(customer_id)
  ON DELETE SET NULL;
  
# Now will insert some records in customers table
insert into Customers values(2,'rahul','Male',28,'rahul.com','bapujinagar'),(3,'Manju','Male',32,'manju93@gmail.com','BTM Lavout');

# Now will insert some records in Orders table
insert into Orders values(5,2,'2021-08-20'),(6,3,'2022-05-09'),(7,2,'2022-04-15');

select * from orders;

# Now will delete the information of customer_id 2
delete from customers where customer_id = 2;

select * from customers;
select * from orders;      # Now you can see over here those records where customer_id = 2 in orders table which were related to customer table got null because we used foreign key as on delete Set null

delete from orders where customer_id is null;       # Now i am deleting those orders whoose customer_id is null

select * from orders;

# Now again i will alter the foreign key constraints and i won't specify anything 
alter table orders 
drop foreign key FK_Orders_Customers,
add constraint FK_O_C
foreign key (customer_id) references customers(customer_id);

select * from Orders;
insert into Customers values(2,'Roopa','Female',28,'roopa.com','bapujinagar');
insert into Orders values(5,2,'2021-08-20'),(7,2,'2022-09-12');

delete from customers where customer_id = 2;
-- If you won't metion On Delete Cascade or On Delete Set Null than it doesnot allow you to delete customer_id =2 in customers table because some of the customers are placed an order in orders table 


-- Now will work on users tables
select * from users;
insert into users(name,email) values('Navya Shree','Navya.raj@gmail.com');   
insert into users(name,email) values('Jeevan Raj','Jeevan.raj@imarticus.com');   # you can see it is not accepting i am getting check constraint violation because email should contain @gmail.com it is statis mail_id 

# Now will create dynamic mail id where the user should include @ ' '.com  it may be gmail.com or facebook.com or imarticus.com

-- Drop the existing check constraint
ALTER TABLE Users
DROP CONSTRAINT users_chk_1;

alter table users add constraint email_format1 check(email like '%@%.com');    # or else the other way of writing the check constraints is by using regexp (email REGEXP '^[A-Za-z0-9._%+-f]+@[A-Za-z0-9.-]+.com$')

describe users;
insert into users(name,email) values('Jeevan Raj','Jeevan.raj@imarticus.com');



