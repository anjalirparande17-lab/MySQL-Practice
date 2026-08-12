-- NORMALIZATION IN SQL 
-- 1NF ,2NF,3NF
  
  
  create database if not exists 
  normalization_practice;
  use normalization_practice;
  
  -- create an unnormalized table containing 
  -- customer and order information.
  
  create table orders_unnormalized
  (
  order_id int ,
  customer_name varchar(50),
  customer_city varchar (50),
  product1 varchar(50),
  product2 varchar(50),
  product3 varchar(50)
  );
  
  
  -- insert sample data into the unnormalized table.
  insert into orders_unnormalized
  values
  (101,"Anjali",'pune','laptop','mouse','keyboard'),
  (102,"Rahul",'mumbai','monitor','mouse',null),
  (103,"Priya",'pune','keyboard',null,null);
  
  -- display the unnormalized table.
  select * from orders_unnormalized;
  
  -- convert the table into first normal form.(1NF).
  -- each column should contain atomic values.
  
  create table orders_1nf (
  order_id int ,
  customer_name varchar (50),
  customer_city varchar(50),
  product_name varchar (50)
  );
  
  -- insert atomic value 
  insert into orders_1nf 
  values
  (101, 'Anjali', 'Pune', 'Laptop'),
(101, 'Anjali', 'Pune', 'Mouse'),
(101, 'Anjali', 'Pune', 'Keyboard'),
(102, 'Rahul', 'Mumbai', 'Monitor'),
(102, 'Rahul', 'Mumbai', 'Mouse'),
(103, 'Priya', 'Pune', 'Keyboard');

-- display 1NF table
select * from orders_1nf;

-- create tables according to second normal form.