--CRIACAO DE SCRIPTS PARA MONTAGEM DE RELATORIO

--QUERY 1
SELECT
  TP.SABOR,
  INF.QUANTIDADE
FROM
  ITENS_NOTAS_FISCAIS INF
  INNER JOIN TABELA_DE_PRODUTOS TP ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO;


--QUERY 2
SELECT
  TP.SABOR,
  TO_CHAR(NF.DATA_VENDA, 'YYYY') AS ANO,
  SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDIDA
FROM
  ITENS_NOTAS_FISCAIS INF
  INNER JOIN TABELA_DE_PRODUTOS TP ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
  INNER JOIN NOTAS_FISCAIS NF ON INF.NUMERO = NF.NUMERO
GROUP BY
  TP.SABOR,
  TO_CHAR(NF.DATA_VENDA, 'YYYY');


  
--QUERY 3
SELECT
  TP.SABOR,
  TO_CHAR(NF.DATA_VENDA, 'YYYY') AS ANO,
  SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDIDA
FROM
  ITENS_NOTAS_FISCAIS INF
  INNER JOIN TABELA_DE_PRODUTOS TP ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
  INNER JOIN NOTAS_FISCAIS NF ON INF.NUMERO = NF.NUMERO
WHERE
  TO_CHAR(NF.DATA_VENDA, 'YYYY') = '2016'
GROUP BY
  TP.SABOR,
  TO_CHAR(NF.DATA_VENDA, 'YYYY')
ORDER BY
  SUM(INF.QUANTIDADE) DESC;


--QUERY 4
SELECT
  TO_CHAR(NF.DATA_VENDA, 'YYYY') AS ANO,
  SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDIDA
FROM
  ITENS_NOTAS_FISCAIS INF
  INNER JOIN TABELA_DE_PRODUTOS TP ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
  INNER JOIN NOTAS_FISCAIS NF ON INF.NUMERO = NF.NUMERO
WHERE
  TO_CHAR(NF.DATA_VENDA, 'YYYY') = '2016'
GROUP BY
  TO_CHAR(NF.DATA_VENDA, 'YYYY')
ORDER BY
  SUM(INF.QUANTIDADE) DESC;



--QUERY FINAL_RELATORIO
 --Determina a venda por sabores, para o ano de 2016, apresentando o percentual de participação de cada um destes sabores, ordenados:
SELECT
  VENDA_TAMANHO.TAMANHO,
  VENDA_TAMANHO.ANO,
  VENDA_TAMANHO.QUANTIDADE,
  ROUND(
    (
      VENDA_TAMANHO.QUANTIDADE / VENDA_TOTAL.QUANTIDADE
    ) * 100,
    2
  ) AS PARTICIPACAO
FROM
  (
    SELECT
      TP.TAMANHO,
      TO_CHAR(NF.DATA_VENDA, 'YYYY') AS ANO,
      SUM(INF.QUANTIDADE) AS QUANTIDADE
    FROM
      TABELA_DE_PRODUTOS TP
      INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
      INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
    WHERE
      TO_CHAR(NF.DATA_VENDA, 'YYYY') = 2016
    GROUP BY
      TP.TAMANHO,
      TO_CHAR(NF.DATA_VENDA, 'YYYY')
  ) VENDA_TAMANHO
  INNER JOIN (
    SELECT
      TO_CHAR(NF.DATA_VENDA, 'YYYY') AS ANO,
      SUM(INF.QUANTIDADE) AS QUANTIDADE
    FROM
      TABELA_DE_PRODUTOS TP
      INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
      INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
    WHERE
      TO_CHAR(NF.DATA_VENDA, 'YYYY') = 2016
    GROUP BY
      TO_CHAR(NF.DATA_VENDA, 'YYYY')
  ) VENDA_TOTAL ON VENDA_TAMANHO.ANO = VENDA_TOTAL.ANO
ORDER BY
  VENDA_TAMANHO.QUANTIDADE DESC;