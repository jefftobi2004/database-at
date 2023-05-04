USE articole_online;

-- Query4

SELECT * FROM products p
WHERE p.bonus_points BETWEEN 10 AND 150
ORDER BY p.unit_price;