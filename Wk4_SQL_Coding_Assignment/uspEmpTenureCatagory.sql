-- Stored proceedure to look up an employee's tenure. Shows how many years employee has been working with company, 
-- and what tenure catagory is assigned to them based on how long they have worked for the company.
use employees;

delimiter $$

CREATE PROCEDURE emp_tenure_catagory(
	IN employee_number int
)
BEGIN
	DECLARE tenure_catagory varchar(20);
    
    CALL years_in_job(employee_number, @years);
    
    IF @years < 10 THEN
		SET tenure_catagory = "Rookie Employee";
	ELSEIF	@years < 20 THEN
		SET tenure_catagory = "Seasoned Employee";
	ELSE
		SET tenure_catagory = "Veteran Employee";    
    END IF;
    
    SELECT @years AS years_in_job, tenure_catagory as "Tenure Status ", concat(e.first_name, + " ", + e.last_name) as "Employee Name",  d.dept_name as "Department"
    FROM departments d
    INNER JOIN dept_emp de ON de.dept_no = d.dept_no
    Inner JOIN employees e ON de.emp_no = e.emp_no
    WHERE de.emp_no = employee_number
    LIMIT 20;
END $$

CALL emp_tenure_catagory(10051);

delimiter ;

select * from employees limit 50;

drop procedure if exists emp_tenure_catagory;