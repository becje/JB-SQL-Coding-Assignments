-- Stored proceedure to show what department an employee is in

delimiter $$

create procedure empDepartment(	
	in firstName varchar(14),
	in lastName varchar(16)	
)
begin
	
	select d.dept_name as "Department", e.first_name as "First Name", e.last_name as "Last Name", t.title as "Job Title"
	from departments d
	inner join dept_emp de on de.dept_no = d.dept_no 
	inner join employees e on e.emp_no = de.emp_no
	inner join titles t on e.emp_no  = t.emp_no
	where t.to_date > now()
	and e.first_name = firstName and e.last_name = lastName
	group by d.dept_name;
	
end $$

delimiter ;

call empDepartment ("%_%", "%_%");

select * from employees;