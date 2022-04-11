use customer_info;

## Scope of Views                           # there are 2 types of check option :- with cascaded check option ,with local check option

## With check Option
drop table if exists t2;
create table t2 (
	name	varchar(20),
    country	varchar(20));
    
create or replace view usa_names as
		select name, country from t2
        where country = 'USA';

insert into usa_names values ('Bill','USA');
insert into usa_names values ('John','Canada');

select * from t2;
select * from usa_names; 

alter view usa_names as
	select name, country from t2
    where country = 'USA'
    with check option;

insert into usa_names values ('Amy','USA');    
insert into usa_names values('jeevan','india');                # it won't insert because their is a check option

## With CASCADED/LOCAL option

drop table if exists t1;
create table t1 (
	c int);

## Creating a view without any option
create or replace view v1 as
	select c from t1
    where c > 10;
    
insert into v1 values (5);   

select * from v1;
select * from t1;

## Creating dependent view.  i.e., view from a view        #cascade check option (if u wont give cascade check option it will automatically take it)
create or replace view v2 as                              
	select c from v1
    with cascaded check option;            # cascaded check option will copy the condition of the parent view and apply the check condition here   
 
insert into v2 values (8);              # it wont acept because in v1 their is a condition >10 from parent table so v2 is a child table of v1  (cascade)
insert into v2 values (15);

## Creating another dependent view v2 based on v2
create or replace view v3 as                            # V3 is cascade of v2 where v2 is cascade of v1
	select c from v2
    where c < 20;
    
insert into v3 values (8);                #it gives error because the parent condition is >10 check condition for v2

insert into v3 values (30);               # it takes because we havent gave check condition here

select * from t1;
select * from v3;

alter view v2 as
	select c from v1
    with local check option;             # if you give local check option it see the condition in the same view name (it wont consist check condition  of parent table)

insert into v2 values (5);    
insert into v3 values (8);




# difference between with check option and with local check option;

create or replace view v4 as                    # condition of c in v1 is >10
select c from v1 
where c<20
with check option;

insert into v4 values(6);                      # it gives an error because its voilating the v1 check option(c>10), where check option will consider both the check option        
insert into v4 values(25);                     # it gives an error because it vilating the v4 check option(c<20)
insert into v4 values(15);                     # it accepts because it satisfing both the check condition (c>10 and c<20) 

# where if we use local ;
alter view v4 as
select c from v1 
where c<20
with local check option;
 
insert into v4 values(5);                      # it accepts because we have only local condition where it satisfy's the condition(c<20)
 
 
select * from v1;

select * from t1;
insert into t1 values(40);                      # it will automatically update to view