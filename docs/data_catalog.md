Data Dictionary for Gold Layer

Overview
The gold layer is the business-level data representation, structured to support analyticaal and reporting use cases. 
It consists of dimension tables and fact tables for specific business metrics.

1. gold.dim_customers
- Purpose: Stores cutomers details.
- Columns:
  customer_key - INT -
  customer_id - INT -
  customer_number - NVARCHAR(50) -
  first_name - NVARCHAR(50) -
  last_name - NVARCHAR(50) -
  country - NVARCHAR(50) -
  marital_status - NVARCHAR(50) -
  gender - NVARCHAR(50) -
  birthdate - DATE -

  
