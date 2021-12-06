--Deliverable 1: The Number of Retiring Employees by Title
DROP TABLE mentorship_table;
SELECT e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date
INTO title_emp
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;
SELECT * FROM title_emp;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (te.emp_no) te.emp_no,
te.first_name,
te.last_name,
te.title

INTO unique_titles
FROM title_emp AS te
ORDER BY emp_no, to_date DESC;
SELECT * FROM unique_titles;

SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;
SELECT * FROM retiring_titles;

--Deliverable 2: The Employees Eligible for the Mentorship Program 
SELECT DISTINCT ON(e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
--DISTINCT ON(emp_no)
INTO mentorship_table
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
SELECT * FROM mentorship_table;


