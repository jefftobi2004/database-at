USE articole_online;

-- Query3

CREATE TABLE Comenzi_Livrate AS
(SELECT o.order_id, c.customer_id, c.first_name, c.last_name, o.order_date, o.shipped_date, s.name, os.name AS status
FROM orders o
INNER JOIN customers c
USING (customer_id)
INNER JOIN order_statuses os
ON o.status = os.order_status_id 
INNER JOIN shippers s
USING (shipper_id)
WHERE os.name='Shipped' OR os.name='Delivered');