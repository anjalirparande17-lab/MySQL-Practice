use classicmodels;

-- create a view to display customer name, city ,country.
create or replace view 
customer_details as
select customername,city,country 
from customers;
select * from customer_details;

-- create a view to display product name,product line and buy price.
create or replace view
product_details as 
select productname,productline,buyprice 
from products;
select * from product_details;

-- create a view to display employee first name,last name and job title.
create or replace view 
employee_details as 
select firstname,lastname,jobtitle
from employees;
select * from employee_details;

-- create a view to display whose price is greater than 50.
create or replace view 
expensive_products as 
select productname,productline,buyprice 
from products 
where buyprice>50;
select * from expensive_products;

-- create a view to display the customers from USA.
create or replace view 
usa_customers as 
select customername,customernumber,city,country
from customers
where country ="USA";
select * from  usa_customers;

-- create a view to display customer name and order details.
 create or replace view 
 customer_order as 
 select c.customername,
 o.ordernumber,
 o.orderdate,o.status
 from customers c 
 join orders o 
 on c.customernumber = o.customernumber;
 select * from customer_order;
 
 -- create a view to display order number, product name,quantity ordered and price.
 create or replace view 
 order_product_details as
 select od.ordernumber,p.productname,od.quantityordered,
 od.priceeach 
 from orderdetails od 
 join products p 
 on od.productcode ;
 select * from order_product_details;
 
 -- create a view to calculate the total amount for each order detail.
 create or replace view 
 order_amounts as
 select ordernumber,
 productcode,quantityordered,priceeach ,quantityordered * 
 priceeach as totalamount 
 from orderdetails;
 select * from order_amounts;
 
 -- display expensive products fro the view in descending order of buy price.
 select * from expensive_products
 order by buyprice desc;
 
 -- delete the usa customers view.
 drop view if exists
 usa_customers;
 
 -- checks all available views.
 show full tables 
 where table_type ="view";
