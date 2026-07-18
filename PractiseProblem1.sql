create database PractiseProblem_1;
use PractiseProblem_1;

create table Student(
S_ID int,
Name1 varchar(100),
Department varchar(100),
CGPA float,
City varchar(50)
);

Insert into Student 
values (101,'Jamal','CSE',3.75,'Dhaka');
Insert into Student 
values (102,'Kamal','CSE',3.55,'Rajshahi');
Insert into Student 
values (103,'Amina','EEE',3.45,'Dhaka');
Insert into Student 
values (104,'Fahim','CSE',3.99,'Khulna');

select * from Student;

select * from Student
where Department='CSE';

alter table Student
ADD email varchar(100) not null default '@aust.edu';

select * from Student
where (City='Dhaka' or City='Rajshahi') and CGPA>3.50;
