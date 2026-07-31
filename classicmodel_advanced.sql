use classicmodels;
-- find products whose buy price is greater than average buy price.
select productName,buyprice
from products
where buyprice>(select avg(buyprice)
from products);

-- find the product with highest buy price.
select productName,buyprice from products
where buyprice=(
select max(buyprice)
from products
);

-- find the second highest buy price.
select max(buyprice) as
second_highest_price 
from products
where buyprice <
(
select max(buyprice)
from products);

-- find customers whose creditlimit is greater than the average credit limit.
select customerName,creditlimit from customers
where creditlimit >(
select avg (creditlimit)
from customers);

-- find customers who have placed at least one order using exists.
select customerName from customers c
where exists
(
select 1
from orders o 
where o.customerNumber=
c.customerNumber );

-- find customers who have never placed an order using not exists.
select customerName from customers c
where not exists
(
select 1
from orders o 
where o.customerNumber=
c.customerNumber );

-- categorize products according to their buy price.
select productName,buyprice ,
case
when buyprice <30 then 
'low'
when buyprice between 30 and 70 then 'medium'
else 'high'
end as price_category
from products;

-- rank products according  to their buy price.
select productName,buyprice,
rank() over (order by buyprice desc)
as price_rank
from products;

-- find total payment made by each customer and rank customers by total payment.
SELECT
    customerNumber,
    SUM(amount) AS total_payment,
    RANK() OVER
    (
        ORDER BY SUM(amount) DESC
    ) AS payment_rank
FROM payments
GROUP BY customerNumber;

-- find customers whose total payment is greater than 100000
select customerNumber, sum(amount)
as  total_payment from payments
group by customerNumber 
having sum(amount)>100000;

-- find average paymment count for each customer.
select customerNumber ,avg(amount) as average_payment 
from payments
group by customerNumber;

-- find the customer who made the highest single payment .
SELECT customerName
FROM customers
WHERE customerNumber =
(
    SELECT customerNumber
    FROM payments
    WHERE amount =
    (
        SELECT MAX(amount)
        FROM payments
    )
);

-- find customer who ordered classic cars.
SELECT customerName
FROM customers
WHERE customerNumber IN
(
    SELECT customerNumber
    FROM orders
    WHERE orderNumber IN
    (
        SELECT orderNumber
        FROM orderdetails
        WHERE productCode IN
        (
            SELECT productCode
            FROM products
            WHERE productLine = 'Classic Cars'
        )
    )
);