
						-- Copy A Table
-- USE invoicing;
-- CREATE TABLE archived_invoices AS
-- SELECT 
-- 	inv.invoice_id,
-- 	inv.number,
--     c.name AS client,
--     inv.invoice_total,
--     inv.payment_total,
--     inv.payment_date,
--     inv.due_date
-- FROM invoices inv
-- JOIN clients  c 
-- USING (client_id)
-- WHERE  inv.payment_date IS NOT NULL;

 
 
-- USE store; 
--  CREATE TABLE orders_archived AS 
--  SELECT * FROM orders;
--  
-- INSERT INTO orders_archived
-- SELECT * FROM orders
-- WHERE order_date < '2019-1-1';
 
                   -- Insert into Hierarchical Rows
-- INSERT INTO orders (customer_id , order_date , status)
-- 	VALUES( 5 , '2022-11-20' , 3);
--     
-- INSERT INTO order_items 
-- 	VALUES (LAST_INSERT_ID() , 1 , 2 , 2.55);