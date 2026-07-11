/* 
=====================================================================
Quality Checks
======================================================================
Script Purpose:
  This script contains example data quality checks that can be applied
  across the Silver layer tables. The checks demonstrate how to validate
  data consistency, accuracy, completeness, and standardization before
  the data is used for reporting and analytics. It includes checks for:
  - null or duplicate primary keys,
  - unwanted spaces,
  - data standardization and consistency,
  - invalid data ranges and orders,
  - data consistency between related fields.
======================================================================
*/

-- ===================================================
-- Check for nulls or duplicates in Primary Key
-- Expectation: No Result
SELECT
prd_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- ===================================================
-- Check for unwanted spaces
-- Expectation: No Results
SELECT 
prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- ===================================================
-- Data standardization & consistency
SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry

-- ===================================================
-- Check for invalid date orders
SELECT *
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt

-- ===================================================
-- Check for nulls or negative numbers
-- Expectation: no Results
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

-- ===================================================
-- Check for invalid dates
SELECT
sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0 OR LEN(sls_order_dt) != 8

-- ===================================================
-- Check data consistency: between sales, quantity and price
SELECT DISTINCT
sls_sales,
sls_quantity,
sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0

-- ===================================================
-- Identify Out-of-Range dayes
SELECT DISTINCT
bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()




