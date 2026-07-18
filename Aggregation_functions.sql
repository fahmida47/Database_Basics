create database AggregationFunc_Topic;
use AggregationFunc_Topic;

create table student
(
	id int primary key, 
	fname varchar(255),
	lname varchar(255),
	cgpa float(10),
	city varchar(255)
);


insert into student values (1, 'Paul', 'Anderson', 3.6 , 'Rome');
insert into student values (2, 'Peter', 'Jackson', 3.3 , 'Venice');
insert into student values (4, 'Tom', 'Russel', 3.7 , 'Madrid');
insert into student values (3, 'Hugh', 'Albon', 3.1 , 'Brisbon');
insert into student values (5, 'Betty', 'Nesord', 3.8 , 'London');
insert into student values (6, 'Karim', 'Khan', 3.1 , 'London');
insert into student values (7, 'Rahim', 'Khan', 3.2 , 'London');
insert into student values (8, 'Rudy', 'Kahn', 3.2 , 'Munich');

select * from student;
select cgpa from student;

select count(*) from student;

select avg(cgpa) from student;
select max(cgpa) from student;
select min(cgpa) from student;
select sum(cgpa) from student;

select avg(cgpa) as AvgCGPA from student;
select max(cgpa) as MaxCGPA from student;
select min(cgpa) as MinCGPA from student;
select sum(cgpa) as CGPA_SUM from student;

-- select first(cgpa) from student;
-- select last(cgpa) from student;
select top 1 cgpa from student order by id asc;
select top 1 cgpa from student order by id desc;

-- Multiple Aggregate Functions

select
    count(*)  as Total_Students,
    avg(cgpa) as Average_CGPA,
    max(cgpa) as Highest_CGPA,
    min(cgpa) as Lowest_CGPA,
    sum(cgpa) as Total_CGPA
from student;

-- Aggregation with WHERE Condition

select avg(cgpa) as London_Avg_CGPA
from student
where city = 'London';

select max(cgpa) as Highest_CGPA
from student
where cgpa > 3.5;
