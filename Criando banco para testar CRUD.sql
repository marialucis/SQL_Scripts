/*criando o banco de dados Cadastro*/
CREATE DATABASE cadastro;

/*informando que vamos utilizar o banco*/
USE cadastro;

/*verificando se o banco de fato foi cadastrado*/
SHOW DATABASES;

/*criando a tabela chamada pessoas para guardar informações de clientes*/
CREATE TABLE pessoas
( nome VARCHAR(100),
cpf CHAR(11),
rg CHAR(9)
);

/*adicionando uma nova coluna chamada limite na tabela pessoas*/
ALTER TABLE pessoas ADD COLUMN limite INT(10);
/*verificando a tabela no banco*/
SHOW TABLES;

/*inserindo os dados de clientes na tabela pessoas*/
INSERT INTO pessoas(nome, cpf,rg) VALUES ("Maria Luci da Costa Sousa","88955566681","3355333");
INSERT INTO pessoas(nome, cpf, rg) VALUES ("Teste sistema 1","88755633218","98356988");
INSERT INTO pessoas(nome, cpf, rg) VALUES ("Heitor de Sousa Lemos","89633266548","1056988");
INSERT INTO pessoas(nome, cpf, rg) VALUES ("Melinda de Sousa Lemos","77844633541","5238197");
INSERT INTO pessoas(nome, cpf, rg) VALUES ("Empresa Lux Teste","11942482418","98684436");


/*consultando as informações da tabela pessoas*/
SELECT * FROM pessoas;

/*ESTUDO COM CRUD*/
/*realizando consulta otimizada no banco*/
SELECT nome, rg FROM pessoas;
/*inserindo novos registros a tabela pessoas*/
INSERT INTO pessoas(nome, cpf, rg,limite) VALUES ("Luci teste","1194248286","87565398",2);

/*atualizando registro da tabela
usar o SQL_SAFE_UPDATES=0 quando não existir coluna de identificacao*/
SET SQL_SAFE_UPDATES = 0;
UPDATE pessoas SET limite= 10000 WHERE nome like '%Melinda%';

/*Deletando registro da tabela*/
DELETE FROM pessoas Where limite > 2000;




