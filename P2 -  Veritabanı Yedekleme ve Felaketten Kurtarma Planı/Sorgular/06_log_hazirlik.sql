BACKUP DATABASE AdventureWorks2022
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\AW_Full2.bak'
WITH 
    FORMAT,
    INIT,
    NAME = 'AdventureWorks2022 - Tam Yedek 2 (FULL model sonrasi)',
    STATS = 10;