-- Funcao- procedimento que recebe de volta apenas um valor com tipo definido
-- As rotinas que recebem parâmetros de entrada, mas têm que devolver um só valor, devem ser implementadas através de funções.
-- Uma das principais características das funções é receber valores através de parâmetros e devolver um só valor, assim os parâmetros só podem ser de entrada.
-- A cláusula RETURN do cabeçalho irá indicar qual é o tipo de dado de retorno da função, ou seja, a variável do ambiente externo que receberá o valor da função também terá que ser do mesmo tipo de dado.



CREATE OR REPLACE FUNCTION obter_descricao_segmercado (
    p_ID IN SEGMERCADO.ID%type
)
RETURN SEGMERCADO.DESCRICAO%type
IS
    v_DESCRICAO SEGMERCADO.DESCRICAO%type;
BEGIN
    SELECT DESCRICAO INTO v_DESCRICAO FROM SEGMERCADO WHERE ID = p_ID;
    RETURN v_DESCRICAO;
END;