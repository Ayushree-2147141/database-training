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