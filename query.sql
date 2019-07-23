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

SELECT d.ID, d.dept_name, e.ID, e.last_name, e.first_name, de.from_date, de.to_date
FROM employees AS e
LEFT JOIN department_employee as de ON e.ID = de.emp_no
LEFT JOIN departments as d ON d.ID = de.dept_no;


