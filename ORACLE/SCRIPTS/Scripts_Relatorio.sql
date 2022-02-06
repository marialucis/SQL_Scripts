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
    venda_tamanho.tamanho,
    venda_tamanho.ano,
    venda_tamanho.quantidade,
    round((venda_tamanho.quantidade / venda_total.quantidade) * 100, 2) AS participacao
FROM
         (
        SELECT
            tp.tamanho,
            to_char(nf.data_venda, 'YYYY') AS ano,
            SUM(inf.quantidade)            AS quantidade
        FROM
                 tabela_de_produtos tp
            INNER JOIN itens_notas_fiscais inf ON tp.codigo_do_produto = inf.codigo_do_produto
            INNER JOIN notas_fiscais       nf ON nf.numero = inf.numero
        WHERE
            to_char(nf.data_venda, 'YYYY') = 2016
        GROUP BY
            tp.tamanho,
            to_char(nf.data_venda, 'YYYY')
    ) venda_tamanho
    INNER JOIN (
        SELECT
            to_char(nf.data_venda, 'YYYY') AS ano,
            SUM(inf.quantidade)            AS quantidade
        FROM
                 tabela_de_produtos tp
            INNER JOIN itens_notas_fiscais inf ON tp.codigo_do_produto = inf.codigo_do_produto
            INNER JOIN notas_fiscais       nf ON nf.numero = inf.numero
        WHERE
            to_char(nf.data_venda, 'YYYY') = 2016
        GROUP BY
            to_char(nf.data_venda, 'YYYY')
    ) venda_total ON venda_tamanho.ano = venda_total.ano
ORDER BY
    venda_tamanho.quantidade DESC;