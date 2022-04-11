drop database if exists view_examples;
create database view_examples;
use view_examples;

create table category (
catid tinyint primary key,
catname varchar(50) not null);

insert into category values (1, 'Furniture'),(2,'Technology'),(3,'Accessories');

create table subcategory (
scatid tinyint primary key,
catid tinyint not null,
scatname varchar(50) not null,
foreign key (catid) references category(catid));

insert into subcategory values (1,1,'Tables'),(2,1,'Chairs'),(3,1,'Book Stand'),
	(4,2,'HP Printer'),(5,2,'Dell Laptop'),
    (6,3,'Ink Catridge'),(7,3,'Pen Stand');

    
create table product (
prdid int primary key,
scatid tinyint not null,
prdname varchar(50) not null,
price	int not null,
foreign key (scatid) references subcategory(scatid));

insert into product values (1, 1, 'Computer Table',1000),(2,1,'Executive Table',8000),
	(3,2,'Simple Chair',800),(4,2,'Chair with Armrest',2500),
    (5,3,'6 ft bookstand',3000),(6,4,'Inkjet Printer',5500),(7,5,'15inch laptop',35000),
    (8,6,'Cat Replacement',600),(9,7,'Desk pen stand',200);
 
 drop view if exists product_details ;
 
create view product_details as                 # using join view function 
select p.prdid as Product_id, 
	p.prdname as Product_name, 
    s.scatname as SubCatgory_name, 
    c.catname as Category_name, 
    p.price as Product_Price
from product p
inner join subcategory s on p.scatid = s.scatid
inner join category c on s.catid = c.catid;

select * from product_details where Product_price < 1000;

select * from product_details;

--      other way of writing the above code;

select p.prdid as product_id, p.prdname as product_name, s.scatid as subcatgory_name,c.catname as category_name, p.price as product_price from category c inner join subcategory s using (catid) inner join product p using (scatid) where price <1000;

drop view if exists dummy;
create view dummy as
select prdid as product_id,
prdname as product_name,
scatname as subcatgory_name,
catname as category_name,
price as product_price from category inner join subcategory using(catid) inner join product using(scatid);

select * from dummy;
