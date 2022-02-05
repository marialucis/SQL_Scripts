--------------------------------------------------------
--  Arquivo criado - Sexta-feira-Fevereiro-04-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CLIENTE
--------------------------------------------------------

  CREATE TABLE "DML"."CLIENTE" 
   (	"CPF" VARCHAR2(11 BYTE), 
	"NOME" VARCHAR2(100 BYTE), 
	"ENDERECO" VARCHAR2(50 BYTE), 
	"BAIRRO" VARCHAR2(50 BYTE), 
	"CIDADE" VARCHAR2(50 BYTE), 
	"ESTADO" VARCHAR2(50 BYTE), 
	"CEP" VARCHAR2(8 BYTE), 
	"DATA_NASCIMENTO" DATE, 
	"IDADE" NUMBER(*,0), 
	"SEXO" VARCHAR2(1 BYTE), 
	"LIMITE_CREDITO" FLOAT(126), 
	"VOLUME_COMPRA" FLOAT(126), 
	"PRIMEIRA_COMPRA" NUMBER(1,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ITENS_NOTAS
--------------------------------------------------------

  CREATE TABLE "DML"."ITENS_NOTAS" 
   (	"NUMERO" VARCHAR2(5 BYTE), 
	"CODIGO_PRODUTO" VARCHAR2(10 BYTE), 
	"QUANTIDADE" NUMBER(*,0), 
	"PRECO" FLOAT(126)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table NOTAS
--------------------------------------------------------

  CREATE TABLE "DML"."NOTAS" 
   (	"NUMERO" VARCHAR2(5 BYTE), 
	"DATA_VENDA" DATE, 
	"CPF" VARCHAR2(11 BYTE), 
	"MATRICULA" VARCHAR2(5 BYTE), 
	"IMPOSTO" FLOAT(126)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUTOS
--------------------------------------------------------

  CREATE TABLE "DML"."PRODUTOS" 
   (	"CODIGO_PRODUTO" VARCHAR2(10 BYTE), 
	"DESCRICAO" VARCHAR2(100 BYTE), 
	"SABOR" VARCHAR2(50 BYTE), 
	"TAMANHO" VARCHAR2(50 BYTE), 
	"EMBALAGEM" VARCHAR2(50 BYTE), 
	"PRECO_LIST" FLOAT(126)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table VENDEDORES
--------------------------------------------------------

  CREATE TABLE "DML"."VENDEDORES" 
   (	"MATRICULA" VARCHAR2(5 BYTE), 
	"NOME" VARCHAR2(100 BYTE), 
	"BAIRRO" VARCHAR2(50 BYTE), 
	"COMISSAO" FLOAT(126), 
	"DATA_ADMISSAO" DATE, 
	"FERIAS" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007652
--------------------------------------------------------

  CREATE UNIQUE INDEX "DML"."SYS_C007652" ON "DML"."CLIENTE" ("CPF") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007666
--------------------------------------------------------

  CREATE UNIQUE INDEX "DML"."SYS_C007666" ON "DML"."ITENS_NOTAS" ("NUMERO", "CODIGO_PRODUTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007656
--------------------------------------------------------

  CREATE UNIQUE INDEX "DML"."SYS_C007656" ON "DML"."NOTAS" ("NUMERO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007647
--------------------------------------------------------

  CREATE UNIQUE INDEX "DML"."SYS_C007647" ON "DML"."PRODUTOS" ("CODIGO_PRODUTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007650
--------------------------------------------------------

  CREATE UNIQUE INDEX "DML"."SYS_C007650" ON "DML"."VENDEDORES" ("MATRICULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "DML"."CLIENTE" MODIFY ("CPF" NOT NULL ENABLE);
  ALTER TABLE "DML"."CLIENTE" ADD PRIMARY KEY ("CPF")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ITENS_NOTAS
--------------------------------------------------------

  ALTER TABLE "DML"."ITENS_NOTAS" MODIFY ("NUMERO" NOT NULL ENABLE);
  ALTER TABLE "DML"."ITENS_NOTAS" MODIFY ("CODIGO_PRODUTO" NOT NULL ENABLE);
  ALTER TABLE "DML"."ITENS_NOTAS" ADD PRIMARY KEY ("NUMERO", "CODIGO_PRODUTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTAS
--------------------------------------------------------

  ALTER TABLE "DML"."NOTAS" MODIFY ("NUMERO" NOT NULL ENABLE);
  ALTER TABLE "DML"."NOTAS" MODIFY ("CPF" NOT NULL ENABLE);
  ALTER TABLE "DML"."NOTAS" MODIFY ("MATRICULA" NOT NULL ENABLE);
  ALTER TABLE "DML"."NOTAS" ADD PRIMARY KEY ("NUMERO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUTOS
--------------------------------------------------------

  ALTER TABLE "DML"."PRODUTOS" MODIFY ("CODIGO_PRODUTO" NOT NULL ENABLE);
  ALTER TABLE "DML"."PRODUTOS" ADD PRIMARY KEY ("CODIGO_PRODUTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table VENDEDORES
--------------------------------------------------------

  ALTER TABLE "DML"."VENDEDORES" MODIFY ("MATRICULA" NOT NULL ENABLE);
  ALTER TABLE "DML"."VENDEDORES" ADD PRIMARY KEY ("MATRICULA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ITENS_NOTAS
--------------------------------------------------------

  ALTER TABLE "DML"."ITENS_NOTAS" ADD CONSTRAINT "FK_PRODUTOS" FOREIGN KEY ("CODIGO_PRODUTO")
	  REFERENCES "DML"."PRODUTOS" ("CODIGO_PRODUTO") ENABLE;
  ALTER TABLE "DML"."ITENS_NOTAS" ADD CONSTRAINT "FK_TABELA_DE_VENDAS" FOREIGN KEY ("NUMERO")
	  REFERENCES "DML"."NOTAS" ("NUMERO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTAS
--------------------------------------------------------

  ALTER TABLE "DML"."NOTAS" ADD CONSTRAINT "FK_CLIENTE" FOREIGN KEY ("CPF")
	  REFERENCES "DML"."CLIENTE" ("CPF") ENABLE;
  ALTER TABLE "DML"."NOTAS" ADD CONSTRAINT "FK_VENDEDORES" FOREIGN KEY ("MATRICULA")
	  REFERENCES "DML"."VENDEDORES" ("MATRICULA") ENABLE;
