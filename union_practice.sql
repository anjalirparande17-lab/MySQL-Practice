-- UNION AND UNION ALL PRACTICE
-- Database:Classicmodels

-- display cities from customers and offices.
select city
from customers
union 
select city 
from offices;

-- display cities from customers and offices 
-- union all keeps the duplicate cities
select city
from customers
union all
select city 
from offices;

-- display countries from customers and offices.
select country 
from customers
union 
select country 
from offices;

--  display countries and remove duplicates.
select country
from customers

union
select country 
from offices
order by country;

-- Display all countries including duplicates.
select country 
from customers
union all
select country 
from offices
order by country;


-- display customer name and employee name.
select customerName
as person_name
from customers 
union
select  concat(firstname,' ',lastname) 
as person_name
from employees;



-- display customer name and employee name 
-- including duplicates.
select customerName
as person_name
from customers 
union all 
select  concat(firstname,' ',lastname) 
as person_name
from employees


