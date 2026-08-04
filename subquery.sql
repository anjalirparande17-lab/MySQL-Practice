-- subqueries
use classicmodels;

-- find customers whose credit limit is greater than the average credit limit.
select customernumber,customername,creditlimit 
from customers where creditlimit >(
select avg(creditlimit )
from customers);

-- find products whose buy price is greater than the average buy price.
select productcode,productname,buyprice from products
where buyprice>
(
select avg(buyprice)
from products);

-- find customers who have placed at least one order.
select customernumber,customername
from customers
where customernumber in(
select customernumber 
from orders
);

-- find customers who never have placed order.
select customernumber,customername
from customers
where customernumber not in (
select customernumber 
from orders);

-- find customers who have made payment. 
select customernumber,customername
from customers 
where exists 
(
select * from payments
where payments.customernumber=customers.customernumber);

-- find customers who have never made payment.
select customernumber,customername 
from customers 
where not exists
(
select * from payments 
where payments.customernumber=customers.customernumber)
;

-- find the customers having maximum credit limit .
select customernumber,customername,creditlimit 
from customers 
where creditlimit =
(
select max(creditlimit)
from customers);

-- find the highest payment made. 
select * from payments 
where amount =
(
select max(amount)
from payments
);

-- find  the second highest payment made. 
select max(amount)
as secondhighestpayment 
from payments
where amount <
(
select max(amount)
from payments)
;

-- find products that have never been ordered. 
select productcode,productname
from products
where productcode not in 
(
select productcode
from orderdetails
);