# Q-1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table Using The Alias Name As <WORKER_NAME>.
use org;
select first_name as worker_name from worker;

# Q-2. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case.
select upper(first_name) from worker;

# Q-3. Write An SQL Query To Fetch Unique Values Of DEPARTMENT From Worker Table.
select distinct(department) from worker;

# Q-4. Write An SQL Query To Print The First Three Characters Of  FIRST_NAME From Worker Table.
select substring(first_name,1,3) from worker;

# Q-5. Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name Column ‘Amitabh’ From Worker Table.
select position('a' in 'amitabh');
select instr(first_name,'a') from worker where first_name ='amitabh';

# Q-6. Write An SQL Query To Print The FIRST_NAME From Worker Table After Removing White Spaces From The Right Side.
select rtrim(first_name) from worker;

# Q-7. Write An SQL Query To Print The DEPARTMENT From Worker Table After Removing White Spaces From The Left Side.
select ltrim(department) from worker;

# Q-8. Write An SQL Query That Fetches The Unique Values Of DEPARTMENT From Worker Table And Prints Its Length.
select department,length(department) from worker group by department;

# Q-9. Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing ‘a’ With ‘A’.
select replace(first_name,'a','A') from worker ;

# Q-10. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them.
select concat(first_name,' ',last_name) as complete_name from worker;

# Q-11. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending.
select * from worker order by first_name;

# Q-12. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending And DEPARTMENT Descending.
select * from worker order by first_name asc,department desc;

# Q-13. Write An SQL Query To Print Details For Workers With The First Name As “Vipul” And “Satish” From Worker Table.
select * from worker where first_name in('vipul','satish');

# Q-14. Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” And “Satish” From Worker Table.
select * from  worker where first_name not in ('vipul','satish');

# Q-15. Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As “Admin”.
select * from worker where department='admin';

# Q-16. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
select * from worker where first_name like '%a%';
select * from worker where first_name regexp 'a';

# Q-17. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
select * from worker where first_name like '%a';
select * from worker where first_name regexp 'a$';

# Q-18. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘H’ And Contains Six Alphabets.
select * from worker where first_name like '_____h';

# Q-19. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.
select * from worker where salary between 100000 and 500000;

# Q-20. Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.
select * from worker where joining_date like '2014-02%';

# Q-21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
select count(*) from worker where DEPARTMENT='admin';

# Q-22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000.
select first_name from worker where salary between 50000 and 100000;

# Q-23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
select department,count(*) as count from worker group by department order by count desc;

# Q-24. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
select * from title;
select * from worker;
select * from worker w inner join title t on w.worker_id= t.WORKER_REF_ID where worker_title ='manager';

# Q-25. Write An SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.
select * from title;
select * from title group by worker_title,affected_from having count(*)>1;

# Q-26. Write An SQL Query To Show Only Odd Rows From A Table.
select * from worker where mod(worker_id,2)!= 0;

# Q-27. Write An SQL Query To Show Only Even Rows From A Table.
select * from worker where mod(worker_id,2)=0;

# Q-28. Write An SQL Query To Clone A New Table From Another Table.
create table clone like worker;
select * from clone;
drop table clone;
create table clone as select * from worker;
insert into clone select * from worker;

# Q-29. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select * from worker where worker_id in(select worker_ref_id from title);
 
# Q-30. Write An SQL Query To Show Records From One Table That Another Table Does Not Have.
select * from worker where worker_id not in(select worker_ref_id from bonus);

# Q-31. Write An SQL Query To Show The Current Date And Time.
select now();

# Q-32. Write An SQL Query To Show The Top N (Say 10) Records Of A Table.
select * from worker limit 10;

 # Q-33. Write An SQL Query To Determine The Nth (Say N=5) Highest Salary From A Table.
select * from worker group by salary order by salary desc limit 4,1;

# Q-34. Write An SQL Query To Determine The 5th Highest Salary Without Using TOP Or Limit Method.
select * from worker where salary =(select max(salary) from worker where salary<(select salary from worker group by salary order by salary desc limit 3,1));


# Q-35. Write An SQL Query To Fetch The List Of Employees With The Same Salary.
select * from worker where salary=(select salary from worker group by salary having count(salary)>1);

#Q-36. Write An SQL Query To Show The Second Highest Salary From A Table.
select * from worker group by salary order by salary desc limit 1,1;
select * from worker where salary<(select max(salary) from worker) order by salary desc limit 1;

# Q-37. Write An SQL Query To Show One Row Twice In Results From A Table.
select * from worker union all select * from worker;

# Q-38. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select * from worker where worker_id in (select worker_ref_id from bonus);

# Q-39. Write An SQL Query To Fetch The First 50% Records From A Table.
select * from worker where worker_id <=(select count(*)/2 from worker);

#Q-40. Write An SQL Query To Fetch The Departments That Have Less Than Five People In It.
select department,count(department) from worker group by department having count(department)<5;

# Q-41. Write An SQL Query To Show All Departments Along With The Number Of People In There.
select department,count(department) from worker group by department;

# Q-42. Write An SQL Query To Show The Last Record From A Table.
select * from worker order by worker_id desc limit 1;
 
# Q-43. Write An SQL Query To Fetch The First Row Of A Table.
select * from worker limit 1;

# Q-44. Write An SQL Query To Fetch The Last Five Records From A Table.
select * from worker where worker_id in (select * from  (select worker_id from worker order by worker_id desc limit 5) as t) order by worker_id;

# Q-45. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
select first_name,max(salary) from worker group by department;

# Q-46. Write An SQL Query To Fetch Three Max Salaries From A Table.
select * from worker order by salary desc limit 3;

# Q-47. Write An SQL Query To Fetch Three Min Salaries From A Table.
select * from worker order by salary limit 3;

# Q-48. Write An SQL Query To Fetch Nth Max Salaries From A Table.  say 6th
select salary from worker group by salary order by salary desc limit 5,1;

# Q-49. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid 
select department,sum(salary) from worker group by department;

# Q-50. Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary.
select first_name,salary from worker where salary= (select max(salary) from worker);
select * from worker order by salary desc;
