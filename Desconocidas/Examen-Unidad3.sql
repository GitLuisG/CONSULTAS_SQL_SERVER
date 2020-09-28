--1. Obtenga los departments que NO tienen empleados asignados 
--Columnas: DEPARTMENT_NAME
SELECT
        DISTINCT D.DEPARTMENT_NAME
FROM
        DEPARTMENTS D
WHERE
        (
                SELECT
                        COUNT(*)
                FROM
                        EMPLOYEES E
                WHERE
                        E.DEPARTMENT_ID = D.DEPARTMENT_ID
        ) = 0;

--2. Obtenga los departments en los cuales todos sus empleados no tengan COMISSION_PCT
--Columnas: DEPARTMENT_NAME
SELECT
        DISTINCT D.DEPARTMENT_NAME
FROM
        DEPARTMENTS D
        JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE
        E.COMMISSION_PCT IS NULL;

--3. Obtenga el COUNTRY_NAME del department donde se encuentra el empleado que mas gana (mayor salary)
--COLUMNAS: COUNTRY_NAME
SELECT
        COUNTRY_NAME
FROM
        COUNTRIES C
        JOIN LOCATIONS L ON C.COUNTRY_ID = L.COUNTRY_ID
        JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID
        JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE
        SALARY = (
                SELECT
                        MAX(SALARY)
                FROM
                        EMPLOYEES
        );

--4.Obtenga el Employee que es el manager del departamento que mas empleados tiene asignados.
--Columnas: LAST_NAME, FIRST_NAME
SELECT
        LAST_NAME,
        FIRST_NAME
FROM
        EMPLOYEES E;
