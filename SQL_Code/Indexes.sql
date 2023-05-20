USE store;

ANALYZE TABLE customers;
show index in customers;
show index in orders;
EXPLAIN SELECT COUNT(*) FROM customers WHERE points > 1000;
CREATE INDEX idx_state ON customers (state);
CREATE INDEX idx_points ON customers (points);

EXPLAIN SELECT COUNT(DISTINCT LEFT(last_name,1)) FROM customers;

 CREATE FULLTEXT INDEX idx_title_body ON posts (title,body);
 Explain SELECT *
 FROM posts 
 WHERE MATCH(title,body) AGAINST('react redux +form'in boolean mode);
 
  -- Crete composite index 
  use store;
 SHOW INDEX IN  customers;
 DROP INDEX idx_points ON customers ;
 CREATE INDEX idx_state_point ON customers (state,points);
 
 Explain SELECT *
 FROM customers 
 WHERE state = 'CA' AND points > 1000;
 
--  CREATE INDEX idx_lastname_state ON customers (last_name,state);
-- CREATE INDEX idx_state_lastname ON customers (state,last_name);
--  
--  Explain SELECT *
--  FROM customers

--  WHERE state LIKE 'A%' AND last_name LIKE 'A%';
