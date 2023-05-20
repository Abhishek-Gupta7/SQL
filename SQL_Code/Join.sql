USE store;

SELECT 
	p.product_id,
    p.name,
    oi.order_id,
    oi.quantity
FROM products as p
LEFT OUTER JOIN order_items as oi
ON p.product_id = oi.product_id
WHERE p.product_id > 1;