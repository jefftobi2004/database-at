-- CREATE DATABASE Lucrare_atestat;
USE Lucrare_atestat;

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `unit_price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
INSERT INTO `products` VALUES ('1', 'Cargo Pants', '45', '12.99');
INSERT INTO `products` VALUES ('2', 'Winter Jacket', '20', '29.99');
INSERT INTO `products` VALUES ('3', 'Hoodie', '94', '10.86');
INSERT INTO `products` VALUES ('4', 'Regular shirt', '120', '6.99');
INSERT INTO `products` VALUES ('5', 'Oversized shirt', '90', '7.55');
INSERT INTO `products` VALUES ('6', 'Biker gloves', '20', '5.99');
INSERT INTO `products` VALUES ('7', 'Nike Shoes', '10', '50.00');
INSERT INTO `products` VALUES ('8', 'Sportswear Gym Fitness set', '5', '119.99');
INSERT INTO `products` VALUES ('9', 'Sweater', '40', '12.59');

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `customers` VALUES ('1', 'Baldwin', 'Millie', '1996-12-03', '106-354-0727', '0 Sage Terrace', 'MA', 'Waltham', DEFAULT);
INSERT INTO `customers` VALUES ('2', 'Castro', 'Jameson', '1999-04-02', '382-827-2837', '14187 Commercial Trial', 'VA', 'Hampton', DEFAULT);
INSERT INTO `customers` VALUES (3, 'Freddi', 'Boagey', '1985-02-07', '719-724-7869', '251 Springs Junction', 'Colorado Springs', 'CO', DEFAULT);
INSERT INTO `customers` VALUES (4, 'Ambur', 'Roseburgh', '1974-04-14', '407-231-8017', '30 Arapahoe Terrace', 'Orlando', 'FL', DEFAULT);
INSERT INTO `customers` VALUES (5, 'Clemmie', 'Betchley', '1973-11-07', NULL, '5 Spohn Circle', 'Arlington', 'TX', DEFAULT);
INSERT INTO `customers` VALUES (6, 'Elka', 'Twiddell', '1991-09-04', '312-480-8498', '7 Manley Drive', 'Chicago', 'IL', DEFAULT);
INSERT INTO `customers` VALUES (7, 'Ilene', 'Dowson', '1964-08-30', '615-641-4759', '50 Lillian Crossing', 'Nashville', 'TN', DEFAULT);
INSERT INTO `customers` VALUES (8, 'Thacher', 'Naseby', '1993-07-17', '941-527-3977', '538 Mosinee Center', 'Sarasota', 'FL', DEFAULT);
INSERT INTO `customers` VALUES (9, 'John', 'Fitzgerald', '1992-05-23', '559-181-3744', '3520 Ohio Trail', 'Visalia', 'CA', DEFAULT);
INSERT INTO `customers` VALUES (10,'Levy','Mynett','1969-10-13','404-246-3370','68 Lawn Avenue','Atlanta','GA', DEFAULT);

CREATE TABLE `orders` (
	`order_id` int(11) NOT NULL AUTO_INCREMENT,