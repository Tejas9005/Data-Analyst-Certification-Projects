show databases

use hr

show tables

Problem Statment - Fetch all the records for Employees Table.
select
*
from
employees;

Problem Statment - Show all the emp_id, first_name, last_name from employee Table.
select
employee_id as emp_id, first_name, last_name 
from
employees;

Problem Statment -  Write a query in SQL to display the first_name and last_name, department_id and salary from employees Table 
who earn more than 20000.
select
first_name, last_name, department_id, salary
from
employees
where salary > 20000

Problem Statment - Write a query in SQL to display the first_name and last_name, email, salary and manager_ID for those employees 
whose managers_ID is 120, 103 or 145.
select
first_name, last_name, email, salary, manager_id
from
employees
where manager_id in (120, 103, 145);

Problem Statment - Write a query in SQL to display the first_name and last_name, department_id andsalary from employees Table 
who earn more than 8000 And whose managers_ID is 120, 103 or 145.
select
first_name, last_name, department_id, salary
from
employees
where salary > 	8000 and manager_id in (120,103,145);

Problem Statment - Write a query to display all the locations (id, city) which do not have any state province mentioned.
select * from locations;

select
location_id, city
from
locations 
where state_province is null;

Problem Statment - Write a query to display job_id, job titles, min_salary, max_salary whose maximum salary is greater than 10000.
select * from jobs

select
*
from
jobs 
where  max_salary > 10000;

Problem Statment - Write a query to display department_id,department_name, Manager_id whose manager_id is greater than 200 
and location_id is 2400.
select
department_id, department_name, manager_id
from
departments 
where manager_id > 200 and location_id = 2400;

Problem Statment - Write a query to display the job title whose minimum salary is greater than 8000 and max salary less than 20000
select
job_title
from
jobs 
where min_salary > 8000 and max_salary < 20000;

Problem Statment - Write a query to retrieve all the records of departments with managers for the location id 1700.
select
*
from
departments 
where location_id = 1700 and manager_id is not null;

Problem Statment - List all departments starting with “P” where there are managers.
select 
*
from 
departments
where department_name like 'P%' and manager_id is not null;

Problem Statment - Print a bonafide certificate for an employee (say for emp. id 123) as below:
#"This is to certify that <full name> with employee id <emp. id> is working as <job id> in dept. <dept ID>.
select 
concat('This is to certify that',' ', first_name, ' ', last_name,' ', 'with employee id',' ',  employee_id,' ', 'is working as',' ', job_id,' ', 'in department',' ', department_id) as 'employee certificate'
from 
employees 
where employee_id = 123 ; 

select 
concat("This is to certify that ",first_name," ",last_name," with employee id ",employee_id," working as ",job_id, " in "," dept. ",department_id) as Bonafide_Certificate 
from employees 
where employee_id=123;

Problem Statment - Write a query to display the employee id, salary & salary range of employees as 'Tier1', 'Tier2' or 'Tier3' 
as per the range <5000, 5000-10000, >10000 respectively, ordering the output by those tiers
select
employee_id, first_name, last_name, salary,
case when salary < 5000 then 'Tier 1'
when salary between 5000 and 10000 then 'Tier 2' 
else 'Tier 3'
end as Tier
from
employees 
order by salary;

Problem Statment -  Write a query to display the department-wise and job-id-wise total salaries of employees whose salary is more than 25000.
select 
job_id, department_id, sum(salary) 
from 
employees 
group by department_id, job_id 
having sum(salary)>25000;

Problem Statment - Write a query to display names of employees whose first name as well as last name ends with vowels. (vowels : aeiou )
select
first_name, last_name
from
employees
where 
(first_name like '%a' or first_name like '%e' or first_name like '%i' or first_name like '%o' or first_name like '%u') 
and (last_name like '%a' or  last_name like '%e' or  last_name like '%i' or  last_name like '%o' or  last_name like '%u');

Problem Statment - What is the average salary range (diff. between min & max salary) of all types 'Manager's and 'Clerk's.
select
job_id, job_title, avg(max_salary - min_salary) as diff_salary_range
from
jobs
group by job_id, job_title
having job_title like '%Manager%' or job_title like '%Clerk%'

Problem Statment - Write a query to list the names of all people who report to the same person in department Accounting
select 
avg(max_salary-min_salary) as diff_avg, job_title, 	job_id  
from jobs 
where job_title like '% Manager%' or job_title like '% Clerk%' 
group by job_id, job_title;

Problem Statment -Write a query in SQL to display the first name, last name, department number, and department name for each employee.
select
*
from
departments

select
concat(emp.first_name, ' ', emp.last_name) as employee_name, dep.department_name, dep.manager_id
from
employees as emp left join
departments as dep on emp.department_id = dep.department_id
where dep.department_name = 'Accounting';

select 
concat(first_name,'',last_name) 
from employees e , departments d 
where d.department_id = e.department_id and department_name='Accounting' 
group by e.first_name, e.last_name, e.manager_id ;

select
concat (e.first_name,' ', e.last_name) as employee_name,  d.department_id, d.department_name
from 
employees e left join
departments d on e.department_id = d.department_id

Problem Statment - Write a query in SQL to display the name of the department, average salary and number of employees working in 
that department who got commission.
select
first_name, last_name, commission_pct
from
employees
where commission_pct is not null;

select commission_pct from employees where commission_pct is not null;

select 
avg(e.salary), count(e.employee_id), d.department_name 
from employees e, departments d 
where d.department_id=e.department_id and commission_pct>0 and e.department_id is not null
group by e.department_id ;

Problem Statment - Display the first name where commission percentage is not provided
select
first_name, commission_pct
from
employees
where commission_pct is null;

Problem Statment - Display first_name , commission and where commission is null print 'Its Null' otherwise print 'It’s not null'
select
first_name, commission_pct,
case when commission_pct is null then 'Its null'
else 'Its not null'
end as comission_pct_status
from
employees

Problem Statment - Write a query in SQL to display those employees who contain a letter z to their first name and also display 
their last name, department, city, and state province.
select 
e.first_name, e.last_name, d.department_name, loc.city, loc.state_province
from
employees e left join
departments d on e.department_id = d.department_id left join
locations loc on d.location_id = loc.location_id
where e.first_name like '%z%';

Problem Statment - Write a query in SQL to display the job title, department id, full name (first and last name) of employee, starting date
and end date for all the jobs which started on or after 1st January, 1993 and ending with on or before 31 August, 2000.
select
concat(e.first_name,' ', e.last_name) as full_name, e.department_id, j.job_title, jh.start_date, jh.end_date
from
employees e join
jobs j on e.job_id = j.job_id join
job_history jh on j.job_id = jh.job_id
where jh.start_date >= '1993-01-01' and jh.end_date <='2000-08-31';

select j.job_id,e.department_id, concat(e.first_name,' ',e.last_name) full_name, j.start_date , j.end_date from employees e 
join job_history j on e.employee_id = j.employee_id
where j.start_date >='1993-01-01' and end_date<='2000-08-31';

Problem Statment - Display the employee number, name (first name and last name) and job title for all employees whose salary is smaller than 
the minimum salary of those employees whose job title is Programmer using subquery
select
e.employee_id, concat(e.first_name, ' ', e.last_name) as employee_name, j.job_title, e.salary
from
employees e left join
jobs j on e.job_id = j.job_id
where 
e.salary < (select min_salary from jobs where job_title = 'Programmer') 

Problem Statment - Write a query in SQL to display the country name, city, and number of those departments where at least 2 employees are working.
select 
country_name, city, count(department_id) 
from countries join 
locations using (country_id) join 
departments using (location_id)
where 
department_id in 
(select department_id from employees group by department_id having COUNT(employee_id)>=2)group by country_name,city;

Problem Statment - Write a query to fetch the employee ID, First Name, Last Name, Salary and Department ID of those employees 
who draw a salary more than the average salary of their respective department. 
select 
employee_id, concat(first_name,' ',last_name) Name,salary,department_id 
from employees o
where salary > (select avg(salary) from employees i where o.department_id = i.department_id);

Problem Statment - Write a query in SQL to display the first and last name, salary, and department ID for those employees who earn
less than the average salary, and also work at the department where the employee Laura is working as a first name holder.
select 
first_name, last_name, salary, department_id
from employees 
where salary < (select avg(salary) from employees) and 
department_id like (select department_id from employees where first_name like "Laura");

Problem Statment - Using HR Schema, write a Query to find the maximum salary of the most recent job that every employee holds
select
concat(e.first_name, ' ' , e.last_name) as employee_name, e.employee_id, e.hire_date, j.max_salary
from
employees e left join
jobs j on e.job_id = j.job_id
order by j.max_salary desc;

Problem Statment - Using HR Schema, write a Query to List the old designation and new designation of all the employees 
in the company where old designation is not null. 
select 
distinct e.employee_id,e.first_name,e.last_name,e.job_id as current_job,
j.job_id as old_job,jo.job_title as current
from 
employees as e inner join 
job_history as j 
on e.employee_id=j.employee_id inner join 
jobs as jo on jo.job_id=e.job_id;

                                                          !! THANK YOU !!

