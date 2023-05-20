show variables like 'transaction_isolation';
set transaction isolation level REPEATABLE READ;


UPDATE products
set properties = JSON_OBJECT(
	'wEIGHT',40,
    "DIMENSION",JSON_ARRAY(1,2,3,4),
    "MANUFACTURER" , JSON_OBJECT("NAME","sONY")
)
WHERE product_id = 2;

SELECT 
	product_id,
    JSON_EXTRACT(properties,'$.weight')
from products
where product_id = 1;

SELECT 
	product_id,
    properties ->> '$.manufacturer.name'
from products
where product_id = 1;

UPDATE products
set properties = JSON_SET(
	properties,
	'$.weight',40,
    '$.age', 20 
)
WHERE product_id = 1;

UPDATE products
set properties = JSON_REMOVE(
	properties,
	'$.age'
)
WHERE product_id = 1;