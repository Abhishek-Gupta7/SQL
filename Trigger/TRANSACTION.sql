START TRANSACTION;
INSERT INTO orders
	VALUES(default,1,'2023-05-03',1,'COMMENTS','2023-05-03',2);
INSERT INTO order_items
	VALUES(LAST_INSERT_ID(),1,1,1);
ROLLBACK;