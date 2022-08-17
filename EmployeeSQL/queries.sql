-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

-- join employees table and salary table , with emp_no as common column

--Select all from employees to see the table 
SELECT * FROM employees;
--Select all from the salaries table
SELECT * FROM salaries;

-- Select the columns required from the employees and salaries table for Joining
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,salaries.salary
FROM employees
FULL OUTER JOIN salaries
on employees.emp_no = salaries.emp_no;


-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT * FROM employees;

SELECT first_name, last_name, hire_date
FROM employees
WHERE extract(year from hire_date) = 1986;

-- List the manager of each department with the following information: 
--department number, department name, 
--the manager's employee number, last name, first name.

SELECT * FROM departments;
SELECT * FROM dep_manager;
SELECT * FROM employees;


SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dep_name, dep_manager.dep_no
From dep_manager
Inner Join departments on dep_manager.dep_no = departments.dep_no
Inner Join employees on dep_manager.emp_no = employees.emp_no;


-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT * FROM dep_employees;
SELECT * FROM departments;
SELECT * FROM employees;

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dep_name
From dep_employees
Inner Join departments on dep_employees.dep_no = departments.dep_no
Inner Join employees on dep_employees.emp_no = employees.emp_no;

-- List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';



-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dep_employees;

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dep_name
From dep_employees
Inner Join departments on dep_employees.dep_no = departments.dep_no
Inner Join employees on dep_employees.emp_no = employees.emp_no
WHERE dep_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name,
-- and department name.

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dep_name
From dep_employees
Inner Join departments on dep_employees.dep_no = departments.dep_no
Inner Join employees on dep_employees.emp_no = employees.emp_no
WHERE dep_name = 'Sales' OR dep_name = 'Development';


-- List the frequency count of employee last names 
-- (i.e., how many employees share each last name) 
-- in descending order.

SELECT last_name, COUNT(last_name) AS "Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Name Count" DESC;
