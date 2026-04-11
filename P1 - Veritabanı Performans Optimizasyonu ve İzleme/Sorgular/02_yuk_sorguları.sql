USE AdventureWorks2022;

-- Sorgu 1
SELECT 
    p.FirstName + ' ' + p.LastName AS FullName,
    COUNT(soh.SalesOrderID) AS OrderCount,
    SUM(soh.TotalDue) AS TotalSpent
FROM Person.Person p
JOIN Sales.Customer c ON p.BusinessEntityID = c.PersonID
JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY p.FirstName, p.LastName
ORDER BY TotalSpent DESC;

-- Sorgu 2
SELECT * FROM Person.Person
WHERE FirstName LIKE '%an%'
AND LastName LIKE '%on%';

-- Sorgu 3
SELECT * FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
AND MONTH(OrderDate) = 6;

-- Sorgu 4
SELECT 
    sod.ProductID,
    p.Name AS ProductName,
    SUM(sod.OrderQty) AS TotalQty,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person per ON c.PersonID = per.BusinessEntityID
GROUP BY sod.ProductID, p.Name
ORDER BY TotalRevenue DESC;
