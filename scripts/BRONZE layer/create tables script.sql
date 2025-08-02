/*
This scripts create tables before inserting data. If part checks this table
exists or not, if exists it drops it and recreate it.

Always pay attention to which database you are using.
*/

USE DataWarehouse;
GO

  
IF OBJECT_ID ('Bronze.crm_cust_info' , 'U') IS NOT NULL
	DROP TABLE Bronze.crm_cust_info;
CREATE TABLE Bronze.crm_cust_info (
cst_id                 INT,
cst_key                NVARCHAR(50),
cst_firstname          NVARCHAR(50),
cst_lastname           NVARCHAR(50),
cst_material_status    NVARCHAR(50),
cst_gndr               NVARCHAR(50),
cst_create_date        DATE
);
GO
  

IF OBJECT_ID ('Bronze.crm_prd_info' , 'U') IS NOT NULL
	DROP TABLE Bronze.crm_prd_info;
CREATE TABLE Bronze.crm_prd_info (
prd_id       INT,
prd_key      NVARCHAR(50),
prd_name     NVARCHAR(50),
prd_cost     INT,
prd_line     NVARCHAR(50),
prd_start_dt DATETIME,
prd_end_dt   DATETIME
);
GO

  
IF OBJECT_ID ('Bronze.crm_sales_details' , 'U') IS NOT NULL
	DROP TABLE Bronze.crm_sales_details;
CREATE TABLE Bronze.crm_sales_details (
sls_order_num NVARCHAR(50),
sls_prd_key   NVARCHAR(50),
sls_cust_id   INT,
sls_order_dt  INT,
sls_ship_dt   INT,
sls_due_dt    INT,
sls_sales     INT,
sls_quantity  INT,
sls_price     INT
);
GO

  
IF OBJECT_ID ('Bronze.erp_loc_a101' , 'U') IS NOT NULL
	DROP TABLE Bronze.erp_loc_a101;
CREATE TABLE Bronze.erp_loc_a101 (
cid   NVARCHAR(50),
cntry NVARCHAR(50)
);
GO

  
IF OBJECT_ID ('Bronze.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE Bronze.erp_cust_az12;
CREATE TABLE Bronze.erp_cust_az12 (
cid   NVARCHAR(50),
bdate DATE,
gen   NVARCHAR(50)
);
GO


IF OBJECT_ID ('Bronze.erp_px_cat_g1v2' , 'U') IS NOT NULL
	DROP TABLE Bronze.erp_px_cat_g1v2;
CREATE TABLE Bronze.erp_px_cat_g1v2 (
id          NVARCHAR(50),
cat         NVARCHAR(50),
subcat      NVARCHAR(50),
maintenance NVARCHAR(50)
);








