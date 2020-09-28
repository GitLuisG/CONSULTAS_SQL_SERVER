-- 1
SELECT DEPARTMENT_NAME 
    FROM
        (SELECT
                DEPARTMENT_NAME
                ,(SELECT COUNT(*) 
                    FROM EMPLOYEES E 
                    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID)
                 CANT_EMPLOYEES
            FROM DEPARTMENTS D) SUB1
    WHERE CANT_EMPLOYEES = 0;
    
-- 2
SELECT DEPARTMENT_NAME
    FROM
        (SELECT
                 DEPARTMENT_NAME
                ,(SELECT COUNT(*) 
                    FROM EMPLOYEES E 
                    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID)
                 CANT_EMPLOYEES
                ,(SELECT COUNT(*) 
                    FROM EMPLOYEES E 
                    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
                        AND E.COMMISSION_PCT IS NULL)
                 CANT_EMPLOYEES_NO_COMMISSION_PCT    
            FROM DEPARTMENTS D) SUB1
    WHERE CANT_EMPLOYEES > 0 AND CANT_EMPLOYEES = CANT_EMPLOYEES_NO_COMMISSION_PCT;        

-- 3
SELECT C.COUNTRY_NAME 
    FROM
        DEPARTMENTS D INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
        INNER JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
    WHERE D.DEPARTMENT_ID = 
        (SELECT DEPARTMENT_ID 
            FROM EMPLOYEES 
            WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES));
            
-- 4
SELECT * 
    FROM
        (SELECT 
                 D.DEPARTMENT_NAME
                ,D.MANAGER_ID
                ,E.LAST_NAME
                ,E.FIRST_NAME
                ,(SELECT COUNT(*) FROM EMPLOYEES E WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID)
                 CANT_EMPLOYEES    
            FROM    
                DEPARTMENTS D INNER JOIN EMPLOYEES E 
                    ON D.MANAGER_ID = E.EMPLOYEE_ID) SUB1
    WHERE 
        CANT_EMPLOYEES =         
            (SELECT MAX(CANT_EMPLOYEES) 
                FROM 
                    (SELECT DEPARTMENT_ID, COUNT(*) CANT_EMPLOYEES 
                        FROM EMPLOYEES GROUP BY DEPARTMENT_ID));
            
            