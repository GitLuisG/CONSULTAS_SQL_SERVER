

SELECT SYSDATE + 1 FROM DUAL;

SELECT
         FIRST_NAME
        ,LAST_NAME
        ,HIRE_DATE
        ,ROUND((SYSDATE - HIRE_DATE) / 365) "ANOS TRABAJANDO"
        ,ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "TOTAL MESES TRABAJADO"
    FROM C##ALUMNO.EMPLOYEES;    
    
SELECT ROUND(SYSDATE, 'MONTH') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 'Miercoles') "NEXT MONDAY" FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') NOW FROM DUAL;
    
    