USE articole_online;

-- Query8

SELECT * FROM customers c
WHERE c.last_name REGEXP 'ey$|on$'
ORDER BY c.first_name;