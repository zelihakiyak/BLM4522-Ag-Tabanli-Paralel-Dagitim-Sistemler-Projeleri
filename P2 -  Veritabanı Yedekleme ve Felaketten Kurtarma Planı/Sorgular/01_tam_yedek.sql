USE master;

BACKUP DATABASE AdventureWorks2022
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\AW_Full.bak'
WITH 
    FORMAT,
    INIT,
    NAME = 'AdventureWorks2022 - Tam Yedek',
    DESCRIPTION = 'P2 Projesi - Full Backup',
    STATS = 10;