use sql_Training_employee;

SELECT * FROM employee;

select name,age, department, salary, 
 AVG (salary) OVER( PARTITION BY Department) AS Avg_Salary
 FROM employee ;
 
 SELECT Name, Department, Salary,
       RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS emp_rank
FROM employee;

SELECT Name, Department, Salary,
       DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS emp_dense_rank
FROM employee;

SELECT Name, Department, Salary,
       ROW_NUMBER() OVER(PARTITION BY Department ORDER BY Salary DESC) AS emp_row_no
FROM employee;



WITH AvgSalaryByDept AS (
    SELECT Department, AVG(Salary) AS AvgSalary
    FROM Employee GROUP BY Department) 
SELECT * FROM AvgSalaryByDept;

select * FROM Employee;
select Department FROM Employee;


