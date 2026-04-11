USE AdventureWorks2022;

SELECT TOP 10
    mid.statement AS table_name,
    migs.avg_total_user_cost * migs.avg_user_impact * 
        (migs.user_seeks + migs.user_scans) AS improvement_measure,
    'CREATE INDEX IX_missing_' + 
        CAST(ROW_NUMBER() OVER(ORDER BY migs.avg_user_impact DESC) AS VARCHAR) +
        ' ON ' + mid.statement + 
        ' (' + ISNULL(mid.equality_columns, '') +
        CASE WHEN mid.inequality_columns IS NOT NULL 
             THEN (CASE WHEN mid.equality_columns IS NOT NULL 
                        THEN ',' ELSE '' END) + mid.inequality_columns 
             ELSE '' END + ')' +
        ISNULL(' INCLUDE (' + mid.included_columns + ')', '') AS create_index_statement,
    migs.avg_user_impact AS expected_improvement_percent
FROM sys.dm_db_missing_index_details mid
JOIN sys.dm_db_missing_index_groups mig ON mid.index_handle = mig.index_handle
JOIN sys.dm_db_missing_index_group_stats migs ON mig.index_group_handle = migs.group_handle
WHERE mid.database_id = DB_ID()
ORDER BY improvement_measure DESC;