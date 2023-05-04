USE articole_online;

-- Query1

SELECT * FROM products p
WHERE p.unit_price < 30
ORDER BY p.unit_price;

-- Query2

SELECT o.order_id, os.name
FROM orders o
INNER JOIN order_statuses os
ON o.status = os.order_status_id 
WHERE os.name='Processed';

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

-- Query4

SELECT * FROM products p
WHERE p.bonus_points BETWEEN 10 AND 150
ORDER BY p.unit_price;

-- Query5

SELECT * FROM customers c
WHERE c.state REGEXP 'MA|TX|IL' AND c.phone IS NOT NULL; 

-- Query6

CREATE TABLE order_items2 AS 
(SELECT oi.order_id, oi.product_id, oi.quantity, p.unit_price * oi.quantity AS total_price, p.bonus_points * oi.quantity AS total_points
FROM products p
INNER JOIN order_items oi USING (product_id)
ORDER BY oi.order_id);

ALTER TABLE order_items2 ADD PRIMARY KEY (order_id, product_id);
ALTER TABLE order_items2 MODIFY order_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 13;
ALTER TABLE order_items2 MODIFY product_id int(11) NOT NULL;
ALTER TABLE order_items2 MODIFY quantity int(11) NOT NULL;
ALTER TABLE order_items2 MODIFY total_price decimal(10,2) NOT NULL;
ALTER TABLE order_items2 MODIFY total_points int(11) NOT NULL;
ALTER TABLE order_items2 ADD INDEX `fk_order_items2_products_idx` (`product_id`);
ALTER TABLE order_items2 ADD 
	CONSTRAINT `fk_order_items2_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
ALTER TABLE order_items2 ADD
	CONSTRAINT `fk_order_items2_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
	
DROP TABLE order_items;
RENAME TABLE order_items2 to order_items;

-- Query7

USE articole_online;
CREATE TABLE test AS
(SELECT o.customer_id, oi.order_id, p.product_id, oi.total_points AS TOTAL
FROM order_items oi
INNER JOIN orders o
	USING(order_id)
INNER JOIN products p
	USING(product_id)
ORDER BY o.customer_id);

ALTER TABLE test ADD 
	CONSTRAINT `fk_customers_test` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);
    
CREATE TABLE customers2 AS
(SELECT c.customer_id, c.first_name, c.last_name, c.birth_date, c.phone, c.address, c.city, c.state, 
	SUM(t.TOTAL) AS fidelity_points, c.rank
	FROM test t 
    INNER JOIN customers c USING (customer_id)
    GROUP BY customer_id);

ALTER TABLE `customers2` ADD PRIMARY KEY (`customer_id`);
ALTER TABLE `customers2` MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 11;
ALTER TABLE `customers2` MODIFY `first_name` varchar(50) NOT NULL;
ALTER TABLE `customers2` MODIFY `last_name` varchar(50) NOT NULL;
ALTER TABLE `customers2` MODIFY `birth_date` date DEFAULT NULL;
ALTER TABLE `customers2` MODIFY `phone` varchar(50) DEFAULT NULL;
ALTER TABLE `customers2` MODIFY `address` varchar(50) NOT NULL;
ALTER TABLE `customers2` MODIFY `city` varchar(50) NOT NULL;
ALTER TABLE `customers2` MODIFY `state` char(2) NOT NULL;
ALTER TABLE `customers2` MODIFY `fidelity_points` int(11) NOT NULL DEFAULT '0';
ALTER TABLE `customers2` MODIFY `rank` varchar(50) NOT NULL;


ALTER TABLE `orders` ADD 
	FOREIGN KEY `fk_orders_customers2` (`customer_id`) REFERENCES `customers2` (`customer_id`) ON UPDATE CASCADE;
RENAME TABLE `customers` to `customers3`;
RENAME TABLE `customers2` to `customers`;
DROP TABLE `test`;
RENAME TABLE `customers3` to `gitignore`;

-- Query8

SELECT * FROM customers c
WHERE c.last_name REGEXP 'ey$|on$'
ORDER BY c.first_name;

-- Query9

UPDATE customers c SET c.rank = 'Bronze'
WHERE c.fidelity_points < 1000;

UPDATE customers c SET c.rank = 'Silver'
WHERE c.fidelity_points > 1000 AND c.fidelity_points < 2000;

UPDATE customers c SET c.rank = 'Gold'
WHERE c.fidelity_points > 2000 AND c.fidelity_points < 4000;

UPDATE customers c SET c.rank = 'VIP'
WHERE c.fidelity_points > 4000;

-- Query10

SELECT * FROM customers c
ORDER BY c.fidelity_points;
