# Data Dictionary for Gold Layer

## Overview
The gold layer is the business-level data representation, structured to support analytical and reporting use cases.
It consists of dimension tables and fact tables for specific business metrics.

## 1. gold.dim_customers

- **Purpose:** Stores customer details. 
- **Columns:**

| Column Name | Data Type | Description |
|------------|-----------|-------------|
| customer_key | INT | Surrogate key generated for each customer. |
| customer_id | INT | Unique customer identifier. |
| customer_number | NVARCHAR(50) | Alphanumeric identifier representing the customer. |
| first_name | NVARCHAR(50) | The customer's first name. |
| last_name | NVARCHAR(50) | The customer's last name. |
| country | NVARCHAR(50) | The country of residence for the customer (e.g. 'Australia'). |
| marital_status | NVARCHAR(50) | The marital status of the customer (e.g. 'Married'). |
| gender | NVARCHAR(50) | The gender of the customer (e.g. 'Male'). |
| birthdate | DATE | The date of birth of the customer, formatted as YYYY-MM-DD. |
| create_date | DATE | The date when the customer record was created in the system. |

## 2. gold.dim_products

- **Purpose:** Provides information about the products and their attributes. 
- **Columns:**

| Column Name | Data Type | Description |
|------------|-----------|-------------|
| product_key | INT | Surrogate key generated for each product. |
| product_id | INT | Unique product identifier. |
| product_number | NVARCHAR(50) | A structured alphanumeric representing the product. |
| product_name | NVARCHAR(50) | Descriptive name of the product. |
| category_id | NVARCHAR(50) | Unique product category identifier. |
| category | NVARCHAR(50) | The classification of the product. |
| subcategory | NVARCHAR(50) | A more detailed classification of the produc. |
| maintenance | NVARCHAR(50) | Indicates whether the product requires maintenance (e.g. 'Yes', 'No'). |
| cost | INT | The cost or base price of the product. |
| product_line | DATE | The specific product line or series to which the product belongs. |
| start_date | DATE | The date when the product became available for sale or use, formatted as YYYY-MM-DD.|

## 3. gold.fact_sales

- **Purpose:** Stores transactional sales data for analytical purposes.
- **Columns:**

| Column Name | Data Type | Description |
|------------|-----------|-------------|
| order_number | NVARCHAR(50) | A unique alphanumeric identifier for each sales order |
| product_key | INT | Surrogate key linking the order to the product dimension table. |
| customer_key | INT | Surrogate key linking the order to the customer dimension table. |
| order_date | DATE | The date when the order was placed. |
| shipping_date | DATE | The date when the order was shipped to the customer.  |
| due_date | DATE | The date when the order payment was due. |
| sales_amount | INT | The total value of the sale for the line item. |
| quantity | INT | The number of units of the product ordered for the line item. |
| price | INT | The price per unit of the product for the line item. |









