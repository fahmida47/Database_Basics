create database PractiseProblem_3;
use PractiseProblem_3;

create Table Business(
CustomerID int,
FName varchar(50),
LName varchar(50),
Age int,
City varChar(50),
CustomerStatus varchar(50)
);

select * from Business;

insert into Business
values(1,'Rashed','Mahmud',32,'Dhaka');
insert into Business
values(2,'Nafisa','Rahman',24,'Chattogram');
insert into Business
values(3,'Tuhin','Ahmed',27,'Sylhet');
insert into Business
values(4,'Samira','Islam',21,'Dhaka');
insert into Business
values(5,'Arif','Hossain',29,'Khulna');
insert into Business
values(6,'Mitu','Akter',23,'Rajshahi');
insert into Business
values(7,'Fahim','Uddin',26,'Dhaka');
insert into Business
values(8,'Sabiha','Noor',22,'Sylhet');
insert into Business
values(9,'Kamal','Chowdhury',34,'Barishal');

select * from Business;

select Top 5 CustomerID,City from Business;

ALTER TABLE Business
ADD CustomerStatus VARCHAR(20);

ALTER TABLE Business
ADD CONSTRAINT DF_CustomerStatus
DEFAULT ('Active') FOR CustomerStatus;

ALTER TABLE Business
DROP CONSTRAINT DF_CustomerStatus;

ALTER TABLE Business
DROP COLUMN CustomerStatus;

UPDATE Business
SET CustomerStatus = 'Active'
WHERE CustomerStatus IS NULL;

update Business
set City='Chattogram'
where FName='Fahim';

select * from Business;

select * from Business 
where Age not between 23 and 28;

select * from Business
where FName='%ha%';

select * from Business
where FName like 'S%' and Age>20;

select * from Business 
where Age in (22,24,26,29);

select * from Business
where City='Dhaka' and Age >20;

alter table Business
drop column LName;