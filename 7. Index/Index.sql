create database index_info;
use index_info;
select * from insurance;
select region from insurance where region = 'southwest';
select count(*) from orders;	
select * from orders;
select Customer_Name from orders where customer_Name like 'ki%r';

create index name_idx on orders (customer_name);
select max(length(customer_name)) from orders;
alter table orders modify customer_name varchar(25);

select Customer_Name from orders where customer_Name like 'ki%r';
show index from orders;
drop index name_idx on orders;




