/*Criando procedure/rotina pra inclusao de dados na tabela cliente*/

CREATE OR REPLACE PROCEDURE INCLUIR_SEGMERCADO
(p_ID IN SEGMERCADO.ID%TYPE , p_DESCRICAO IN SEGMERCADO.DESCRICAO%TYPE)
IS
BEGIN
INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (p_ID, upper(p_DESCRICAO));
COMMIT;
END;




--Criando procedure/rotina pra inculsao de vendedores na tabela

CREATE OR REPLACE PROCEDURE incluir_vendedores
( p_matricula IN                   tabela_de_vendedores.matricula%type,
  p_nome IN                        tabela_de_vendedores.nome%type,
  p_percentual_comissao IN         tabela_de_vendedores.percentual_comissao%type,
  p_data_admissao IN               tabela_de_vendedores.data_admissao%type,
  p_de_ferias IN                   tabela_de_vendedores.de_ferias%type
    )
IS 
BEGIN
    INSERT INTO tabela_de_vendedores (matricula,nome,percentual_comissao, data_admissao, de_ferias)
     VALUES (p_matricula, p_nome, p_percentual_comissao, p_data_admissao, p_de_ferias);
     COMMIT;
END;