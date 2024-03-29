--FUNCOES DE STRING
--CONVERTENDO A STRING PARA MINUSCULA USANDO LOWER
SELECT NOME, LOWER(NOME) FROM TABELA_DE_CLIENTES;

--CONVERTENDO A STRING PARA MINUSCULO UPPER
SELECT NOME, UPPER(NOME) FROM TABELA_DE_CLIENTES;


--CONCATENANDO STRING
SELECT NOME,ENDERECO_1 ||  '' || BAIRRO || ' ' || CIDADE || ''|| ESTADO AS ENDERECO_COMPLETO
FROM TABELA_DE_CLIENTES; 


--ADICIONANDO CARACTERES A


--FUNCOES DE DATA
--RETORNA A DATA DO COMPUTADOR
SELECT SYSDATE FROM DUAL;

-- CONTA A DATA DE HOJE E ADICIONA MAIS DIAS
SELECT SYSDATE + 10 FROM DUAL;

--TRAZENDO A DATA E HORA DO COMPUTADOR
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY HH:MM:SS' ) FROM DUAL;

SELECT NOME, MONTHS_BETWEEN (SYSDATE, DATA_DE_NASCIMENTO)/12 AS IDADE
FROM HOMOLOGACAO.tabela_de_clientes;

--USANDO O MONTHS_BETWEEN PARA DETERMINAR O NUMERO DE MESES ENTRE AS DATAS PASSADAS COMO PARAMETRO
SELECT MONTHS_BETWEEN(SYSDATE, '05/04/1998') FROM DUAL;