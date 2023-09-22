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

--delete vs truncate
delete from employee where empId = 2;

truncate table employee;


CREATE TABLE employeeTable
(
empId int identity(1,1), 
empName varchar(50)
);

select * from employeeTable;


select * from employee;
--truncate resets the counter
INSERT INTO employee(empId, empName) values(3, 'Akash Singh');
INSERT INTO employee(empId, empName) values(4, 'Reuben Mohan Kurian');
INSERT INTO employee(empId, empName) values(5, 'Renil Justin');
INSERT INTO employee(empId, empName) values(6, 'Shreyanshi Srivastava');
INSERT INTO employee(empName, deptId) values( 'Prakash Parwez', 1);
INSERT INTO employee(empName, deptId) values('Tanushree Mittal', 2);

-- IN , LIKE, NOT IN , BETWEEN, OR, AND

--IN
select * from employee where empId in (1,2,6);
-- NOT IN
select * from employee where empId not in (3);

--LIKE
select * from employee where empName like 'a%';
select * from employee where empName like '%a';
select * from employee where empName like '%a%';

--BETWEEN
select * from employee where empId between 2 and 5;

--OR
select * from employee where empName like 'a%' OR empName like '%a';

--AND
select * from employee where empName like '%a%' AND empName like 'S%';


create table department
(
deptId int identity(1,1),
deptName varchar(50)
);

insert into department values('IT');
insert into department values('Admin');
insert into department values('Support');
insert into department values('HR');

select * from department;

--altering table
alter table employee add deptId int;

update employee set deptId = 4 where empName like 'shre%' ;

select * from employee;


select employee.empName , employee.empId, employee.deptId, department.deptName from employee
join department
on department.deptId = employee.deptId;

