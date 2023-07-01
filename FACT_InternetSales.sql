-- Cleansed FACT_InternetSales Table --
Select 
	ProductKey,
	OrderDateKey,
	DueDateKey,
	ShipDateKey,
	CustomerKey,
	SalesOrderNumber,
	SalesAmount

from AdventureWorksDW2022..FactInternetSales
WHERE
	LEFT (OrderDateKey, 4) >= YEAR(	GETDATE()) - 2 -- insuring the date we took is the most recent 
ORDER BY 
	OrderDateKey