USE master;

SELECT name, recovery_model_desc 
FROM sys.databases 
WHERE name = 'AdventureWorks2022';