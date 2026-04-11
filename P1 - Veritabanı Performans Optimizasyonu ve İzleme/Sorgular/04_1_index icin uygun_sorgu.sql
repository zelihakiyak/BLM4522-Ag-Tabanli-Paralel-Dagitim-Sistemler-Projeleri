USE AdventureWorks2022;

SELECT 
    soh.CustomerID,
    soh.OrderDate,
    soh.TotalDue,
    soh.Status
FROM Sales.SalesOrderHeader soh
WHERE soh.OrderDate >= '2011-01-01' 
AND soh.OrderDate < '2012-01-01'
AND soh.Status = 5
ORDER BY soh.TotalDue DESC;