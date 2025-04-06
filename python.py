import mysql.connector
import pandas as pd

# Connect to MySQL Database
conn = mysql.connector.connect(
    host="localhost",   
    user="root", 
    password="Sa$$yMi$$y@254",  
    database="sales_data",
    port=3306 
)
cursor = conn.cursor()

# SQL Query for Sales by Region
query = """
SELECT sr.region_name, SUM(o.quantity * o.price) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN sales_regions sr ON c.region_id = sr.region_id
GROUP BY sr.region_name;
"""
cursor.execute(query)

# Fetch Data and Convert to DataFrame
data = cursor.fetchall()
df_region_sales = pd.DataFrame(data, columns=["region_name", "total_sales"])

# SQL Query for Sales Trends (monthly)
query_trends = """
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month, SUM(o.quantity * o.price) AS total_sales
FROM orders o
GROUP BY month;
"""
cursor.execute(query_trends)

# Fetch Data and Convert to DataFrame
data_trends = cursor.fetchall()
df_sales_trends = pd.DataFrame(data_trends, columns=["month", "total_sales"])

# Export to Excel
with pd.ExcelWriter('sales_report.xlsx') as writer:
    df_region_sales.to_excel(writer, sheet_name="Sales by Region", index=False)
    df_sales_trends.to_excel(writer, sheet_name="Sales Trends", index=False)

# Close the connection
cursor.close()
conn.close()