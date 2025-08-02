/*
This scripts insert datas into precreated empty tables. Before inserting 
it makes tables empty and insert data inside them.
*/


CREATE OR ALTER PROCEDURE Bronze.load_bronze AS 
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;

	BEGIN TRY
		SET @batch_start_time = GETDATE();
			PRINT '===================================================================';
			PRINT 'LOADING BRONZE LAYER';
			PRINT '===================================================================';
			PRINT '===================================================================';
			PRINT 'LOADING CRM TABLES';
			PRINT '===================================================================';

		SET @start_time = GETDATE();
			PRINT '>> Truncating Table: Bronze.crm_cust_info';
			TRUNCATE TABLE Bronze.crm_cust_info;
			PRINT '>> Inserting Data Into: Bronze.crm_cust_info';
			BULK INSERT Bronze.crm_cust_info
			FROM 'D:\SQL Data Warehouse Project\datasets\source_crm\cust_info.csv'
			WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );
		SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
	

		SET @start_time = GETDATE();
			PRINT '>> Truncating Table: Bronze.crm_prd_info';
			TRUNCATE TABLE Bronze.crm_prd_info;
			PRINT '>> Inserting Data Into: Bronze.crm_prd_info';
			BULK INSERT Bronze.crm_prd_info
			FROM 'D:\SQL Data Warehouse Project\datasets\source_crm\prd_info.csv'
			WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );
		SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

		SET @start_time = GETDATE();
			PRINT '>> Truncating Table: Bronze.crm_sales_details';
			TRUNCATE TABLE Bronze.crm_sales_details;
			PRINT '>> Inserting Data Into: Bronze.crm_sales_details';
			BULK INSERT Bronze.crm_sales_details
			FROM 'D:\SQL Data Warehouse Project\datasets\source_crm\sales_details.csv'
			WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );
		SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

			PRINT '===================================================================';
			PRINT 'LOADING ERP TABLES';
			PRINT '===================================================================';


		SET @start_time = GETDATE();
			PRINT '>> Truncating Table: Bronze.erp_cust_az12';
			TRUNCATE TABLE Bronze.erp_cust_az12;
			PRINT '>> Inserting Data Into: Bronze.erp_cust_az12';
			BULK INSERT Bronze.erp_cust_az12
			FROM 'D:\SQL Data Warehouse Project\datasets\source_erp\CUST_AZ12.csv'
			WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );
		SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

		SET @start_time = GETDATE();
			PRINT '>> Truncating Table: Bronze.erp_loc_a101';
			TRUNCATE TABLE Bronze.erp_loc_a101;
			PRINT '>> Inserting Data Into: Bronze.erp_loc_a101';
			BULK INSERT Bronze.erp_loc_a101
			FROM 'D:\SQL Data Warehouse Project\datasets\source_erp\LOC_A101.csv'
			WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );
		SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
	
		SET @start_time = GETDATE();
			PRINT '>> Truncating Table: Bronze.erp_px_cat_g1v2';
			TRUNCATE TABLE Bronze.erp_px_cat_g1v2;
			PRINT '>> Inserting Data Into: Bronze.erp_px_cat_g1v2';
			BULK INSERT Bronze.erp_px_cat_g1v2
			FROM 'D:\SQL Data Warehouse Project\datasets\source_erp\PX_CAT_G1V2.csv'
			WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );
		SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		
		SET @batch_end_time = GETDATE();

			PRINT '======================================================';
			PRINT 'LOADING BRONZE LAYER IS COMPLETED';
			PRINT 'Total Load Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'SECONDS';
			PRINT '======================================================';
	END TRY

	BEGIN CATCH
				PRINT '======================================================';
				PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
				PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
				PRINT 'ERROR MESSAGE' + CAST (ERROR_NUMBER() AS NVARCHAR);
				PRINT '======================================================';
	END CATCH
END
