USE master;

ALTER DATABASE AdventureWorks2022
SET RECOVERY FULL;

SELECT name, recovery_model_desc 
FROM sys.databases 
WHERE name = 'AdventureWorks2022';