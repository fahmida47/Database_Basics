create database SQL_queries_1;
use SQL_queries_1;

-- Department Table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Employee Table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Project Table
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    emp_id INT NOT NULL,
    hours_worked INT NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

INSERT INTO Department (dept_id, dept_name)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO Employee (emp_id, emp_name, salary, dept_id)
VALUES
(101, 'Jamal', 70000.00, 2),
(102, 'Kamal', 52000.00, 2),
(103, 'Sadia', 48000.00, 2),
(104, 'Nadia', 68000.00, 3),
(105, 'Hasan', 42000.00, 3),
(106, 'Mim', 45000.00, 3),
(107, 'Rafi', 60000.00, 1),
(108, 'Tania', 39000.00, 1),
(109, 'Sohan', 55000.00, 4);

INSERT INTO Project (project_id, project_name, emp_id, hours_worked)
VALUES
(201, 'ERP', 101, 40),
(202, 'Website', 102, 30),
(203, 'Payroll', 104, 25),
(204, 'Inventory', 105, 32),
(205, 'Training', 107, 28),
(206, 'CRM', 103, 18),
(207, 'Finance App', 106, 20), 
(208, 'Marketing Campaign', 109, 35);

select * from Department;
select * from Employee;
select * from Project;

--Q2
select e.emp_name,d.dept_name,e.salary
from Employee e
join Department d
on e.dept_id=d.dept_id
where e.salary>(select avg(salary)
from Employee);

--Q3
select d.dept_name,Min(e.salary) AS MIN_Salary
from Employee e
join Department d
on e.dept_id=d.dept_id
Group by d.dept_name
having Min(e.salary)>
(
    select Min(e2.salary)
    from Employee e2
    join Department d2
    on e2.dept_id=d2.dept_id
    where d2.dept_name='IT'
);

--Q4
select e.emp_name,d.dept_name 
from Employee e
join Department d
on e.dept_id=d.dept_id
where e.dept_id in
(
    select dept_id
    FROM Employee
    GROUP BY dept_id
    HAVING AVG(salary)>50000
)

--Q5
select e.emp_name,d.dept_name,p.hours_worked
from Employee e
join Department d
on e.dept_id=d.dept_id
join Project p
on e.emp_id=p.emp_id
where p.hours_worked >
(
    select Avg(hours_worked)
    from Project
);



