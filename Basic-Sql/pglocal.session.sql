-- CREATE TABLE sales
CREATE TABLE sales(
    id INT,
    sales_date DATE,
    product VARCHAR(50),
    quantity INT,
    revenue DECIMAL(10, 2)   
)

-- INSERT VALUES INTO sales
INSERT INTO sales (id, sales_date, product, quantity, revenue) VALUES
(1, '2023-01-01', 'Widget A', 10, 100.00),
(2, '2023-01-02', 'Widget B', 5, 50.00),
(3, '2023-01-03', 'Widget C', 20, 200.00),
(4, '2023-01-04', 'Widget A', 15, 150.00),
(5, '2023-01-05', 'Widget B', 8, 80.00);

--SELECT QUERIES
SELECT * FROM sales;

-- Retrieve data only for a specific product, such as "Product A":
SELECT * FROM sales WHERE product = 'Widget A';


--Retrieve the total revenue for each day:
SELECT sales_date, SUM(revenue) FROM sales GROUP BY sales_date ORDER BY sales_date;

--Retrieve the total quantity sold for each product:
SELECT product, SUM(quantity) FROM sales GROUP BY product ORDER BY SUM(quantity);

