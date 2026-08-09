--  ACID PROPERTIES IN SQL 
use classicmodels;

-- A->ATOMICITY
-- completely or not executed at all .
start transaction ;
update customers 
set creditlimit =creditlimit + 100
where customernumber =103;
update customers set creditlimit =creditlimit +1000 
where customernumber=112;
commit;

-- C->CONSISTENCY
-- remains valid before and after transaction.
start transaction;
update customers 
set creditlimit =creditlimit +500
where customernumber =103;
commit;


-- I->ISOLATION
-- execute without interfering with each other .
start transaction;
select customernumber,customername,creditlimit 
from customers
where customernumber=103;
commit;

-- D->DURABILITY
-- commited ,the changes remain saved.
start transaction;
update customers
set creditlimit =creditlimit +2000
where customernumber=103;
commit;
select * from customers;

-- ROLLBACK 
-- current transaction before commit .
start transaction;
update customers 
set creditlimit =creditlimit+5000
where  customernumber =103;
rollback;
-- verify that the changes was cancellled 
select customernumber,customername,creditlimit 
from customers 
where customernumber=103;

-- COMMIT PRACTICE
-- COMMIT  peremanently saves the transaction.
start transaction;
update customers 
set creditlimit=creditlimit+1000
where customernumber=103;
commit;
-- verify saved changes 
select customernumber,customername,creditlimit 
from customers 
where customernumber=103;