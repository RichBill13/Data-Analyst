---Creation de la table Client
SELECT DISTINCT Customer_ID, Customer_Name, Segment, Region
INTO Clients
FROM train

----Creation de la table Commandes
SELECT Order_ID, Customer_ID, Order_Date, Ship_Mode, Sales
INTO Commandes
FROM train

---Afficher customer_name, order_id, Sales en croisant les deux tables
Select Customer_Name, Order_ID, Sales
from Clients
join Commandes on Clients.Customer_ID = Commandes.Customer_ID

---Quels sont les 10 clients qui ont généré le plus de chiffre d'affaires ?
Select TOP 10 Customer_Name, SUM(Sales) as top10
From Clients
join Commandes ON Clients.Customer_ID = Commandes.Customer_ID
group by Customer_Name
order by top10 desc

---Quel est le CA par client ET par région ?
Select SUM(Sales)as CA, Customer_Name, Region
From Clients
join Commandes on Clients.Customer_ID = Commandes.Customer_ID
group by Customer_Name, Region
order by CA desc

---affiche le CA par client mais uniquement pour la région West
Select SUM(Sales) as CA, Customer_Name
From Clients
join Commandes on Clients.Customer_ID = Commandes.Customer_ID
where Region = 'west'
group by Customer_Name
order by CA desc

---CA par client, uniquement pour la région West ET le segment Consumer
Select SUM(Sales) as CA, Customer_Name
from Clients
join Commandes on Clients.Customer_ID = Commandes.Customer_ID
where Segment = 'Consumer' and region = 'west'
group by Customer_Name
order by CA desc

---Affiche uniquement les clients ayant généré plus de 10 000$ de CA
Select Customer_Name, SUM(Sales) as CA
from Clients
join Commandes on Clients.Customer_ID  = Commandes.Customer_ID
group by Customer_Name
having SUM(Sales) > 10000
order by CA desc

---Inserons un customer dans la table Client
INSERT INTO Clients (Customer_ID, Customer_Name, Segment, Region)
VALUES ('TEST-001', 'Client Test', 'Consumer', 'West');

----Verifions le resultat sur un LEFT JOIN
Select Customer_Name, Order_ID, Sales
from Clients
LEFT JOIN Commandes on Clients.Customer_ID = Commandes.Customer_ID
where Customer_Name = 'Client Test'

----Quels clients n'ont jamais passé de commande ?
Select Customer_Name, Order_ID
From Clients
left join Commandes on Clients.Customer_ID = Commandes.Customer_ID
where Order_ID is NULL

---Affiche les clients qui ont dépensé plus que la moyenne générale
Select COUNT(distinct Customer_Name)
from Clients
join Commandes on Clients.Customer_ID = Commandes.Customer_ID
where Sales > (Select AVG(Sales) From Commandes)


---Affiche les clients qui ont dépensé plus que la moyenne des ventes de leur propre région
Select  Customer_Name,Region,Sales
From Clients
join Commandes c1 on Clients.Customer_ID = c1.Customer_ID
where Sales > (SELECT AVG(Sales) 
 FROM Commandes c2 
 JOIN Clients cl2 ON c2.Customer_ID = cl2.Customer_ID 
 WHERE cl2.Region = Clients.Region)



SELECT TOP 1 * FROM Commandes
select *
from Commandes