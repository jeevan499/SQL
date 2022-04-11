create database sample_database;

show databases;

use sample_database;

create table products  (
	product_id 	int not null primary key,
    product_name	varchar(100) 	not null,
    price		int 	not null);
    
show tables;    

alter table products add column quantity tinyint not null  default 10;

desc products;

insert into products  values 
	(1, 'Bajaj Platina', 70000,20),
    (2, 'Honda Activa', 75000,20),
    (3, 'RX 100', 90000, 15);
    
select * from products; 

select product_name, price from products
where product_name like 'Honda%'; 

insert into products values (4, 'Honda Duo',70000, 15); 

select product_name, price from products
where price between 70000 and 90000; 

update products set
	price = 78000
where product_name = 'Honda Activa';

update products set
	price = price * 1.05
where product_name like 'Honda%';  

alter table products add column discount tinyint null;  

select * from products;

update products set
	discount = 5
where product_name like 'Bajaj%';   

select product_name, price * discount from products;

select product_name, price,
 round(price - price * (ifnull(discount,1) /100)) as "Min sell Price"
 from products;
 
 delete from products 
 where product_name like 'Bajaj%';
    