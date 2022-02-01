--CRIANDO USUARIO
alter session set "_oracle_script"=true;
CREATE USER teste_homologacao IDENTIFIED BY homo123 DEFAULT TABLESPACE users;

--Criando permissao/privilegios simples ao usuario
GRANT CREATE SESSION TO teste_homologacao;

--Criando permissao /privilegios
GRANT CONNECT, RESOURCE TO teste_homologacao;

--Removendo/Revogando as permissoes/privilegiosdo usuario
REVOKE CONNECT, RESOURCE FROM teste_homologacao;

--Dropando usuario
DROP USER homologacao CASCADE;