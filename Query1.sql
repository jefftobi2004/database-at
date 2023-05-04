USE articole_online;

-- Query1

SELECT * FROM products p
WHERE p.unit_price < 30
ORDER BY p.unit_price;