SELECT 
        D.DEPARTMENT_ID
        ,D.DEPARTMENT_NAME
        ,(SELECT COUNT(*)
             FROM EMPLOYEES E
             WHERE DEPARTMENT_ID = D.DEPARTMENT_ID) CANT_EMPLOYEES
             ,(SELECT NVL(SUM(SALARY) ,0)
             FROM EMPLOYEES E
             WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID) SALARY_PA
    FROM DEPARTMENTS D;
    
--..............................................................................


SELECT 
          L.LOCATION_ID
          ,L.CITY
          ,L.STREET_ADDRESS
          ,(SELECT COUNT(*)
             FROM DEPARTMENTS D
             WHERE D.LOCATION_ID = L.LOCATION_ID) CANT_DEPS
             ,(SELECT COUNT(*)
             FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
             WHERE D.LOCATION_ID = L.LOCATION_ID) CANT_EMPLOYEES
    FROM LOCATIONS L;
    
--..............................................................................
    

--CANTIDAD DE EMPLEADOS DE CIERTO LOCATION
SELECT   COUNT(*) CANT_EMPLEADOS
         FROM EMPLOYEES E JOIN DEPARTMENTS D 
         ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
         WHERE D.LOCATION_ID = 1400;
         