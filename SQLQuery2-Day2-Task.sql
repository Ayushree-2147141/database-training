use MyDB;

create table newemployeeTable
(
id int identity(1,1),
employeeId varchar(20),
firstName varchar(50),
lastName varchar(50),
salary int,
gender varchar(10),
createdOn datetime default getdate(),
primary key(id)
)


-- using functions employeeId EP001<create a function>
-- insertnewEmpRecord <procedure> 
-- after adding 5 employees , fetch max salary <max salary function>


select * from newemployeeTable;

--inserting data 
--creating procedure
create procedure InsertEmployee
(
@firstName varchar(50),
@lastName varchar(50),
@salary int,
@gender varchar(10)
)
as 
begin
	if((select count(*) from newemployeeTable) > 0)
		begin
			insert into newemployeeTable(firstName, lastName, salary, gender) 
			values(@firstName, @lastName, @salary, @gender)
		end
	else
		begin
			--insert into newemployeeTable(employeeId, firstName , lastName, salary, gender) 
			--values(dbo.getEmployeeId(@@IDENTITY), @firstName, @lastName, @salary, @gender)
			update newemployeeTable
			set employeeId = dbo.getEmployeeId(@@IDENTITY);
		end
	
end

exec dbo.InsertEmployee 'Ayush', 'Kumar', 80000, 'male'
--drop procedure InsertEmployee;
select * from newemployeeTable

-- delete from newemployeeTable where id = 1;
create function getEmployeeId(@empid int)
returns varchar(20)
as
begin
return (select concat('EP00', @empid ) from newemployeeTable where id = @empid)
end

select dbo.getEmployeeId(2)



insert into newemployeeTable (firstName, lastName, salary, gender) values ('ayush', 'kumar', 80000, 'male');
select * from newemployeeTable;