SELECT
 LAST_NAME,
 FIRST_NAME,
 HIRE_DATE,
 TO_CHAR(SALARY, 'L999,999.99') SALARY,
 TO_CHAR(SALARY + (SALARY / 3), '$009,999.99') AUM
 
 FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN
 TO_DATE('01/01/2000', 'DD/MM/YYYY') AND
 TO_DATE('31/12/2000', 'DD/MM/YYYY');
 

 /*
1; ontenga todods los empleados que hayan 
sido contratados el primero de cualquier año
columnas: nombre completo(concatando),  fecha de contatacion en formto AAAA-MM-DD
salario en formato $4,434
*/
SELECT FIRST_NAME ||' '|| LAST_NAME , HIRE_DATE, TO_CHAR(SALARY, '$99,999') SALARY
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'MM') = 01;
/*
2; obtener todos los jobs que tengan un salario minimo mayor a 3,000
columnas: job_name, min_salary, max_salary
en formato $003,432.00
*/
SELECT * FROM JOBS WHERE MIN_SALARY > 3000;
/*
3; seleccione todos los empleados y que tengan comosion (COMMISSION_PCT) Y MUESTRE 
COMULANAS: nombre completo (cocatenado),
el procentaje de comision FORMATO 65%
*/
SELECT  FIRST_NAME || ' ' || LAST_NAME AS NOMBRE,SALARY, COMMISSION_PCT * 100 || '%' as ptc
    FROM EMPLOYEES
    WHERE COMMISSION_PCT IS NOT NULL
    ORDER BY SALARY,COMMISSION_PCT;
/*
4; OBTENR TODOS LOS JOB-HISTORY CORRESPONDENTES
A LOS MOVIMIENTOS REALIADOS (star_date) ente el ano 2000 y 2006.
columnas todas, star_date y end_date en formato 
miercoles 29 de mayo de 2019
*/
select JOB_ID, DEPARTMENT_ID, TO_CHAR(START_DATE, 'DAY DD  ,MONTH YYYY'),TO_CHAR(END_DATE, 'DAY DD  ,MONTH YYYY')
FROM JOB_HISTORY
WHERE START_DATE > '01-JAN-2000' AND START_DATE < '01-JAN-2006';

/*
5; obtenga todos los empleados que hayan sido contaratdos en ano bisiesto
columnas: nombre complet(c0ncatando)
hire_date en formatoo miercoles 29/mayo/19
*/
SELECT FIRST_NAME || ' ' || LAST_NAME AS NOMBRE, TO_CHAR(HIRE_DATE, 'DD /MONTH /YY') 
    FROM EMPLOYEES;
