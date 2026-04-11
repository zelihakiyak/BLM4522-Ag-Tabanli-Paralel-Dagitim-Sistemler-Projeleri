USE AdventureWorks2022;

CREATE INDEX IX_missing_1 
ON [Sales].[SalesOrderHeader] ([Status], [OrderDate]) 
INCLUDE ([CustomerID], [TotalDue]);