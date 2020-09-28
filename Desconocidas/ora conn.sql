/*
 == Dise�o de bases de datos ==
 == Recuperacion unidad 3    ==
 */
/*
 1. Obtenga el Department (o departments) que tengan la mayor cantidad de Job_Title o los Department 
 que tenga la menor cantidad de empleados.
 Columnas: DEPARTMENT_NAME, STREET_ADDRESS, COUNTRY_NAME, REGION_NAME, MANAGER:
 (FIRST_NAME as MANAGER_FIRST_NAME, LAST_NAME as MANAGER_LAST_NAME y JOB_TITLE
 as MANAGER_JOB_TITLE), CAN_JOB_TITLE, CANT_EMPLOYEES.
 */
SELECT
    *
FROM
    (
        SELECT
            D.DEPARTMENT_NAME,
            D.MANAGER_ID,
            E.LAST_NAME AS MANAGER_LAST_NAME,
            E.FIRST_NAME AS MANAGER_FIRST_NAME,
            J.JOB_TITLE AS MANAGER_JOB_TITLE,
            (
                SELECT
                    COUNT(*)
                FROM
                    EMPLOYEES E
                WHERE
                    E.DEPARTMENT_ID = D.DEPARTMENT_ID
            ) CANT_EMPLOYEES
        FROM
            DEPARTMENTS D
            INNER JOIN EMPLOYEES E ON D.MANAGER_ID = E.EMPLOYEE_ID
            INNER JOIN JOBS J ON E.JOB_ID = J.JOB_ID
    ),
    (
        SELECT
            DEPARTMENT_NAME,
            STREET_ADDRESS,
            COUNTRY_NAME,
            REGION_NAME,
            (
                SELECT
                    COUNT(DISTINCT JOB_ID)
                FROM
                    EMPLOYEES E
                WHERE
                    E.DEPARTMENT_ID = D.DEPARTMENT_ID
            ) CANT_JOB_TITLE
        FROM
            DEPARTMENTS D
            INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
            INNER JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
            INNER JOIN REGIONS R ON C.REGION_ID = R.REGION_ID
    ) SUB1
WHERE
    CANT_JOB_TITLE = (
        SELECT
            MAX(CANT_JOB_TITLE)
        FROM
            (
                SELECT
                    DEPARTMENT_NAME,
                    (
                        SELECT
                            COUNT(DISTINCT JOB_ID)
                        FROM
                            EMPLOYEES E
                        WHERE
                            E.DEPARTMENT_ID = D.DEPARTMENT_ID
                    ) CANT_JOB_TITLE
                FROM
                    DEPARTMENTS D
            )
    )
    AND CANT_EMPLOYEES = (
        SELECT
            MIN(CANT_EMPLOYEES)
        FROM
            (
                SELECT
                    DEPARTMENT_ID,
                    COUNT(*) CANT_EMPLOYEES
                FROM
                    EMPLOYEES
                GROUP BY
                    DEPARTMENT_ID
            )
    );