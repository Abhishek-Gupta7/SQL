Drop procedure if exists get_unpaid_invoices_for_client;

DELIMITER $$
Create Procedure get_unpaid_invoices_for_client(
	client_id int,
    out invoice_count int,
    out invoice_totals decimal
)
BEGIN
	select 
		count(*),
        sum(invoice_total)
	INTO invoice_count,invoice_totals
	from invoices i
    where i.client_id = client_id AND payment_total = 0;
END $$
DELIMITER ;
