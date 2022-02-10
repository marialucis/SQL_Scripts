/*Criando procedure/rotina pra inclusao de dados na tabela cliente*/
CREATE
OR REPLACE PROCEDURE INCLUIR_SEGMERCADO (
  p_ID IN SEGMERCADO.ID % TYPE,
  p_DESCRICAO IN SEGMERCADO.DESCRICAO % TYPE
) IS BEGIN
INSERT INTO
  SEGMERCADO (ID, DESCRICAO)
VALUES
  (p_ID, upper(p_DESCRICAO));
COMMIT;
END;


--Criando procedure/rotina pra inculsao de vendedores na tabela
CREATE
OR REPLACE PROCEDURE incluir_vendedores (
  p_matricula IN tabela_de_vendedores.matricula % type,
  p_nome IN tabela_de_vendedores.nome % type,
  p_percentual_comissao IN tabela_de_vendedores.percentual_comissao % type,
  p_data_admissao IN tabela_de_vendedores.data_admissao % type,
  p_de_ferias IN tabela_de_vendedores.de_ferias % type
) IS BEGIN
INSERT INTO
  tabela_de_vendedores (
    matricula,
    nome,
    percentual_comissao,
    data_admissao,
    de_ferias
  )
VALUES
  (
    p_matricula,
    p_nome,
    p_percentual_comissao,
    p_data_admissao,
    p_de_ferias
  );
COMMIT;
END;


--Criando procedure/rotina pra inculsao de clientes na tabela
create
or replace NONEDITIONABLE PROCEDURE INCLUIR_CLIENTE (
  p_ID IN CLIENTE.ID % TYPE,
  p_RAZAO_SOCIAL IN CLIENTE.RAZAO_SOCIAL % TYPE,
  p_CNPJ IN CLIENTE.CNPJ % TYPE,
  p_SEGMERCAD0_ID IN CLIENTE.SEGMERCADO_ID % TYPE,
  p_DATA_INCLUSAO IN CLIENTE.DATA_INCLUSAO % TYPE,
  p_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO % TYPE,
  p_CATEGORIA IN CLIENTE.CATEGORIA % TYPE
) IS BEGIN
INSERT INTO
  CLIENTE (
    ID,
    RAZAO_SOCIAL,
    CNPJ,
    SEGMERCADO_ID,
    DATA_INCLUSAO,
    FATURAMENTO_PREVISTO,
    CATEGORIA
  )
VALUES
  (
    p_ID,
    p_RAZAO_SOCIAL,
    p_CNPJ,
    p_SEGMERCAD0_ID,
    TO_DATE(p_DATA_INCLUSAO, 'DD/MM/YYYY'),
    p_FATURAMENTO_PREVISTO,
    p_CATEGORIA
  );
COMMIT;
END;


--PROCEDURE PARA FORMATAR O CNPJ
create or replace NONEDITIONABLE PROCEDURE formata_cnpj
(   p_CNPJ IN OUT CLIENTE.CNPJ%type)

IS
BEGIN
    p_CNPJ := SUBSTR(p_cnpj, 1,2) || '.' || SUBSTR(p_CNPJ,3,3) || '.' || SUBSTR(p_CNPJ,6,3) || '/'|| SUBSTR(p_CNPJ,9,4) || '-' || SUBSTR(p_CNPJ,13,2);
END;
