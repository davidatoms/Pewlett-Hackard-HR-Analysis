# Pewlett-Hackard-HR-Analysis
Columbia Data Science Bootcamp Module 7 - Using Python and SQL - Help an employee of Pewlett Hackard effectively and accurately run through human resource operations.

###### Written by: David Adams
###### Written for: Columbia Data Science Bootcamp Module 7
###### Date: March 8, 2021
###### Written with: PGADMIN 4.0, POSTGRES

## Overview of Analysis:
The analysis began with databases from Hewlett-Packard that contained information about their promotions, time with the company, roles performed, and birthdays. It was located in multiple areas and the HR analyst's job was to organize the data and prepare retirement packages, forecast potential retirees, and shed light on the upcoming "silver tsunami" of the company.

By laying out the data in an ERD, analysts can see which data connects among the company's files. This creates a network that is available to answer questions like: How many people are eligible for retirement? How many employees are available to mentor those who will need to replace them? And ho

The setup is important because the SQL coding helps stroke the information in a way that answers the specific questions laid out above. 

## Results:
| Count:     | Title:             |
| ---------- | ------------------ |
| 29414      | Senior Engineer    |
| 28254      | Senior Staff       |
| 14222      | Engineer           |
| 12243      | Staff              |
| 4502       | Technique Leader   |
| 1761       | Assistant Engineer |
| 2          | Manager            |

This seems to be the most profound snapshot of the current retiring employees picture. It shows the titles of the employees that will be retiring and their count. Furthermore, it doesn't expose birthdays or other personal information about the employees that work at Pewlett Hackard. There are a lot of engineers and technical roles that will need to be filled. Then, there are supporting roles that help make the engineered content more understandable.

This information can be compared to the rest of the company and the roles that are upcoming. It can be used to provide information about possible solutions of promising employees that can fill the roles. By understanding the age and the managerial roles, the company can see who may be a good fit for the upcoming vacant roles.

## Summary:
| Questions: | Answer:  |
| ---------- | -------- |
| How many roles will need to be filled as the "silver tsunami" begins to make an impact? | 41380 |
| Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? | _Maybe_ see Zen Shorts |

Question number one shows that there will be a lot of vacant roles. Because Hewlitt Packard is a mature company, they will need to reorganize and search deep within their company to find leaders of young ages that can keep the company on track. Question two shows that there are not a lot of employees that can mentor, but that the mentorship needs to be efficient. 

_Zen Shorts_ by John J. Muth has a panda that always says maybe. Although, the task of managing the "silver tsunami" seems daunting. I believe that as the panda from _Zen Shorts_ says, this "may" not "be" bad for the company. It is a time for the company to reevaluate, restructure, and explore nex possibilities into the next generation of technology.

Personally, I would like to see computing companies understand and utilize blockchain technology. This is a personal opinion, but I believe computing companies that harness the fervor around the technology and create computers equal to the task of blockchain, they will find significant market opportunity.

Lastly, in recent news, Hewlitt Packard announced that they are moving their headquarters from Silicon Valley in California to Austin, Texas. I believe that this choice is smart for business because of Austin's young population. It is also a major tech hub. The employees that they bring with them will be able to mentor the up-and-coming future technologists to keep Hewlitt Packard as a big player in the industry.

## Troubleshooting Journal:
The first time I imported the csv from my computer to the departments, dept_manager, and dept_emp did not properly import. However, the employees, salaries, and titles did import. For 'departments', I accidentally put VARCHAR(4) when it needs to be VARCHAR(40). I tried to update the table with the UPDATE method, but I ended up creating a new table called departments_revised. It just worked, so I will go with departments_revised to show my work.

For the dept_manager and the dept_emp tables, I saw that the reference to an incorrect table was causing an error that didn't allow the data from the csvs to import. It worked with the new revision.

Third, my dept_emp was off because of the keys. They were not connecting to the tables.
