-- CASE WHEN PRACTICE
-- Database: classicmodels

use classicmodels;

-- categorize customers based on creditlimit.
select customername,creditlimit ,
case when creditlimit>=100000
then 'high' 
when creditlimit>=50000
then 'medium'
else 'low'
end as credit_category 
from customers;


-- categorize products based on buy price.
select productname,buyprice ,
case
when buyprice>=100
then 'expensive'
when buyprice>=50 
then 'medium'
else 'Affordable'
end as price_category 
from products;

-- categorize products based on their status.
select ordernumber,status,
case
when status='shipped'
then 'completed'
when status='cancelled'
then 'failed'
when status='in'
then 'processing'
else 'other'
end as order_category 
from orders;

-- count customers in each credit category.
select case 
when creditlimit >=100000 then 'high'
when creditlimit>=50000 then 'medium'
else 'low' 
end as credit_category ,
count(*) as total_customers 
from customers 
group by credit_category;

-- find products with their price category .
select productcode,productname,buyprice,
case 
when buyprice>=100
then 'high price'
when buyprice>=50
then 'low price'
end as price_category
from products 
order by buyprice desc;

-- categorize customers based on their country.
select customername,country ,
case 
when country in ('UK','France','germany','spain','Italy')
then 'Europe'
else
'other region'
end as region
from customers;

-- categorize employees based on the job titles. 
select firstname,lastname,jobtitle,
case
when 
jobtitle='president' then 'Top management'
when jobtitle like '%manager%' then 'Management'
else 'Staff'
end as 
employee_category 
from employees;


-- count orders by category.
select case
when status='shipped'
then 'completed'
when status='cancelled'
then 'cancelled'
else 'pending'
end as order_category,
count(*) as total_orders
from orders 
group by order_category;


-- find the number of products in each stock category.
select case 
when 
quantityinstock>=5000 then 'High stock'
when 
quantityinstock >=2000 then 'Medium stock'
else 
'low stock'
end as stock_category,
count(*) as total_products
from products
group by stock_category;

