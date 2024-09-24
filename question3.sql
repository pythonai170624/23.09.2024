CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    sale_amount DECIMAL(10, 2),
    sale_timestamp TIMESTAMP
);

-- Insert sample data with timestamps
INSERT INTO sales (product_name, sale_amount, sale_timestamp) VALUES
('Laptop', 1200.50, '2024-01-10 10:30:00'),
('Smartphone', 800.00, '2024-01-15 14:45:00'),
('Tablet', 450.75, '2024-02-05 09:00:00'),
('Monitor', 250.00, '2024-03-10 11:15:00'),
('Keyboard', 50.00, '2024-03-12 16:30:00');

SELECT * FROM sales
WHERE sale_timestamp >= '2024-03-01 00:00:00'
AND sale_timestamp < '2024-04-01 00:00:00';

SELECT * FROM sales
WHERE EXTRACT(DOW FROM sale_timestamp) IN (0, 6);

SELECT * FROM sales
WHERE sale_timestamp >= NOW() - INTERVAL '7 days';

SELECT * FROM sales
WHERE EXTRACT(HOUR FROM sale_timestamp) BETWEEN 9 AND 17;

SELECT DATE(sale_timestamp) AS sale_date, COUNT(*) AS total_sales
FROM sales
GROUP BY DATE(sale_timestamp)
ORDER BY sale_date;

SELECT DATE(sale_timestamp) AS sale_date, COUNT(*) AS total_sales
FROM sales
GROUP BY DATE(sale_timestamp)
ORDER BY sale_date;

SELECT * FROM sales
WHERE EXTRACT(HOUR FROM sale_timestamp) < 12;

SELECT product_name, MIN(sale_timestamp) AS first_sale
FROM sales
GROUP BY product_name;

SELECT product_name, MAX(sale_timestamp) AS last_sale
FROM sales
GROUP BY product_name;

SELECT DATE(sale_timestamp) AS sale_date, SUM(sale_amount) AS total_sales
FROM sales
WHERE EXTRACT(HOUR FROM sale_timestamp) BETWEEN 12 AND 14
GROUP BY DATE(sale_timestamp);






