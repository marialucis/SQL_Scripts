--CRIANDO TABELA COM AUTO-INCREMENTO
CREATE TABLE teste_incre (
    id   NUMBER
        GENERATED BY DEFAULT ON NULL AS IDENTITY,
    nome VARCHAR2(50) NULL
);