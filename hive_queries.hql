use nikunj_projects;

--1 A list showing employee number, last name, first name, sex, and salary for each employee.
select salaries.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
from employees  
inner join salaries 
on salaries.emp_no = employees.emp_no 
order by salaries.emp_no; 

--2 A list showing first name, last name, and hire date for employees who were hired in 1986.
select emp_no, last_name, first_name, hire_date 
from employees 
where right(hire_date,4) = '1986';

--3 A list showing the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
select distinct dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager 
inner join departments 
on dept_manager.dept_no= departments.dept_no
inner join employees 
on dept_manager.emp_no = employees.emp_no
order by dept_manager.dept_no;

--4 A list showing the department of each employee with the following information: employee number, last name, first name, and department name.
select distinct  employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees 
left join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
order by employees.emp_no;

--5 A list showing first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B.“
select last_name, first_name
from employees 
where (first_name = 'Hercules') and (lower(last_name) like 'b%')
order by last_name;

--6 A list showing all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees 
inner join dept_emp 
on dept_emp.emp_no = employees.emp_no
inner join departments on dept_emp.dept_no= departments.dept_no
where lower(departments.dept_name) = 'sales';

--7 A list showing all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees 
inner join dept_emp 
on dept_emp.emp_no = employees.emp_no
inner join departments on dept_emp.dept_no= departments.dept_no
where (lower(departments.dept_name) = 'sales') or (lower(departments.dept_name) = 'development');

--8 A list showing the frequency count of employee last names, in descending order. ( i.e., how many employees share each last name).
select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by Frequency desc;

--9 A list showing the frequency count of employee first names, in descending order. ( i.e., how many employees share each first name).
select first_name,count(first_name) as Frequency 
from employees 
group by first_name
order by Frequency desc;

--10. How many employees are females and how many employees are male?
select sex as Gender,count(sex) as No_of_Individuals 
from employees 
group by sex
order by No_of_Individuals  desc;

--11. What is the average salary in the company?
select avg(salary) as Avg_Salary_of_Company from salaries ;

--12. What is the average salary department wise?
select departments.dept_name, avg(salaries.salary) as Avg_Salary
from departments inner join dept_emp
on departments.dept_no = dept_emp.dept_no
inner join employees
on dept_emp.emp_no = employees.emp_no
inner join  salaries
on employees.emp_no=salaries.emp_no
group by departments.dept_name;

--13 . What is the average salary gender wise?
select employees.sex as Gender, avg(salaries.salary) as Avg_Salary
from employees inner join salaries
on employees.emp_no=salaries.emp_no
group by employees.sex;

--14. what is the frequency distribution of performance rating?
select last_performance_rating as Ratings, count(*) as Frequency
from employees
group by last_performance_rating
order by Frequency desc;



