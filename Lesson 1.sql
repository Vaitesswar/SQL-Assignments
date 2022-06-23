show databases;
use hr;
show tables;
select * from employees where first_name = 'Nancy';
select * from employees where first_name like 'N%';
select * from employees where department_id = 90;
select * from employees where department_id = 60 order by employee_id desc;
describe employees;

# 'and' operator
select * from employees where department_id = 30 and first_name like 'N%';

# 'or' operator
select * from employees where department_id = 30 or first_name like 'N%';

# '=' only for 1 query at a time (sub-query)
select * from employees where department_id = ( select department_id from employees where first_name = 'Bruce');

# in  operator is for all options (sub-query)
select * from employees where department_id in ( select department_id from employees where first_name = 'Bruce');

# Join -> displaying data from multiple tables
select employees.first_name, departments.department_name 
from employees,departments 
where employees.department_id = departments.department_id;

select e.first_name, d.department_name 
from employees e,departments d
where e.department_id = d.department_id;

# Aggregate data (count, sum, avg, max, min)
select department_id, count(*) Counting
from employees 
where department_id in (50,80)
group by department_id
having Counting >5 # where - one condition / having - aggregate conditions
order by Counting;

# Practice Questions

# Display each employee name with location
select employees.first_name,departments.location_id
from employees,departments
where employees.department_id = departments.department_id;

# Display employee information who joined from 1994 to 2004
select first_name,hire_date
from employees
where hire_date between "1994-01-01" and "2004-12-31";

# Display maximum salary department wise
select department_id, max(employees.salary)
from employees
group by department_id;

# Display employees who joined before Bruce
select first_name,hire_date
from employees
where hire_date <= (select hire_date from employees where first_name = 'Bruce')
order by hire_date;

# Display employees who joine from Jan 1994 to December 2004.
select first_name,hire_date
from employees
where hire_date between "1994-01-01" and "2004-12-31"
order by hire_date;