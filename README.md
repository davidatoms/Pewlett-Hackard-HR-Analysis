# Pewlett-Hackard-HR-Analysis
Columbia Data Science Bootcamp Module 7 - Using Python and SQL - Help an employee of Pewlett Hackard effectively and accurately run through human resource operations.

###### Written by: David Adams
###### Date: March 8, 2021
###### Written with: PyCharm
###### Written for: Columbia Data Science Bootcamp Module 7

## Troubleshooting Journal:
The first time I imported the csv from my computer to the departments, dept_manager, and dept_emp did not properly import. However, the employees, salaries, and titles did import. For 'departments', I accidentally put VARCHAR(4) when it needs to be VARCHAR(40). I tried to update the table with the UPDATE method, but I ended up creating a new table called departments_revised. It just worked, so I will go with departments_revised to show my work.

For the dept_manager and the dept_emp tables, I saw that the reference to an incorrect table was causing an error that didn't allow the data from the csvs to import. It worked with the new revision.

Third, my dept_emp was off because of the keys. They were not connecting to the tables.
