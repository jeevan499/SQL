
# test 1
create database exam_result;
show databases;
use exam_result;
show tables;

select * from bank_account_detail;
select * from bank_account_transacsion;
select * from bank_customaar;
select * from customaar;
select * from ordars;
select * from salesmen;

/* #1. Write a SQL query which will sort out the customer and their grade
who made an order. Every customer must have a grade and be served by at least one seller, who belongs to a region. */ 

select cust.customer_id, cust.cust_name,cust.city,cust.grade,ord.salesman_id
from customer as cust	
left join orders as ord on cust.custemor_id=ord.customer_id order by cust.city;


#2 Write a query for extracting the data from the order table for the salesman who earned the maximum commission.

select ord.ord_no,sale.salesman_id,sale.name,sale.city,max(sale.commision)
from orders as ord right join salesman as sale on ord.salesman_id=sale.salesman_id;


/* #3 From orders retrieve only ord_no, purch_amt, ord_date, ord_date, salesman_id where salesman’s city is Nagpur(Note salesman_id of
orderstable must be other than the list within the IN operator.) */

select ord.ord_no,ord.purch_amt,ord.ord_date,ord.salesman_id,sale.city
from orders as ord 
right join salesman as sale on ord.salesman_id = sale.salesman_id where sale.city = 'nagpur';


/* #4  Write a query to create a report with the order date in such a way
that the latest order date will come last along with the total purchase
amount and the total commission for that date is (15 % for all
sellers).*/

select ord.ord_no,sum(ord.purch_amt),ord.ord_date,sum(sale.commision)*.15 from orders 
as ord left join salesman as sale on ord.salesman_id = sale.salesman_id
order by ord.ord_date asc; 
#OR
select ord_date, sum(purch_amt),sum(purch_amt)*.15 from orders group by ord_date order
 by ord_date;



/* #5 Retrieve ord_no, purch_amt, ord_date, ord_date, salesman_id from Orders table and display only those sellers whose purch_amt is
greater than average purch_amt.*/

select ord_no,purch_amt,ord_date,salesman_id from orders as ord 
where purch_amt>(select avg(purch_amt) from orders);

#6 Write a query to determine the Nth (Say N=5) highest purch_amt from Orders table.

select purch_amt from orders order by purch_amt DESC limit 5,1;


#7. What are Entities and Relationships?

## # An Entity–relationship describes the structure of a database 
# with the help of a diagram,which is known as Entity Relationship Diagram .
 # An ER model is a design or blueprint of a database that can later be implemented as a database. 
 # The main components of E-R model are  entity set and relationship set.
 # model classifed 3 types  entity ,attribute,relatationship.
 
 
 
/* #8. Print customer_id, account_number and balance_amount, condition that if balance_amount is nil then assign transaction_amount for
account_type = "Credit Card" */ 

select customer_id,account_number,balance_amount,
case when balance_amount= 0 then 'Credit Card' else account_type 
end as account_type from bank_account_details;



/* #9 Print customer_id, account_number, balance_amount, conPrint account_number, balance_amount, transaction_amount from
Bank_Account_Details and bank_account_transaction for all the transactions occurred during march, 2020 and april, 2020. */ 

select Bank.customer_id,Bank.account_number,Bank.balance_amount,tran.transaction_amount 
from Bank_Account_details as bank 
left join Bank_account_transaction as tran on bank.account_number = tran.account_number 
where month(tran.transaction_date) = 3 or month(tran.transaction_date) = 4;




/* #10 Print all of the customer id, account number, balance_amount, transaction_amount from bank_cutomer, bank_account_details and
bank_account_transactions tables where excluding all of their transactions in march, 2020 month .*/ 

select cust.customer_id,cust.customer_name,bank.account_number,bank.balance_amount,
tran.transaction_amount,tran.transaction_date 
from bank_customer as cust
inner join bank_account_details as bank on cust.customer_id=bank.customer_id inner join 
bank_account_transaction as tran on bank.account_number=tran.account_number 
where month(tran.transaction_date) != 3;