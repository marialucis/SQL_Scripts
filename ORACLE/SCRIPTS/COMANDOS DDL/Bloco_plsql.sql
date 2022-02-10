--Verificando a categoria usando o bloco pl
SET SERVEROUTP ON

DECLARE
    v_faturamento_previsto cliente.faturamento_previsto%type:= 12000;
    v_categoria cliente.categoria%type;
BEGIN
    
    if v_faturamento_previsto < 10000 then
        v_categoria := 'PEQUENO';
    elsif v_faturamento_previsto < 50000  then
        v_categoria := 'MÉDIO';
    elsif v_faturamento_previsto < 100000 then
        v_categoria := 'MÉDIO GRANDE';
    else
         v_categoria := 'GRANDE';
    END IF;
    dbms_output.put_line('A categoria é ' || v_categoria);
END;