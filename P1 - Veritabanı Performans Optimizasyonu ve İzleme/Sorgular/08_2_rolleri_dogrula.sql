USE AdventureWorks2022;

SELECT 
    dp.name AS user_name,
    dp.type_desc AS user_type,
    o.name AS object_name,
    p.permission_name,
    p.state_desc AS permission_state
FROM sys.database_permissions p
JOIN sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
LEFT JOIN sys.objects o ON p.major_id = o.object_id
WHERE dp.name IN ('analyst_user', 'app_user', 'db_admin')
ORDER BY dp.name, p.permission_name;