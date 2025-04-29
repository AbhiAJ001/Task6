-- 1. Create database and table
CREATE DATABASE IF NOT EXISTS online_sales;
USE online_sales;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    product_id INT NOT NULL
);

-- 2. Stored procedure to generate sample data
DELIMITER $$
CREATE PROCEDURE GenerateOrders()
BEGIN
    DECLARE counter INT DEFAULT 0;
    WHILE counter < 400 DO
        INSERT INTO orders (order_date, amount, product_id)
        VALUES (
            DATE_ADD('2022-01-01', INTERVAL FLOOR(RAND() * 800) DAY),
            ROUND(10 + (RAND() * 990), 2),
            FLOOR(1 + (RAND() * 50))
        );
        SET counter = counter + 1;
    END WHILE;
END$$
DELIMITER ;

-- Generate data (execute once)
CALL GenerateOrders();
