create database PractiseProblem_6;
use PractiseProblem_6;

create table Student2(
StudentID int,
FName varchar(100),
LName varchar(100),
Age int,
Department varchar(50)
);

insert into Student2
values(1,'Tom','Russel',21,'CSE');
insert into Student2
values(2,'Alex','Albon',22,'EEE');
insert into Student2
values(3,'Carlos','Sainz',22,'CSE');
insert into Student2
values(4,'Max','Stroll',23,'IPE');
insert into Student2
values(5,'ALexa','Botez',20,'IPE');
insert into Student2
values(6,'Fernando','Alonso',24,'ME');
insert into Student2
values(7,'Nicko','Hulkenberg',27,'CSE');
insert into Student2
values(8,'Ayrton','Senna',26,'EEE');
insert into Student2
values(9,'Bobby','Fisher',22,'CSE');

select * from Student2;

-- 1. Display all students whose Department is CSE.
SELECT *
FROM Student2
WHERE Department = 'CSE';

-- 2. Display the FName and LName of students whose Age is greater than 22.
SELECT FName, LName
FROM Student2
WHERE Age > 22;

-- 3. Display all students whose FName starts with 'A'.
SELECT *
FROM Student2
WHERE FName LIKE 'A%';

-- 4. Display all students whose Age is between 21 and 25.
SELECT *
FROM Student2
WHERE Age BETWEEN 21 AND 25;

-- 5. Display all students sorted by Department in ascending order.
SELECT *
FROM Student2
ORDER BY Department ASC;

-- 6. Add a new column Email of type VARCHAR.
ALTER TABLE Student2
ADD Email VARCHAR(100);

-- 7. Add a new column EnrollmentYear of type INTEGER with a default value of 2024.
ALTER TABLE Student2
ADD EnrollmentYear INT DEFAULT 2024;

-- 8. Delete the column EnrollmentYear from the table.
ALTER TABLE Student2
DROP CONSTRAINT DF__Student2__Enroll__5BE2A6F2;
ALTER TABLE Student2
DROP COLUMN EnrollmentYear;

-- 9. Add a PRIMARY KEY constraint on StudentID.
ALTER TABLE Student2
ALTER COLUMN StudentID INT NOT NULL;
ALTER TABLE Student2
ADD CONSTRAINT PK_Student PRIMARY KEY (StudentID);

-- 10. Add a UNIQUE constraint on Email.
UPDATE Student2
SET Email = CONCAT(FName, StudentID, '@gmail.com');
ALTER TABLE Student2
ADD CONSTRAINT UQ_Email UNIQUE (Email);

-- 11. Add a CHECK constraint so that Age must be greater than 18.
ALTER TABLE Student2
ADD CONSTRAINT CHK_Age CHECK (Age > 18);

-- 12. Add a NOT NULL constraint on Department.
ALTER TABLE Student2
ALTER COLUMN Department VARCHAR(50) NOT NULL;

-- 13. Delete the records from the table where Department is EEE.
DELETE FROM Student2
WHERE Department = 'EEE';

-- 14. Truncate the student table.
TRUNCATE TABLE Student2;

-- 15. Update the Department of Alex Albon to CSE.
UPDATE Student2
SET Department = 'CSE'
WHERE FName = 'Alex'
AND LName = 'Albon';

DROP TABLE Student2;








