/*CRIANDO TABELA COM CONSTRAINT: NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY ,AUTO_INCREMENT  E INDEX */

CREATE TABLE pessoas
( id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(100) NOT NULL,
idade INT
);

CREATE TABLE enderecos
(id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, /*ADICIONANDO A CHAVE PRIMARIA E O AUTO INCREMENTO NA TABELA, NÃO PODE SER NULO*/
rua VARCHAR(100),
numero VARCHAR(10),
pessoa_id INT NOT NULL,
FOREIGN KEY(pessoa_id) REFERENCES pessoas(id) /*CHAVE ESTRANGEIRA REFERENCIADO A TABELA A PESSOA*/
);

/*Inserindo dados na tabela*/
INSERT INTO pessoas(nome, idade) VALUES("Luci",23);
INSERT INTO enderecos(rua, numero, pessoa_id) VALUES ("Rua teste","123",1);

SELECT * FROM pessoas;
SELECT * FROM enderecos;

/*CRIANDO INDEX NA TABELA PARA MELHORAR A CONSULTA*/
CREATE INDEX index_id
ON pessoas(id);


/*ALTERANDO A TABELA E ADICIONANDO UM NOVO CAMPO COM A CONSTRAINT UNIQUE QUE É O TIPO UNICO SEM REPETICAO*/
ALTER TABLE pessoas ADD COLUMN email VARCHAR(100) UNIQUE;

/*INSERINDO DADOS NOVAMENTE NA TABELA PARA TESTAR O CAMPO UNICO SEM REPETICAO*/
INSERT INTO pessoas (nome, idade, email) VALUES("Teste ",25, "emailteste@gmail");