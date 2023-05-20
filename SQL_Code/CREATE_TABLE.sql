CREATE DATABASE IF NOT EXISTS sql_store;
USE sql_store;

DROP TABLE IF EXISTS customers;
CREATE TABLE IF NOT EXISTS customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    points INT NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    FOREIGN KEY fk_orders_customer(customer_id)
    REFERENCES customers (customer_id)
    ON UPDATE CASCADE 
    ON DELETE NO ACTION
);

ALTER TABLE customers
	ADD COLUMN  last_name VARCHAR(50) NOT NULL AFTER first_name,
    DROP COLUMN points;
    
ALTER TABLE ORDERS
	ADD COLUMN status VARCHAR(50) NOT NULL ;