-- SELECT * FROM store.order_items;

SELECT 
	ot.product_id,
    order_id,
    p.name,
    ot.quantity,
    ot.unit_price
FROM order_items as ot
JOIN products  as p ON 
ot.product_id = p.product_id;