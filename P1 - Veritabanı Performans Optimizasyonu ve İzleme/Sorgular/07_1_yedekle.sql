USE AdventureWorks2022;

SELECT 
    i.name AS index_name,
    i.type_desc,
    COL_NAME(ic.object_id, ic.column_id) AS column_name,
    ic.is_included_column
FROM sys.indexes i
JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
WHERE i.name = 'IX_Address_StateProvinceID'
AND OBJECT_NAME(i.object_id) = 'Address';