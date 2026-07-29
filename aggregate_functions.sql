-- SQL :Aggregate functions
use company1;
-- 1.find total number of employees
select COUNT(*) AS
total_employees
from employees;

-- 2.find total salary of all employees
select SUM(salary)AS
total_employeees
from employeees;

-- 3.Find average salary
select AVG(salary) AS average_salary
from employeees;


-- 4. Find minimum salary
select MIN(salary) AS minimum_salary
from  employeees;


-- 5. Find maximum salary
select  MAX(salary) AS maximum_salary
from  employeees;


-- 6. Find number of employees in each department
 select depid, COUNT(*) AS employee_count
from departments
group by depid;


-- 7. Find average salary in each department
select depid, AVG(salary) AS average_salary
from employeees
group by depid;


-- 8. Find departments where average salary is greater than 60000
select department, AVG(salary) AS average_salary
from employeees
group by department
having avg(salary) > 60000;