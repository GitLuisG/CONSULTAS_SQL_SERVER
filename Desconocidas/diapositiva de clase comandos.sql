SELECT
e.last_name, d.department_id, d.department_name
FROM employees e
LEFT OUTER JOIN departments d ON (e.department_id = d.department_id);


SELECT e.last_name, d.department_id,d.department_name
FROM employees e
FULL OUTER JOIN departments d ON (e.department_id = d.department_id);


SELECT last_name, e.job_id AS "job", jh.job_id AS "old job", end_date
FROM employees e LEFT OUTER JOIN job_history jh
ON(e.employee_id = jh.employee_id);
