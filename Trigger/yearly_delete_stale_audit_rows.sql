DROP EVENT IF EXISTS yearly_delete_stale_audit_rows;
-- SHOW EVENTS LIKE 'YEAR%';
-- ALTER EVENT yearly_delete_stale_audit_rows DISABLE;

DELIMITER $$
CREATE EVENT yearly_delete_stale_audit_rows
ON SCHEDULE 
	-- AT '2023-05-03'
    -- EVERY 1 YEAR
    -- EVERY 1 DAY HOUR 
    EVERY 1 DAY STARTS '2023-05-03' ENDS '2025-05-03'
DO
BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$
DELIMITER ;