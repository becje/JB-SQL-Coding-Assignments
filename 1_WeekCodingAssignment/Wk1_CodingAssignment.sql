-- Q1: Show all employees who were born before 1965-01-01

select first_name, last_name, birth_date from employees where birth_date < '1965-01-01' 
order by birth_date desc limit 20;

-- Q2: Show all employees who are female and were hired after 1990

select first_name, last_name, gender, hire_date from employees where gender = 'f' and hire_date > '1990-12-31' 
order by hire_date desc limit 20;

-- Q3: Show the first and last name of the first 50 employees whose last name starts with F

select first_name, last_name from employees where last_name like 'f%' 
order by last_name limit 50;

-- Q4: Insert 3 new employees into the employees table. There emp_no should be 100, 101, and 102. You can choose the rest of the data.

insert into employees values
(100, '1995-06-28', 'Anil', 'O\'Connor', 'F', '2018-03-15'), 
(101, '1996-10-28', 'Callum', 'Phelps', 'M', '2019-06-02'), 
(102, '1975-03-18', 'Naseem', 'Goodwin', 'F', '2012-05-01');
select * from employees where emp_no >= '100' and emp_no <= '200';

-- Q5: Change the employee's first name to Bob for the employee with the emp_no of 10023.

update employees set first_name = 'Bob' where emp_no = '10023';
select * from employees where emp_no = '10023';

-- Q6: Change all employees hire dates to 2002-01-01 whose first or last names start with P.
	-- See excel file Q6_employeesDB_Before_After.xlsx file for comparison of data sets
	-- Comparison of total rows of data match at 31567 rows of data successfully updated not including field titles

select emp_no, first_name, last_name, hire_date from employees where first_name like 'p%' or last_name like 'p%';
update employees set hire_date = '2002-01-01' where first_name like 'p%' or last_name like 'p%';
select emp_no, first_name, last_name, hire_date from employees where first_name like 'p%' or last_name like 'p%'
order by first_name, last_name, emp_no;

-- Q7: Delete all employees who have an emp_no less than 10000

select emp_no, first_name, last_name from employees where emp_no < '10000';
delete from employees where emp_no < '10000';
select emp_no, first_name, last_name from employees where emp_no < '10000';

-- Q8: Delete all employee who have an emp_no of 10048, 10099, 10234, and 20089.

select emp_no, first_name, last_name from employees where emp_no in ('10048', '10099', '10234', '20089');
delete from employees where emp_no in ('10048', '10099', '10234', '20089');
select emp_no, first_name, last_name from employees where emp_no in ('10048', '10099', '10234', '20089');
