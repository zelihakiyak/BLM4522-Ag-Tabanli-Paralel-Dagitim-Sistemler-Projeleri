USE master;

BACKUP DATABASE AdventureWorks2022
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\AW_Diff.bak'
WITH 
    DIFFERENTIAL,
    FORMAT,
    INIT,
    NAME = 'AdventureWorks2022 - Diferansiyel Yedek',
    DESCRIPTION = 'P2 Projesi - Differential Backup',
    STATS = 10;