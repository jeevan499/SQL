use customer_info;
select * from order_info;

delete from order_info where order_id = 2;

create table product_sales (
	item_type varchar(20) not null,
    num_item	smallint not null,
    store_type	varchar(10) not null default "Medium",
    sales	int not null,
   check (store_type in ("Large","Medium","Small"))
    );
    
insert into product_sales values ("Dairy",40, "Small", 3000);
insert into product_sales values ("Snacks",100, "Medium", 5000);
insert into product_sales values ("Soft Drinks",30, "Small", 1500);
insert into product_sales values ("Groceries",120, "Large", 10000);
insert into product_sales values ("Fruits",50, "Small", 2000);

insert into product_sales values ("Dairy",200, "Big", 10000);


select * from product_sales;
truncate table product_sales;
drop table product_sales;

SELECT 	Item_Type, Num_Item, Sales 
FROM 	product_sales 
Where 	Sales >= 2000 and 
		num_item between 60 and 100;
        
select * from personal_info where city is not null;    
update personal_info set
		city = null
where city = "Boston";        

select * from product_sales order by sales desc;

insert into product_sales values ("Snacks", 25, "Small", 2500);
insert into product_sales values ("Drinks", 25, "Medium", 3500);

use customer_info;
select * from product_sales;
select * from product_sales
where sales < 5000 and
	(item_type like 'S%' or item_type like 'F%');
    
select count(*) from product_sales where item_type like 'S%'; 
select min(sales), max(sales), avg(sales) from product_sales;   
select distinct item_type from product_sales;

desc movie_metadata;
select count(*) from movie_metadata;

alter table movie_metadata modify duration int;

update movie_metadata set
	duration = null
where rtrim(duration) = '';

update movie_metadata set
	gross = null
where rtrim(gross) = '';
alter table movie_metadata modify gross int;

select 
	movie_title, 
    duration, 
    gross, 
    budget, 
    (budget - gross) as 'revenue' 
from movie_metadata
where movie_title like "%Lord of the%";

select * from product_sales;
select item_type,  sum(sales) from product_sales
where sales > 2000
group by item_type;
