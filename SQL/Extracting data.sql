use sales_data;

select * from customers;
select * from orders;
select * from products;
select * from sales_regions;

# extracting sales data

-- Total sales by region
SELECT sr.region_name, SUM(o.quantity * o.price) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN sales_regions sr ON c.region_id = sr.region_id
GROUP BY sr.region_name;

-- Sales trends over time (monthly)
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month, SUM(o.quantity * o.price) AS total_sales
FROM orders o
GROUP BY month;



