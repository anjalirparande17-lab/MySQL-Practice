use classicmodels;

-- TRIGGER IN SQL 

-- create a table to store customer audit information.
create table customer_audit (
audit_id int auto_increment
primary key,
customernumber int,
customername varchar (50),
action_type varchar (20),
action_date datetime
);

-- create an after insert trigger on customers table.
-- The trigger should store the details whenever a new customer is added.

DELIMITER //

CREATE TRIGGER after_customer_insert
AFTER INSERT ON customers
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit
    (customerNumber, customerName, action_type, action_date)
    VALUES
    (NEW.customerNumber, NEW.customerName, 'INSERT', NOW());
END //

DELIMITER ;


--  Insert a new customer to test the trigger.

INSERT INTO customers
(customerNumber, customerName, contactLastName, contactFirstName,
phone, addressLine1, city, country, creditLimit)
VALUES
(497, 'Test Customer', 'Patil', 'Anjali',
'9876543210', 'Test Address', 'Pune', 'India', 10000);


-- Display the customer audit table.

SELECT * 
FROM customer_audit;


--  Create a BEFORE UPDATE trigger on products table.
-- Prevent quantityInStock from becoming negative.

DELIMITER //

CREATE TRIGGER before_product_update
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    IF NEW.quantityInStock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Quantity in stock cannot be negative';
    END IF;
END //

DELIMITER ;


-- Test the BEFORE UPDATE trigger.

UPDATE products
SET quantityInStock = -10
WHERE productCode = 'S10_1678';


--  Create an AFTER DELETE trigger on customers table.
-- Store deleted customer information in customer_audit.

DELIMITER //

CREATE TRIGGER after_customer_delete
AFTER DELETE ON customers
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit
    (customerNumber, customerName, action_type, action_date)
    VALUES
    (OLD.customerNumber, OLD.customerName, 'DELETE', NOW());
END //

DELIMITER ;


--  Delete the test customer to check the DELETE trigger.

DELETE FROM customers
WHERE customerNumber = 497;

-- Display the customer audit records.

SELECT *
FROM customer_audit;


-- Display all triggers available in the database.

SHOW TRIGGERS;


-- Drop the INSERT trigger.

DROP TRIGGER after_customer_insert;


--  Drop the UPDATE trigger.

DROP TRIGGER before_product_update;


--  Drop the DELETE trigger.

DROP TRIGGER after_customer_delete;