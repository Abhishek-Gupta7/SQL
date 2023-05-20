Drop procedure if exists make_payments;

DELIMITER $$
Create Procedure make_payments(
	invoice_id int,
    payment_total double(9,2),
    payment_date date
)
BEGIN
	If payment_total <= 0 Then
		Signal SQLSTATE '22003'
			set Message_text = 'Invalid payment amount';
	End if;
    
    update invoices i
    set i.payment_total = payment_total,
		i.payment_date = payment_date
	where i.invoice_id = invoice_id;
    
END $$
DELIMITER ;
