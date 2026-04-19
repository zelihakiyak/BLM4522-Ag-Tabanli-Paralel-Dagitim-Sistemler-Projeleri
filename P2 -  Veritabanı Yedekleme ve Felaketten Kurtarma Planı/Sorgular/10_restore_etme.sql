USE master;

ALTER DATABASE AdventureWorks2022
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

RESTORE DATABASE AdventureWorks2022
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\AW_Full2.bak'
WITH 
    NORECOVERY,
    REPLACE,
    STATS = 10;

RESTORE LOG AdventureWorks2022
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\AW_Log1.bak'
WITH 
    RECOVERY,
    STATS = 10;

ALTER DATABASE AdventureWorks2022
SET MULTI_USER;

USE AdventureWorks2022;

SELECT COUNT(*) AS ToplamKayit FROM Sales.SalesOrderHeader;