create database PractiseProblem_2;
use PractiseProblem_2;

create table Employee(
EmpID int,
EmpName varchar(50),
Department varchar(30),
City varchar(30),
Salary int
);

select * from Employee;

insert into Employee
values(101,'Jamal','HR','Dhaka',35000);
insert into Employee
values(102,'Kamal','IT','Chattogram',55000);
insert into Employee
values(103,'Nabila','HR','Dhaka',42000);
insert into Employee
values(104,'Tanvir','Sales','Khulna',38000);
insert into Employee
values(105,'Mim','IT','Dhaka',60000);
insert into Employee
values(106,'Rafi','Sales','Rajshahi',32000);
insert into Employee
values(107,'Sohan','IT','Chattogram',55000);
insert into Employee
values(108,'Nusrat','HR','Khulna',22000);

select * from Employee;

select EmpName,Salary from Employee
where Salary>=42000;

select * from Employee
where city<>'Dhaka' and Salary<55000;

select * from Employee
where city='Dhaka' and Department='HR' and Salary<>35000;

select * from Employee
where Salary between 35000 and 55000 and Department not in ('IT','Sales');