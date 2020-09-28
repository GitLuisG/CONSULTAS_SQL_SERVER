

SELECT 
        LAST_NAME, 
        FIRST_NAME, 
        TO_CHAR(SALARY, 'L999,999.99') SALARY,
        TO_CHAR(SALARY + (SALARY / 3), '$009,999.99') AUM,
        HIRE_DATE
    FROM EMPLOYEES
    WHERE HIRE_DATE BETWEEN 
        TO_DATE('01/01/2000', 'DD/MM/YYYY') AND 
        TO_DATE('31/12/2000', 'DD/MM/YYYY');

/*
 * 1. Obtenga todos los empleados que hayan sido
 *    contratados en el mes de enero de cualquier año.
 *    columnas: nombre completo (concatenado),
 *    fecha de contratación en formato 0000-00-00,
 *    salario en formato $4,434
 */
SELECT 
         FIRST_NAME || ' ' || LAST_NAME AS NOMBRE_COMPLETO
        ,TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') AS HIRE_DATE
        ,TO_CHAR(SALARY, '$999,999,999') AS SALARY
    FROM EMPLOYEES
    WHERE TO_CHAR(HIRE_DATE, 'MM') = '01'
    --WHERE TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') LIKE '%-01-%'
    ORDER BY LAST_NAME, FIRST_NAME;    
 
 
/*
 * 2. Obtenga todos los Jobs que tengan un salario
 *    mímino mayor a 3,000.
 *    columnas: job_name, min_salary, max_salary
 *    en formato $003,432.00 USD
 */
SELECT 
         JOB_TITLE
        ,'$ ' ||TO_CHAR(MIN_SALARY, '000,000.00') || ' USD' AS MIN_SALARY
        ,TO_CHAR(MAX_SALARY, '$000,000.00') || ' USD' AS MAX_SALARY
    FROM JOBS
    WHERE MIN_SALARY > 3000
    ORDER BY MIN_SALARY DESC;

 
/*
 * 3. Seleccione todos los empleados que tengan
 *    comisión (COMMISSION_PCT).
 *    columnas: nombre completo (concatenado),
 *    el porcentaje de comisión en formato 65%
 */
SELECT
         FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
        ,COMMISSION_PCT * 100 || '%' AS COMMISSION_PCT
    FROM EMPLOYEES
    WHERE COMMISSION_PCT IS NULL
    ORDER BY COMMISSION_PCT, LAST_NAME, FIRST_NAME;    
 
/*
 * 4. Obtenga todos los job_history correspondiente
 *    a los movimientos realizados (start_date) entre 
 *    el año 2000 y 2006.
 *    columnas: todas, start_date y end_date en formato
 *    miércoles 29 de mayo de 2019.
 */
SELECT
         EMPLOYEE_ID
        ,JOB_ID
        ,DEPARTMENT_ID
        ,TO_CHAR(START_DATE, 'DAY DD "de" MONTH "de" YYYY') START_DATE
        ,TO_CHAR(END_DATE, 'DAY DD "de" MONTH "de" YYYY') END_DATE
    FROM JOB_HISTORY
    WHERE 
        START_DATE BETWEEN 
            TO_DATE('1996-01-01', 'YYYY-MM-DD') AND
            TO_DATE('1999-12-31', 'YYYY-MM-DD')
    ORDER BY JOB_HISTORY.START_DATE        ;
 
/*
 * 5. Obtenga todos los empleados que hayan sido 
 *    contratados en año bisiesto. 
 *    columnas: nombre completo (concatenado),
 *    hire_date en formato miercoles 29/mayo/19.
 */
SELECT
         FIRST_NAME || ' ' || LAST_NAME AS "NAME"
        ,TO_CHAR(HIRE_DATE, 'DD/MONTH/YYYY') HIRE_D
    FROM EMPLOYEES    
    WHERE 
        (MOD(TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')), 4) = 0 AND
        MOD(TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')), 100) <> 0)  --  !=
        OR MOD(TO_CHAR(HIRE_DATE, 'YYYY'), 400) = 0;





