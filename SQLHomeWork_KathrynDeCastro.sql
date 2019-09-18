--List the following details of each employee: employee number, last name, first name, gender, and salary.
select emp.emp_no, emp.first_name, emp.last_name, emp.gender, s.salary
	from employees as emp 
	join salaries as s
		on emp.emp_no = s.emp_no
	Order by emp_no;
	
--List employees who were hired in 1986.
select emp.emp_no, emp.first_name, emp.last_name, emp.gender, emp.hire_date
	from employees as emp 
	Where hire_date < '1/1/1987' and hire_date > '12/31/1985'
	Order by emp_no;
	
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates

Select dpt.dept_name, dpt.dept_no, dptman.emp_no, emp.last_name, emp.first_name, 
	   dptman.from_date, dptman.to_date, tit.title
	 from dept_manager as dptman
	 join departments as dpt
	 	on dptman.dept_no = dpt.dept_no
	 join employees as emp
	 	on dptman.emp_no = emp.emp_no
	 join titles as tit
	 	on dptman.emp_no = tit.emp_no
	 Where tit.title = 'Manager' and dptman.to_date = '01/01/9999';
	 
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
Select emp.emp_no, emp.last_name, emp.first_name, dpt.dept_name
	from employees as emp
	join dept_emp as de
		on emp.emp_no = de.emp_no
	join departments as dpt
		on de.dept_no = dpt.dept_no;
		
--List all employees whose first name is "Hercules" and last names begin with "B."
Select * 
From employees 
where first_name = 'Hercules' and  last_name like 'B%_';

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
Select emp.emp_no, emp.last_name, emp.first_name, dpt.dept_name
from employees as emp
	join dept_emp as de
	on emp.emp_no = de.emp_no
	join departments as dpt
	on de.dept_no =dpt.dept_no
Where dpt.dept_name = 'Sales'; 

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
Select emp.emp_no, emp.last_name, emp.first_name, dpt.dept_name
from employees as emp
	join dept_emp as de
	on emp.emp_no = de.emp_no
	join departments as dpt
	on de.dept_no =dpt.dept_no
Where dpt.dept_name = 'Sales' or dpt.dept_name = 'Development'; 

--In descending order, 
--list the frequency count of employee last names, 
--i.e., how many employees share each last name.
Select last_name, (last_name).count
from employees
group by last_name
order by last_name;
