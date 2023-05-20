USE invoicing;

SELECT  c.name,
		pm.name AS "Payment Mode"
FROM
	payments as p
JOIN
	clients as c
ON 	p.client_id = c.client_id
JOIN 
	payment_methods pm
ON 	p.payment_method = pm.payment_method_id;
