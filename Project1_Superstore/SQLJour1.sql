---Combien de commandes differentes y'a t'il dans ce dataset?

SELECT COUNT ( DISTINCT Order_ID)
FROM train

---Est ce que tout les segments des clients commandent autant?
select Segment, COUNT(DISTINCT Order_ID) AS N_Order
from train
group by Segment
order by N_Order DESC

---Quelles sont les 5 villes qui passent le plus de commandes
select TOP 5 City,State, Region, COUNT(DISTINCT Order_ID) AS TopCity
from train
group by City, State, Region
ORDER BY TopCity DESC

---Quelle region genere le plus de commandes
Select Region, COUNT(DISTINCT Order_ID) AS TopRegion
from train
group by Region
order by TopRegion DESC

---Quel mode de livraison est le plus utilise
Select Ship_Mode,COUNT(DISTINCT Order_ID) AS TopShipMode
from train
group by Ship_Mode
order by TopShipMode DESC

SELECT *
FROM train