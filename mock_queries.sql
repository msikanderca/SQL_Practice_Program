use sql_hr;

select * from employees;
-- query to find the 3 highest salary using normal SQL
select * from employees order by salary desc limit 3;

-- query to find the 3 highest salary using windowing functions
select employee_id, salary 
from ( select employee_id, salary ,
		dense_rank() over (order by salary desc) as dr
        from employees
)e 
where dr <=3;

--  query to find the 3 highest salary by using the CTE
with highsal as 
( select employee_id, salary,
row_number() over (order by salary desc ) as r
from employees
) 
select employee_id, salary 
from highsal  where r <=3;

-- stored procedure to find the highest salary department wise and execute the procedure
CALL GetHighestSalaryByDepartment();

use myfirstdb;
select * from employees;

-- query to count the no of employees per department
select department ,count(*) as dept_count from employees group by department;

-- create a new table "Test_Employess" and add the Columns same like employee table in it and insert the 10  sample records in it
create table Test_Employess (
emp_id int not null,
first_name varchar(20) not null,
last_name varchar(20),
department varchar(20),
salary int,
email varchar(50)
);

insert into test_Employess  values 
( 1 , 'Alice', 'LNAlice', 'Sales',2000,'alice@abc.com'),
( 2, 'Bob', 'LNBob', 'IT',2000,'bob@abc.com'),
( 3, 'Charlie', 'LNCharlie', 'Sales',2000,'charlie@abc.com'),
( 4, 'David', 'LNDavid', 'HR',2000,'david@abc.com'),
( 5, 'Eve', 'LNeve', 'Sales',2000,'eve@abc.com'),
( 6, 'Framk', 'LNfrank', 'Finance',2000,'frank@abc.com'),
( 7, 'George', 'LNgeorge', 'HR',2000,'george@abc.com'),
( 8, 'Henry', 'LNhenry', 'Sales',2000,'henry@abc.com'),
( 9, 'Iris', 'LNiris', 'Finance',2000,'iris@abc.com'),
( 10, 'Joe', 'LNjoe', 'IT',2000,'joe@abc.com');

select * from test_Employess;

--   query to get the even and odd employee ids in the employee table
select  * from employees where emp_id % 2 =0 ; 

select  * from employees where emp_id % 2 !=0 ; 

-- query to find an employee salary which is greater then manager salary in the employee table.
use sql_hr;
select  * from employees;
select e.first_name,e.salary, m.first_name, m.salary 
from employees e 
join employees m 
on e.reports_to = m.employee_id
where e.salary > m.salary; 

-- SQL query to print sum of salary of each department
use myfirstdb; 
select * from employees;
select department , sum(salary) as sum_sal
from employees
group by department;

-- query to find emp name and manager name in single table?
use sql_hr;
select  * from employees;
select e.first_name,e.salary, m.first_name, m.salary 
from employees e 
join employees m 
on e.reports_to = m.employee_id;

--  query to print duplicate names of employee
use sql_hr;
select  * from employees;
select employee_id, count(*) as dup
from employees
group by employee_id 
having count(*) >1; 

-- query to print only employees without salary
create table EmpTable (
Emp_Id int not null,
Emp_Name varchar(20) not null,
Emp_IdSalary int );

insert into EmpTable
values 
	(1,'ram',18000),
	(2, 'siva',27000),
	(3,	'Appu',39000),
	(4,	'priya',47600),
	(5,	'Divya',58500),
	(6,	'Gopi',null),
	(7,	'Raghu',null),		
	(8,	'Nanee',null),		
	(9,	'Pavan',null),		
	(10,'Saru',null);
    
    select * from emptable;
    select * from emptable 
    where Emp_IdSalary is null;
    
    -- tables A and B, find Right,left & inner join 
    create table A_table (id int not null);
    create table B_table (id int not null);
insert into A_table
values 
	(1),
    (1),
    (1);
insert into B_table
values 
	(1),
    (1),
    (1);   
    
select a.id as A_ID, b.id as B_ID 
from A_table a
right join B_table b
on a.id = b.id;
    
select a.id as A_ID, b.id as B_ID 
from A_table a
left join B_table b
on a.id = b.id;

select a.id as A_ID, b.id as B_ID 
from A_table a
inner join B_table b
on a.id = b.id;

-- 2 tables A and B conatining col id as a common field write a sql query to find non matching records from both tables
SELECT a.id as A_ID, b.id as B_ID 
FROM A_table A 
FULL OUTER JOIN B_table B ON A.id = B.id
WHERE A.id IS NULL OR B.id IS NULL;

SELECT  a.id as A_ID, b.id as B_ID
FROM A_Table a
FULL OUTER JOIN B_Table b -- replace with union
ON a.ID = b. ID
WHERE A.id IS NULL OR B.id IS NULL;


SELECT a.id AS A_ID, b.id AS B_ID
FROM A_Table a
LEFT JOIN B_Table b ON a.id = b.id
WHERE b.id IS NULL
UNION -- replace for full outer join
SELECT a.id AS A_ID, b.id AS B_ID
FROM A_Table a
RIGHT JOIN B_Table b ON a.id = b.id
WHERE a.id IS NULL;

 -- "I aM VeRy StRoN At CoDiNg" querey to print remove owels and empty spaces in that place
 select replace(
 replace(
 replace(
 replace(
 replace(
 replace(
 replace(
 replace(
 replace(
 replace('I aM VeRy StRoN At CoDiNg','a',''),
 'A',''),  'E',''),  'e',''),  'I',''),  'i',''), 'o',''),
 'O',''),  'u',''),  'U','')  as result;
 
--  duplicate value with its count of each duplicate
create table EMP_DUP (id int not null);
insert into EMP_DUP
values 
	(1), (1), (1), (1),(2),(2),(3),(3);
    
select*  from EMP_DUP;

select id, count(*)as total_Count from EMP_DUP group by id;

/* query to calculate the total revenue by product category from a sales table.
 The table Sales has columns: product_id, category_id, sale_amount, 
 and there is a Categories table with columns category_id and category_name */
 
 use myfirstdb;
 
 select o.customer_id, sum(amount) as total_revenue
 from sales s 
 join orders o
 on s.product_id = o.product_id
 group by o.customer_id;
 
 
 
  -- tables A and B, find inner , left, right, outer, left anti  
   drop table A1_table;
   drop table B1_table;
    create table A1_table (id int);
    create table B1_table (id int);
insert into A1_table
values 
	(1),
    (2),
    (3),
    (5),
    (null);
insert into B1_table
values 
	(1),
    (1),
    (2),
    (4),
    (6);   
    
    select * from A1_table;
    select * from B1_table;
    
   select a.id as A_ID, b.id as B_ID 
from A1_table a
inner join B1_table b
on a.id = b.id;

   select a.id as A_ID, b.id as B_ID 
from A1_table a
left join B1_table b
on a.id = b.id;

   select a.id as A_ID, b.id as B_ID 
from A1_table a
right join B1_table b
on a.id = b.id;

   select a.id as A_ID, b.id as B_ID 
from A1_table a
outer join B1_table b -- union can be used instead
on a.id = b.id;

SELECT a.id AS A_ID, b.id AS B_ID
FROM A1_table a
LEFT JOIN B1_table b ON a.id = b.id
WHERE b.id IS NULL
UNION  -- instead of outer join
SELECT a.id AS A_ID, b.id AS B_ID
FROM A1_table a
RIGHT JOIN B1_table b ON a.id = b.id
WHERE a.id IS NULL;

   select a.id as A_ID, b.id as B_ID 
from A1_table a
left anti join B1_table b  -- use null instead of anti
on a.id = b.id;

 select a.id as A_ID, b.id as B_ID 
from A1_table a
left join B1_table b  -- instead of left anti
on a.id = b.id
where b.id is null;