
SELECT 
         EMPLOYEE_ID
        ,FIRST_NAME
        ,LAST_NAME
        ,TO_CHAR(HIRE_DATE, 'DD/MM/YYYY') HIRE_DATE
        ,TO_CHAR(SALARY, '$999,999,999.99') SALARY
        ,TO_CHAR(SALARY * 12, '$999,999,999.99') ANUAL_SALARY
    FROM EMPLOYEES;
    
/*
 * Username: C##1730000
 * Password: 1730000
 * Hostname: oracleacad.upvictoria.edu.mx
 * Port: 1521
 * Service name: orcl
 *
 */