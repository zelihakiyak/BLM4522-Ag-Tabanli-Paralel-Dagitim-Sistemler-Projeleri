USE AdventureWorks2022;

SELECT 
    OBJECT_NAME(i.object_id) AS table_name,
    i.name AS index_name,
    i.type_desc AS index_type,
    ius.user_seeks,
    ius.user_scans,
    ius.user_lookups,
    ius.user_updates,
    ius.last_user_seek,
    ius.last_user_scan
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats ius 
    ON i.object_id = ius.object_id 
    AND i.index_id = ius.index_id
    AND ius.database_id = DB_ID()
WHERE OBJECT_NAME(i.object_id) NOT LIKE 'sys%'
AND i.type_desc != 'HEAP'
AND i.is_primary_key = 0
AND i.is_unique = 0
AND ISNULL(ius.user_seeks, 0) = 0
AND ISNULL(ius.user_scans, 0) = 0
AND ISNULL(ius.user_lookups, 0) = 0
ORDER BY ISNULL(ius.user_updates, 0) DESC;