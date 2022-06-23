show databases;
use hr;

# Practice Questions

# Display each employee name with location
select employees.first_name,locations.city
from employees,departments,locations
where (employees.department_id = departments.department_id) and (locations.location_id = departments.location_id);

# Display employees who joined in June of all years.
select first_name, hire_date, date_format(hire_date,'%M')
from employees
where date_format(hire_date,'%M') like 'June'
order by hire_date;

# Display employees who joined in year 2000
select first_name, hire_date, date_format(hire_date,'%M')
from employees
where date_format(hire_date,'%Y') like '2000'
order by hire_date;

# Display number of hiring per year
select date_format(hire_date,'%Y'),count(*)
from employees
group by YEAR(employees.hire_date);

# Display in which month maximum hiring happened
select total.mon, max(total.num) # total.mon extracts first element which is also the month with maximum employees (due to ordering)
	from (select date_format(hire_date,'%M') as mon, count(*) as num
		from employees
		group by MONTH(employees.hire_date)
		order by count(*) DESC) total;
        
# Display in which month maximum hiring happened in department 60
select total.mon, max(total.num)
from (select date_format(hire_date,'%M') as mon, count(*) as num
		from employees
        where employees.department_id = 60
		group by MONTH(employees.hire_date)
		order by count(*) DESC) total;
        
# Display highest paid employee information in each department.
select * from employees
inner join
(select employees.department_id as dpt, max(employees.salary) as sal
from employees
group by employees.department_id
order by employees.department_id) A ON A.dpt = employees.department_id and A.sal = employees.salary;

select * from employees
where department_id in (60, 80);
