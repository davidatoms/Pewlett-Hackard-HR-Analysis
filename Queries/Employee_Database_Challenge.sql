-- CHALLENGE --
-- Steps 1 and 2
SELECT emp_no, first_name, last_name
FROM employees;

SELECT title, from_date, to_date
FROM titles;

SELECT * FROM current_emp;

-- Step 3: Create a table using the INTO clause
SELECT e.emp_no, e.first_name, e.last_name,
ttl.title, ttl.from_date, ttl.to_date
INTO retirement_titles
FROM employees AS e
	LEFT JOIN titles AS ttl
		ON e.emp_no = ttl.emp_no
WHERE (e.birth_date between '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no DESC;

-- 6. Export the Retirement Titles
-- 7. Before you export, confirm that it looks like this. Revise the order
-- that 6 and 7 are in.

SELECT * FROM retirement_titles;

-- 8. Copy query and add it
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;

-- 9. Retrieve the employee number, first and last name, and title columns 
-- from the Retirement Titles table.
SELECT emp_no, first_name, last_name, title
FROM retirement_titles;

-- 10. Use the DISTINCT ON statement to retrieve the first occurrence of the 
-- employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (emp_no) emp_no, to_date, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT (DISTINCT title)
FROM unique_titles;
-- 7
SELECT DISTINCT title
FROM unique_titles;
-- Engineer, Senior Engineer, Manager, Assistant Engineer, Staff, Senior
-- Staff, Technique Leader
SELECT COUNT (emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

-- DELIVERABLE 2 --
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ttl.title
INTO mentor_elibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ttl
ON (e.emp_no = ttl.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentor_elibility;

SELECT COUNT(*) FROM mentor_elibility;
SELECT * FROM retirement_info;
SELECT *
