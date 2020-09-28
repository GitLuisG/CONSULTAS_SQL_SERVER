-- 1 Obtenga los departamentos que no tengan empleados asignados. (NO REPETIR REGISTROS) --
-- Columnas: DEPARTMENT_NAME --

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
    
-- 2 Obtenga los departments en los cuales todos sus empleados no tengan COMMISSION_PCT. (NO REPETIR REGISTROS)
-- Columnas: DEPARTMENT_NAME

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

-- 3 Obtenga el COUNTRY_NAME del Department donde se encuentra el empleado que mas gana (mayor SALARY).
-- Columnas: COUNTRY_NAME

SELECT C.COUNTRY_NAME 
    FROM
        DEPARTMENTS D INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
        INNER JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
    WHERE D.DEPARTMENT_ID = 
        (SELECT DEPARTMENT_ID 
            FROM EMPLOYEES 
            WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES));
            
-- 4 Obtenga el Employee que es el manager del department que mas empleados tienen asignados
--Columnas: LAST_NAME, FIRST_NAME 

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


-- 5 Obtenga el Department que tiene mayor cantidad de JOB_TITLES.
-- Columnas: DEPARTMENT_NAME, STREET_ADDRESS, COUNTRY_NAME, REGION_NAME.

SELECT *
    FROM
        (SELECT 
                 DEPARTMENT_NAME
                ,STREET_ADDRESS
                ,COUNTRY_NAME
                ,REGION_NAME
                ,(SELECT COUNT(DISTINCT JOB_ID) 
                    FROM EMPLOYEES E 
                    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID)
                 CANT_JOB_TITLE    
            FROM
                DEPARTMENTS D INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
                INNER JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
                INNER JOIN REGIONS R ON C.REGION_ID = R.REGION_ID) SUB1
    WHERE CANT_JOB_TITLE =
        (SELECT MAX(CANT_JOB_TITLE) 
            FROM
                (SELECT 
                        DEPARTMENT_NAME
                        ,(SELECT COUNT(DISTINCT JOB_ID) 
                            FROM EMPLOYEES E 
                            WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID)
                         CANT_JOB_TITLE
                    FROM DEPARTMENTS D) SUB2);

            
            