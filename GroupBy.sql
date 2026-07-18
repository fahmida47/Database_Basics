create database GroupByFunc_Topic;
use GroupByFunc_Topic;

create table student1
(
	id int primary key, 
	fname varchar(255),
	lname varchar(255),
	cgpa float(10),
	city varchar(255)
);


insert into student1 values (1, 'Paul', 'Anderson', 3.6 , 'Rome');
insert into student1 values (2, 'Peter', 'Jackson', 3.3 , 'Venice');
insert into student1 values (4, 'Tom', 'Russel', 3.7 , 'Madrid');
insert into student1 values (3, 'Hugh', 'Albon', 3.1 , 'Brisbon');
insert into student1 values (5, 'Betty', 'Nesord', 3.8 , 'London');
insert into student1 values (6, 'Karim', 'Khan', 3.1 , 'London');
insert into student1 values (7, 'Rahim', 'Khan', 3.2 , 'London');
insert into student1 values (8, 'Rudy', 'Kahn', 3.2 , 'Munich');

select * from student1;

select  city,SUM(cgpa) AS Total_CGPA
from student1
GROUP BY city;

select city,AVG(cgpa) AS Average_CGPA
from student1
GROUP BY city;

select city,lname,COUNT(*) AS Total
from student1
GROUP BY city, lname;

select city,COUNT(*) AS Total
from student1
GROUP BY city
HAVING COUNT(*) > 2;