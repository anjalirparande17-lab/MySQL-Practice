 -- CLASSICAL MODEL-- 
 
 use classicalmodels;
show tables;
-- fetch customername where creditlimit is greater than 50000
select * from customers
where creditlimit>50000;

-- find customers from france.
select * from customers
where country="france";

-- find products with buy price greater than 50.
select productName,buyprice
from products
where buyprice>50;

-- display customers ordered by customer name.
select customerName 
from customers
order by customerName;

-- display products in descending order of buy price.
select productName,buyprice
from products
order by buyprice desc;

-- find the average buy price.
select avg(buyprice) as 
averageprice 
from products;


--  find the maximun buy price.
select max(buyprice)
from products;

-- find minimum buyprice
select min(buyprice)
from products;

-- display unique countries.
select distinct country 
from customers;

-- find customers whose credit limit is greater than 50000
select customerName,creditlimit
from customers 
where creditlimit>50000;

-- find products between 20 and 80
select productName,buyprice 
from products 
where buyprice between 20 and 80;

-- find customer whose name starts with "A"
select customerName
from customers
where customername like 'A%';

-- find customers whose name ends with 'ltd'
select customerName
from customers
where customername like'%ltd';

-- find all products in classic cars product line
select productName 
from products 
where productline ='classic cars';

-- display customers from USA of france
select customerName,country
from customers
where country in("USA","france");

-- display the first 10 products.
select * from products
limit 10;

-- display products after skipping the first 5.
select * from products
limit 5 offset 5;

-- display all product lines.
select * from productlines;

-- display all orders with status shipped 
select * from orders
where status="shipped";