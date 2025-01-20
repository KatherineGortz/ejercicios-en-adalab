USE bbdd_empleadas;

SELECT *  
FROM empleadas  
WHERE nombre LIKE 'A%';

SELECT *  
FROM empleadas  
WHERE nombre LIKE 'E_%';

SELECT *  
FROM empleadas  
WHERE nombre LIKE '%l%';