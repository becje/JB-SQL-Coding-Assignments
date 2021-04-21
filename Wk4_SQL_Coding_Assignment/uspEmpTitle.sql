-- Stored proceedure to show employee titles --

delimiter $$

create procedure empTitle(
	in firstName varchar(14),
	in lastName varchar(16)
)
begin
	select e.first_name as "First Name", e.last_name as "Last Name", t.title as "Job Title" 
	from employees e
	inner join titles t on e.emp_no = t.emp_no 
	where t.to_date > now()
	and e.first_name = firstName and e.last_name = lastName;
end $$

delimiter ;

call empTitle ("Anneke", "Preusig");

select * from employees;