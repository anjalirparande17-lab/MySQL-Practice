use classicmodels;
-- ROW_NUMBER() 
-- Assign a unique row number to each customer.
select customernumber,customername,creditlimit ,
row_number() over (order by creditlimit desc )
as row_num from customers;

-- RANk()
-- rank customer based on creditlimit.
select customername,customernumber,creditlimit ,
rank() over (order by creditlimit desc )
as customer_rank
from customers;

-- DENSE_RANk()
-- rank customer without gaps
select customernumber,customername,creditlimit,
dense_rank() over (order by creditlimit desc ) as
customer_rank from customers;

-- ROW_NUMBER ()partiton by country
select customernumber, customername,creditlimit,
row_number() over (partition by country order by creditlimit desc)
as country_row from customers;


-- DENSE_RANK 
-- partition by country 
select customername,customernumber,creditlimit,
dense_rank () over (partition by country order by creditlimit desc)
as dense_country_rank from customers;

-- LAG()
-- previous payment amount
select customernumber,paymentdate,amount ,
lag(amount)over (partition by customernumber
order by paymentdate )
as previous_payment 
from payments;

-- LEAD()
-- next payment amount
select customernumber, paymentdate,amount,
lead(amount) over (partition by customernumber order by paymentdate)
as next_payment
from payments;

-- FIRST_VALUE 
-- highest payment of each customer.
select customernumber,paymentdate,amount,
first_value (amount) over (partition by 
customernumber order by amount desc )
as highest_payment 
from payments;

-- LAST_VALUE
-- last payment mode
select customernumber,paymentdate,amount,
last_value (amount)
over (partition by 
customernumber 
order by paymentdate
rows between unbounded preceding 
and unbounded following )
as last_payment 
from payments;

-- running total
select customernumber, paymentdate,amount ,
sum(amount) over (partition by customernumber
order by paymentdate )
as running_total from payments;

-- running average 
select customernumber, paymentdate,amount ,
avg(amount) over (partition by customernumber
order by paymentdate )
as running_average from payments;

-- top three customers by credit limit
select * from 
( select 
customername,creditlimit ,
dense_rank() over (
order by creditlimit desc )
as ranking from customers 
)
as t 
where ranking<=3;
