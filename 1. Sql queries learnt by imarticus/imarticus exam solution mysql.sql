/*
1. Write a SQL query which will sort out the customer and their grade who made an order. Every customer must have a grade and be served by at least one seller, who belongs to a region.
2. Write a query for extracting the data from the order table for the salesman who earned the maximum commission.
3. From orders retrieve only ord_no, purch_amt, ord_date, ord_date, salesman_id where salesman’s city is Nagpur(Note salesman_id of orderstable must be other than the list within the IN operator.)
4. Write a query to create a report with the order date in such a way that the latest order date will come last along with the total purchase amount and the total commission for that date is (15 % for all sellers).
5. Retrieve ord_no, purch_amt, ord_date, ord_date, salesman_id from Orders table and display only those sellers whose purch_amt is greater than average purch_amt.
6. Write a query to determine the Nth (Say N=5) highest purch_amt from Orders table.
7. What are Entities and Relationships?
8. Print customer_id, account_number and balance_amount, condition that if balance_amount is nil then assign transaction_amount for account_type = "Credit Card"
9. Print customer_id, account_number, balance_amount, conPrint account_number, balance_amount, transaction_amount from Bank_Account_Details and bank_account_transaction for all the transactions occurred during march, 2020 and april, 2020.
10. Print all of the customer id, account number, balance_amount, transaction_amount from bank_cutomer, bank_account_details and bank_account_transactions tables where excluding all of their transactions in march, 2020 month .
*/
/*
1. Write a SQL query which will sort out the customer and their grade who made an order.
 Every customer must have a grade and be served by at least one seller, who belongs to a region.  */
 
 select c.cust_name customer,c.grade Grade from customer c inner join orders o using (customer_id)
 inner join salesman s using(salesman_id) ;

#or

SELECT customer.cust_name AS "Customer",
customer.grade AS "Grade"
FROM orders, salesman, customer
WHERE orders.customer_id = customer.customer_id
AND orders.salesman_id = salesman.salesman_id
AND salesman.city IS NOT NULL
AND customer.grade IS NOT NULL;

# 2. Write a query for extracting the data from the order table for the salesman who earned the maximum commission.

select ord_no,purch_amt,ord_date,salesman_id from orders where salesman_id = (select salesman_id from salesman group by commision order by commision desc limit 1) ;

SELECT ord_no, purch_amt, ord_date, salesman_id
FROM orders
WHERE salesman_id IN(
SELECT salesman_id
FROM salesman
WHERE commision = (
SELECT MAX(commision)
FROM salesman));


/*# 3. From orders retrieve only ord_no, purch_amt, ord_date, ord_date, salesman_id where salesman’s city is Nagpur(Note
salesman_id of orderstable must be other than the list within the IN operator.)    */

select ord_no,purch_amt,ord_date,salesman_id from orders where salesman_id not in(
select salesman_id from salesman where city='nagpur');

SELECT ord_no, purch_amt, ord_date, ord_date, salesman_id
FROM orders
WHERE salesman_id NOT IN(
SELECT salesman_id FROM salesman
WHERE city='Nagpur');

/* 4. Write a query to create a report with the order date in such a way that the latest
 order date will come last along with the total purchase amount and the total commission for that date is (15 % for all sellers).  */
 
 SELECT ord_date, SUM(purch_amt) 'total purchase amount',SUM(purch_amt)*.15 'total commission' 
FROM orders
GROUP BY ord_date
ORDER BY ord_date;

/* 5. Retrieve ord_no, purch_amt, ord_date, ord_date,
 salesman_id from Orders table and display only those sellers whose purch_amt is greater than average purch_amt.*/
 
 select ord_no,purch_amt,ord_date,salesman_id from orders where purch_amt>(select avg(purch_amt) from orders); 

SELECT ord_no, purch_amt, ord_date,  salesman_id
FROM Orders WHERE purch_amt>
(SELECT AVG(purch_amt) FROM Orders);

/* 6. Write a query to determine the Nth (Say N=5) highest purch_amt from Orders table. */

select purch_amt from (select purch_amt,dense_rank() over (order by purch_amt desc) n  from orders ) n where n=5;

select purch_amt from (select purch_amt from orders group by purch_amt order by purch_amt desc) t limit 4,1;

/* 7. What are Entities and Relationships?
Entities: A person, place, or thing in the real world about which data can be stored in a database. 
Tables store data that represents one type of entity.
 For example – A bank database has a customer table to store customer information. 
 Customer table stores this information as a set of attributes (columns within the table) for each customer.
Relationships: Relation or links between entities that have something to do with each other.
 For example – The customer name is related to the customer account number and contact information, 
 which might be in the same table. There can also be relationships between separate tables (for example, customer to accounts).*/
 
 /* 8. Print customer_id, account_number and balance_amount, 
 condition that if balance_amount is nil then assign transaction_amount for account_type = "Credit Card" */
 
 select customer_id,ba.account_number,balance_amount ,case when ifnull(balance_amount,0) =0  then transaction_amount  else balance_amount
 end as balance_amount from bank_account_details ba inner join bank_account_transaction bat on ba.account_number =bat.account_number and  account_type = 'credit card' ;

Select customer_id , ba.account_number,Case when ifnull(balance_amount,0) = 0 then Transaction_amount else
balance_amount end as balance_amount from Bank_Account_Details ba
inner join  bank_account_transaction bat on ba.account_number = bat.account_number
and account_type = "Credit Card";

/* 9. Print customer_id, account_number, balance_amount,  transaction_amount
from Bank_Account_Details and bank_account_transaction
for all the transactions occurred during march, 2020 and april, 2020   */

select bad.customer_id,bad.account_number,bad.balance_amount,bat.transaction_amount,bat.transaction_date from bank_account_details bad right join bank_account_transaction bat
using (account_number)	where transaction_date between '2020-03-01' and '2020-04-31'; 
select * from bank_account_transaction; 

Select
ba.Account_Number,Balance_amount, Transaction_amount, Transaction_Date
from Bank_Account_Details ba
inner join
bank_account_transaction bat
on ba.account_number = bat.account_number
And ( Transaction_Date between "2020-03-01" and
"2020-04-30");

/* 10. Print all of the customer id, account number, balance_amount,transaction_amount
from bank_cutomer,bank_account_details
and bank_account_transactions tables where excluding all of their transactions in march, 2020 month  */

select bad.customer_id,bad.account_number,bad.balance_amount,bat.transaction_amount,transaction_date
 from bank_account_details bad 
left join bank_account_transaction bat
on bad.account_number =bat.account_number
and transaction_date not like '2020-03%';

Select ba.Customer_id,ba.Account_Number,Balance_amount, Transaction_amount, Transaction_Date
from Bank_Account_Details ba
Left join bank_account_transaction bat
on ba.account_number = bat.account_number
And NOT ( date_format(Transaction_Date , '%Y-%m') = "2020-03" );
use exam;