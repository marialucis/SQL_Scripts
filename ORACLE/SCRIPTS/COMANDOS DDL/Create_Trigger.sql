--CRIANDO TRIGGER

CREATE OR REPLACE TRIGGER TG_CALCULO_FATURAMENTO
AFTER INSERT OR UPDATE OR DELETE ON ITENS_NOTAS
BEGIN
    DELETE FROM TAB_FATURAMENTO;
    INSERT INTO TAB_FATURAMENTO
        SELECT NOTAS.DATA_VENDA, SUM(ITENS_NOTAS.QUANTIDADE * ITENS_NOTAS.PRECO) AS TOTAL_VENDA
        FROM NOTAS INNER JOIN ITENS_NOTAS
        ON NOTAS.NUMERO = ITENS_NOTAS.NUMERO
        GROUP BY NOTAS.DATA_VENDA;
END;