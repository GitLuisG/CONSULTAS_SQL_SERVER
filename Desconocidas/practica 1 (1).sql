SELECT * FROM employees
WHERE hire_date between '01-01-2001' AND '31-12-2001' 
OR hire_date between '01-01-2003' AND '31-12-2003' 
OR hire_date between '01-03-2004' AND '31-03-2004';

--2.-
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary >2000 AND department_id != 100;

--3.-
SELECT manager_id,location_id,department_name
FROM DEPARTMENTS
WHERE manager_id IS NULL AND (location_id IN (1,2,3) OR department_name LIKE '%o');


--4.-
SELECT first_name, last_name , commission_pct, salary
FROM employees
WHERE (commission_pct IS NOT NULL) OR (salary BETWEEN 2000 AND 3000);

--5.-

SELECT first_name, last_name, salary*1.20+100
FROM employees;