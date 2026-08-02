use classicmodels;

-- display customer name and sales representative name.(innner join)
select c.customerName ,concat (e.firstname,' ',e.lastname)as 
salesRepresentative from customers c
inner join employees e on c.salesRepEmployeeNumber=e.employeeNumber;

-- display customer name,order number ,and order date.(inner join)
select c.customerName,o.orderNumber,o.orderDate
from customers c 
inner join orders o 
on c.customerName=o.customerNumber;

-- display order number, product name ,quantity ordered and price each.(inner join)
select od.ordernumber ,p.productname,od.quantityordered,od.priceeach 
from orderdetails od inner join products p 
on od.productcode=p.productcode;

-- display employee name with office city and country.(inner join)
select concat (e.firstname,' ',e.lastname) as employeename ,
o.city ,o.country
from employees e 
inner join offices o 
on e.officecode=o.officecode;

-- display customer name and payment amount.(inner join)
select c.customername,p.paymentDate,p.amount 
from customers c 
inner join payments p on c.customernumber=p.customernumber;

-- display all customer orders ,including customers who never placed an order.(left join)
select c.customername,o.ordernumber,o.orderdate
from customers c 
left join orders o
on c.customernumber=o.customernumber;

-- display all customers and employees  assigned to them  ,including employees  with no customers.(left join)
select concat(e.firstname,' ',e.lastname) as employeename,
c.customername from employees e 
left join customers c 
on e.employeenumber=c.salesrepemployeenumber;

-- display all products and their ordered quantity including products never ordered.(left join)
select p.productname,od.quantityordered
from  products p 
left join orderdetails od
on p.productcode=od.productcode;

-- display all customers and their payment details ,including customers who never made a payment.(left join)
select c.customername,p.paymentdate,p.amount
from customers c 
left join payments p 
on 
c.customernumber=p.customernumber;

-- display the customer name ,order number,productname,quantity ordered ,and price each (multiple inner join.)
select c .customername,o.ordernumber,p.productname,od.quantityordered,od.priceeach
from customers c 
inner join orders o on c.customernumber=o.customernumber
inner join orderdetails od on o.ordernumber=od .ordernumber 
inner join products p on od.productcode=p.productcode;