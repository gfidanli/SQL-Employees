-- Define Database Schema
DROP TABLE IF EXISTS department_employee;
DROP TABLE IF EXISTS department_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

-- Create a table of departments
CREATE TABLE departments (
  ID VARCHAR PRIMARY KEY,
  dept_name VARCHAR NOT NULL
);

-- Create a table of employees
CREATE TABLE employees (
    ID INT PRIMARY KEY,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- Create a table of salaries
CREATE TABLE salaries (
   	-- ID SERIAL PRIMARY KEY,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(ID),
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE
);

-- Create a table of titles
CREATE TABLE titles (
    -- ID INT PRIMARY KEY,
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(ID),
    title VARCHAR(30) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE
);

-- Create a junction table for Departments/Employees
CREATE TABLE department_employee (
    -- ID SERIAL PRIMARY KEY,
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(ID),
	FOREIGN KEY (dept_no) REFERENCES departments(ID)
);

-- Create a junction table for Departments/Manager
CREATE TABLE department_manager (
    -- ID INT PRIMARY KEY,
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE,
	FOREIGN KEY (dept_no) REFERENCES departments(ID),
    FOREIGN KEY (emp_no) REFERENCES employees(ID)
);

SELECT * FROM departments;