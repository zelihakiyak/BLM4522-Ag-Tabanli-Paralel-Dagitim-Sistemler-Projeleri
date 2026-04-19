USE AdventureWorks2022;

INSERT INTO Person.BusinessEntity (ModifiedDate, rowguid)
VALUES (GETDATE(), NEWID());

DECLARE @NewID INT = SCOPE_IDENTITY();

INSERT INTO Person.Person 
(BusinessEntityID, PersonType, FirstName, LastName, ModifiedDate, rowguid)
VALUES (@NewID, 'EM', 'Log', 'Test1', GETDATE(), NEWID());

UPDATE Person.Person 
SET FirstName = 'Guncellendi'
WHERE FirstName = 'Test' AND LastName = 'Kullanici';

USE master;

BACKUP LOG AdventureWorks2022
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\AW_Log1.bak'
WITH 
    FORMAT,
    INIT,
    NAME = 'AdventureWorks2022 - Log Yedek 1',
    DESCRIPTION = 'P2 Projesi - Transaction Log Backup',
    STATS = 10;