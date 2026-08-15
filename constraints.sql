-- CONSTRAINTS IN SQL
-- DATABASE-> classicmodels

use classicmodels;

-- display the structure of customer table. 
describe customers;

-- display the primary key of the customers table.
show index from customers;

-- display the structure of the order table.
describe orders; 
 
 
 -- display the structure of product table.
 describe products;
 
 -- see the structure of employee table.
 describe employees;
 
 -- create a practice table with primary key and not null values  
 create table customer_practice(
 customer_id int primary key ,
 customer_name varchar(50) not null,
 email varchar(100) unique
 );
 
 -- insert data
 insert into customer_practice
 values
 (1,'anjali','anajli@gmail.com'),
 (2,'aditi','aditi@gmail.com'),
 (3,'priya','priya@gmail.com');
 
 -- display data
 select * from customer_practice;
 
 -- test primary key 
 INSERT INTO customer_practice
 VALUES (1, 'Amit', 'amit@gmail.com');
 
 -- it gives error means we can't add values if there is already an priamry key present.......
 
 -- test not null
 INSERT INTO customer_practice
 VALUES (4, NULL, 'amit@gmail.com');
 
 -- gives an error..............
 
 -- test unique 
 INSERT INTO customer_practice
VALUES (4, NULL, 'amit@gmail.com');
-- gives an error...............

-- create a table with foreign key
CREATE TABLE order_practice (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,

    FOREIGN KEY (customer_id)
    REFERENCES customer_practice(customer_id)
);


-- Q13. Insert valid orders

INSERT INTO order_practice
VALUES
(101, 1, '2026-08-01'),
(102, 2, '2026-08-02'),
(103, 3, '2026-08-03');


-- Q14. Display orders

SELECT *
FROM order_practice;


-- Test FOREIGN KEY

-- This should give an error because customer 10
-- does not exist.

INSERT INTO order_practice
 VALUES (104, 10, '2026-08-04');
 
 -- display customer and order information.


SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date
FROM customer_practice c
JOIN order_practice o
ON c.customer_id = o.customer_id;

 -- Create product table with CHECK and DEFAULT

CREATE TABLE product_practice (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(70) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0),
    quantity INT DEFAULT 0 CHECK (quantity >= 0)
);

-- Insert products

INSERT INTO product_practice
VALUES
(1, 'Laptop', 55000, 10),
(2, 'Mouse', 800, 50),
(3, 'Keyboard', 1500, 30);

-- insert product without quantity
insert into product_practice
(product_id, product_name,price)
values 
(4,'monitor',12000);

-- display products
select * from product_practice;