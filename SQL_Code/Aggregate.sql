USE invoicing;

SELECT "First Half of 2019" AS "Date Range",
	   SUM(invoice_total) AS "Total Sales",
	   SUM(payment_total) AS "Total Payment",
       SUM(invoice_total - payment_total) AS "What we Expecting"
FROM invoices
WHERE payment_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION 
SELECT "Second Half of 2019" AS "Date Range",
	   SUM(invoice_total) AS "Total Sales",
	   SUM(payment_total) AS "Total Payment",
       SUM(invoice_total - payment_total) AS "What we Expecting"
FROM invoices
WHERE payment_date BETWEEN '2019-07-01' AND '2019-12-31'
UNION 
SELECT "Total" AS "Date Range",
	   SUM(invoice_total) AS "Total Sales",
	   SUM(payment_total) AS "Total Payment",
       SUM(invoice_total - payment_total) AS "What we Expecting"
FROM invoices
WHERE payment_date BETWEEN '2019-01-01' AND '2019-12-31'
