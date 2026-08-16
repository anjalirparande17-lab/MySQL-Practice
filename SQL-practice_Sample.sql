-- SQL PRACTICCE SAMPLE
-- DATABASE: Classicmodels

use classicmodels;
 
 -- display all customers
 select * from customers;
 
 -- find customer from USA
 select customername,city ,country 
 from customers
 where country ='USA';
 
 -- find customers with creditlimit  greater than 50000
 select customernumber,customername,creditlimit
 from customers
 where creditlimit>50000;
 
 -- find the total number of customers
 select count(*)
 as 
 total_customers
 from customers;
 
 -- find average credit limit
 select avg(creditlimit) as 
 average_creditlimit
 from customers;
 
 -- join  customers and orders
 select 
 c.customername,
 o.ordernumber,
 o.orderdate,
 o.status
 from customers c 
 inner join orders o 
 on c.customernumber=o.customernumber;
 
 -- find the top 5 products by price.
 select productname,buyprice 
 from products 
 order by buyprice desc 
 limit 5;
 
 
 -- find the highest product price.
 select max(buyprice)
 as 
 highest_price 
 from products;
 
 -- find the lowest buy price.
 select min(buyprice)
 as 
 lowest_price 
 from products;
 
 -- find products with price greather than the average price.
 select productname,buyprice 
 from products 
 where buyprice <
 (
 select avg(buyprice)
 from products 
 );
 
 -- rank products according to the price.
 select productname,buyprice,
 rank() over (order by buyprice desc )
 as price_rank 
 from products;
 
 -- find total sales revenue.
 select round(Sum(quantityordered * priceeach),2)
 as total_revenue
 from orderdetails;