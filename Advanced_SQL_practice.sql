-- ADVANCED SQL PRACTICE
-- Database: classicmodels

use classicmodels;

-- use CASE to categorize customers based on creditlimit.
select customername,creditlimit,
case
when creditlimit>=100000 then 'high'
when creditlimit>=50000 then 'medium'
else 'low'
end as credit_category from customers;

-- use ifnull to replace the state value.
select customername,ifnull(state,"not available")
as state 
from customers;

-- use COALESCE to display the first available value.
select customername,
coalesce(state,city,country) as 
location from customers;

-- find the customer who have placed at least one order  using exists.
select customernumber,customername
from customers c 
where exists (
select 1 from orders o 
where o.customernumber=c.customernumber);

-- find customers who have never placed an order using not exists. 
select customernumber,customername
from customers c 
where  not exists (
select 1 from orders o 
where o.customernumber=c.customernumber);

-- find products whose price is greater than the average than product price.
select productname,buyprice
from products 
where buyprice>
(select avg(buyprice)
from products
);

-- Rank the products  according to their buy price.
select productname,buyprice,
rank()
over(
order by buyprice desc ) as price_rank 
from products;

-- rank product within each product line. 
select productname,productline,buyprice,
rank() over(
partition by productline 
order by buyprice desc )
as product_rank
from products;

-- combine customer cities and office cities with using UNION.
select city 
from customers
union 
select city 
from offices;

-- find employees and their managers using self join. 
select 
concat (e.firstname,' ',e.lastname)
as employee,
concat (m.firstname,' ',m.lastname)
as manager
from employees 
e 
left join employees m on e.reportsTO=m.employeenumber;

-- use CTE to find total revenue for each product.
with product_sales as 
(
select 
productcode,sum(Quantityordered*priceeach)
as revenue from orderdetails
group by productcode
)
select p.productcode ,round (ps.revenue ,2) as
total_revenue 
from product_sales ps
join  products p 
on ps.productcode=p.productcode
order by total_revenue desc;


-- 