# Elevate_labs_3
Internship(Task3)
# SQL Customer Orders Database

This project defines and demonstrates an SQL database structure for managing customers, products, orders, and related analytics for a sample e-commerce system.

---

## 📂 Database Structure

The database consists of the following tables:

- **customers**: Stores customer information.
- **categories**: Stores product categories.
- **products**: Contains product listings and their category.
- **orders**: Holds individual order records linked to customers.
- **order_items**: Line items for each order referencing products.

---

## 🧾 SQL Features Demonstrated

### a. Basic Queries
- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
- Example: List customers from the USA ordered by name.

### b. Joins
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- Example: Get all orders with customer names.

### c. Subqueries
- Nested queries using `IN`, `HAVING`, and comparison operators.
- Example: Get customers with more than two orders.

### d. Aggregate Functions
- `SUM`, `AVG`, and `GROUP BY`
- Example: Total quantity sold per product.

### e. Views
- Created view: `customer_order_summary`
- Summary of total orders and spending per customer.

### f. Indexing
- Added indexes to optimize joins and lookups:
  - `orders(customer_id)`
  - `order_items(product_id)`

---
