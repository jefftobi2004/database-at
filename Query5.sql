USE articole_online;

-- Query5

SELECT * FROM customers c
WHERE c.state REGEXP 'MA|TX|IL' AND c.phone IS NOT NULL;