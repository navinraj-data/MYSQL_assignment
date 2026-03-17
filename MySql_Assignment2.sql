CREATE DATABASE employee;
USE employee;
CREATE TABLE Departments (
department_id INT PRIMARY KEY,
department_name VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Location (
location_id INT AUTO_INCREMENT PRIMARY KEY,
location_name VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100) NOT NULL,
age INT CHECK (age >= 18),
gender ENUM('M','F'),
designation VARCHAR(100),
hire_date DATE DEFAULT (CURRENT_DATE),
department_id INT,
location_id INT,
FOREIGN KEY (department_id) REFERENCES Departments(department_id),
FOREIGN KEY (location_id) REFERENCES Location(location_id)
);
DROP DATABASE employee;
CREATE DATABASE employee;
USE employee;
ALTER TABLE Employees
ADD email VARCHAR(100);
ALTER TABLE Employees
MODIFY designation VARCHAR(150);
ALTER TABLE Employees
DROP COLUMN age;
ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;
RENAME TABLE Departments TO Departments_Info;
RENAME TABLE Location TO Locations;
TRUNCATE TABLE Employees;
DROP TABLE Employees;
DROP DATABASE employee;
alter table Employees add salary int;

describe Employees;

INSERT INTO Departments VALUES
(1,'Finance'),
(2,'IT'),
(3,'HR'),
(4,'Marketing');
select * from Departments;  
INSERT INTO Location VALUES
(1,'Chennai'),
(2,'Bangalore'),
(3,'Hyderabad');
insert into Employees values(1, 'Roger', 19, 'M', 'Player', '2015-05-10', 1, 1, 50000);
select * from Employees;
INSERT INTO Employees VALUES
(2,'Sharmila',20,'F','Analyst','2016-03-12',2,2,55000),
(3,'Novak',21,'M','Hr','2014-11-20',1,3,70000),
(4,'Suchitra',22,'F','Manager','2019-06-15',3,1,52000);

select distinct salary from Employees;
SELECT age AS Employee_Age,
salary AS Employee_Salary
FROM Employees;
SELECT *
FROM Employees
WHERE salary > 50000
AND hire_date < '2016-01-01';
SELECT *
FROM Employees
WHERE designation IS NULL;
UPDATE Employees
SET designation = 'Data Scientist'
WHERE employee_id = 5;
SELECT *
FROM Employees
ORDER BY department_id ASC, salary DESC;
UPDATE Employees
SET designation = 'Data Scientist'
WHERE designation IS NULL;

SELECT *
FROM Employees
WHERE YEAR(hire_date) = 2018
LIMIT 5;
INSERT INTO Employees VALUES
(5,'Vaishnavi',26,'M','Analyst','2018-07-10',2,2,58000);
select MIN(age)
FROM Employees;
select location_id, max(Salary) from Employees group by location_id;
select location_id, avg(salary) from Employees where designation = "Analyst" group by location_id;
SELECT SUM(salary)
FROM Employees
WHERE department_id = 1;
select department_id , count(*) from Employees group by department_id having count(*) < 3 ;
SELECT e.employee_name, e.designation, d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;
SELECT d.department_name, COUNT(e.employee_id)
FROM Departments as d
LEFT JOIN Employees as e
ON d.department_id = e.department_id
GROUP BY d.department_name;
select d.department_name, count(e.employee_id)
from Departments as d
right join Employees as e
on d.department_id = e.department_id
group by d.department_name;
describe Employees;
describe Departments;
describe Location;
show tables;
SELECT l.location_name, e.employee_name
FROM Employees e
RIGHT JOIN Location l
ON e.location_id = l.location_id;
SELECT Departments.department_name, Location.location_name
FROM Departments
CROSS JOIN Location;
SELECT e1.employee_name, e2.employee_name
FROM Employees e1
JOIN Employees e2
ON e1.department_id = e2.department_id
AND e1.employee_id <> e2.employee_id;
SELECT employee_name, salary,
RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM Employees;
SELECT employee_name, department_id, salary,
DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dept_rank
FROM Employees;
SELECT employee_name, department_id, salary,
SUM(salary) OVER (PARTITION BY department_id ORDER BY salary) AS running_total
FROM Employees;

