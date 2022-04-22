--Parâmetros IN – passamos o valor na própria procedure.
--Parâmetros OUT – recebemos o valor a partir da chamada de blocos externos.
--Parâmetros IN OUT – passamos um valor inicial para a procedure e recebemos de volta uma atualização.

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



--PROCEDURA PARA FORMATAR O CPF
create or replace PROCEDURE formata_cpf
(   p_CPF IN OUT CLIENTE.CPF%type)

IS
BEGIN
    p_CPF := SUBSTR(p_CPF,1,3) || '.' || SUBSTR(p_CPF,4,3) || '.' || SUBSTR(p_CPF,7,3) || '-' ||SUBSTR(p_CPF,10,2);
END;




--PROCEDURE PARA ATUALIZAR O CNPJ DO CLIENTE A PARTIR DO ID
create or replace PROCEDURE atualizar_cnpj_cliente (
 p_id IN  cliente.id%TYPE, p_cnpj IN  cliente.cnpj%TYPE)
IS
    v_CNPJ CLIENTE.CNPJ%type := p_CNPJ; --declarando a variavel v_cnpj para receber p_cnpj e realizar a formatação 
BEGIN
    formata_cnpj(v_cnpj);
    UPDATE CLIENTE SET CNPJ = v_cnpj
    WHERE ID = p_id;
    COMMIT;
END;

--Para executar a procedure atualizar_cnpj_cliente passando os parametros
execute atualizar_cnpj_cliente(p_id,p_cnpj);
ex:execute atualizar_cnpj_cliente(5,54375233000106);




--Para executar a procedure atualizar_cpf_cliente
create or replace  PROCEDURE atualizar_cpf_cliente (
 p_id IN  cliente.id%TYPE, p_cpf IN  cliente.cpf%TYPE)
IS
    v_CPF CLIENTE.CPF%type := p_CPF; --declarando a variavel v_cpf para receber p_cpf e realizar a formatação 
BEGIN
    formata_cpf(v_cpf);
    UPDATE CLIENTE SET CPF = v_cpf
    WHERE ID = p_id;
    COMMIT;
END;

--Para executar a procedure atualizar_cpf_cliente passando os parametros
execute atualizar_cpf_cliente(p_id,p_cpf);
ex:execute atualizar_cpf_cliente(1,64789259005);



--PROCEDURE PARA DELETAR O CLIENTE A PARTIR DO ID
create or replace PROCEDURE Deletar_cliente (
 p_id IN  cliente.id%TYPE)
IS
    
BEGIN
   DELETE FROM CLIENTE 
    WHERE ID = p_id;
    COMMIT;
END;

--Para executar a procedure deletar_cliente passando os parametros
execute deletar_cliente(p_id);  
ex:execute deletar_cliente(1)  




--PROCEDURE PARA FORMATAR CNPJ_CPF

create or replace  PROCEDURE formata_cnpj_cpf
(   p_CNPJ IN OUT CLIENTE.CNPJ%type, p_CPF IN OUT CLIENTE.CPF%TYPE )

IS
BEGIN
    p_CNPJ := SUBSTR(p_cnpj, 1,2) || '.' || SUBSTR(p_CNPJ,3,3) || '.' || SUBSTR(p_CNPJ,6,3) || '/'|| SUBSTR(p_CNPJ,9,4) || '-' || SUBSTR(p_CNPJ,13,2);
    p_CPF := SUBSTR(p_CPF,1,3) || '.' || SUBSTR(p_CPF,3,3) || '.' || SUBSTR(p_CPF,6,3) || '-' ||SUBSTR(p_CPF,9,4);
END;


