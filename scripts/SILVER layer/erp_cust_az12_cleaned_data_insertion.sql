PRINT ' >>> Truncating Table: Silver.erp_cust_az12 <<< ' 
TRUNCATE TABLE Silver.erp_cust_az12;
PRINT ' >>> Inserting Data Into: Silver.erp_cust_az12 <<< ' 
INSERT INTO Silver.erp_cust_az12 (cid, bdate, gen)

SELECT 

CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
	 ELSE cid
END cid,

CASE WHEN bdate > GETDATE() THEN NULL
	 ELSE bdate
END AS bdate,

CASE WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
	 WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
	 ELSE 'n/a'
END AS gen

FROM Bronze.erp_cust_az12