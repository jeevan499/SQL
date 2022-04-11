-- select * from customers;          # the (*)will print all the data which are present in customers table
show databases;
use sql_store;
show tables;
describe customers;
select * from customers ;
select first_name ,last_name, points ,points +1 as "new points" from customers;     #using arrethmatic operation   # we can explicitily print the column which we want to print

select first_name, last_name, points, points+(points*0.10) as "increasing 10%" from customers ;  #using aliase (as) to mention any name in the table

select * from customers;          # if we want to make some changes in a data open and make change in result grid and press apply ->
select state from customers;      # if we use perticular attributes it is used only for reading purpose we cannot do any modification 
select count(*) from customers;     # to count howmany rows are their in customers table

# to have a unique name in the state table , it remove the duplicate values if we use distinct
select count(*) from (select  distinct (state) from customers ) t  ;      # we have unique state is 9

#assingment
select *  from products;
select name,unit_price,unit_price * 1.10 as "new price" from  products ;
select name,unit_price,unit_price+(unit_price*0.10) as 'new price' from products;      # both above and this condition are same but different way of writing the persentage

#comparison operator in sql
select * from customers where  state !="va";               # not equal too (!=) or (<>)
select * from customers where birth_date >"1990-01-01";    

show tables;
select * from orders;

#assingment 
# find the order date of this year(2019)

select * from orders where  order_date >="2019-01-01";   #this is not the correct way of searching the order_date of this year
select * from orders where order_date regexp "^2019";    # or you can use in this way the details of regexp-> regersion expression is given below
select * from orders where order_date like "2019%";      # or you can use in this way the details of like is given below 
# operator (and,or,not)
select * from customers;
select * from customers where birth_date>"1990-01-01" and points >1000; # AND OPERATOR where both the condition should be true , it prints only if both condition satisfy
select * from customers where birth_date>"1990-01-01" or points>3000 ; # OR OPERATOR where it prints if any one of the condition is true
select * from customers where not birth_date>"1970-01-01"; # if we use the not operator it converts the operator sign >"1970-01-01" to <"1970-01-01"

#combination of operator :- (evaluation process starts from (),/,*,+,- ,for operator  AND,OR,NOT)
select * from customers where  birth_date>"1990-01-01" or (points >1000 and state="va") ; 

select * from customers where not( birth_date>"1990-01-01" or (points >1000 and state="va"));  # using not operator to find the values 
select * from customers where birth_date<="1990-01-01" and( points<=1000 or state!="va");       # or you can write in this way both works the same

#assingment 
select * from order_items ;
select order_id,quantity,unit_price,unit_price*quantity as "total price" from order_items;
select * from order_items where (order_id =6 and unit_price*quantity>30) ;

# workig on IN and NOT IN operators
select * from customers where state = "va" or state = "fl" or state="il" ; #insted of doing this use IN operator
select * from customers where state in("va","fl","il");
select * from customers where state not in("va","fl","il");

#assingment
show tables;
select * from products;
select * from products where quantity_in_stock in(49,38,72);

# BETWEEN OPERATOR IN MYSQL , If we use between operator than both the values are inclusive
select * from customers where points >=1000 and points<=3000; #insted of this use between operator
select * from customers where points between 1000 and 3000 ;

#assingment
select * from customers;
select * from customers where birth_date between "1990-01-01" and "2000-01-01";

# how to retrive the rows that match specific string pattern , like (%) operation 
select * from customers;
select * from customers where last_name like "b%";   # it prints the customers last name starts from b
select * from customers where last_name like "%ey";
select * from customers where phone like "%59%";      # it doesnt matter the first number and last number it prints only the number is connected with 59

select * from customers where first_name like "_____a";
select * from customers where first_name like "b____a";
select * from customers where first_name like "__e__i";
# we use (%) any number of characters
# we use (_)  for single character  in mid perticular term should be their


# assingment
select * from customers;
select * from customers where address  like  "%trail%" or address like "%avenue%" ;    #insted of this 
select * from customers where address regexp "trail|avenue";        # The regular experssion will be explained below, it is used for multiple string values
select * from customers where phone not like "%9";
select * from customers where phone not regexp '9$';

#the regular expression is used fetch the multiple values
# regular expression , it is very popular to search for string  we indicate regular expression as REGEXP
select * from customers where last_name regexp "field";    #anywhere if we find the term field in the last_name it shows the values
select * from customers where last_name regexp "^field";   #we use hat ^ to represent begining of the string
select * from customers where last_name regexp "field$";   #we use dollor $ to represent end of the string
select * from customers where last_name regexp "field|mac"; # any where of the last_name it should countain field or mac in a table
select * from customers where last_name regexp "field|mac|rose";  # the pipe(|) is used as (or operator) 

 #select * form customers where name regexp "[gim]e"
 # your answer may be "ge" or "ie" or "me" in the name(value)
  
  #select * form customers where name regexp "e[gim]"
 # your answer may be "eg" or "ei" or "em" in the name(value)
 
  #select * form customers where name regexp "[a-g]e"
 # your answer may be "ae" or "be" or "ce" or "de" or "ee" or "fe" or "ge" in the name(value)

 
select * from customers where last_name regexp "[gim]e";

#assingment
select * from customers where first_name regexp "(elka|ambur)";
select * from customers where last_name regexp "(ey$|on$)";
select * from customers where last_name regexp "(^my|se)";
select * from customers where last_name regexp "([ru]b)";

#find how to get the record with missing values

select * from customers;
select * from customers where phone is null;
select * from customers where phone is not null;

#assingments
show tables;
select * from orders;
select * from orders where shipper_id is null;

# how to sort data in a sql quires
select * from customers;
select * from customers order by first_name;  # the data is sorted in accending order
select * from customers order by first_name desc;   # this data is sorted in descending order
select * from customers order by state,first_name;  # this is sorted by multiple column 

#assingment
show tables;
select * from order_items;
select *,quantity*unit_price as "total price" from order_items  where order_id =2  order by unit_price*quantity desc;

#how to limit no of records which are return from queries  **limit should always print at the last

select * from customers limit 3;
select * from customers limit 6,3;     #it skips first 6 records and prints rest 3 records from the tables

#assingment
select * from customers;
select * from customers order by points desc limit 3;

# In sql we have 2 type of joins inner joins and outer joins (in inner join the inner key is optional, if you use only join it default takes as inner join)
#inner joints  (we are joining the 2 tables with same database)
show tables;
select * from customers;
select * from orders;                                        # primary key is customer_id

select * from orders inner join customers on orders.customer_id=customers.customer_id;     # it print every customer_id which are present in orders

#it does't print customer_id here it popup an error because we have customer_id in both the table, orders and customers ,the mysql doesnot know from where it should print the customer_id, so we want to mention it by giving the table name
select order_id,orders.customer_id,first_name,last_name from orders inner join customers on orders.customer_id=customers.customer_id order by order_id;

#insted of writing the name repeatedly use the alias to avoid writing big name, ex-> from orders-> o and customers-> c
select order_id,o.customer_id,first_name,last_name 
from orders o inner join customers c on o.customer_id=c.customer_id  ;

select order_id,o.customer_id,first_name,last_name 
from orders o inner join customers c on o.customer_id=c.customer_id order by order_id ;

#assingments
show tables;
use sql_store;
select * from products;
select * from order_items;

select order_id,order_items.product_id,quantity,order_items.unit_price from order_items join products on order_items.product_id=products.product_id;
select order_id,o.product_id,quantity,o.unit_price from order_items o join products p on o.product_id=p.product_id;

# how to combine column from tables accross multiple database
use sql_inventory;
show databases;
show tables;
describe products;
select * from sql_store.order_items oi inner join sql_inventory.products p on oi.product_id=p.product_id ;
select count(*) from sql_store.order_items oi inner join sql_inventory.products p on oi.product_id=p.product_id;

#joining table with itself  'self join'
use sql_hr;
select * from employees;
select e.employee_id,e.first_name ,m.first_name as manager from employees e inner join employees m on e.reports_to=m.employee_id;

# joining multiple tables    (we are joining multiple tables in the same database)

use sql_store;
show databases;
show tables;
use sql_store;
select * from customers;
select * from orders;
select * from order_statuses;
select * from orders inner join customers on orders.customer_id=customers.customer_id;
select * from orders o inner join customers c on o.customer_id=c.customer_id join order_statuses os on o.status=os.order_status_id;     # joining 3 tables
select o.order_id,o.order_date,c.first_name,c.last_name,os.name as "status" from orders o inner join customers c on o.customer_id=c.customer_id join order_statuses os on o.status=os.order_status_id order by order_id; 

# assingment
show databases;
use sql_invoicing;
show tables;
select * from clients;
select * from payments;
select * from payment_methods;
select * from  payments p inner join  clients c on p.client_id=c.client_id join payment_methods pm on p.payment_method =pm.payment_method_id;
select p.payment_id,p.date,p.amount,p.invoice_id,c.name,pm.name as 'payment details' from  payments p inner join  clients c on p.client_id=c.client_id join payment_methods pm on p.payment_method = pm.payment_method_id ;

#or the same in neat manner
show databases;
show tables;
select * from clients;
select * from payments;
select * from payment_methods;
select p.payment_id,c.name,p.invoice_id,p.date,p.amount,pm.name as 'payment mode' from payments p inner join clients c on p.client_id=c.client_id inner join payment_methods pm on p.payment_method=pm.payment_method_id;

#compound join conditions(it is used where we cannot identify the rows to find unique records in a single column) in a given table
#the composit primary key contain primary key, in more than one column
# we have multiple condition to join 2 tables
show databases;
use sql_store;
show tables;
select * from order_items;
select * from order_item_notes;
select * from order_items oi inner join order_item_notes oin on oi.order_id=oin.order_id and oi.product_id=oin.product_id;


#implicit join syntax  (recomended not to use ) insted of join statement we use where clause
#don't use implicit join(using from to join the table), insted of this use explict function(using join function)

use sql_store;
show tables;
select * from orders o join customers c on o.customer_id = c.customer_id;      #insted of this we cas use implicit join syntax  
select * from orders o, customers c where o.customer_id = c.customer_id;       # if you forget the where clause you will get the cross result ex:- we get 100 record where customer record =10,order record =10 where 10*10=100 every record in order table join the every record in customer table

#outer joins
# when we use the inner join for customer table and order table, it only prints the details of customer who has the order ,where if we want to print the customer details who dont have any order so we use outer joins

select * from customers;
select * from orders;
select c.customer_id,c.first_name,o.order_id from orders o join customers c on o.customer_id= c.customer_id;     # inner join ex
#in outer join we have 2 types left join ,right join
# all the records from the left table will return weather the condition is true or not
select c.customer_id,c.first_name,o.order_id from customers c left join orders o on o.customer_id= c.customer_id;           #(or u can use left outer join (outer is optional) ) it prints every thing on which are in left :-   all the record from the left table returns weather the condition is true or not
select c.customer_id,c.first_name,o.order_id from orders o right join customers c on o.customer_id= c.customer_id;          # (or u can use right outer join (outer is optional) )it prints everything which are in right   :-     all the record from the left table returns weather the condition is true or not

# assingment
use sql_store;
 show tables;
select * from products;
select * from order_items;
select oi.order_id,p.product_id,oi.quantity,oi.unit_price from products p left join order_items oi on p.product_id=oi.product_id;
select p.product_id,p.name,oi.quantity from order_items oi right outer join products p on oi.product_id=p.product_id;

# outer joins between multiple tables  ( where outer join prints the null values )
# avoid right joins and try to use always left  joins
show databases;
select * from customers;
select * from orders;
select * from shippers;
select c.customer_id,c.first_name,o.order_id,s.name as 'shipper name' from customers c left outer join  orders o on c.customer_id = o.customer_id left outer join shippers s on o.shipper_id=s.shipper_id;

#assingments
select * from order_statuses;
select * from orders;
select * from customers;
select * from shippers;
select o.order_date,o.order_id,c.first_name,s.name as 'shipper name',os.name as 'status' from customers c left outer join orders o on c.customer_id=o.customer_id left outer join order_statuses os on o.status=os.order_status_id left outer join shippers s on o.shipper_id=s.shipper_id;
select o.order_date,o.order_id,c.first_name,s.name as 'shipper name',os.name as 'status' from customers c inner join orders o on c.customer_id=o.customer_id left outer join order_statuses os on o.status=os.order_status_id left outer join shippers s on o.shipper_id=s.shipper_id order by status;

# self outer join

use sql_hr;
select * from employees;
select e.employee_id,e.first_name,e.reports_to,m.first_name as 'manager'  from employees e inner join employees m on e.reports_to=m.employee_id ;   #inner join it only prints an employee name who has an manager where the manager is not going to report to any one ,so for manager the reports_to is null so it does'nt print the details of manager
select e.employee_id,e.first_name,e.reports_to,m.first_name as 'manager'  from employees e left outer join employees m on e.reports_to=m.employee_id ;

# The using clause  , it is used when we are going to join 2 table with same column(attributes) name then we use "using clause"
use sql_store;
select * from orders o left outer join customers c on c.customer_id=o.customer_id;   # insted of on function in join clauses you can use using function
select o.order_id,c.first_name,o.status, s.name from orders o left outer join customers c using (customer_id) left outer join shippers s using (shipper_id);

 #working using (using clause)
 select * from order_items oi join order_item_notes oin on oi.order_id=oin.order_id and oi.product_id=oin.product_id;   # insted of this use using function
 select * from order_items oi join order_item_notes oin using (order_id,product_id);

use sql_invoicing ;
select p.date,c.name as client,p.amount,pm.name as "payment mode" from payments p inner join clients c using (client_id) inner join payment_methods pm on p.payment_method=pm.payment_method_id;

#natural joins :- (this is not recomanded because it gives unexpected output)  it only used where you want to join the 2 table with same column  
use sql_store;
select o.order_id,c.first_name from orders o natural join customers c order by order_id;

#cross joins (we used cross join, to combine every record from first table to every record from the second table
use sql_store;
select * from customers cross join products p order by first_name;
select c.first_name as customer,p.name as product from customers c cross join products p order by c.first_name ;  # or use next type both are one and the same, which are mentioned below

# assingment 
select s.name as shippers,p.name as products from shippers s,products p order by s.name;             # using implesit function 
select s.name as shippers,p.name as products  from shippers s cross join products p order by s.name;  # using explesit function


#----------------joins completed (join combine the column from multiple table)-------

# unions    (in sql we can combine rows from multiple table)
# problem:- if the table is current year mark it as active if not mark it as archived 
select * from orders;
select order_id,order_date, 'active' as status from orders where order_date>'2019-01-01' ;
select order_id,order_date,"active" as status from orders where order_date regexp "2019";    # this is more efficient to find this year
select order_id,order_date, "archived" as status from orders where order_date<"2019-01-01";
# by using union we can combine above 2 statement  (write union in between the two statement)
select order_id ,order_date,'active' as status from orders where order_date >"2019-01-01" union select order_id,order_date,"archived" as status from orders where order_date <"2019-01-01";
# the above operation is done for same table
# let we work this union operation in different database
# always the name of the column returns the first queri
#the number of attribute from first query should be equal to number of attribute of second query 
select first_name from customers;
select name from shippers;

select first_name from customers union select name from shippers;   # the union works the number of column of each quary returns should be equals

#assingment
select * from customers;

select customer_id,first_name,points,"bronze" as credit from customers where points <"2000" union 
select customer_id,first_name,points,"silver" as credit from customers where points between 2000 and 3000 union 
select customer_id,first_name,points,"gold" as credit from customers where points >=3000 order by first_name ;


# column attributes; (here we are going to learn update and delete data)
# inserting a single row
insert into customers 
values (default, 'jeevan','raj','1997-12-31',null,'bapujinagar','bangalore','ka',2455);
select * from customers;

# inserting multiple rows
select* from shippers;
insert into shippers (name)
values ("shipper1"),("shippers2"),("shipper3");
select * from shippers;

#assingment
insert into products 
values(default,"mobile",12,"4"),(default,"laptop",21,"2"),(default,"car",25,"4");
select * from products;
 
#inserting hierarchical rows
insert into orders (customer_id ,order_date,status)
values (1,"1997-12-31",1);
insert into order_items (order_id,product_id,quantity,unit_price)
values(last_insert_id(),5,3,1.15),(last_insert_id(),6,5,3.15),(last_insert_id(),9,9,1.15);

select * from order_items;
#if we want to know the last inserted elements 
select last_insert_id();

# creating a copy of a table  ( creating a new table and copying all the data from the existing table)  it is only possible working on the same database 
create table orders_archived as select * from orders;
select * from orders_archived ;           #or
truncate orders_archived;
# copying only subset of records from the orders table in to the orders_archived table 
# copying the records before order_date is 2019
insert into orders_archived select * from orders where order_date <'2019-01-01';
select * from orders_archived;

# assingment
use sql_store;
create table dummy_table as select * from customers where points >=3000;   # it only works in data contain in the same database with different table
select * from dummy_table;


#assingment
use sql_invoicing;
select * from clients;
select * from invoices;
select * from payments;
create table invoice_archade as
select i.invoice_id,i.number,c.name,i.invoice_total,i.payment_total,i.invoice_date,i.due_date,i.payment_date from invoices i inner join clients c using(client_id) where payment_date is not null;
select * from invoice_archade;
truncate invoice_archade;
drop table invoice_archade;

# updating a single row    if we want to update (change)any data in the existing database we use update function
use sql_invoicing;
select * from invoices;
update invoices set payment_total=10,payment_date='2019-01-01' where invoice_id=1;
update invoices set payment_date ="2019-10-20",payment_total =15 where invoice_id = 3;

# updating multiple rows:-  (if you want to update multiple rows first you want to switch off the safe update mode  )

select * from invoices;
update invoices set payment_total=invoice_total *0.5 ,payment_date=due_date  where client_id=5 ;    # if we want to perform this operation we must off the safe update mode

 #assingment
 use sql_store;
 select * from customers;
update customers set points=points+50 where birth_date <"1990-01-01";


# using subqueries in updates
use sql_invoicing;
select * from clients;
select * from invoices;
update invoices set payment_total=invoice_total *0.5 ,payment_date=due_date where client_id=(select client_id from clients where name = "myworks");  # insted of using the perticular number for mentioning it we use this type 
update invoices set payment_total=invoice_total *0.5 ,payment_date=due_date where client_id in (select client_id from clients where state in ("ca","ny") ); # insted of using the perticular number for mentioning it we use this type 
select * from invoices;
select client_id from clients where state in ("ca","ny");


#assingment

use sql_store;
select * from orders;
update orders set comments ="gold customer" where customer_id in (select customer_id from customers where points>3000);

# how to delete the data
# how to restore


