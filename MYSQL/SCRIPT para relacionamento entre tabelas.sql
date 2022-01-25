/*RELACIONAMENTO ENTRE TABELAS, ONE TO ONE, ONE TO MANY, MANY TO MANY*/
CREATE DATABASE relacoes; /*CRIANDO O BANCO DE DADOS PARA TRABALHARMOS COM CONSULTAS REFERENTE AOS RELACIONAMENTO ENTRE TABELAS*/

/*INFORMANDO AO MYSQL QUE VAMOS UTILIZAR ESSE BANCO*/
USE relacoes;

/*CRIANDO AS TABELAS(ESTUDANTES E CONTATOS) PARA TRABALHAR COM O TIPO DE RELACIONAMENTOS ONE TO ONE-UM PARA UM*/
CREATE TABLE estudantes(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- CHAVE PRIMARIA DA TABELA ESTUDANTES
nome VARCHAR(100),
turma VARCHAR(5)
);

CREATE TABLE contatos(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL , -- ID É A CHAVE PRIMARIA DA TABELA CONTATOS
telefone VARCHAR(20),
estudante_id INT ,
FOREIGN KEY (estudante_id) REFERENCES estudantes(id) -- ESTUDANTES_ID É CHAVE ESTRANGEIRA REFERENCIANDO AO ID DA TABELA ESTUDANTES*/
);

/*CONSULTANDO A TABELA*/
SELECT * FROM estudantes;
SELECT * FROM contatos;

/*INSERINDO OS DADOS NAS TABELAS*/
INSERT INTO estudantes(nome, turma) VALUES("Luci", "578b");
INSERT INTO estudantes(nome, turma) VALUES("Hector", "583f");

INSERT INTO contatos(telefone, estudante_id) VALUES("(83) 99147-0223", 1);
INSERT INTO contatos(telefone, estudante_id) VALUES("(89) 99274-0263", 2);

/*USANDO O JOIN PARA TRAZER OS REGISTROS DAS TABELAS DE ACORDO COM O ID
USANDO O TIPO DE RELACINAMENTO ONE TO ONE(UM PARA UM)*/
SELECT estudantes.nome, estudantes.turma, contatos.telefone
FROM estudantes
JOIN contatos ON contatos.estudante_id= estudantes.id;

/*OUTRA FORMA DE TRAZER REGISTROS ENTRE TABELAS(ONE TO ONE) USANDO ID REFERENTE A FOREIGN KEY(CHAVE ESTRANGEIRA)
OU SEJA, OUTRO TIPO DE JOIN*/
SELECT estudantes.nome, estudantes.turma, contatos.telefone
FROM estudantes, contatos
WHERE estudantes.id = contatos.estudante_id;


/*CRIANDO AS TABELAS(CLIENTES E PEDIDO) PARA TRABALHARMOS COM O TIPO DE RELACIONAMENTO ONE TO MANY
(UM PARA MUITOS) */
CREATE TABLE clientes
(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- ID É A CHAVE PRIMARIA DA TABELA CLIENTES E NÃO PODE SER NULO
nome VARCHAR(100),
data_nascimento DATE
);

CREATE TABLE pedidos
( id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- ID É A CHAVE PRIMARIA DA TABELA PEDIDOS E NÃO PODE SER NULO
  qtd_itens INT(10),
  total FLOAT,
  cliente_id INT NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id) -- CLIENTE_ID É A CHAVE ESTRANGEIRA QUE FAZ REFERENCIA A TABELA CLIENTES
);

/*CONSULTANDO AS TABELAS CRIADAS*/
SELECT * FROM clientes;
SELECT * FROM pedidos;

/*INSERINDO REGISTROS NAS TABELAS CLIENTES E PEDIDOS*/
INSERT INTO clientes(nome, data_nascimento) VALUES("Luci Sousa", "1998-04-05");
INSERT INTO clientes(nome, data_nascimento) VALUES("Joao Pedro", "1988-08-06");

INSERT INTO pedidos(qtd_itens, total, cliente_id) VALUES(5,200,1);
INSERT INTO pedidos(qtd_itens, total, cliente_id) VALUES(2,150.5,1);
INSERT INTO pedidos(qtd_itens, total, cliente_id) VALUES(9,355.8,1);
INSERT INTO pedidos(qtd_itens, total, cliente_id) VALUES(2,220,2);
INSERT INTO pedidos(qtd_itens, total, cliente_id) VALUES(1,80,2);

/*UTILIZANDO O JOIN PARA TRAZER OS REGISTROS ENTRE AS TABELAS UTILIZANDO A CHAVE ESTRANGEIRA/FOREIGN KEY ID 
ENTRE AS DUAS TABELAS*/
SELECT clientes.id AS 'id Cliente', clientes.nome AS 'Nome Cliente', pedidos.qtd_itens AS 'Quantidade de Itens do pedido', pedidos.total AS 'Total do Pedido', pedidos.cliente_id 
FROM clientes
JOIN pedidos ON pedidos.cliente_id = clientes.id
WHERE clientes.id = 1;

/*OUTRA FORMA DE UTILIZAR O JOIN ENTRE TABELAS*/
SELECT clientes.id AS 'id Cliente', clientes.nome AS 'Nome do cliente', pedidos.qtd_itens AS 'Quantidade de Itens do pedido', pedidos.total AS 'Total do Pedido', pedidos.cliente_id
FROM clientes, pedidos 
WHERE clientes.id = pedidos.cliente_id
AND clientes.id= 1;



/*CRIANDO TABELA MATERIA E ESTUDANTE_MATERIA(TABELA PIVO) PARA TRABALHAR COM O TIPO DE RELACIONAMENTO MANY TO MANY-MUITOS PARA MUITOS*/
CREATE TABLE materia
(id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- ID É A CHAVE PRIMARIA DA TABELA MATERIA E NÃO PODE SER NULO
nome VARCHAR(100)
);

CREATE TABLE estudante_materia
( estudante_id INT NOT NULL,
 materia_id INT NOT NULL,
 FOREIGN KEY(estudante_id) REFERENCES estudantes(id), -- ESTUDANTE_ID É A CHAVE ESTRANGEIRA FAZENDO REFERENCIA A TABELA ESTUDANTES
 FOREIGN KEY(materia_id) REFERENCES materia(id) -- MATERIA_ID É A CHAVE ESTRANGEIRA FAZENDO REFERENCIA A TABELA MATERIA
);

/*CONSULTANDO AS TABELAS MATERIA E ESTUDANTE_MATERIA*/
SELECT * FROM materia;
SELECT * FROM estudantes;
SELECT * FROM estudante_materia;

/*INSERINDO REGISTROS NAS TABELAS MATERIA, ESTUDANTE_MATERIA E ESTUDANTES*/
-- TABELA MATERIA
INSERT INTO materia(nome) VALUES("Quimica");
INSERT INTO materia(nome) VALUES("Matematica");
INSERT INTO materia(nome) VALUES("Fisica");
INSERT INTO materia(nome) VALUES("Biologia");

-- TABELA ESTUDANTES
INSERT INTO estudantes(nome, turma) VALUES("Maria", "578b");
INSERT INTO estudantes(nome, turma) VALUES("Lucas", "583f");

-- TABELA ESTUDANTE_MATERIA
INSERT INTO estudante_materia(estudante_id, materia_id) VALUES(1,1);
INSERT INTO estudante_materia(estudante_id, materia_id) VALUES(1,2);
INSERT INTO estudante_materia(estudante_id, materia_id) VALUES(1,3);
INSERT INTO estudante_materia(estudante_id, materia_id) VALUES(1,4);
INSERT INTO estudante_materia(estudante_id, materia_id) VALUES(2,1);
INSERT INTO estudante_materia(estudante_id, materia_id) VALUES(2,4);
INSERT INTO estudante_materia(estudante_id, materia_id) VALUES(3,1);
INSERT INTO estudante_materia(estudante_id, materia_id) VALUES(4,4);

/*USANDO O JOIN PARA TRAZER REGISTROS ENTRE AS TABELAS USANDO O TIPO DE RELACIONAMENTO ENTRE TABELAS MANY TO MANY*/
SELECT * FROM estudantes
JOIN estudante_materia ON estudante_materia.estudante_id = estudantes.id 
AND estudante_materia.estudante_id = 1;


/*OUTRA FORMA DE UTILIZAR O JOIN*/
SELECT *FROM estudantes, estudante_materia
WHERE estudante_materia.estudante_id= estudantes.id
AND estudante_materia.estudante_id = 2;

/*DELETANDO UM REGISTRO DUPLICADO DA TABELA ESTUDANTE_MATERIA*/
DELETE FROM estudante_materia WHERE estudante_id = 1 ;



