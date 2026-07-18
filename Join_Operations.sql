create database Join_operations_Topics;
use Join_operations_Topics;

create table persons(
	P_Id int PRIMARY KEY,
	LastName varchar(255),
	FirstName varchar(255),
	Address varchar(255),
	City varchar(255)
);

create table orders(
	O_Id int PRIMARY KEY,
	OrderNo int,
	P_Id int
);

--Persons
insert into persons values (1, 'Hansen', 'Ola', 'Timoteivn 10', 'Sandnes');
insert into persons values (2, 'Svendson', 'Tove', 'Borgvn 23', 'Sandnes');
insert into persons values (3, 'Pattersen', 'Kari', 'Storgt 20', 'Stavanger');
--Orders
insert into orders values (1, 77895, 3);
insert into orders values (2, 44678, 3);
insert into orders values (3, 22456, 1);
insert into orders values (4, 24562, 1);
insert into orders values (5, 34764, 15);

select * from persons;
select * from orders;

/* The JOIN keyword is used in SQL to query data from two or more 
   tables, based on a relationship between certain columns in these
   tables. The purpose is to bind data together across table without
   repeating all of the data in every table. */

/* The inner join keyword returns rows when there is 
	at least one match in both tables. For P_Id values 
	1 and 3, there are records in both persons and orders. */
select * from persons inner join orders on persons.P_Id=orders.P_Id;
select * from persons inner join orders on persons.P_Id=orders.P_Id
	order by persons.P_Id;

/* The LEFT JOIN returns all records of left table, even if 
	there are no matches in the right table. */
select * from persons left join orders on persons.P_Id=orders.P_Id;
select * from persons left join orders on persons.P_Id=orders.P_Id
	order by persons.P_Id;

/* The RIGHT JOIN returns all records of right table, even if 
	there are no matches in the left table. */
select * from persons right join orders on persons.P_Id=orders.P_Id;
select * from persons right join orders on persons.P_Id=orders.P_Id
	order by persons.P_Id;
select * from persons right join orders on persons.P_Id=orders.P_Id
	order by orders.P_Id;

/* The FULL JOIN returns rows when there is a match in one of the tables */
select * from persons full join orders on persons.P_Id=orders.P_Id;
select * from persons full join orders on persons.P_Id=orders.P_Id
	order by persons.P_Id;
select * from persons full join orders on persons.P_Id=orders.P_Id
	order by orders.P_Id;

/* A cross join is a type of join that returns the Cartesian product 
   of rows from the tables in the join. In other words, it combines 
   each row from the first table with each row from the second table.*/
SELECT * FROM persons CROSS JOIN orders;

SELECT persons.P_Id,persons.FirstName,
COUNT(orders.O_Id) AS Total_Orders
FROM persons
LEFT JOIN orders
ON persons.P_Id = orders.P_Id
GROUP BY persons.P_Id, persons.FirstName;

SELECT City,
COUNT(*) AS Total_Persons
FROM persons
GROUP BY City;

SELECT persons.FirstName,
SUM(orders.OrderNo) AS Total_OrderNo
FROM persons
INNER JOIN orders
ON persons.P_Id = orders.P_Id
GROUP BY persons.FirstName;

SELECT persons.FirstName,
COUNT(orders.O_Id) AS Total_Orders
FROM persons
LEFT JOIN orders
ON persons.P_Id = orders.P_Id
GROUP BY persons.FirstName
HAVING COUNT(orders.O_Id) > 1;

SELECT persons.City,persons.FirstName,
COUNT(orders.O_Id) AS Total_Orders
FROM persons
LEFT JOIN orders
ON persons.P_Id = orders.P_Id
GROUP BY persons.City, persons.FirstName;

SELECT persons.FirstName,
COUNT(orders.O_Id) AS Total_Orders
FROM persons
INNER JOIN orders
ON persons.P_Id = orders.P_Id
GROUP BY persons.FirstName;