create database if not exists imarticus_exams;
use imarticus_exams;

# To convert in to date format
select * from orders;
alter table orders add column ord_date1 date after ord_date;
update orders set ord_date1 = str_to_date(ord_date , '%d/%m/%Y');
alter table orders drop ord_date;
alter table orders change ord_date1 ord_date date;

# There was a spell mistake in your dataset so correcting the table name
alter table customer change custemor_id customer_id int;


desc orders;

/*1. Write a SQL query which will sort out the customer and their grade
who made an order. Every customer must have a grade and be served
by at least one seller, who belongs to a region.*/

select cust_name customer ,grade from customer c inner join orders o on c.customer_id=o.customer_id inner join salesman s on o.salesman_id = s.salesman_id
and c.grade is not null and s.city is not null;

-- 2. Write a query for extracting the data from the order table for the salesman who earned the maximum commission.

select ord_no,purch_amt,ord_date,salesman_id from orders where salesman_id=(select salesman_id from salesman group by commision order by commision desc limit 1);

/*# 3. From orders retrieve only ord_no, purch_amt, ord_date, ord_date, salesman_id where salesman’s city is Nagpur(Note
salesman_id of orderstable must be other than the list within the IN operator.)    */

select ord_no,purch_amt,ord_date,salesman_id from orders where salesman_id not in(select salesman_id from salesman 
where city='nagpur');

/* 4. Write a query to create a report with the order date in such a way that the latest
 order date will come last along with the total purchase amount and the total commission for that date is (15 % for all sellers).  */
 
select ord_date,sum(purch_amt) 'total purchase amount',sum(purch_amt *0.15) 'total commission' from orders 
group by ord_date order by ord_date;
 
 /* 5. Retrieve ord_no, purch_amt, ord_date, 
 salesman_id from Orders table and display only those sellers whose purch_amt is greater than average purch_amt.*/
 
select ord_no,purch_amt,ord_date,salesman_id from orders where purch_amt>(select avg(purch_amt) from orders);

 /* 6. Write a query to determine the Nth (Say N=5) highest purch_amt from Orders table. */

select purch_amt from orders group by purch_amt order by purch_amt desc limit 4,1;

#or using dense_ranking 
select purch_amt from (select purch_amt,dense_rank() over (order by purch_amt desc) n from orders) t where n=5;

/* 7. What are Entities and Relationships?

Entities:- An Entities can be easily recognizable living or non living real world object 
Tables store data that represents one type of entity.
For example:– A bank database has a customer table to store customer information.
Customer table stores this information as a set of attributes (columns within the table) for each customer.

Relationships: Relation is an association between 2 entities.
For example:– The customer name is related to the customer account number and contact information, 
which might be in the same table. There can also be relationships between separate tables (for ex:- customer buyes a product)*/

 /* 8. Print customer_id, account_number and balance_amount, 
 condition that if balance_amount is nil then assign transaction_amount for account_type = "Credit Card" */
 
select customer_id,bad.account_number,case when ifnull(balance_amount,0) =0 then transaction_amount 
else balance_amount end balance_amount from bank_account_details bad inner join bank_account_transaction bat 
on bad.account_number =bat.account_number and account_type = 'credit card';

/* 9. Print customer_id, account_number, balance_amount,  transaction_amount
from Bank_Account_Details and bank_account_transaction
for all the transactions occurred during march, 2020 and april, 2020   */

select bad.account_number,balance_amount,transaction_amount,transaction_date from bank_account_details bad inner join bank_account_transaction bat
on bad.account_number=bat.account_number where transaction_date between '2020-03-01' and '2020-04-31';

/* 10. Print all of the customer id, account number, balance_amount,transaction_amount
from bank_cutomer,bank_account_details
and bank_account_transactions tables where excluding all of their transactions in march, 2020 month  */

select customer_id,bad.account_number, balance_amount,transaction_amount,transaction_date from bank_account_details bad left join bank_account_transaction bat
on bad.account_number=bat.account_number and transaction_date not like '2020-03%';


