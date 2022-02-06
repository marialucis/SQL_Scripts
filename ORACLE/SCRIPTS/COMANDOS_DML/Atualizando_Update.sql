--ATUALIZANDO DADOS COM UPDATE

--ATUALIZANDO TABELA DE CLIENTE
UPDATE cliente
SET
    endereco = ' Rua Jorge Emilio, 23',
    bairro = 'Santo Amaro',
    cidade = 'São Paulo',
    estado = 'SP',
    cep = '8833223'
WHERE
    cpf = '19290992743';



    --ATUALIZANDO PRECO_LISTA
UPDATE PRODUTOS SET PRECO_LISTA= PRECO_LISTA * 1.1 WHERE SABOR = 'Maracuja';