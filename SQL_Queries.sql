use sql_inventory;
select * from sql_store.order_items o join products p on o.product_id = p.product_id;

use sql_store;
select * from sql_inventory. products p join order_items o  on o.product_id = p.product_id;

select unit_price  from products;
 use sql_hr;
 select * from employees m join employees e on m.employee_id = e.reports_to;
 
  -- query to find an employee salary which is grater then manager salary in the employee table.
select e.first_name,e.salary, m.first_name as Manager_name, m.salary as M_Salary
 from employees e join employees m 
 on m.employee_id = e.reports_to where e.salary >m.salary order  by e.salary desc;
 
  -- query to find emp name and manager name in single table
   select e.first_name,e.last_name, m.first_name as Manager_name
   from employees e join employees m 
   on m.employee_id = e.reports_to; 
   
   use sql_invoicing;
   
     SELECT c.name, c.client_id,pm.name
FROM payments p
join clients c on c.client_id = p.client_id
join payment_methods pm  on pm.payment_method_id =p.payment_method;

use sql_store;
select p.product_id,p.name,oi.quantity 
from products p right join order_items oi 
on p.product_id = oi.product_id;

use sql_invoicing;

use sql_Training_employee;

SELECT * FROM employee;

select name,age, department, salary, 
 AVG (salary) OVER( PARTITION BY Department) AS Avg_Salary
 FROM employee ;
 
SELECT Name, Department, Salary,
ROW_NUMBER() OVER(PARTITION BY Department ORDER BY Salary DESC) AS emp_row_no
FROM employee;

WITH AvgSalaryByDept AS (
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employee GROUP BY Department) 
SELECT * FROM AvgSalaryByDept;

use sql_Training_employee;

SELECT c_id, start_date, end_date,
DATEDIFF(LEAD(start_date) OVER (ORDER BY start_date), end_date) +1  AS no_of_days
FROM contest;

SELECT c_id, start_date, end_date, 
LAG(end_date) OVER (ORDER BY start_date) AS prev_end_date,
DATEDIFF(start_date, LAG(end_date) OVER (ORDER BY start_date)) AS gap_days
FROM contest;

use sql_training_testdb;
-- Write SQL Query to Display FIRST_NAME with Alias WORKER_NAME
select First_Name As Worker_Name from worker;

-- Write SQL Query to Display FIRST_NAME in Upper Case from the Worker Table
select upper(First_Name) As Worker_Name from worker;

-- Write SQL Query to Display Unique DEPARTMENT Values from the Worker Table
select Distinct DEPARTMENT from worker;

-- Write SQL Query to Display the First 3 Chars of FIRST_NAME from the Worker Table
select substring(first_name,1,3) as Worker_Name from worker;

-- Write SQL Query to Find the Position of Alphabet ‘a’ in the FIRST_NAME Column
SELECT POSITION("A" IN first_name) FROM worker WHERE first_name = "monika";

-- Write SQL Query to Fetch FIRST_NAME from the Worker Table With No White Spaces on the Right
Select RTRIM(FIRST_NAME) from Worker;

-- Write SQL Query to List DEPARTMENT from the Worker Table With No White Spaces on the Left
Select LTRIM(DEPARTMENT) from Worker;

-- Write SQL Query to Display Unique DEPARTMENT Values and Their Lengths from the Worker Table
select distinct(department) , length (department)  as len_Dept from worker; 

-- Write SQL Query to Replace ‘a’ with ‘A’ in FIRST_NAME from the Worker Table
select replace (first_name,'a','A') as name from worker;

-- Write SQL Query to Combine FIRST_NAME and LAST_NAME into COMPLETE_NAME
SELECT CONCAT(first_name, '', last_name) AS full_name FROM Worker;

-- Write SQL Query to Print Worker Details Ordered by FIRST_NAME Ascending and DEPARTMENT Descending
select * from worker order by first_name asc, department desc;

-- Write SQL Query to Print Worker Details with First Names “Vipul” and “Satish”
select * from worker where first_name in ('Vipul','Satish');

-- Write SQL Query to Print Worker Details Excluding First Names (“Vipul” and “Satish”)
select * from worker where first_name not in ('Vipul','Satish');

-- Write SQL Query to Print Worker Details with DEPARTMENT Name as “Admin”
select * from worker where department like '%Admin%';

-- Write SQL Query to Print Worker Details Whose FIRST_NAME Contains ‘a’
select * from worker where first_name like '%a%';

-- Write SQL Query to List Worker Info Whose FIRST_NAME Ends with ‘a’
select * from worker where first_name like '%a';

--  Write SQL Query to Fetch Workers Whose FIRST_NAME Ends with ‘h’ and Has 6 Letters
select * from worker where first_name like '_____h';
select * from worker where first_name like '%h' and length(first_name) =6; 

-- Write SQL Query to Show Worker Info Whose SALARY is Between 100000 & 500000
select * from worker where salary between 100000 and 500000;

-- Write SQL Query to Display Workers Who Joined in Feb 2021
Select * from Worker where JOINING_DATE >= '2021-02-01' and JOINING_DATE <= '2021-02-28';

-- Write SQL Query to Print Employee Count in ‘Admin’ Department
select distinct count(department) from worker where department like '%admin%';

-- Write SQL Query to Fetch Worker Names with Salaries >= 50000 and <= 100000
Select first_name, last_name from Worker where salary>= 50000 and salary <= 100000;

-- Write SQL Query to List Worker Count Per Department in Descending Order
select department,count(worker_id) as total_count 
from worker 
group by department 
order by department desc; 

-- Write SQL Query to Print Worker Details Who Are Also Managers
select w.first_name, w.worker_id
from worker w join title t 
on w.worker_id = t.worker_ref_id
and t.worker_title ='manager';

--   Write SQL Query to Fetch Duplicate Records with Matching Data in Specific Fields of a Table 
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*) as total FROM Title GROUP BY WORKER_TITLE ; 

-- Write SQL Query to Show Only Odd Rows from a Table
Select * from Worker where worker_id % 2 !=0;

 -- Write SQL Query to Show Only Even Rows from a Table
 Select * from Worker where worker_id % 2 = 0 ;
 
 -- Write SQL Query to Clone a New Table from Another Table 
 create table worker_cloning AS SELECT * FROM WORKER;
 select * from  worker_cloning;
 
 -- Write SQL Query to Display Intersecting Records of Two Tables
  select * from  worker_cloning union  select * from  worker;

-- Write SQL Query to Fetch the Last Five Records from a Table
select * from worker order by worker_id desc limit 5;

-- Write SQL Query to Show Employees with the Highest Salary in Each Department
select department , max(salary) as max_salary
from worker
group by department;

-- Write SQL Query to Show Records from One Table That Are Not Present in Another Table 
SELECT * FROM Worker where WORKER_ID  not IN (  SELECT 1 FROM Worker_Clone); 

-- Write SQL Query to Show the Current Date and Time 
select current_timestamp();

-- Write SQL Query to Show the Top n (say 10) Records of a Table
SELECT * FROM Worker order by worker_id desc limit 10;

-- Write SQL Query to Determine the Nth (say n=5) Highest Salary
SELECT distinct(w1.salary) FROM Worker w1 where 4 =(SELECT w2.salary FROM Worker w2 WHERE w2.Salary >= w1.Salary);

-- Write SQL Query to Fetch the List of Employees with the Same Salary
select w.worker_id, w.salary,e.first_name from worker w
join worker e 
on w.salary = e.salary
and w.worker_id !=e.worker_id;

-- Write SQL Query to List the Employee with the Second-Highest Salary
SELECT * FROM worker WHERE salary = ( 
    SELECT MAX(salary) 
    FROM worker WHERE salary < (
        SELECT MAX(salary) from worker) );

SELECT * FROM 
    (SELECT *, 
    DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM worker) t
WHERE rnk = 2;

-- Write SQL Query to Display One Row Twice in the Results from a Table
select * from worker union all select * from worker order by worker_id;

-- Write SQL Query to Fetch Intersecting Records of Two Tables
select * from worker union select * from worker;

-- Write SQL Query to Fetch the First 50% of Records from a Table
SELECT * FROM WORKER WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);

-- Write SQL Query to Fetch Departments with Less than three People in Them
select department, count(WORKER_ID) as count_dept from worker group by department having count(WORKER_ID) < 3;

-- Write SQL Query to Show All Departments with the Number of People in There
select department,count(department) as total from worker group by department ;

-- Write SQL Query to Show the Last Record from a Table
SELECT * FROM WORKER order by worker_id desc limit 1;


-- Write SQL Query to Fetch the First Row of a Table
SELECT * FROM WORKER order by worker_id limit 1;

-- Write SQL Query to Fetch the Top Three Max Salaries from a Table
select first_name,salary from 
(select first_name,salary,
dense_rank() over(order by salary desc)as r
from worker) win where r <4;

-- Write SQL Query to Fetch the Three Min Salaries from a Table
SELECT distinct (salary) FROM Worker ORDER BY SALARY limit 3;

-- Write SQL Query to Fetch the Nth Max Salaries from a Table
select first_name,salary from 
(select first_name,salary,
dense_rank() over(order by salary desc)as r
from worker) win where r =5 ;

-- Write SQL Query to Fetch Departments and Their Total Salaries
select department,sum(salary) as total_sal from worker group by department;

-- Write SQL Query to Fetch Workers with the Highest Salary
select worker_id, department,salary from worker order by salary desc limit 1;

use sql_training_employee;
-- write a query to find the 3 highest salary using normal SQL 
select name,salary from employee order by salary desc limit 3;

-- write a query to find the 3 highest salary using windowing functions
select name,salary from (select name,salary, 
dense_rank () over (order by salary desc) as dr 
from employee ) win where dr <4;

-- write a query to find the 3 highest salary by using the CTE
with cte_sal as (select name,salary,
row_number() over (order by salary desc) as rn
 from employee ) select name,salary from cte_sal where rn <=4;
 
 -- create a stored procedure to find the highest salary department wise and execute the procedure
 call highsal_dept;
 
 -- write a query to count the no of employees per department
 select department,count(*) as total_emp from employee group by department; 
 
 use sql_invoicing;
-- write a query to get the even and odd employee ids in the employee table
select * from employees where employee_id % 2 !=0;
select * from employees where employee_id % 2 =0;

use sql_hr;
-- write a query to find an employee salary which is grater then manager salary in the employee table.
select e.first_name,e.salary, m.first_name as man_name, m.salary as man_sal
 from employees e 
 join employees m 
 on e.reports_to = m.employee_id
 where e.salary > m.salary;
 
 use sql_training_employee;
 -- SQL query to print sum of salary of each department
 select department, sum(salary) as total_sal from employee group by department;
 
 
 use sql_hr;
 -- Write a SQL query to find emp name and manager name in single table
 select e.first_name, m.first_name as man_name
 from employees e 
 left join employees m 
 on e.reports_to = m.employee_id;
 
  -- Write a SQL query to print duplicate names of employe
select first_name,count(*) as dup from employees group by first_name having count(*) >1;
 
 use myfirstdb;
SELECT *
FROM A1_table A;
SELECT *
FROM B1_table B;

SELECT A.id AS a_id, B.id AS b_id
FROM A1_table A
full OUTER JOIN B1_table B
    ON A.id = B.id
WHERE A.id IS NULL OR B.id IS NULL;


SELECT A.id AS non_matching_id
FROM A1_table A
LEFT JOIN B1_table B ON A.id = B.id
WHERE B.id IS NULL
union 
SELECT B.id AS non_matching_id
FROM B1_table B
LEFT JOIN A1_table A ON B.id = A.id
WHERE A.id IS NULL;

-- str =" I aM VeRy StRoN At CoDiNg" Write a Sql querey to print remove owels and empty spaces in that place 
select replace
(replace (replace
(replace
(replace 
(replace 
(replace
(replace 
(replace 
(replace ( "I aM VeRy StRoN At CoDiNg",'a' ,''),'A',''),'e','' ),'E',''),'o',''),'O',''), 'i',''), 'I',''),'u',''),'U','')
as result;

-- Create a table with hash distribution of emp id and other details 
CREATE TABLE employees_hash (
    emp_id INT,
    name VARCHAR(100),
    department VARCHAR(50)
)
PARTITION BY HASH(emp_id)
PARTITIONS 4;
select * from employees_hash;

SELECT A.id 
FROM A1_table A
inner JOIN B1_table B ON A.id = B.id;

SELECT A.id 
FROM A1_table A
left JOIN B1_table B ON A.id = B.id;

SELECT A.id 
FROM A1_table A
right JOIN B1_table B ON A.id = B.id;

SELECT A.id 
FROM A1_table A
full outer JOIN B1_table B ON A.id = B.id;

SELECT A.id 
FROM A1_table A
left JOIN B1_table B ON A.id = B.id
where B.id is null;