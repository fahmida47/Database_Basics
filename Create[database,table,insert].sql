create database Basics_no_1;
use Basics_no_1;


create table forMe1(
ID int,
firstname varchar(100),
lastname varchar(100),
addres varchar(200),
city varchar(50)
);
select * from forMe1;

insert into forMe1
values(1,'Fahmida','Afrin','mugda','Dhaka');
insert into forMe1
values(2,'Faija','Onima','Mohammadpur','Dhaka');
insert into forMe1
values(3,'Nadia','Rahman','123 road','Ctg');
insert into forMe1
values(4,'Afifa','Rahman','456 road','Rajhshahi');
insert into forMe1
values(5,'Ahona','Zabin','789 road','Feni');

select ID,firstname,lastname from forMe1;

select distinct city from forMe1;

select * from forMe1;

select * from forMe1
where city='Dhaka';

select * from forMe1
where ID between 2 and 4;

select * from forMe1
where lastname like '%man%';

select * from forMe1
where ID in (1,3,5,7,9,11);

select * from forMe1
where ID>2 and city='Dhaka';

select * from forMe1
where (ID>2 or city='Ctg') and lastname='Rahman';

select * from forMe1
where not city='Dhaka';

select * from forMe1;

update forMe1
set city='Khulna'
where ID=2;

update forMe1
set firstname='Fariha',lastname='Amin'
where ID=2;

alter table forMe1
ADD age int;

alter table forMe1
ADD age1 int not null default 12;

DELETE FROM forMe1
WHERE firstname IS NULL
  AND lastname IS NULL
  AND addres IS NULL
  AND city IS NULL;

select * from forMe1;

alter table forMe1
DROP COLUMN age;

ALTER TABLE forMe1
DROP CONSTRAINT DF__forMe1__age1__5BE2A6F2;

alter table forMe1
DROP COLUMN age1;

select * into new_table
from forMe1;

select * from new_table;

select firstname,lastname
into new_table_1 
from forMe1;

select * from new_table_1;

truncate table new_table_1;
drop table new_table_1;






