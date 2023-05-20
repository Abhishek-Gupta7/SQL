DROP PROCEDURE IF EXISTS get_invoices_by_clients;

DELIMITER $$
CREATE PROCEDURE get_invoices_by_clients(
	client_id int
)
BEGIN 
	SELECT * FROM invoices i
    WHERE i.client_id = client_id;
END $$
DELIMITER ;

CALL get_invoices_by_clients(3);

