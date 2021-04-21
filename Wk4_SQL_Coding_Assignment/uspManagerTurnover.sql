-- Stored proceedure to show employee turnover based on data from managers table

delimiter $$

create procedure uspManagerTurnover(
	out working int,
	out notWorking int
)
begin
	declare total int default 0;

	select count(*) 
	into total 
	from dept_manager;

	select count(*)
	into working 
	from dept_manager dm 
	inner join titles t on dm.emp_no 
	where t.to_date > now();


	select total - working into notWorking;
end $$


delimiter ;

call uspManagerTurnover (@working, @notWorking);
select @working, @notWorking;
