
/*Adcionando uma coluna a tabela*/
ALTER TABLE funcionarios ADD COLUMN data_nascimento VARCHAR(100);

/*Romendo a coluna da tabela*/
ALTER TABLE funcionarios DROP COLUMN data_nascimento;

/*Modificando uma coluna da tabela*/
ALTER TABLE funcionarios MODIFY COLUMN data_nascimento DATE;


/* acessei o banco teste_tipo_dados para remover a tabela pessoa que foi adicionada incorreta*/
USE teste_tipo_dados;
/*removendo a tabela pessoas*/
DROP TABLE pessoas;