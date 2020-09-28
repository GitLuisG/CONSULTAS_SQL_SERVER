
SELECT 
         LAST_NAME
        ,FIRST_NAME
        ,COMMISSION_PCT
        ,NVL2(COMMISSION_PCT, 'EMP POR COMISIÓN', 'EMP POR SALARIO') AS PCT_IS_NULL
        ,NVL(COMMISSION_PCT, 0) * 100 || '%' AS "COMMISSION IN %"
    FROM EMPLoYEES
    ORDER BY LAST_NAME, FIRST_NAME;
    

SELECT
         LAST_NAME
        ,FIRST_NAME
        ,CASE DEPARTMENT_ID
            WHEN 90 THEN 'Managment'
            WHEN 80 THEN 'Sales'
            WHEN 60 THEN 'IT'
            ELSE 'Other Department'
         END AS "DEPARMENT_NAME"    
    FROM EMPLOYEES
    ORDER BY LAST_NAME, FIRST_NAME;
    
-- DECODE es una función propia de ORACLE!
SELECT
         LAST_NAME
        ,FIRST_NAME
        ,DECODE(DEPARTMENT_ID,
         90, 'Management',
         80, 'Sales',
         60, 'IT',
         'Other Dept.') "DEPARMENT_NAME"    
    FROM EMPLOYEES
    ORDER BY LAST_NAME, FIRST_NAME;