/* 1. Write a SQL query which will sort out the customer and their grade who made an order. 
Every customer must have a grade and be served by at least one seller, who belongs to a region.*/

select c.cust_name customer,grade from customer c inner join orders o on c.customer_id = o.customer_id inner join salesman s on 
o.salesman_id =s.salesman_id and grade is not null and s.city is not null;

-- 2. Write a query for extracting the data from the order table for the salesman who earned the maximum commission.

select * from orders o where salesman_id =(select salesman_id from salesman group by commision order by commision desc limit 1) ;

/*# 3. From orders retrieve only ord_no, purch_amt, ord_date, ord_date, salesman_id where salesman’s city is Nagpur(Note
salesman_id of orderstable must be other than the list within the IN operator.)    */

select o.ord_no,o.purch_amt,o.ord_date,ord_date,o.salesman_id from orders o where salesman_id not in (select salesman_id from salesman 
where city ='nagpur');

/* 4. Write a query to create a report with the order date in such a way that the latest
 order date will come last along with the total purchase amount and the total commission for that date is (15 % for all sellers).  */
 
select ord_date,sum(purch_amt) 'total purchase amount', sum(purch_amt*.15) commission from orders group by ord_date order by ord_date;
 
 /* 5. Retrieve ord_no, purch_amt, ord_date, ord_date,
 salesman_id from Orders table and display only those sellers whose purch_amt is greater than average purch_amt.*/
 
select ord_no,purch_amt,ord_date,ord_date,salesman_id from orders where purch_amt >(select avg(purch_amt) from orders);
 
 /* 6. Write a query to determine the Nth (Say N=5) highest purch_amt from Orders table. */

select * from (select * from orders group by purch_amt order by purch_amt desc limit 5) t order by purch_amt limit 1;
select * from orders group by purch_amt order by purch_amt desc limit 4,1;

/* 7. What are Entities and Relationships? 

Entities:- An Entity is easily recognizeable living and non living real world object 
ex:- customer,student,product

relationship:- relationship associate having the relationship between two entities 
ex:- customer buyes a product 

it is considered as a best practice to draw entity relationship diagram (ER diagram) before implimenting your database*/





 /* 8. Print customer_id, account_number and balance_amount, 
 condition that if balance_amount is nil then assign transaction_amount for account_type = "Credit Card" */
 
select customer_id,bad.account_number,balance_amount ,case when ifnull (balance_amount,0) =0 then transaction_amount else balance_amount end balance_amount
from bank_account_details bad inner join bank_account_transaction bat on bad.account_number=bat.account_number and account_type= 'credit card';


 /* 9. Print customer_id, account_number, balance_amount,  transaction_amount
from Bank_Account_Details and bank_account_transaction
for all the transactions occurred during march, 2020 and april, 2020   */

select customer_id,bad.account_number,balance_amount,transaction_amount,transaction_date from bank_account_details bad inner join bank_account_transaction bat
on bad.account_number =bat.account_number
where transaction_date between '2020-03-01' and '2020-04-31';


/* 10. Print all of the customer id, account number, balance_amount,transaction_amount
from bank_cutomer,bank_account_details
and bank_account_transactions tables where excluding all of their transactions in march, 2020 month  */

select bad.customer_id,bad.account_number,bad.balance_amount,bat.transaction_amount,transaction_date from bank_account_details bad left join bank_account_transaction bat
on bad.account_number = bat.account_number and transaction_date not like '2020-03%';

