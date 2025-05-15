a. SELECT, WHERE, ORDER BY, GROUP BY

-- List customers from 'USA' ordered by name
SELECT name, email, country 
FROM customers 
WHERE country = 'USA' 
ORDER BY name;

-- Total order amount per country
SELECT country, SUM(order_amount) AS total_spent 
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY country 
ORDER BY total_spent DESC;

b. JOINS (INNER, LEFT, RIGHT)
-- INNER JOIN: List all orders with customer names
SELECT o.order_id, c.name, o.order_date, o.order_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- LEFT JOIN: Show all customers and their orders (even if no orders)
SELECT c.name, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN: Products and which orders they are in (if any)
SELECT p.product_name, oi.order_id
FROM products p
RIGHT JOIN order_items oi ON p.product_id = oi.product_id;

c. Subqueries

-- Customers who have placed more than 2 orders
SELECT name 
FROM customers 
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders 
    GROUP BY customer_id 
    HAVING COUNT(order_id) > 2
);

-- Orders above average order amount
SELECT * 
FROM orders 
WHERE order_amount > (
    SELECT AVG(order_amount) 
    FROM orders
);

d. Aggregate Functions (SUM, AVG)

-- Total and average order amount
SELECT SUM(order_amount) AS total_sales, AVG(order_amount) AS avg_order 
FROM orders;

-- Total quantity of each product sold
SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name;

e. Create Views for Analysis

-- View for customer order summary
CREATE VIEW customer_order_summary AS
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders, SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;
SELECT * FROM customer_order_summary;

f. Optimize Queries with Indexes

-- Add index on customer_id in orders table for faster joins
CREATE INDEX idx_orders_customer_id ON orders(customer_id);

-- Add index on product_id in order_items table
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
SHOW INDEX FROM order_items;