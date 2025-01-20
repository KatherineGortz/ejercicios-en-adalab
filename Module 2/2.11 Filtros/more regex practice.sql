USE bbdd_empleadas_regex;

SELECT *
FROM empleadas;

SELECT *
FROM empleadas
WHERE nombre REGEXP 'n';

SELECT *
FROM empleadas
WHERE email REGEXP '@gmail\\.com';

SELECT *
FROM empleadas
WHERE telefono REGEXP '^[0-9]+$';