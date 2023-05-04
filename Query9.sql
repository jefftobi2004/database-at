USE articole_online;

-- Query9

UPDATE customers c SET c.rank = 'Bronze'
WHERE c.fidelity_points < 1000;

UPDATE customers c SET c.rank = 'Silver'
WHERE c.fidelity_points > 1000 AND c.fidelity_points < 2000;

UPDATE customers c SET c.rank = 'Gold'
WHERE c.fidelity_points > 2000 AND c.fidelity_points < 4000;

UPDATE customers c SET c.rank = 'VIP'
WHERE c.fidelity_points > 4000;