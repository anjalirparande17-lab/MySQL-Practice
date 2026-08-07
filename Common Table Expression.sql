-- Common Table Expression 
use classicmodels;


-- Display customers whose credit limit is greater than the average credit limit.
WITH AvgCredit AS
(
    SELECT AVG(creditLimit) AS avg_credit
    FROM customers
)
SELECT customerNumber, customerName, creditLimit
FROM customers, AvgCredit
WHERE creditLimit > avg_credit;



 -- Find the Top 10 customers based on credit limit.
WITH RankedCustomers AS
(
    SELECT customerNumber,
           customerName,
           creditLimit,
           DENSE_RANK() OVER(ORDER BY creditLimit DESC) AS rnk
    FROM customers
)
SELECT *
FROM RankedCustomers
WHERE rnk <= 10;



--  Calculate total payment made by each customer.

WITH CustomerPayments AS
(
    SELECT customerNumber,
           SUM(amount) AS TotalPayment
    FROM payments
    GROUP BY customerNumber
)
SELECT *
FROM CustomerPayments
ORDER BY TotalPayment DESC;



--  Find customers whose total payment is greater
-- than 100000.

WITH CustomerPayments AS
(
    SELECT customerNumber,
           SUM(amount) AS TotalPayment
    FROM payments
    GROUP BY customerNumber
)
SELECT *
FROM CustomerPayments
WHERE TotalPayment > 100000;


 -- Find products whose buy price is greater than the average buy price.

WITH AvgPrice AS
(
    SELECT AVG(buyPrice) AS AvgBuyPrice
    FROM products
)
SELECT productCode,
       productName,
       buyPrice
FROM products, AvgPrice
WHERE buyPrice > AvgBuyPrice;



-- Find the Top 5 most expensive products.

WITH ProductRank AS
(
    SELECT productCode,
           productName,
           buyPrice,
           ROW_NUMBER() OVER(ORDER BY buyPrice DESC) AS rn
    FROM products
)
SELECT *
FROM ProductRank
WHERE rn <= 5;



-- Count customers in each country.

WITH CountryCustomers AS
(
    SELECT country,
           COUNT(*) AS TotalCustomers
    FROM customers
    GROUP BY country
)
SELECT *
FROM CountryCustomers
ORDER BY TotalCustomers DESC;


-- Find employees who manage customers.

WITH EmployeeCustomers AS
(
    SELECT salesRepEmployeeNumber,
           COUNT(*) AS TotalCustomers
    FROM customers
    WHERE salesRepEmployeeNumber IS NOT NULL
    GROUP BY salesRepEmployeeNumber
)
SELECT *
FROM EmployeeCustomers;



-- Find product lines having more than 10 products.

WITH ProductLineCount AS
(
    SELECT productLine,
           COUNT(*) AS TotalProducts
    FROM products
    GROUP BY productLine
)
SELECT *
FROM ProductLineCount
WHERE TotalProducts > 10;



--  Find customers who placed more than 5 orders.
WITH CustomerOrders AS
(
    SELECT customerNumber,
           COUNT(orderNumber) AS TotalOrders
    FROM orders
    GROUP BY customerNumber
)
SELECT *
FROM CustomerOrders
WHERE TotalOrders > 5;



-- Find the average payment for each customer.
WITH AvgPayment AS
(
    SELECT customerNumber,
           AVG(amount) AS AveragePayment
    FROM payments
    GROUP BY customerNumber
)
SELECT *
FROM AvgPayment
ORDER BY AveragePayment DESC;



-- Find customers having the highest payment.
WITH MaxPayment AS
(
    SELECT customerNumber,
           MAX(amount) AS HighestPayment
    FROM payments
    GROUP BY customerNumber
)
SELECT *
FROM MaxPayment
ORDER BY HighestPayment DESC;