use inclass;
## 1
select * from bank_inventory_pricing;
select product, price, sum(quantity)
from bank_inventory_pricing
group by product
having sum(quantity) > 5;


## 2
select product, quantity, month, count(*)
from bank_inventory_pricing
where Estimated_sale_price < purchase_cost
group by product;

##3
select est_sale_price from (select distinct ifnull(estimated_sale_price,0) est_sale_price
from bank_inventory_pricing
order by estimated_sale_price desc
limit 3) price
order by est_sale_price
limit 1;

select est_sale_price from (
	select distinct ifnull(estimated_sale_price,0) as est_sale_price, 
    row_number() over (order by estimated_sale_price desc) as row_num
from bank_inventory_pricing) t
where row_num = 3;

select est_sale_price from (
	select distinct ifnull(estimated_sale_price,0) as est_sale_price, 
    dense_rank() over (order by estimated_sale_price desc) as row_num
from bank_inventory_pricing) t
where row_num = 3;

## 4
select product, count(product)
from bank_inventory_pricing
group by product
having count(product) > 1;

select count(*) from (select product, count(product)
from bank_inventory_pricing
group by product
having count(product) > 1) t;
 
 ## 5
 create or replace view bank_details as
	select * from bank_inventory_pricing
    where product = 'PayPoints' and
		quantity > 2;

select product, quantity from bank_inventory_pricing
where product = 'PayPoints';   
     
select * from bank_details;    

## 6
create or replace view bank_details1 as
		select * from bank_inventory_pricing;
select * from bank_details1;        
insert into bank_details1 values ('PayPoints',3, 410.67,null, 425.98,3); 
select * from bank_details;    

## 7
desc bank_branch_pl; 
select * from bank_branch_pl;

select branch, product, (revenue - cost) as realprofit, Estimated_profit
from bank_branch_pl
where (revenue - cost) > Estimated_profit;

##8
select month, min(revenue - cost) as realprofit
from bank_branch_pl
group by month;

##9
alter table bank_inventory_pricing modify quantity char(5);

select product, lpad(quantity,5,'0')
from bank_inventory_pricing;

##11 

select branch, product, (revenue - cost * (1 - .3)) as realprofit, Estimated_profit
from bank_branch_pl
where (revenue - cost * (1 - .3)) > Estimated_profit;

##12
select * from bank_inventory_pricing
where product not in ('BusiCard','SuperSave');

##13
use database_ex;
select * from bank_inventory_pricing
where price between 220 and 300;

## 14
select product, count(product) 
from bank_inventory_pricing
group by product
having count(product) = 1;
select i.* from bank_inventory_pricing i
inner join (select product, count(product) 
from bank_inventory_pricing
group by product
having count(product) = 1) t on
i.product = t.product
limit 5;

select * from (select * from bank_inventory_pricing 
group by product
having count(product) = 1) t
limit 5;

## 15
update bank_inventory_pricing set
	price = price * 1.15
where quantity > 3; 

##16
select round(price) from bank_inventory_pricing;   

##17
alter table bank_inventory_pricing modify product varchar(30);

## 18
alter table bank_inventory_pricing add column new_price float;
desc bank_inventory_pricing;
select product, price, quantity, new_price from bank_inventory_pricing;
update bank_inventory_pricing set
	new_price = price + 100
where quantity > 3;

##19
desc bank_account_details;
select * from bank_account_details;
select * 
from bank_account_details a
where a.account_type = 'SAVINGS';
select * 
from bank_account_details a
where a.account_type = 'SAVINGS' and
	exists( select customer_id from bank_account_details b
			where b.customer_id = a.customer_id and
				  b.account_type  = 'Add-on Credit Card') and
	exists( select 1 from bank_account_details c
			where c.customer_id = a.customer_id and
				  c.account_type  = 'Credit Card');
                  
## 20
desc bank_account_transaction;	
desc bank_account_relationship_details;	

select tr.account_number, ac.account_type 'Tran Ac Type', 
	transaction_amount, linking_account_number, 
	la.account_type 'Linking Ac Type'
from bank_account_transaction tr
left join bank_account_relationship_details la
	on tr.account_number = la.account_number 
left join bank_account_details ac
	on ac.account_number = tr.account_number;
    
## 21
desc bank_account_transaction;
select ac.account_number, sum(transaction_amount)
from bank_account_transaction tr
inner join bank_account_details ac
	on tr.account_number = ac.account_number
inner join bank_account_relationship_details rl on
	tr.account_number = rl.linking_account_number 
where ac.account_type = 'Credit Card' and
	rl.account_type = 'Add-on Credit Card'
group by ac.account_number;

#22
desc bank_account_transaction;
alter table bank_account_transaction add column yearmonth int;

update bank_account_transaction set
	yearmonth = convert(concat(convert(year(transaction_date),char(4)),convert(month(transaction_date),char(2))),signed)
;

## The alternate update statement using extract function
	update bank_account_transaction set
		yearmonth = extract(YEAR_MONTH from transaction_date);
        
select transaction_date, extract(year_month from transaction_date) 
from bank_account_transaction;
        
select cm.account_number, cm.cm_tran_amount, pm.pm_tran_amount
from (select account_number, sum(transaction_amount) as cm_tran_amount
from bank_account_transaction 
where yearmonth = (select max(yearmonth) from bank_account_transaction)
group by account_number) cm
inner join (
select account_number, sum(transaction_amount) as pm_tran_amount
from bank_account_transaction 
where yearmonth < (select max(yearmonth) from bank_account_transaction)
group by account_number) pm
on cm.account_number = pm.account_number;

##23
select cm.account_number, cm.cm_tran_amount
from (select account_number, sum(transaction_amount) as cm_tran_amount
from bank_account_transaction 
where yearmonth = (select max(yearmonth) from bank_account_transaction)
group by account_number) cm
inner join (
select account_number, sum(transaction_amount) as pm_tran_amount
from bank_account_transaction 
where yearmonth < (select max(yearmonth) from bank_account_transaction)
group by account_number) pm
on cm.account_number = pm.account_number and
	cm.cm_tran_amount > pm.pm_tran_amount;

## 24

select ac.customer_id, count(ac.customer_id)
from bank_account_transaction tr
inner join bank_account_details ac
on  ac.account_number = tr.account_number 
where ac.account_type like '%Credit%'
group by customer_id;

##25

select employee_id , first_name ,last_name phone_number ,salary, job_id from employee_details inner join
department_details using(employee_id) where department_name  =  "Contracting" ;
## 26
select * from bank_account_details;
select ac.customer_id, count(ac.customer_id)
from bank_account_transaction tr
inner join bank_account_details ac
	on ac.account_number = tr.account_number
where ac.account_type in ('SAVINGS','RECURRING DEPOSITS')
group by ac.customer_id
having count(ac.customer_id) > 4;

# Result verification

select ac.customer_id, tr.account_number as "tran Ac #", ac.account_type
from bank_account_transaction tr
inner join bank_account_details ac
	on ac.account_number = tr.account_number
where ac.account_type in ('SAVINGS','RECURRING DEPOSITS');

select * from employee_details;

#27
select employee_id, first_name, last_name , phone_number ,email, job_id
from employee_details  where job_id not in ('IT_PROG');


##29
select employee_id , first_name ,last_name phone_number ,salary, job_id from employee_details inner join
department_details using(employee_id) where department_details.manager_id  =  60;
 ;

#30
create table emp_dept as 
select employee_id , first_name ,last_name phone_number ,salary, job_id from employee_details inner join
department_details using(employee_id);