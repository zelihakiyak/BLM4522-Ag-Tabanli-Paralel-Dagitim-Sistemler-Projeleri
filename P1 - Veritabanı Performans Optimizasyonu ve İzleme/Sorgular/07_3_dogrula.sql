USE AdventureWorks2022;

SELECT name FROM sys.indexes 
WHERE OBJECT_NAME(object_id) = 'Address'
AND name = 'IX_Address_StateProvinceID';