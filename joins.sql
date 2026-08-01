 use classicmodels;
 
 -- display the customers name sales representative (employee) name.
 select c.customerName,concat(e.firstName,' ',e.lastName)
 as 
 sales_representataive from customers  c
 join employees e on c.salesrepemployeeNumber = e.employeeNumber;
 
 -- display all orders along the customer name.
 select o.orderNumber ,o.orderDate,c.customerName
 from orders  o
 join customers c 
 on o.customerNumber=c.customerNumber;
 
 -- show the product name,product line ,and nuy price.
 select productName,productline,buyprice 
 from products;
 
 -- list employees with their office city and country .
 select e.firstname,e.lastname,o.city,o.country 
 from employees e join offices o 
 on   e.officecode =o.officecode;
 
 -- display payments made by each customer.
 select c.customerName,p.checkNumber ,
 p.paymentDate,p.amount 
 from customers c join payments p 
 on c.customerNumber=p.customerNumber;
 
 -- find the total number of customers in each country.
 select country ,count(*)
 as total_customers 
 from customers 
 group by country;
 
 -- find the average credit limit for each country.
 select country ,avg(creditlimit)as average_credit_limit 
 from customers
 group by country;
 
 -- display the total payment made by each customer.
 SELECT
    c.customerName,
    SUM(p.amount) AS Total_Payment
FROM customers c
JOIN payments p
ON c.customerNumber = p.customerNumber
GROUP BY c.customerName;
 