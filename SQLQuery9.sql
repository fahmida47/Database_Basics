create database PractiseProbelm_7;
use PractiseProbelm_7;

create table Customers_2(
CustomersID int PRIMARY KEY,
CustomersName varchar(100),
City varchar(50)
);

create table Products(
ProductID int PRIMARY KEY,
ProductName varchar(100),
Category varchar(50),
Price float
);

create table Orders(
OrderID int,
CustomerID int,
ProductID int,
Quantity int
);

INSERT INTO Customers_2 VALUES
(101,'Jamal','Dhaka'),
(102,'Kamal','Chattogram'),
(103,'Nadia','Sylhet'),
(104,'Farhan','Khulna'),
(105,'Mitu','Rajshahi');

INSERT INTO Products VALUES
(201,'Laptop','Electronics',85000),
(202,'Mouse','Electronics',1200),
(203,'Keyboard','Electronics',2500),
(204,'Chair','Furniture',5500),
(205,'Desk','Furniture',9000);


INSERT INTO Orders VALUES
(301,101,201,1),
(302,101,202,2),
(303,102,204,1),
(304,103,202,3),
(305,103,203,1),
(306,106,201,1),
(307,102,207,2);

select * from Customers_2;
select * from Products;
select * from orders;

--q2
select c.CustomersName,p.ProductName,o.Quantity
from Orders o
inner join Customers_2 c on
o.CustomerID = c.CustomersID
inner join Products p on
o.ProductID = p.ProductID;

--q3
select c.CustomersName,p.ProductName,o.Quantity
from Customers_2 c
left join orders o on
o.CustomerID = c.CustomersID
left join Products p on
o.ProductID = p.ProductID;

--q4
select o.CustomerID,o.OrderId,o.ProductID,o.Quantity
from orders o
left join Customers_2 c on
o.CustomerID = c.CustomersID
left join Products p on
p.ProductID = o.ProductID
where c.CustomersID is null or
p.ProductName is null;

--q5
select o.OrderId,c.CustomersName,c.City,p.ProductID,p.Category,o.Quantity 
from orders o 
inner join Customers_2 c on
o.CustomerID = c.CustomersID
inner join Products p on
o.ProductID = p.ProductID
order by c.CustomersName  asc;

