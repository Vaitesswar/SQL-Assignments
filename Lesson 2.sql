use hr;

# Join - Displaying data from multiple tables

# Natural join - no condition (cross-product)
select e.first_name, d.department_name
from employees e, departments d;

# Inner join (Way 1) - displays only matches from both tables which satisfy the condition 
select e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

# Inner join (Way 2) - displays only matches from both tables which satisfy the condition 
select e.first_name, d.department_name
from employees e
inner join
departments d on e.department_id = d.department_id;

# Left outer join (all information from table 1 included regardless of match with table 2)
select e.first_name, d.department_name
from employees e
left outer join
departments d on e.department_id = d.department_id;

# Right outer join (all information from table 2 included regardless of match with table 1)
select e.first_name, d.department_name
from employees e
right outer join
departments d on e.department_id = d.department_id;

# Self join (information from same table)
select concat(e.first_name, ' ', e.last_name) as Employee, concat(m.first_name, ' ', m.last_name) as Manager
from employees e
join
employees m on e.manager_id = m.employee_id;

# Null keyword
select * from employees where manager_id is null;