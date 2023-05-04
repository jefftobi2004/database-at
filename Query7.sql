USE articole_online;

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