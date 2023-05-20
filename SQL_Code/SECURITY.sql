-- CREATE USER Abhi identified by "12345";

-- CREATE USER Abhi@google.com identified by "12345";
-- Drop user Abhi@google.com;
-- Select * from mysql.user;

-- set password for Abhi = "12345";
-- set password = "12345";

-- 	Web and Desktop  
CREATE USER app IDENTIFIED BY '12345';

GRANT SELECT,INSERT,UPDATE,DELETE,EXECUTE,ALTER
ON store.* 
TO app;

-- Admin 
GRANT ALL
ON *.*
TO  Abhi;

SHOW GRANTS FOR Abhi;

GRANT CREATE VIEW 
ON store.*
TO app;

REVOKE CREATE VIEW 
ON store.*
FROM app;