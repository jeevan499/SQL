use customer_info;
use emp;

desc employee;
drop procedure if exists proc_cust_insert;
delimiter //

create procedure proc_cust_insert (
	in v_emp_id  int,
	in v_emp_name  varchar(20),
	in v_emp_desig  varchar(20),
	in v_rep_to  int,
	out v_msg  varchar(50)
)
begin
	declare v_mgr_id int;
    select emp_id 
		into v_mgr_id 
	from employee
    where emp_id = v_rep_to;
    
    if (v_mgr_id > 0) then
		insert into employee values 
			(v_emp_id, v_emp_name, v_emp_desig, v_rep_to);
		set v_msg = 'Row Inserted';
	else
		set v_msg = 'Reporting Manager Id is not found!';
	end if;
end//
delimiter ; 

set @msg = "";
call proc_cust_insert(10,'Bill','Software Eng',1, @msg);
select @msg;
call proc_cust_insert(11,'Amy','Software Eng',5, @msg);
select @msg;
select * from employee;