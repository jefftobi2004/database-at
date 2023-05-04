USE articole_online;

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