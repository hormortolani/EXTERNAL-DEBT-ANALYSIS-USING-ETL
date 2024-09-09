select * from External_debt;

--1. filter external debt by a specific year
--SELECT * 
--FROM External_debt
--WHERE Year = 2023;

--2. Filter by a Specific Month
--SELECT * 
--FROM External_debt
--WHERE Month = 'March';

--3.  Filter by Both Year and Month
--SELECT * 
--FROM External_debt
--WHERE Month = 'December' and Year = 2022;

--4. Calculate Average Per Capita Debt
--SELECT ROUND(AVG([Per capita]), 2) AS avg_per_capita_debt
--FROM External_debt;

--5.Sum Total Debt for a Specific Year
--SELECT SUM(
--    CASE 
--        WHEN Total IS NULL THEN 0 
--        WHEN Total LIKE '%trillion%' THEN TRY_CAST(REPLACE(REPLACE(LTRIM(RTRIM(REPLACE(Total, ' ', ''))), 'trillion', ''), ',', '') AS DECIMAL(20, 2)) * 1000000000000
--        WHEN Total LIKE '%billion%' THEN TRY_CAST(REPLACE(REPLACE(LTRIM(RTRIM(REPLACE(Total, ' ', ''))), 'billion', ''), ',', '') AS DECIMAL(20, 2)) * 1000000000
--        WHEN Total LIKE '%million%' THEN TRY_CAST(REPLACE(REPLACE(LTRIM(RTRIM(REPLACE(Total, ' ', ''))), 'million', ''), ',', '') AS DECIMAL(20, 2)) * 1000000
--        ELSE TRY_CAST(REPLACE(REPLACE(Total, ' ', ''), ',', '') AS DECIMAL(20, 2))
--    END
--) AS Total_debt_2023
--FROM External_debt
--WHERE Year = 2022;

--6.List Countries/Territories with Debt Above a Certain Percentage of GDP
 --firstly i have to rename some of the columns 
--EXEC sp_rename 'External_debt.Country or territory', 'country_territory', 'COLUMN';
--EXEC sp_rename 'External_debt.% of GDP', 'percent_GDP', 'COLUMN';
--EXEC sp_rename 'External_debt.Per capita', 'Per_capita', 'COLUMN';
--EXEC sp_rename 'External_debt.% of total wealth', 'percent_of_total_wealth', 'COLUMN';
--EXEC sp_rename 'External_debt.Total', 'Total_debt', 'COLUMN';

--SELECT country_territory, Per_capita, Total, percent_GDP
--FROM External_debt
--WHERE percent_GDP > 100;

--7.Count the Number of Countries/Territories per Year

--SELECT Year, COUNT(country_territory) AS country_count
--FROM External_debt
--GROUP BY Year;


--8.The Average Percentage of Total Wealth Across All Countries/Territories

--SELECT AVG(percent_of_total_wealth) AS avg_total_wealth_pct
--FROM External_debt;

--9.Total external debt per month

--SELECT Month, COUNT(Total) AS Month_Debt
--FROM External_debt
--GROUP BY Month
--ORDER BY Month_Debt DESC;


select * from External_debt;













