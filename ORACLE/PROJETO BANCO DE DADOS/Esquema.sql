--Criando Tabelas do esquema
CREATE TABLE PRODUTOS
( CODIGO VARCHAR(10)NOT NULL,
  DESCRICAO VARCHAR(100) NULL,
  SABOR VARCHAR(50) NULL,
  TAMANHO VARCHAR(50) NULL,
  EMBALAGEM VARCHAR(50) NULL,
  PRECO_LIST FLOAT NULL,
  PRIMARY KEY (CODIGO));
  
  --ALTERANDO A COLUNA/CAMPO DA TABELA
  ALTER TABLE PRODUTOS RENAME COLUMN CODIGO_PRODUTOS TO CODIGO_PRODUTO;
  
CREATE TABLE VENDEDORES
 (  MATRICULA VARCHAR(5)NOT NULL,
    NOME VARCHAR(100) NULL,
    BAIRRO VARCHAR(50) NULL,
    COMISSAO FLOAT NULL,
    DATA_ADIMISSAO DATE,
    FERIAS INTEGER NULL,
    PRIMARY KEY (MATRICULA));
    
    --ALTERANDO A COLUNA/CAMPO DA TABELA
    ALTER TABLE VENDEDORES RENAME COLUMN DATA_ADIMISSAO TO DATA_ADMISSAO;
    
CREATE TABLE CLIENTE
  ( CPF VARCHAR(11) NOT NULL,
    NOME VARCHAR(100) NULL,
    ENDERECO VARCHAR(50) NULL,
    BAIRRO VARCHAR(50) NULL,
    CIDADE VARCHAR(50) NULL,
    ESTADO VARCHAR(50) NULL,
    CEP VARCHAR(8) NULL,
    DATA_NASCIMENTO DATE ,
    IDADE INTEGER NULL,
    SEXO VARCHAR(1) NULL,
    LIMITE_CREDITO FLOAT NULL,
    VOLUME_COMPRA FLOAT NULL,
    PRIMEIRA_COMPRA INTEGER NULL,
    PRIMARY KEY(CPF));
   
   
   ALTER TABLE CLIENTE MODIFY PRIMEIRA_COMPRA NUMBER(1);
   
   
CREATE TABLE TABELA_DE_VENDAS
   ( NUMERO VARCHAR(5) NOT NULL,
     DATA_VENDA DATE NULL,
     CPF VARCHAR(11) NOT NULL,
     MATRICULA VARCHAR(5) NOT NULL,
     IMPOSTO FLOAT NULL,
     PRIMARY KEY (NUMERO));
     
     
   --ADICIONANDO CHAVE ESTRANGEIRA/FK 
  ALTER TABLE TABELA_DE_VENDAS ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (CPF) REFERENCES CLIENTE (CPF);
  
  ALTER TABLE TABELA_DE_VENDAS ADD CONSTRAINT FK_VENDEDORES FOREIGN KEY (MATRICULA) REFERENCES VENDEDORES (MATRICULA);
  
CREATE TABLE ITENS_NOTAS
  ( NUMERO VARCHAR(5) NOT NULL,
    CODIGO_PRODUTO VARCHAR(10) NOT NULL,
    QUANTIDADE INTEGER NULL,
    PRECO FLOAT NULL,
    PRIMARY KEY (NUMERO,CODIGO_PRODUTO)
  );
  
   
  --ADICIONANDO CHAVE ESTRANGEIRA NA TABELA   
   ALTER TABLE ITENS_NOTAS ADD CONSTRAINT FK_PRODUTOS FOREIGN KEY (CODIGO_PRODUTO) REFERENCES PRODUTOS (CODIGO_PRODUTO);
   
   ALTER TABLE ITENS_NOTAS ADD CONSTRAINT FK_TABELA_DE_VENDAS FOREIGN KEY (NUMERO) REFERENCES NOTAS (NUMERO);
   
   --ALTERANDO NOME DA TABELA
   ALTER TABLE TABELA_DE_VENDAS RENAME TO NOTAS;
   ALTER TABLE TABELA_ITENS_NOTAS RENAME TO ITENS_NOTAS;