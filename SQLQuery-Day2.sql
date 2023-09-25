use MyDB;

-- defining primary key 
create table student 
(studentId int identity(1,1), 
firstName varchar(100), 
lastName varchar(100), 
className int, 
createdOn datetime default getdate(), 
primary key(studentId));

--select getdate()

insert into student(firstName, lastName, className) values('Ayushree', 'Chakrabartty', 2);
insert into student(firstName, lastName, className) values('Hrishik', 'Kumar', 1);
insert into student(firstName, lastName, className) values('Renil', 'Justin', 3);
insert into student(firstName, lastName, className) values('Akash', 'Singh', 1);
insert into student(firstName, lastName, className) values('Reuben', 'Kurian', 3);

select * from student;

-- system function / user defined functions
-- cast for type casting

--CONCATENATION
select concat(firstName,' ',lastName) as 'Full Name'
from student;

select concat(firstName,' ',lastName) 'Full Name'
from student;

-- Functions 
-- Mydb/programmability/functions/scalar-valued functions/<dbname>.<functionName>
create function getFullName(@id int)
returns varchar(200)
as
begin 
return (select concat(firstName,' ',lastName) 'Full Name' from student where studentId = @id);
end


-- function call
-- returns all value
-- using 'from student' since student table contains studentId, and not passing value therefore need to refer
select dbo.getFullName(studentId) as FullName from student;

-- returns one particular
-- no need to use 'from student' since direct value is being passed
select dbo.getFullName(2) as 'Full Name' 