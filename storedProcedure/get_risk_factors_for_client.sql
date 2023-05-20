Drop function if exists get_risk_factors_for_client;


DELIMITER $$
Create Function get_risk_factors_for_client(
	client_id INT
)
RETURNS INT
MODIFIES SQL DATA
DETERMINISTIC
BEGIN
	DECLARE risk_factor decimal default 0;
    DECLARE invoice_count int;
    DECLARE invoice_totals decimal;
	select 
		count(*),
        sum(invoice_total)
	INTO invoice_count,invoice_totals
	FROM invoices i
    WHERE i.client_id = client_id;
    
    SET risk_factor = invoice_totals / invoice_count * 5;

RETURN IFNULL(risk_factor,0);
END $$
DELIMITER ;