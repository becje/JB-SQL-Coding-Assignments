use employees;

-- Q1: How many employees with each title were born after 1965-01-01?

select count(*) from  employees where birth_date > 1965-01-01;

-- Q2:  What is the average salary per title?

select t.title as "Title", avg(s.salary) as "Average Salary" from titles t
inner join salaries s on s.emp_no = t.emp_no
group by t.title;

-- Q3: How much money was spent on salary for the marketing department between the years 1990 and 1992?

select d.dept_no as "Department Number", d.dept_name as "Department", sum(s.salary) as "1990-1992 Total Salary", de.from_date as "From Date", de.to_date as "To Date" from departments d
inner join dept_emp de on d.dept_no = de.dept_no 
inner join salaries s on s.emp_no = de.emp_no
where de.from_date >= '1990-01-01' and de.to_date <= '1992-01-01'
and  d.dept_name = "Marketing";
 
desc departments;
select * from departments;
desc dept_emp;
desc employees;