-- Define Database Schema

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS department_employee;
DROP TABLE IF EXISTS department_manager;


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
    ID INT PRIMARY KEY,
    employee_ID INT,
	FOREIGN KEY (employee_ID) REFERENCES employees(ID),
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE
);

-- Create a table of titles
CREATE TABLE titles (
    ID INT PRIMARY KEY,
    employee_ID INT NOT NULL,
    FOREIGN KEY (employee_ID) REFERENCES employees(ID),
    title VARCHAR(30) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE
);

-- Create a junction table for Departments/Employees
CREATE TABLE department_employee (
    ID INT PRIMARY KEY,
    department_ID VARCHAR NOT NULL,
    employee_ID INT NOT NULL,
    FOREIGN KEY (department_ID) REFERENCES departments(ID),
    FOREIGN KEY (employee_ID) REFERENCES employees(ID),
    from_date DATE NOT NULL,
    to_date DATE
);

-- Create a junction table for Departments/Manager
CREATE TABLE department_manager (
    ID INT PRIMARY KEY,
    department_ID VARCHAR NOT NULL,
    employee_ID INT NOT NULL,
    FOREIGN KEY (department_ID) REFERENCES departments(ID),
    FOREIGN KEY (employee_ID) REFERENCES employees(ID)
);