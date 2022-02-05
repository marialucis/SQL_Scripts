ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

--criando usuario
CREATE USER dml IDENTIFIED BY dml DEFAULT TABLESPACE users;

--aplicando permissoes ao usuario
GRANT ALL PRIVILEGES TO dml;