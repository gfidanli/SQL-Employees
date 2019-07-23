-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary

SELECT emp.ID, emp.last_name, emp.first_name, emp.gender, salaries.salary
FROM employees AS emp
LEFT JOIN salaries
ON emp.ID = salaries.emp_no;

-- 2. List employees who were hired in 1986
SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
    AND hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

SELECT d.ID, d.dept_name, e.ID, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM employees AS e
INNER JOIN department_manager as dm ON e.ID = dm.emp_no
INNER JOIN departments as d ON d.ID = dm.dept_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT e.ID, e.last_name, e.first_name, d.dept_name, de.from_date, de.to_date
FROM employees AS e
INNER JOIN department_employee AS de ON e.ID = de.emp_no
INNER JOIN departments as d on d.ID = de.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM EMPLOYEES
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

SELECT e.ID, e.last_name, e.first_name, d.dept_name, de.from_date, de.to_date
FROM employees AS e
INNER JOIN department_employee AS de ON e.ID = de.emp_no
INNER JOIN departments as d on d.ID = de.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT e.ID, e.last_name, e.first_name, d.dept_name, de.from_date, de.to_date
FROM employees AS e
INNER JOIN department_employee AS de ON e.ID = de.emp_no
INNER JOIN departments as d on d.ID = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "count_last_name"
FROM EMPLOYEES
GROUP BY last_name
ORDER BY count_last_name DESC;