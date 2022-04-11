use customer_info;

create table testtbl (
	name 	varchar(10) not null,
    salary	int not null);

insert into testtbl values 
		('Anand',50000),
        ('Akshay',45000),
        ('Amy',50000),
        ('Bill',45000),
        ('John',30000),
        ('Abhi',45000);
        
select salary from testtbl 
order by salary; 


select salary, row_number() over (order by salary desc)
from testtbl;   

select salary, dense_rank() over (order by salary desc) as ranknum
from testtbl;  

select salary from 
(select salary, row_number() over (order by salary desc) as rownum
from testtbl) t1
where rownum = 2; 

select  salary from 
(select salary, dense_rank() over (order by salary desc) as ranknum
from testtbl) t1
where ranknum = 2
limit 1;    
    