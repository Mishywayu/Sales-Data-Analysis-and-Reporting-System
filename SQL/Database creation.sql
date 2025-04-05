-- Database creation 
CREATE DATABASE sales_data;

use sales_data;

-- Create sales_regions table
CREATE TABLE sales_regions (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL
);

-- Create customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES sales_regions(region_id)
);

-- Create products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Create orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price FLOAT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


# INSERTING SAMPLE DATA
-- Insert data into sales_regions table
INSERT INTO sales_regions (region_name)
VALUES
('North America'),
('Europe'),
('Asia'),
('Australia'),
('South America');

-- Insert data into customers table
INSERT INTO customers (customer_name, region_id)
VALUES
('John Doe', 1),
('Jane Smith', 2),
('Alice Johnson', 3),
('Bob Brown', 4),
('Charlie Davis', 5);

-- Insert data into products table
INSERT INTO products (product_name, category)
VALUES
('Laptop', 'Electronics'),
('Smartphone', 'Electronics'),
('Shoes', 'Clothing'),
('T-shirt', 'Clothing'),
('Headphones', 'Electronics');

-- Insert data into orders table
INSERT INTO orders (order_date, customer_id, product_id, quantity, price)
VALUES
('2025-01-10', 1, 1, 2, 1200.50),
('2025-01-15', 2, 2, 3, 800.99),
('2025-01-20', 3, 3, 1, 50.00),
('2025-01-22', 4, 4, 5, 25.75),
('2025-01-25', 5, 5, 2, 150.25),
('2025-02-10', 1, 2, 1, 799.99),
('2025-02-12', 2, 3, 4, 45.00),
('2025-02-18', 3, 4, 2, 20.00),
('2025-02-20', 4, 1, 3, 1200.50),
('2025-03-05', 5, 5, 1, 150.25);