-- FUNCTIONS IN SQL
 use classicmodels;
 
 -- find the length of each customer name.
 select customername,
 length(customername) as
 name_length
 from customers;
 
 -- display customername in upper case.
 select customername,
 UPPER (customername)
 as
 uppercase_name
 from customers;
 
 -- display customer name in lowecase.
 select customername,
 LOWER(customername)
 as
 lowercase_name
 from customers;
 
 -- display the first 10 characters of each customers name.
 select customername,
 LEFT(customername,10)
 as
 first_10_characters
 from customers;
 
 -- display the last 5 characters of each customer name.
 select customername,
 RIGHT(customername,5)
 as
 last_5_characters
 from customers;
 
 -- find the position of the word 'cars' in customer names.
 select customername,
 LOCATE('cars',customername)
 as
 position from customers;
 
 -- display customername after removing space from both sides.
 select trim(customername) as trimmed_name
 from customers;
 
 -- display the product name and its quantity rounded to the nearest integer.
 select productname,
 round(quantityinstock) as
 rounded_quantity
 from products;
 
 -- display the products price rounded to 2 decimal places.
 select productname,buyprice ,
 round (buyprice,2)
 as
 rounded_price
 from products;
 
 -- find the absolute value of -500.
 select abs (-500)
 as 
 absolute_value;
 
 -- find the highest buy price rounded to 2 decimal places.
 select round(max(buyprice),2)as 
 highest_price
 from products;
 
 ----------------------------------------------------------------------------------