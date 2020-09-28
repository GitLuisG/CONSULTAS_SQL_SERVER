/*
 *                      == Diseño de Base de Datos ==
 *                      ==    Examen Unidad 4      ==
 */
 
/*
   1. Escriba la sentencia SQL para crear una tabla que se llame "EXU4_ALUMNOS" que tenga las 
      siguientes columnas: 
      ID (numerico de 6 digitos, no null y PK), NOMBRE (varchar2 de 64 caracteres, no null),
      APELLIDO_PATERNO (varchar2 de 64 caracteres, no null), APELLIDO_MATERNO (varchar2 de 64
      caracteres, null), FECHA_NACIMIENTO (datet, no null), CURP (char de 28 caracteres, no null),
      MATRICULA (numerico de 9 digitos, no null), MUNICIPIO_ID (numérico de 5 digitos, null).
      Al momento de crear la tabla crear una restricción de llave foranea para el campo de 
      MUNICIPIO_ID, con la tabla MUNICIPIOS en el campo ID.
 */
-- TODO: SENTENCIA SQL.
CREATE TABLE MUNICIPIOS (
     ID NUMBER(4) CONSTRAINT MUNICIPIOS_PK PRIMARY KEY
    ,CLAVE NUMBER(3) NOT NULL
    ,NOMBRE VARCHAR2(256) NOT NULL
    ,SIGLA VARCHAR2(8) NOT NULL
 );  
CREATE TABLE EXU4_ALUMNOS(
     ID NUMBER(6) 
    ,NOMBRE VARCHAR2(64) NOT NULL
    ,APELLIDO_PATERNO VARCHAR2(64) NOT NULL
    ,APELLIDO_MATERNO VARCHAR2(64) NOT NULL
    ,FECHA_NACIMIENTO DATE NOT NULL
    ,CURP CHAR(28) NOT NULL
    ,MATRICULA NUMBER(9) NOT NULL
    ,MUNICIPIO_ID NUMBER(5) NULL
    ,CONSTRAINT EXU4_ALUMNOS_PK PRIMARY KEY (ID)
    ,CONSTRAINT EXU4_ALUMNOS_MUNICIPIO_FK FOREIGN KEY (MUNICIPIO_ID) REFERENCES MUNICIPIOS 
    );

 
/*
   2. Escriba la sentencia SQL para crear una secuencia para el ID de la tabla ALUMNOS, la cual 
      va a empezar en el número 1000 y va a ir aumentando en 10. 
 */
-- TODO: SENTENCIA SQL.
 CREATE SEQUENCE EXU4_SEQUENCE_ID
    INCREMENT BY 10
    START WITH 1000;
    COMMIT;
 
/*
   3. Escriba la sentencia SQL para poder agregar una restricción de tipo "unique" para el campo
      MATRICULA de la tabla EXU4_ALUMNOS.
 */
-- TODO: SENTENCIA SQL.
ALTER TABLE EXU4_ALUMNOS
ADD CONSTRAINT U_EXU4_ALUMNOS
UNIQUE (MATRICULA);

  
/*
   4. Escriba la sentencia SQL para crear una tabla que se llame "CARRERAS", que tenga las
      siguientes columnas:
      ID (char de 5 caracteres, PK), ABREVIATURA (varchar2 de 8 caracteres, no null), NOMBRE
      (varchar2 de 64 caracteres, no null). Tambien en la consulta de creación de la tabla,
      agregar una restricción "unique" en la columna ABREVIATURA.
 */
-- TODO: SENTENCIA SQL.


CREATE TABLE CARRERAS(
     ID NUMBER(5) CONSTRAINT CARRERAS_PK PRIMARY KEY 
    ,ABREVIATURA VARCHAR2(8) NOT NULL
    ,NOMBRE VARCHAR2(64) NOT NULL
    ,APELLIDO_PATERNO VARCHAR2(64) NOT NULL
    ,APELLIDO_MATERNO VARCHAR2(64) NOT NULL
,UNIQUE (ABREVIATURA)
    );

   
/*
   5. Escriba la sentencia SQL para modificiar la tabla EXU4_ALUMNOS para agregar una columna
      que se llame CARRERA_ID que sea null; y la sentencia SQL para agregar una restricción de
      llave foranea de esta campo con la tabla de CERRERAS. 
 */  
-- TODO: SENTENCIAS SQL.
ALTER TABLE EXU4_ALUMNOS 
 ADD (CARRERA_ID CHAR(5) DEFAULT NULL);
/*
   6. Escriba la sentencia SQL para crear una vista que se llame EXU4_ALUMNOS_VIEW, la cual sea la
      union de las tablas EXU4_ALUMNOS, MUNICIPIOS y CARRERAS.
 */   
-- TODO: SENTENCIA SQL. 
 CREATE OR REPLACE VIEW EXU4_ALUMNOS_VIEW AS
SELECT
         DEPARTMENT_ID
        ,DEPARTMENT_NAME
        ,(SELECT COUNT(0) 
            FROM EMPLOYEES E 
            WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID)
         CANT_EMPLOYEES    
        ,CITY
        ,STATE_PROVINCE
        ,COUNTRY_NAME
        ,REGION_NAME
        ,MANAGER_ID
    FROM
        DEPARTMENTS D INNER JOIN LOCATIONS L
            ON D.LOCATION_ID = L.LOCATION_ID
        INNER JOIN COUNTRIES C
            ON L.COUNTRY_ID = C.COUNTRY_ID
        INNER JOIN REGIONS R
            ON C.REGION_ID = R.REGION_ID
    ORDER BY DEPARTMENT_NAME;        
    
 
/*
   7. Escriba la sentencia SQL para crear un índice para la tabla EXU4_ALUMNOS en la columna
      CARRERA_ID.
 */   
  CREATE UNIQUE INDEX INDICE_ALUMNOS
  ON EXU4_ALUMNOS(CARRERA_ID);
/*
   8. Escriba las sentencias SQL para borrar todos los objetos creados en esta práctica.
 */
-- TODO: SENTENCIAS SQL.
   DROP TABLE EXU4_ALUMNOS;
   DROP TABLE MUNICIPIOS;
   DROP TABLE CARRERAS;
   
   DROP SEQUENCE EXU4_SEQUENCE_ID;
   DROP INDEX INDICE_ALUMNOS;