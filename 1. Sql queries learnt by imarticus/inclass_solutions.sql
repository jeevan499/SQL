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
