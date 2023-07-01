-- Selecting the columns that's relevent to our work
SELECT
	[DateKey]
    ,[FullDateAlternateKey] as Date
    ,[DayNumberOfWeek] AS DayNum
    ,[EnglishDayNameOfWeek] as Day
    ,[WeekNumberOfYear] as WeekNum
    ,[EnglishMonthName] as Month,
	LEFT([EnglishMonthName],3) AS MonthShort
    ,[MonthNumberOfYear] as MonthNum
    ,[CalendarQuarter] as Quarter
    ,[CalendarYear] as Year
  FROM [AdventureWorksDW2022].[dbo].[DimDate]
  WHERE CalendarYear >= 2021