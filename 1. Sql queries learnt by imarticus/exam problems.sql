use exam;

/* #1)Write a SQL query which will sort out the customer and their grade 
  who made an order. Every customer must have a grade and be served  
  by at least one seller, who belongs to a region  */
  
select cust_name,c.customer_id,c.grade,o.ord_no,s.name,s.city from customer c inner join orders o using(customer_id) inner join salesman s using(salesman_id) ;

# 2)Write a query for extracting the data from the order table for the 
  #salesman who earned the maximum commission.

select ord_date from orders where salesman_id=(select salesman_id from salesman group by commision order by commision desc limit 1)  ;

  #3 From orders retrieve only ord_no,purch_amt,ord_date,
  #salesman_id where salesman's city is Nagpur (Note salesman_id of 
  #orderstable must be other than the list within the IN operator.)

select ord_no,purch_amt,ord_date,salesman_id from orders where salesman_id IN (select salesman_id from salesman where city='nagpur');

/*  #4. Write a query to create a report with the order date in such a way 
that the latest order date will come last along with the total purchase 
amount and the total commission for that date is (15 % for all 
sellers). */

alter table orders modify ord_date date; 

select ord_date,sum(purch_amt) as 'total purchase amount',sum(sales.commision)*0.15 ;
select str_to_date(ord_date, '%Y-%m-%d') from orders;
select ord_date from orders;
select date_format(ord_date, '%d-%m-%Y') from orders;

alter table orders drop new_date;
alter table orders add new_date date after ord_date;
update orders set new_date= ;

desc orders;
update ordes set new_date=str_todate;
select * from orders;







select ord.ord_no,sum(ord.purch_amt),ord.ord_date,sum(sale.commision)*.15 from orders 
as ord left join salesman as sale on ord.salesman_id = sale.salesman_id
order by ord.ord_date asc; 
#OR
select ord_date, sum(purch_amt),sum(purch_amt)*.15 from orders group by ord_date order
 by ord_date;


#5. Retrieve ord_no, purch_amt, ord_date, ord_date, salesman_id from 
#Orders table and display only those sellers whose purch_amt is 
#greater than average purch_amt.

select ord_no,purch_amt,ord_date,salesman_id from orders where purch_amt>(select avg(purch_amt) from orders); 

#6. Write a query to determine the Nth (Say N=5) highest purch_amt from
#Orders table.

select * from orders order by purch_amt desc limit 4,1;

-- 7. What are Entities and Relationships?

/* Entities:- An entity is an easily recognizable living or non-living real world object  
ex:- customer,employee , products 

Relationships:- An relationship is a association between two entities 
ex:- customer buyes a product

ER-Diagram
entity relationship diagram displays the relationship between the entities stored in a database
In technical language er-diagram shows the logical structure of a database

its considered as a best practice to design er-diagram before implementing your database

ER data model is the notion of real world entities and relationship between them      (notion:- notion is an all in one relationship, where you can write,plan,collaborate and get organized)
  
An ER model describes the structure of a database with the help of diagram, which is known as entity relationship diagram
An ER model is a design or blueprint of a database that can later be implemented as a database */



#8. Print customer_id, account_number and balance_amount, condition 
#that if balance_amount is nil then assign transaction_amount for 
#account_type = "Credit Card"

create or replace view a as (select Customer_id,Account_Number,Balance_amount,case when balance_amount = 0 then 'credit card' else account_type end account_type
from bank_account_details);

create or replace view b as (select account_number,case when balance_amount =0 then transaction_amount else balance_amount end balance_amount
from badt);
select * from b;
create or replace view badt as(select bad.account_number,Transaction_amount,Balance_amount from bank_account_details bad inner join bank_account_transaction using (account_number));
select * from badt;
select a.customer_id,a.account_number,b.Balance_amount,a.account_type from a inner join b using (account_number);


#9. Print customer_id, account_number, balance_amount, balance_amount, transaction_amount from 
#Bank_Account_Details and bank_account_transaction for all the 
#transactions occurred during march, 2020 and april, 2020.

select customer_id,bad.account_number,balance_amount,transaction_amount,Transaction_Date from bank_account_transaction bat left join bank_account_details bad 
on bat.Account_Number=bad.Account_Number where month(Transaction_Date)=3 or month(Transaction_Date)=4 order by Transaction_Date;

/* #10 Print all of the customer id, account number, balance_amount, transaction_amount from bank_cutomer, bank_account_details and
bank_account_transactions tables where excluding all of their transactions in march, 2020 month .*/ 

select customer_id,bad.account_number,balance_amount,Transaction_amount,transaction_date from bank_account_details bad left join bank_account_transaction bat
on bad.Account_Number=bat.Account_Number where not month(Transaction_Date) =3;


#8. Print customer_id, account_number and balance_amount, condition 
#that if balance_amount is nil then assign transaction_amount for 
#account_type = "Credit Card"

create or replace view acc as (select customer_id,account_number,balance_amount, case when balance_amount = 0 then 'credit card'
 else account_type end as account_type from bank_account_details) ; 
 
 create or replace view bcc as (select account_number,case when balance_amount =0 then transaction_amount 
 else balance_amount end balance_amount from badbat) ;

create view badbat as select customer_id,bad.account_number,balance_amount,transaction_amount from bank_account_details bad inner join 
bank_account_transaction bat using (account_number) ;


drop view acc;
select acc.customer_id,acc.account_number,bcc.balance_amount,acc.account_type from acc inner join bcc on acc.account_number =bcc.account_number;



