use HRDB;

create function get_employee()
returns table
as 
return (select * from employees)

select * from get_employee()

create or alter function multival()
returns @employee table(employee_id int, first_name varchar(50), salary int) as
begin
	insert into @employee
	select employee_id, first_name, salary from employees
	update @employee set first_name = 'joy' where employee_id = 1
	return
end

select * from multival()

select * from employees
select * from locations

/* insert trigger */
create or alter trigger trInsertEmployee
on employees
for insert
as 
begin
	declare @id int
	select @id = employee_id from inserted
	insert into locations 
	values (16, 'lagos', CAST(@id as varchar(20)), 'city', 'lagos', 2)
end

select * from jobs

-- Insert action
create or alter trigger trInsertJob
on jobs
for insert
as 
begin
	print 'there is a new entry with id'
	--select * from jobs
end

insert into jobs values (100, 'test', 2000, 4000)

--Delete trigger

create or alter trigger trDeleteJob
on jobs
for delete
as
begin
	set nocount on
	print 'you have just deleted a record'
end

delete from jobs where job_id = 17

-- Update trigger
create or alter trigger trUpdateJob
on jobs
for update
as
begin
	declare @id int
	select @id = job_id from inserted
	print ('you have just updated a record '+ CAST(@id as varchar(20)))
end

select * from jobs

update jobs set job_title = 'hello world' where job_id = 1


create or alter trigger trg_job on jobs
for insert, update, delete
as
begin
	declare @id int, @job_title varchar(50), @del int, @title int, @Action varchar(50)

	select @id = (i.job_id + 1), @job_title = i.job_title from inserted i
	select @del = d.job_id, @title = d.job_title from deleted d

	set @Action =
	case
		when @id is not null then 'Delete'
		when @job_title is not null then 'Insert'
		else 'Update'
		end

	set @Action = 
	case 
		when @del is not null then 'Insert'
		when @title is not null then 'Update'
		else 'Delete'
		end

		insert into jobs values(@id, @job_title, @del, @title)
		print @Action
		
end

insert into jobs values (30, 'tests', 2000, 3000)

select * from jobs

create or alter trigger trRestrictCreateTable
on database
for create_table
as
begin
	print 'YOU CANNOT CREATE A TABLE IN THIS DATABASE'
	rollback transaction
end

create or alter trigger trRestrictAlterTable
on database
for alter_table
as
begin
	print 'YOU CANNOT ALTER A TABLE IN THIS DATABASE'
	rollback transaction
end

create or alter trigger trRestrictDropTable
on database
for drop_table
as
begin
	print 'YOU CANNOT DROP A TABLE IN THIS DATABASE'
	rollback transaction
end

create or alter trigger trRestrictDDLTable
on database
for create_table, alter_table, drop_table
as
begin
	print 'YOU CANNOT CREATE, ALTER, DROP A TABLE IN THIS DATABASE'
	rollback transaction
end

create table test (id int, body text )
select * from test
drop table test

enable trigger trRestrictDDLTable on database

create or alter procedure sp_Add @a int, @b int
as
begin
	declare @c int
	begin try
		set @c = @a / @b
		print 'Divide is '+ cast(@c as char)
	end try
	begin catch
		print error_state()
	end catch
end

exec sp_Add 20, 0