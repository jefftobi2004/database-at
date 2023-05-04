DROP DATABASE IF EXISTS `Articole_online`;
CREATE DATABASE `Articole_online`;
USE `Articole_online`;

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `unit_price` decimal(6,2) NOT NULL,
  `bonus_points` int(11) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
INSERT INTO `products` VALUES (1, 'Cargo Pants', 45, 12.99, 100);
INSERT INTO `products` VALUES (2, 'Winter Jacket', 20, 29.99, 250);
INSERT INTO `products` VALUES (3, 'Hoodie', 94, 10.86, 75);
INSERT INTO `products` VALUES (4, 'Regular shirt', 120, 6.99, 50);
INSERT INTO `products` VALUES (5, 'Oversized shirt', 90, 7.55, 60);
INSERT INTO `products` VALUES (6, 'Biker gloves', 20, 5.99, 40);
INSERT INTO `products` VALUES (7, 'Nike Shoes', 10, 50.00, 750);
INSERT INTO `products` VALUES (8, 'Sportswear Set', 5, 99.99, 2000);
INSERT INTO `products` VALUES (9, 'Sweater', 40, 12.59, 90);

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `fidelity_points` varchar(50) NOT NULL DEFAULT 'To be calculated',
  `rank` VARCHAR(50) DEFAULT 'To be determined',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `customers` VALUES (1, 'Baldwin', 'Millie', '1996-12-03', '106-354-0727', '0 Sage Terrace', 'Waltham', 'MA', DEFAULT, DEFAULT);
INSERT INTO `customers` VALUES (2, 'Castro', 'Jameson', '1999-04-02', '382-827-2837', '14187 Commercial Trial', 'Hampton', 'VA', DEFAULT, DEFAULT);
INSERT INTO `customers` VALUES (3, 'Freddi', 'Boagey', '1985-02-07', '719-724-7869', '251 Springs Junction', 'Colorado Springs', 'CO', DEFAULT, DEFAULT);
INSERT INTO `customers` VALUES (4, 'Ambur', 'Roseburgh', '1974-04-14', '407-231-8017', '30 Arapahoe Terrace', 'Orlando', 'FL', DEFAULT, DEFAULT);
INSERT INTO `customers` VALUES (5, 'Clemmie', 'Betchley', '1973-11-07', NULL, '5 Spohn Circle', 'Arlington', 'TX', DEFAULT, DEFAULT);
INSERT INTO `customers` VALUES (6, 'Elka', 'Twiddell', '1991-09-04', '312-480-8498', '7 Manley Drive', 'Chicago', 'IL', DEFAULT, DEFAULT);
INSERT INTO `customers` VALUES (7, 'Ilene', 'Dowson', '1964-08-30', '615-641-4759', '50 Lillian Crossing', 'Nashville', 'TN', DEFAULT, DEFAULT);
INSERT INTO `customers` VALUES (8, 'Thacher', 'Naseby', '1993-07-17', '941-527-3977', '538 Mosinee Center', 'Sarasota', 'FL', DEFAULT, DEFAULT);
INSERT INTO `customers` VALUES (9, 'John', 'Fitzgerald', '1992-05-23', '559-181-3744', '3520 Ohio Trail', 'Dallas', 'TX', DEFAULT, DEFAULT);
INSERT INTO `customers` VALUES (10,'Levy','Mynett','1969-10-13','404-246-3370','68 Lawn Avenue','Atlanta','GA', DEFAULT, DEFAULT);

CREATE TABLE `shippers` (
  `shipper_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`shipper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `shippers` VALUES (1,'Hettinger LLC');
INSERT INTO `shippers` VALUES (2,'Blue Dart Express');
INSERT INTO `shippers` VALUES (3,'Satterfield LLC');
INSERT INTO `shippers` VALUES (4,'Yamato holdings');
INSERT INTO `shippers` VALUES (5,'FedEx Express');

CREATE TABLE `order_statuses` (
  `order_status_id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `order_statuses` VALUES (1,'Processed');
INSERT INTO `order_statuses` VALUES (2,'Shipped');
INSERT INTO `order_statuses` VALUES (3,'Delivered');

CREATE TABLE `orders` (
	`order_id` int(11) NOT NULL AUTO_INCREMENT,
    `customer_id` int(11) NOT NULL,
    `order_date` date NOT NULL,
    `status` tinyint(4) NOT NULL DEFAULT '1',
    `shipped_date` date DEFAULT NULL,
    `shipper_id` tinyint(4) DEFAULT NULL,
    PRIMARY KEY (`order_id`),
    INDEX `fk_orders_customers_idx` (`customer_id`),
    INDEX `fk_orders_shippers_idx` (`shipper_id`),
    INDEX `fk_orders_status_idx` (`status`),
    CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE,
    CONSTRAINT `fk_orders_status` FOREIGN KEY (`status`) REFERENCES `order_statuses` (`order_status_id`) ON UPDATE CASCADE,
    CONSTRAINT `fk_orders_shippers` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`shipper_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `orders` VALUES (1, 2, '2021-03-23', 2, '2021-03-29', 3);
INSERT INTO `orders` VALUES (2, 5, '2023-03-04', 1, DEFAULT, DEFAULT);
INSERT INTO `orders` VALUES (3, 6, '2022-12-30', 2, '2023-02-01', 5);
INSERT INTO `orders` VALUES (4, 2, '2023-01-05', 1, DEFAULT, DEFAULT);
INSERT INTO `orders` VALUES (5, 7, '2022-07-17', 2, '2022-09-03', 1);
INSERT INTO `orders` VALUES (6, 9, '2023-01-01', 1, DEFAULT, DEFAULT);
INSERT INTO `orders` VALUES (7, 10, '2021-01-07', 2, '2021-02-05', 3);
INSERT INTO `orders` VALUES (8, 4, '2023-02-21', 2, '2023-02-23', 5);
INSERT INTO `orders` VALUES (9, 3, '2022-04-19', 2, '2022-04-22', 2);
INSERT INTO `orders` VALUES (10, 8, '2023-03-02', 1, DEFAULT, DEFAULT);
INSERT INTO `orders` VALUES (11, 1, '2022-09-24', 2, '2022-12-23', 5);
INSERT INTO `orders` VALUES (12, 1, '2023-03-08', 1, DEFAULT, DEFAULT);

CREATE TABLE `order_items` (
	`order_id` int(11) NOT NULL AUTO_INCREMENT,
    `product_id` int(11) NOT NULL,
    `quantity` int(11) NOT NULL,
    `total_price` decimal(6,2) NOT NULL DEFAULT '0.00',
    `total_points` int(11) NOT NULL DEFAULT '0.00',
    PRIMARY KEY (`order_id`, `product_id`),
    INDEX `fk_order_items_products_idx` (`product_id`),
    CONSTRAINT `fk_order_items_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
    CONSTRAINT `fk_order_items_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `order_items` VALUES (1,4,4,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (2,1,2,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (2,4,4,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (2,6,2,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (3,3,10,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (4,3,7,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (4,9,2,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (5,2,3,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (6,1,4,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (6,2,4,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (6,7,4,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (6,5,1,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (7,3,7,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (8,5,2,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (8,8,2,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (9,6,5,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (10,1,10,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (10,9,5,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (11,6,3,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (11,7,1,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (11,8,1,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (12,9,2,DEFAULT,DEFAULT);
INSERT INTO `order_items` VALUES (12,6,1,DEFAULT,DEFAULT);