USE articole_online;

-- Query2

SELECT o.order_id, os.name
FROM orders o
INNER JOIN order_statuses os
ON o.status = os.order_status_id 
WHERE os.name='Processed';