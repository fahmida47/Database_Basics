create database SQL_queries_2;
use SQL_queries_2;

CREATE TABLE Department1
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee1
(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department1(dept_id)
);

CREATE TABLE Project1
(
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT,
    budget DECIMAL(10,2),
    FOREIGN KEY(emp_id) REFERENCES Employee1(emp_id)
);

INSERT INTO Department1 (dept_id, dept_name, location)
VALUES
(101, 'HR', 'Dhaka'),
(102, 'IT', 'Dhaka'),
(103, 'Finance', 'Chattogram'),
(104, 'Marketing', 'Dhaka');

INSERT INTO Employee1 (emp_id, emp_name, salary, dept_id)
VALUES
(1, 'Rahim', 45000, 102),
(2, 'Karim', 55000, 102),
(3, 'Nadia', 70000, 103),
(4, 'Sadia', 55000, 103),
(5, 'Hasan', 45000, 101),
(6, 'Rafi', 60000, 104),
(7, 'Mim', 65000, 102),
(8, 'Tania', 45000, 103);

INSERT INTO Project1 (project_id, project_name, emp_id, budget)
VALUES
(201, 'Payroll System', 2, 50000),
(202, 'Website', 3, 30000),
(203, 'Recruitment', 1, 150000),
(204, 'Budget App', 4, 75000),
(205, 'Digital Work', 6, 45000),
(206, 'Inventory', 2, 20000),
(207, 'Mobile App', 7, 35000),
(208, 'Training System', 5, 120000);

select * from Department1;
select * from Employee1;
select * from Project1;

--Q2
select d.dept_name,count(e.emp_id) AS total_employee
from Department1 d
join Employee1 e
on d.dept_id=e.dept_id
group by d.dept_name
ORDER BY Total_Employee DESC;

--Q3
select d.dept_name,Avg(e.salary) AS Avg_Salary
from Department1 d
join Employee1 e
on d.dept_id=e.dept_id
group by d.dept_name
having Avg(e.salary)>55000;

--Q4
select d.dept_name,SUM(p.budget) AS total_budget
from Department1 d
join Employee1 e
on d.dept_id=e.dept_id
join Project1 p
on e.emp_id=p.emp_id
group by d.dept_name;

--Q5
select d.location,d.dept_name,count(p.project_id) AS total_project
from Department1 d
join Employee1 e
on d.dept_id=e.dept_id
join Project1 p
on e.emp_id=p.emp_id
group by d.location,d.dept_name;

