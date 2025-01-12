USE tienda;

SELECT customer_name, phone, address_line1
FROM customers;

SELECT *
FROM customers
WHERE country= 'USA';

SELECT contact_last_name, contact_first_name
FROM customers
WHERE address_line2 IS NULL;

SELECT *
FROM customers
WHERE state IS NOT NULL;

SELECT *
FROM customers
WHERE country = 'USA' and state IS NULL;

SELECT *
FROM customers
WHERE credit_limit > 10000;


