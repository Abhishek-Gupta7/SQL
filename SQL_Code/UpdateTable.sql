USE invoicing;

                  --  Updating Multiple Row_ 
UPDATE invoices 
SET payment_total = (invoice_total / 100 * 50 ), payment_date = due_date
WHERE client_id = 3;


                   --  Updating single Row_ 
-- UPDATE invoices 
-- SET payment_total = (invoice_total / 100 * 50 ), payment_date = due_date
-- WHERE invoice_id = 3;