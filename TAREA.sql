-- En una consulta obtener todas las regiones y cuantos departamentos
-- hay en cada region.
-- Columnas: region_name, cant_departments

SELECT *
    FROM
    (SELECT 
        R.REGION_NAME
,(SELECT COUNT(*)
                    FROM 
                        DEPARTMENTS P 
                        JOIN LOCATIONS N ON P.LOCATION_ID = N.LOCATION_ID
                        JOIN COUNTRIES S ON N.COUNTRY_ID = S.COUNTRY_ID
                    WHERE S.REGION_ID = R.REGION_ID)
                    CANT_DEPARTMENTS    
            FROM REGIONS R);
-- Obtener todos los paises y cuántos departments hay en cada país,
-- además de saber cuanto se paga de salarios en cada pais.
-- country_name, cant_depts, total_salary 
SELECT *
    FROM
        (SELECT 
                 C.COUNTRY_NAME
                ,(SELECT COUNT(*)
                    FROM 
                        DEPARTMENTS P
                        JOIN EMPLOYEES N ON P.DEPARTMENT_ID = N.DEPARTMENT_ID
                        JOIN LOCATIONS L ON P.LOCATION_ID = L.LOCATION_ID
                    WHERE L.COUNTRY_ID = C.COUNTRY_ID)
                 CANT_DEPARTMENTS
                 ,(SELECT NVL(SUM(SALARY), 0)
                        FROM EMPLOYEES N
                        JOIN  DEPARTMENTS P ON P.DEPARTMENT_ID = N.DEPARTMENT_ID
                        JOIN LOCATIONS L ON P.LOCATION_ID = L.LOCATION_ID
                        WHERE L.COUNTRY_ID = C.COUNTRY_ID)SALARIO_TOTAL
            FROM COUNTRIES C);


