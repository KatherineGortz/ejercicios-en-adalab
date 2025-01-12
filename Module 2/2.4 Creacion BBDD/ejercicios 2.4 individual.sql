SELECT * FROM tienda.customers;

USE tienda;

CREATE TABLE IF NOT EXISTS customers_mod
SELECT * 
FROM customers;

INSERT INTO customers_mod (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (343,'Adalab','Rodriguez','Julia', 672986373, 'Calle Falsa 123', 'Puerta 4', 'Madrid', 'Espana', 28000, 'España', 15, 20000000);

INSERT INTO customers_mod (
    customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit
) 
VALUES (
    344,
    'La pegatina After',
    'Santiago',
    'Maricarmen',
    '00000000',
    'Travesía del rave',
    NULL,
    'Palma de Mallorca',
    NULL,
    '07005',
    'España',
    10,
    45673453
);

delete from customers_mod
where customer_number = 343;

INSERT INTO customers_mod (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (497,'Adalab1','Iglesias','Julio', 672986373, 'Calle Falsa 123', 'Puerta 5', 'Madrid', 'Espana', 28000, 'España', 15, 20000000),
(498,'Adalab2','Picasso','Pablo', 672986373, 'Calle Falsa 456', 'Puerta 6', 'Madrid', 'Espana', 28000, 'España', 15, 20000000),
(499,'Adalab3','Buble','Michael', 672986373, 'Calle Falsa 789', 'Puerta 7', 'Madrid', 'Espana', 28000, 'España', 15, 20000000),
(500,'Adalab4','Harris','Kamala', 672986373, 'Calle Falsa 100', 'Puerta 8', 'Madrid', 'Espana', 28000, 'España', 15, 20000000),
(501,'Adalab5','Swift','Taylor', 672986373, 'Calle Falsa 101', 'Puerta 9', 'Madrid', 'Espana', 28000, 'España', 15, 20000000);

UPDATE customers_mod
SET address_line1= 'Polígono Industrial de Son Castelló', 
address_line2= 'Nave 92', 
city= 'Palma de Mallorca',
state= 'España',
postal_code= 28123,
country= 'Espana',
sales_rep_employee_number= 25,
credit_limit= 5000000
WHERE customer_number = 344;

CREATE TABLE IF NOT EXISTS customers_destroy
SELECT * 
FROM customers_mod;

UPDATE customers_destroy
SET address_line1= 'Vamos',
address_line2= 'a',
postal_code= 'fastidiar',
country= 'la tabla :)';

UPDATE customers_mod
SET sales_rep_employee_number = 2
WHERE customer_number = 112;

delete from customers_mod
where contact_first_name = NULL;

SELECT * FROM tienda.customers_mod
ORDER BY customer_number asc;

SELECT customer_number FROM tienda.customers_mod
ORDER BY customer_number asc
limit 10;
