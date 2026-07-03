create database Basics_no_2;
use Basics_no_2;

-- creation of a table named persons; primary key is P_Id, short for person id
create table persons(
	P_Id int PRIMARY KEY,
	LastName varchar(255),
	FirstName varchar(255),
	Address varchar(255),
	City varchar(255)
);

-- creation of a table named orders; primary key is O_Id, short for order id
-- different persons will place orders, hence P_Id is a column of this table 
create table orders(
	O_Id int PRIMARY KEY,
	OrderNo int,
	P_Id int
);

-- inserting some records into the persons table 
insert into persons values (1, 'Hansen', 'Ola', 'Timoteivn 10', 'Sandnes');
insert into persons values (2, 'Svendson', 'Tove', 'Borgvn 23', 'Sandnes');
insert into persons values (3, 'Pattersen', 'Kari', 'Storgt 20', 'Stavanger');

-- inserting some records into the orders table 
insert into orders values (1, 77895, 3);
insert into orders values (2, 44678, 3);
insert into orders values (3, 22456, 1);
insert into orders values (4, 24562, 1);
insert into orders values (5, 34764, 15);

-- displaying all the values of the persons table
-- displaying all records of orders table 
select * from persons;
select * from orders;

/* The JOIN keyword is used in SQL to query data from two or more 
   tables, based on a relationship between certain columns in these
   tables. The purpose is to bind data together across table without
   repeating all of the data in every table. */

--Inner Join()
select * from persons inner join orders on persons.P_Id=orders.P_Id
order by  persons.P_Id;

--Left Join()
select * from persons left join orders on persons.P_Id=orders.P_Id
order by persons.P_Id;

--Right Join()
select * from persons right join orders on persons.P_Id=orders.P_Id
order by persons.P_Id;

--Full Join()
select * from persons full join orders on persons.P_Id=orders.P_Id
order by persons.P_Id;

--Cross Join()
select * from persons cross join orders;

--Union
select P_Id from persons union select P_Id from orders;

--Union all
select P_Id from persons union all select P_Id from orders;

--Intersect
select P_Id from persons intersect select P_Id from orders;
SELECT P_Id, LastName FROM persons WHERE P_Id BETWEEN 1 AND 2
	INTERSECT
	SELECT P_Id, LastName FROM persons WHERE LastName like '%sen';

--Difference
select P_Id from persons except select P_Id from orders;
SELECT P_Id, LastName FROM persons WHERE P_Id BETWEEN 1 AND 2
	EXCEPT
	SELECT P_Id, LastName FROM persons WHERE LastName like '%sen';

