Create database MyDB;
use MyDB;

--DDL
CREATE TABLE employee
(
empId int, 
empName varchar(50)
);

--DQL
SELECT * FROM employee;

--DML
INSERT INTO employee(empId, empName) values(1, 'Ayushree Chakrabartty');
INSERT INTO employee(empId, empName) values(2, 'Ayushree Chakrabartty');

--update
UPDATE employee set empName = 'Hrishik Kumar' where empId = 2;

--drop table employee;



