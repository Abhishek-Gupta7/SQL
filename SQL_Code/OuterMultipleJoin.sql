SELECT 
	o.order_id,
    o.order_date,
    o.status,
    c.first_name AS Customer,
    s.name AS Shipper,
    os.name AS StatusName
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
LEFT JOIN shippers s
ON o.shipper_id = s.shipper_id
JOIN order_statuses os
ON o.status = os.order_status_id
ORDER BY o.order_id;