/*****************************************************************************************************************
NAME:    Creating and Answering Questions in SQL Server Management Studio
PURPOSE: Answer questions on AdventureWorks2022 Database

MODIFICATION LOG:
Ver      Date        Author        		Description
-----   ----------   ---------------------     -------------------------------------------------------------------
1.0     07/13/2024   Samuel Kofi Amissah       1. Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- Q1: What should go here?
-- A1: Question goes on the previous line, intoduction to the answer goes on this line...


/*

Q1 Business User question—Marginal complexity: 
Which product has the highest units sold?
*/
SELECT Production.Product.ProductID , Production.Product.Name , COUNT(Sales.SalesOrderDetail.SalesOrderID) * Sales.SalesOrderDetail.OrderQty AS NumberOfOrders
	
	FROM Production.Product

	INNER JOIN Sales.SalesOrderDetail ON Sales.SalesOrderDetail.ProductID = Production.Product.ProductID

GROUP BY Production.Product.ProductID , Production.Product.Name , Sales.SalesOrderDetail.OrderQty

ORDER BY COUNT(Sales.SalesOrderDetail.SalesOrderID) * Sales.SalesOrderDetail.OrderQty DESC

-- Water Bottle - 30 oz was the highest sold


/*
Q2 Business User question—Marginal complexity:
How many purchasing vendors do we have until now?
*/
SELECT	COUNT(Purchasing.Vendor.BusinessEntityID) AS Total_Vendors

FROM Purchasing.Vendor;

-- The total vendors are 104


/*
Q3 Business User question—Moderate complexity:
How many orders have a status of 'Shipped' in the Sales.SalesOrderHeader table, and what is the sum of their SubTotal?
*/
SELECT	COUNT(Sales.SalesOrderHeader.ShipDate) AS Total_Vendors 

FROM Sales.SalesOrderHeader

WHERE Sales.SalesOrderHeader.ShipDate IS NOT NULL;

-- The number of order shipped is 31,465

SELECT	SUM(Sales.SalesOrderHeader.SubTotal) AS Sum_of_SubTotal_Shipped 

FROM Sales.SalesOrderHeader

WHERE Sales.SalesOrderHeader.SubTotal IS NOT NULL;

-- The Sum of their SubTotal  is 109,846,381.4039


/*
Q4 Business User question—Moderate complexity:
What are the top 10 customers by total purchasing amount?
*/
SELECT TOP 10 CustomerID , SUM(Sales.SalesOrderHeader.SubTotal) AS Total_Purchasing_Amount

FROM Sales.SalesOrderHeader

GROUP BY Sales.SalesOrderHeader.CustomerID

ORDER BY SUM(Sales.SalesOrderHeader.SubTotal) DESC;

-- The coding above will provides the top 10 customers by total purchase amount


/*
Q5 Business User question—Increased complexity:
What are the 5 top selling items, with quantity by region or territory, and total gross sales per product?
*/
SELECT TOP 5 Sales.SalesOrderHeader.TerritoryID , Sales.SalesTerritory.Name , Sales.SalesOrderDetail.ProductID , Production.Product.Name , COUNT(Sales.SalesOrderDetail.SalesOrderID) AS Number_of_Orders , Sales.SalesOrderDetail.OrderQty AS Quantity_Bought , COUNT(Sales.SalesOrderDetail.SalesOrderID) * Sales.SalesOrderDetail.OrderQty AS Number_of_Orders , Sales.SalesOrderDetail.UnitPrice AS Product_Unit_Price , COUNT(Sales.SalesOrderDetail.SalesOrderID) * Sales.SalesOrderDetail.OrderQty *  Sales.SalesOrderDetail.UnitPrice AS Total_Gross_Sales_Per_Product
	
	FROM (Sales.SalesOrderHeader

		INNER JOIN Sales.SalesTerritory ON Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID 
		INNER JOIN Sales.SalesOrderDetail ON Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID
		INNER JOIN Production.Product ON Sales.SalesOrderDetail.ProductID = Production.Product.ProductID
	)

GROUP BY Sales.SalesOrderHeader.TerritoryID , Sales.SalesOrderDetail.ProductID, Production.Product.Name, Sales.SalesTerritory.Name , Sales.SalesOrderDetail.OrderQty , Sales.SalesOrderDetail.UnitPrice
	

ORDER BY Sales.SalesTerritory.Name , COUNT(Sales.SalesOrderDetail.SalesOrderID) * Sales.SalesOrderDetail.OrderQty DESC;


/*
Q6 Business User question—Increased complexity:
Find the total number of products in each product category?
*/
SELECT Production.ProductCategory.ProductCategoryID , COUNT(Production.ProductSubcategory.ProductCategoryID) AS Number_of_Products

FROM Production.ProductCategory

	JOIN Production.ProductSubcategory ON Production.ProductCategory.ProductCategoryID = Production.ProductSubcategory.ProductCategoryID

GROUP BY Production.ProductCategory.ProductCategoryID

ORDER BY Production.ProductCategory.ProductCategoryID ASC;



/*
Q7 Metadata question—Your question here
Create a table with a column name 'StudentID' as the PRIMARY KEY and another column name StudentEmail with UNIQUE constraint.
*/
CREATE TABLE MyTable (
	
	StudentID int PRIMARY KEY,
	StudentEmail varchar(50) UNIQUE

);


/*
Q8 Metadata question—Your question here
What constraints are defined on the Sales.SalesOrderDetail table according?
*/
---- Answer:
-- There is a Primary Key constraint on the column SailesOrderID and SalesOrderDetailID
-- There is a Foreign Key link created on SalesOrderID column on the table and SalesOrderID column on the table, SalesOrderHeader
-- There is also a Foreign Key link created on SpecialOfferID column on the table and SpecialOfferID column on the table, SpecialOffer 
-- The remaining columns on the table are all set to NOT NULL
