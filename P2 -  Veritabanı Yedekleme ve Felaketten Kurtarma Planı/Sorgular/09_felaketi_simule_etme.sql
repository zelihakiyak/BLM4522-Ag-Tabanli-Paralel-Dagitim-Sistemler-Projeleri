USE AdventureWorks2022;

DELETE FROM Sales.SalesOrderDetail;
DELETE FROM Sales.SalesOrderHeader;

SELECT COUNT(*) AS KalanKayit FROM Sales.SalesOrderHeader;