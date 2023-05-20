Drop procedure if exists get_risk_factor;

DELIMITER $$
Create Procedure get_risk_factor()
BEGIN

	DECLARE risk_factor decimal default 0;
    DECLARE invoice_count int;
    DECLARE invoice_totals decimal;
	select 
		count(*),
        sum(invoice_total)
	INTO invoice_count,invoice_totals
	from invoices;
    
    set risk_factor = invoice_totals / invoice_count * 5;
    select risk_factor;
END $$
DELIMITER ;