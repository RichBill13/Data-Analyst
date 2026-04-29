---Quel est le segment qui rapporte le plus?
Select Segment, SUM(Sales) as TotalDepenses
from train
group by Segment
order by TotalDepenses DESC

----Quel est le montant moyen par commande par segment?
select segment, AVG(Sales) as AverageSale
from train
group by Segment
order by AverageSale desc

---Quelle est la commande la moins chere et la plus chere du dataset
select MIN(sales) as MinSales, MAX(Sales) as MaxSales
from train

---Quel est le chiffre d'affaires total, le panier moyen, la vente min et max
select SUM(Sales) as TotalSales, AVG(Sales) as AvgSales, MIN(sales) as MinSales, MAX(Sales) as MaxSales
from train

---Quel est le chiffre d'affaires total par région ET par segment ?
select SUM(Sales) as totalsum, Region,segment
from train
group by Region, Segment
order by totalsum desc


Select TOP 5 *
FROM train