

--Create a titles table and import the csv file to populate the table 
CREATE TABLE titles(
       title_id VARCHAR PRIMARY KEY,
       title VARCHAR(40)
);

-- list/print out the table to see the values
SELECT * FROM titles;

--Create an employees table and import the csv file to populate the table 
CREATE TABLE employees(
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(30) NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL
    
);

SELECT * FROM employees;

--Create a departments table and import the csv file to populate the table 
CREATE TABLE departments(
    dep_no VARCHAR(30) PRIMARY KEY,
    dep_name VARCHAR(40)
);

SELECT * FROM departments;

--Create a departments manager table and import the csv file to populate the table 
--Table schema for junction table 
CREATE TABLE dep_manager(
    dep_no VARCHAR(30) NOT NULL,
    FOREIGN KEY (dep_no) REFERENCES departments(dep_no),
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (dep_no, emp_no )
);


SELECT * FROM dep_manager;

--Create a departments employees table and import the csv file to populate the table
--Table schema for junction table 
CREATE TABLE dep_employees(
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dep_no VARCHAR(30) NOT NULL,
    FOREIGN KEY (dep_no) REFERENCES departments(dep_no),
    PRIMARY KEY (emp_no, dep_no)
);


SELECT * FROM dep_employees;

--Create a Salaries table and import the csv file to populate the table
CREATE TABLE salaries(
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary INT NOT NULL 
);

-- list/print Salaries Table 
SELECT * FROM salaries;
