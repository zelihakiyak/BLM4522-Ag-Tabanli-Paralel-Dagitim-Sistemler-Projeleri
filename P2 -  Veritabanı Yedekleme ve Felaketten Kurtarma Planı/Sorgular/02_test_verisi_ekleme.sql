USE AdventureWorks2022;

INSERT INTO Person.BusinessEntity (ModifiedDate, rowguid)
VALUES (GETDATE(), NEWID());

DECLARE @NewID INT = SCOPE_IDENTITY();

INSERT INTO Person.Person 
(BusinessEntityID, PersonType, FirstName, LastName, ModifiedDate, rowguid)
VALUES 
(@NewID, 'EM', 'Test', 'Kullanici', GETDATE(), NEWID());

SELECT BusinessEntityID, FirstName, LastName 
FROM Person.Person 
WHERE FirstName = 'Test';