use customer_info;

create table products (
	prdid 	int primary key auto_increment,
    prdname	varchar(20) not null,
    price	float not null,
    discount	float);
    
insert into products(prdname, price, discount) values 
		('abc', 10.25, null),('xyz',11.35,5.0),('def',21.0,8.0);

insert into products (prdname, price, discount) values
	('pqr',25.50, 15),('rst',35.02,18);
select * from products;        

        
select prdname, price , 
	case 
		when ifnull(discount, 0) = 0 then 10
        when discount > 15 then 15
        else discount 
	end as 'discount'
from products;        