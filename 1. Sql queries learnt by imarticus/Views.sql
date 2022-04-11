create view savings_account_details as
	select 	* 
    from 	bank_account_details 
	where 	account_type = "SAVINGS" and
			account_status = "ACTIVE";
            
create view row_column_subset_bank_view as
select customer_id, Account_number, account_type, Balance_amount
	from bank_account_details where account_status = 'ACTIVE';
    
create or replace view cust_ac_balance_view as
		select customer_id, sum(balance_amount) "Total_Balance"
        from bank_account_details
        group by customer_id;
        
select * from cust_ac_balance_view;        
    
    select * from row_column_subset_bank_view;

#where account_status = "ACTIVE";
            
select * from savings_account_details;    
select * from bank_account_details;    

use join_examples;    

create or replace view cum_cust_sales as
select customerid, sum(SalesValue) total_balance
from cus_sales 
group by customerid;

insert into cus_sales values (7, 'c4',10000), (7, 'c3', 2000), (8, 'c1', 4000), (8, 'c2',2500);
insert into cus_sales values (9, 'c5',1000), (9, 'c6', 2000);
select * from cum_cust_sales;