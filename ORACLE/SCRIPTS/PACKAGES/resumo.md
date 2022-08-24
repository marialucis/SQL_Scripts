### Packages, Synonym e Dependencias

## Synonym e Dependencia
    Um sinonimo é um alias da tabela.Um sinonimo não é, na verdade um objeto de esquema em si, mas sim uma referencia direta a ele.
    - Fornece acesso a um objeto de esquema;
    - Fornece transparencia de localização para tabelas;
    - Um sinonimo pode ser publico ou privado;
    
    OBS: SINONIMOS NADA MAIS É QUE UM ALIAS DE UM OBJETO DE UM OUTRO SCHEMA PARA OUTRO

    
  ## EXISTEM DOIS TIPOS DE SINONIMOS:

    - SINONIMOS PRIVADOS(DEFAULT)
    - São mais recomendados por motivos de segurança

    Criando Sinonimo Privado
    EX:
        - CREATE OR REPLACE SYNONYM <SYNONYM_NAME> FOR <OBJECT_NAME>;
  
    Dropando Sinonimo Privado
    EX:
        - DROP SYNONYM <SYNONYM_NAME>;
  
    
    - SINONIMOS PUBLICOS
    - Somente Usuarios com Privilegios DBA podem criar sinonimos publicos. O Sinonimo Publico estara disponivel para todos os usuarios do Banco de Dados com os privilegios agrupados.
  
    Criandoo Sinonimo Publico
    EX:
        - CREATE OR REPLACE PUBLIC SYNONYM <SYNONYM_NAME> FOR <OBJECT_NAME>;


    Dropando Sinonimos Publico
        - DROP PUBLIC SYNONYM <SYNONYM_NAME>;

      