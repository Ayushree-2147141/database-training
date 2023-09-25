use MyDB;

-- defining primary key 
create table student 
(studentId int identity(1,1), 
firstName varchar(100), 
lastName varchar(100), 
classId int, 
createdOn datetime default getdate(), 
primary key(studentId));

--select getdate()

insert into student(firstName, lastName, classId) values('Ayushree', 'Chakrabartty', 2);
insert into student(firstName, lastName, classId) values('Hrishik', 'Kumar', 1);
insert into student(firstName, lastName, classId) values('Renil', 'Justin', 3);
insert into student(firstName, lastName, classId) values('Akash', 'Singh', 1);
insert into student(firstName, lastName, classId) values('Reuben', 'Kurian', 3);

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

create table studentclass 
(
classId int identity(1,1),
className varchar(20),
primary key(classId)
)

insert into studentclass (className) values('MCA');
insert into studentclass (className) values('MDS');
insert into studentclass (className) values('MBA');

select * from studentClass;


select st.firstName, st.lastName, stc.className
from student st
inner join studentclass stc
on st.classId = stc.classId;


-- Creating VIEW
create view [GetStudentData] as
select st.studentId, dbo.getFullName(st.studentId) as 'Full Name', stc.className
from student st
inner join studentclass stc
on st.classId = stc.classId;

select * from GetStudentData;

--PROCEDURES
--create proc Or create procedure

create procedure InsertData
(
@firstName varchar(100),
@lastName varchar(100),
@classId int
)
as
begin  
insert into student(firstName, lastName, classId) values(@firstName, @lastName, @classId)
end

-- executing the procedure
exec InsertData 'Tanushree','Chakrabartty', 1

select * from student;

--truncate table student;
--drop proc InsertData;

-- IF ELSE

--altering the insertdata procedure classId from int to varchar
--alter procedure <procedure-name> <body>
create procedure InsertDataID
(
@firstName varchar(100),
@lastName varchar(100),
@className varchar(100)
)
as
begin  
	if((select count(*) from studentclass where className = @className) > 0)
		begin
			insert into student(firstName, lastName, classId) values(@firstName, @lastName, (select classId from studentclass where className = @className))
		end
	else
		begin
			insert into studentclass(className) values(@className);
			insert into student(firstName, lastName, classId) values(@firstName, @lastName, @@IDENTITY);
		end
end

exec InsertDataID 'Test1', 'Name1' , 'X'

select * from student;
select * from studentclass;

delete from student where classId = 7;
-- drop procedure InsertDataID