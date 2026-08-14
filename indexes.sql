-- INDEXES IN SQL

use classicmodels;

-- display all the indexes of the customers table.
show index from customers;

-- create an index on customername.
create index customer_name
on customers(customername);

-- check weather index is created or not.
show index from customers;

-- create an  index on customers_country
create index customer_Country
on customers (country);

-- create  a composite index on country and city.
create index country_city
on customers(country,city);

-- display customers from USA.
select * from customers
where country="USA";

-- display customers from USA and new york.
select * from customers 
where country ="USA" and city="new york";

-- create an index on employee last name.
create index
idx_employee_lastname
on employees(lastname);

-- create an index of payment date.
create index idx_payment_date
on payments(paymentdate);

-- create a index on creditlimit.
create index idx_creditlimit
on customers (creditlimit);

show index from customers;

-- display all the indexes of the product tables.
show indexes from products;
