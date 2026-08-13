  use normalization_practice;
  
  -- create the table according to 3nf form.
  -- remove transitive dependency by seperating city information.
  
  create table cities_3nf 
  (
  city_id int primary key,
  city_name varchar(50)
  );
  
  create table customers_3nf(
  customer_id int primary key,
  customer_name varchar(50),
  city_id int,
  foreign key (city_id)
  references 
  cities_3nf(city_id)
  );
  
  -- insert city information
  insert into cities_3nf
  values
  (1,'pune'),
  (2,'mumbai');
  
  -- insert customer information
  insert into customers_3nf
  values
  (1,'Anjali',1),
  (2,'Rahul',2),
  (3,'Priya',1);
  
  -- display the 3nf table.
  select * from cities_3nf;
  select* from customers_3nf;
  
  -- display customer names along with their city with city using  inner join.
  select 
  c.customer_id,
    c.customer_name,
  city.city_name
  from customers_3nf c
  join cities_3nf city
  on c.city_id=city.city_id;
  
  
  show tables;
  
  