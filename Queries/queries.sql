--7.3.1 Query Dates
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

--skill drill
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-01-01';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-01-01';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-01-01';

-- Retirement Eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement Eligibility updated
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create new tables
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Select infor from new table
SELECT * FROM retirement_info;

-- Drop old retirement_info table
DROP TABLE retirement_info;

--Drop incorrect tables
DROP TABLE dept_emp;
DROP TABLE dept_manager;

-- Create a new table for retiring employees with new rules
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager_revised tables
SELECT departments_revised.dept_name,
     dept_manager_revised.emp_no,
     dept_manager_revised.from_date,
     dept_manager_revised.to_date
FROM departments_revised
INNER JOIN dept_manager_revised
ON departments_revised.dept_no = dept_manager_revised.dept_no;

-- Joining retirement_info and dept_emp_revised tables
SELECT retirement_info.emp_no, retirement_info.first_name, retirement_info.last_name, dept_emp_revised.to_date
FROM retirement_info
LEFT JOIN dept_emp_revised
ON retirement_info.emp_no = dept_emp_revised.emp_no;

-- Joining retirement_info and dept_emp_revised tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp_revised.to_date
FROM retirement_info
LEFT JOIN dept_emp_revised
ON retirement_info.emp_no = dept_emp_revised.emp_no;

-- Changing the names of the tables so that it more functions with the curriculum
ALTER TABLE departments_revised
RENAME TO departments;

ALTER TABLE dept_emp_revised
RENAME TO dept_emp;

ALTER TABLE dept_manager_revised
RENAME TO dept_manager;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Left Join Practice
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

--7.3.4
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Creating the lists
-- List #1 with Employee Information
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employees AS e
	INNER JOIN salaries AS s
		ON (e.emp_no = s.emp_no)
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');
	
-- List #2 with Management Information
SELECT mgr.dept_no,
	dpt.dept_name,
	mgr.emp_no,
	ce.last_name,
	ce.first_name,
	mgr.from_date,
	mgr.to_date
INTO manager_info
FROM dept_manager AS mgr
	INNER JOIN departments AS dpt
		ON (mgr.dept_no = dpt.dept_no)
	INNER JOIN current_emp AS ce
		ON (mgr.emp_no = ce.emp_no);

-- List #3 with department retirees
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	dpt.dept_name
INTO dept_info
FROM current_emp AS ce
	INNER JOIN dept_emp AS de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments AS dpt
		ON (de.dept_no = dpt.dept_no);
		