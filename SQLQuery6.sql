/* Stored Procedures */
/*INPUT stored procedure */
use HRDB

create or alter procedure locationlist (@name varchar(10))
as 
begin
	select street_address, city, state_province
	from locations 
	where city like @name
end

exec locationlist '%n%'


/* OUTPUT */
create or alter procedure locationlist (@name INT OUTPUT)
as 
begin
	select @name = COUNT(street_address)
	from locations
end

declare @display int
exec locationlist @display output
select @display as locations


create or alter procedure employeeInnerList (@name varchar(2000) OUTPUT)
as 
begin
	set @name = (select 
		e.first_name
		from employees e, employees b
		where e.employee_id = b.manager_id )
end

declare @display varchar(2000)
exec employeeInnerList @display output
print @display

select * from employees
select * from employees