create database PractiseProblem_4;
use PractiseProblem_4;

create table dept(
DeptID int PRIMARY KEY,
DeptName varchar(50) not null UNIQUE
);

create table Student1(
StudentID int PRIMARY KEY,
StudentName varchar(100) not null,
Email varchar(100) UNIQUE,
CGPA float CHECK(CGPA between 2.00 and 4.00),
City varchar(50) Default'Dhaka',
DeptID int,
FOREIGN KEY(DeptID)
references Dept(DeptID)
on Update cascade
on Delete cascade
);

insert into Dept
values(101,'CSE');
insert into Dept
values(102,'EEE');

select * from Dept;

insert into Student1(StudentID, StudentName, Email, CGPA, DeptID)
values(1,'Sawon','s@g.c',3.75,101);
insert into Student1(StudentID, StudentName, Email, CGPA, DeptID)
values(2,'Jisan','j@g.c',3.55,102);
insert into Student1(StudentID, StudentName, Email, CGPA, DeptID)
values(3,'Amin','a@g.c',3.15,101);
insert into Student1(StudentID, StudentName, Email, CGPA, DeptID)
values(4,'Arman','a@a.edu',3.20,101);
insert into Student1(StudentID, StudentName, Email, CGPA, DeptID)
values(5,'Shahaun','s@a.edu',3.55,102);
insert into Student1(StudentID, StudentName, Email, CGPA, DeptID)
values(6,'Robin','r@g.c',3.75,101);
insert into Student1(StudentID, StudentName, Email, CGPA, DeptID)
values(7,'Rafat','j@a.edu',3.55,101);
insert into Student1(StudentID, StudentName, Email, CGPA, DeptID)
values(8,'Anika','an@g.c',2.95,102);

select * from Student1;

select TOP 50 percent *
from Student1
order by CGPA DESC,StudentID ASC;

select * from Student1
where CGPA between 3.25 and 3.80 
and DeptID in(101,102)
order by DeptID DESC;

select * from Student1
where DeptID=101
and StudentName like '_a%n';