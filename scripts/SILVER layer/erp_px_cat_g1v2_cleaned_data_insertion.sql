PRINT ' >>> Truncating Table: Silver.erp_px_cat_g1v2 <<< ' 
TRUNCATE TABLE Silver.erp_px_cat_g1v2;
PRINT ' >>> Inserting Data Into: Silver.erp_px_cat_g1v2 <<< ' 
INSERT INTO Silver.erp_px_cat_g1v2
( id, cat, subcat, maintenance )
SELECT 
id, 
cat,
subcat,
maintenance
FROM Bronze.erp_px_cat_g1v2