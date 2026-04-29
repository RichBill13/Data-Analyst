---Tendance Profit per Year
EXEC sp_rename 'Financial Sample', 'Financial_Sample'

SELECT SUM(TRY_CAST(
    REPLACE(REPLACE(REPLACE(REPLACE(Profit, '$', ''), ',', ''), '(', '-'), ')', '')
AS FLOAT)) AS Profit_year, Year
FROM dbo.Financial_Sample
GROUP BY Year
ORDER BY Year


---Country with the best Profit
Select SUM(TRY_CAST(
    REPLACE(REPLACE(REPLACE(REPLACE(Profit, '$', ''), ',', ''), '(', '-'), ')', '')
AS FLOAT)) AS Profit_year,Country
FROM dbo.Financial_Sample
group by Country
order by Profit_year desc

----Best Product
Select Product, SUM(TRY_CAST(
    REPLACE(REPLACE(REPLACE(REPLACE(Profit, '$', ''), ',', ''), '(', '-'), ')', '')
AS FLOAT)) AS Profit_Product
From Financial_Sample
group by Product
order by Profit_Product

---Best ratio Prodt/Sales
Select Segment, SUM(TRY_CAST(
    REPLACE(REPLACE(REPLACE(REPLACE(Profit, '$', ''), ',', ''), '(', '-'), ')', '')
AS FLOAT)) / SUM(Sales) as Ratio
From Financial_Sample
group by Segment
order by Ratio desc

Select *
From dbo.Financial_Sample