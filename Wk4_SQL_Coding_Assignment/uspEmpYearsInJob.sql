-- Stored proceedure to show how many years an employee has been in a job.

delimiter $$

create procedure years_in_job (
in employee_number int,
out years_in_job int

)
Begin
	declare start_year int;
    declare end_year int;
    
    select year(de.from_date), year(de.to_date)
    into start_year, end_year
    from dept_emp de
    inner join employees e on de.emp_no = e.emp_no 
    where de.emp_no = employee_number
    Limit 2;
    
    If end_year = 9999 then
		set end_year = year(now());
    end if;
    
    select end_year - start_year into years_in_job;

End $$

call years_in_job(10025, @years);
select @years;

Delimiter ;

drop procedure if exists years_in_job;
