use sql_training_testdb;
-- use the link to execute the queries https://techbeamers.com/sql-query-questions-answers-for-practice/

-- Write SQL Query to Display FIRST_NAME with Alias WORKER_NAME
select First_Name As Worker_Name from worker;

-- Write SQL Query to Display FIRST_NAME in Upper Case from the Worker Table
select upper(First_Name) As Worker_Name from worker;

-- Write SQL Query to Display Unique DEPARTMENT Values from the Worker Table
select Distinct DEPARTMENT from worker;

-- Write SQL Query to Display the First 3 Chars of FIRST_NAME from the Worker Table
select SUBSTRING(First_Name,1,3) As Worker_Name from worker;

-- Write SQL Query to Find the Position of Alphabet ‘a’ in the FIRST_NAME Column
SELECT POSITION("A" IN first_name) FROM worker WHERE first_name = "Vishal";

-- Write SQL Query to Fetch FIRST_NAME from the Worker Table With No White Spaces on the Right
Select RTRIM(FIRST_NAME) from Worker;

-- Write SQL Query to List DEPARTMENT from the Worker Table With No White Spaces on the Left
Select LTRIM(DEPARTMENT) from Worker;

-- Write SQL Query to Display Unique DEPARTMENT Values and Their Lengths from the Worker Table
SELECT DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) AS LDept FROM Worker;

-- Write SQL Query to Replace ‘a’ with ‘A’ in FIRST_NAME from the Worker Table
Select REPLACE(FIRST_NAME,'a','A') as Name from Worker;

-- Write SQL Query to Combine FIRST_NAME and LAST_NAME into COMPLETE_NAME
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Worker;

-- Write SQL Query to Print Worker Details Ordered by FIRST_NAME Ascending and DEPARTMENT Descending
	select * from worker order by first_name , department desc;

-- Write SQL Query to Print Worker Details with First Names “Vipul” and “Satish”
Select * from Worker where FIRST_NAME in ('Vipul','Satish');

-- Write SQL Query to Print Worker Details Excluding First Names (“Vipul” and “Satish”)
Select * from Worker where FIRST_NAME Not in ('Vipul','Satish');

-- Write SQL Query to Print Worker Details with DEPARTMENT Name as “Admin”
Select *, DEPARTMENT As admin from Worker;

Select * from Worker where DEPARTMENT like 'Admin%';

-- Write SQL Query to Print Worker Details Whose FIRST_NAME Contains ‘a’
select * from worker where first_name  like ('%a%');

-- Write SQL Query to List Worker Info Whose FIRST_NAME Ends with ‘a’
select * from worker where first_name  regexp ('a$');

--  Write SQL Query to Fetch Workers Whose FIRST_NAME Ends with ‘h’ and Has 6 Letters
Select * from Worker where FIRST_NAME like '_____h';

-- Write SQL Query to Show Worker Info Whose SALARY is Between 100000 & 500000
select * from worker where salary between 100000 AND 500000;

-- Write SQL Query to Display Workers Who Joined in Feb 2021
Select * from Worker where JOINING_DATE >= '2021-02-01' and JOINING_DATE <= '2021-02-28';

-- Write SQL Query to Print Employee Count in ‘Admin’ Department
SELECT COUNT(*) FROM Worker WHERE DEPARTMENT = 'Admin';

-- Write SQL Query to Fetch Worker Names with Salaries >= 50000 and <= 100000
SELECT FIRST_NAME , LAST_NAME, Salary FROM Worker WHERE Salary BETWEEN 50000 AND 100000;

-- Write SQL Query to List Worker Count Per Department in Descending Order
SELECT COUNT(*) FROM Worker order by DEPARTMENT desc; 
SELECT DEPARTMENT, count(WORKER_ID) as numbers FROM Worker GROUP BY DEPARTMENT ORDER BY numbers DESC;

-- Write SQL Query to Print Worker Details Who Are Also Managers
SELECT  W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W  
 JOIN Title T 
ON W.WORKER_ID = T.WORKER_REF_ID  where T.WORKER_TITLE = ('Manager');

--  ** Write SQL Query to Fetch Duplicate Records with Matching Data in Specific Fields of a Table **
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*) FROM Title GROUP BY WORKER_TITLE ; 

-- Write SQL Query to Show Only Odd Rows from a Table
SELECT * FROM Worker WHERE WORKER_ID % 2 != 0;

 -- Write SQL Query to Show Only Even Rows from a Table
 SELECT * FROM Worker WHERE WORKER_ID % 2 = 0;

-- Write SQL Query to Clone a New Table from Another Table 
CREATE TABLE Worker_Clone AS SELECT * FROM Worker;
select * from Worker_Clone ;

-- Write SQL Query to Display Intersecting Records of Two Tables
select * from title;
SELECT * FROM Worker union SELECT * FROM Worker_Clone ; 

-- ** Write SQL Query to Show Records from One Table That Are Not Present in Another Table **
SELECT * FROM Worker where WORKER_ID  not IN (  SELECT 3 FROM Worker_Clone); 

-- Write SQL Query to Show the Current Date and Time 
SELECT CURRENT_TIMESTAMP;

-- Write SQL Query to Show the Top n (say 10) Records of a Table
SELECT * FROM Worker ORDER BY SALARY DESC  LIMIT 10; 

-- Write SQL Query to Determine the Nth (say n=5) Highest Salary
SELECT * FROM Worker ORDER BY SALARY DESC limit 1 OFFSET 4;

-- **Write SQL Query to Determine 5th Highest Salary Without Using TOP or Limit **
SELECT Salary FROM Worker W1 WHERE 4 = (SELECT COUNT(DISTINCT W2.Salary) FROM Worker W2 WHERE W2.Salary >= W1.Salary);

-- Write SQL Query to Fetch the List of Employees with the Same Salary
SELECT distinct W.WORKER_ID, W.FIRST_NAME, W.Salary from Worker W , Worker W1 where W.Salary = W1.Salary and W.WORKER_ID != W1.WORKER_ID;

-- Write SQL Query to List the Employee with the Second-Highest Salary
SELECT max(salary) FROM Worker where salary != ((SELECT max(salary) FROM Worker ) );

-- Write SQL Query to Display One Row Twice in the Results from a Table
SELECT FIRST_NAME, DEPARTMENT from Worker W where W.DEPARTMENT='HR' union all 
select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR';

-- Write SQL Query to Fetch Intersecting Records of Two Tables
SELECT * FROM Worker w
JOIN Worker_clone wc ON w.WORKER_ID = wc.WORKER_ID;

-- **Write SQL Query to Fetch the First 50% of Records from a Table**
SELECT * FROM WORKER WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);

-- Write SQL Query to Fetch Departments with Less than Five People in Them
SELECT DEPARTMENT, COUNT(WORKER_ID) as Number_of_Workers FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;

-- Write SQL Query to Show All Departments with the Number of People in There
SELECT DEPARTMENT, COUNT(DEPARTMENT) as Number_of_Workers FROM Worker GROUP BY DEPARTMENT;

-- Write SQL Query to Show the Last Record from a Table
select * from worker order by  worker_id desc limit 1 ; 
Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker);

-- Write SQL Query to Fetch the First Row of a Table
select * from worker order by worker_id limit 1;
Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID) from Worker);

-- Write SQL Query to Fetch the Last Five Records from a Table
select * from worker order by worker_id desc limit 5;

SELECT * FROM Worker WHERE WORKER_ID <= 5 UNION 
SELECT * FROM (SELECT * FROM Worker W ORDER BY W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <= 5;

-- Write SQL Query to Show Employees with the Highest Salary in Each Department
SELECT w.DEPARTMENT, w.FIRST_NAME, w.Salary 
from (SELECT max(Salary) as TotalSalary, DEPARTMENT from Worker group by DEPARTMENT)
 as w1  Join Worker w on w1.DEPARTMENT = w.DEPARTMENT and w1.TotalSalary = w.Salary;

-- Write SQL Query to Fetch the Top Three Max Salaries from a Table
SELECT distinct (salary) FROM Worker ORDER BY SALARY desc limit 3;
select distinct salary from worker a where 3>=(select count (salary) from worker b where a.salary <= b.salary)
order by a.salary desc;

-- Write SQL Query to Fetch the Three Min Salaries from a Table
SELECT distinct (salary) FROM Worker ORDER BY SALARY limit 3;


-- ** Write SQL Query to Fetch the Nth Max Salaries from a Table**
WITH vars AS (SELECT 6 AS n) 
SELECT DISTINCT Salary FROM Worker a 
WHERE (SELECT n FROM vars) >= (SELECT COUNT(DISTINCT Salary) FROM Worker b WHERE a.Salary <= b.Salary) ORDER BY a.Salary DESC;

-- Write SQL Query to Fetch Departments and Their Total Salaries
SELECT  Department, Salary from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);

-- Write SQL Query to Fetch Workers with the Highest Salary
SELECT  first_name, last_name, Salary from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);

 
