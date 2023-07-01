-- Cleaning DimCustomer Table --

Select  c.CustomerKey AS [Customer Key],
		c.FirstName AS [First Name],
		c.LastName AS [Last Name],
		c.FirstName + ' ' + LastName as [Full Name],
		CASE c.Gender
			WHEN 'M' THEN 'Male'
			WHEN 'F' THEN 'Female' end
			AS Gender,
		c.DateFirstPurchase,
		g.City AS [Customer City] -- Joined in Customer City from Geography Table
from AdventureWorksDW2022..DimCustomer as c
JOIN DimGeography as g ON g.GeographyKey = c.GeographyKey

order by [Customer Key]