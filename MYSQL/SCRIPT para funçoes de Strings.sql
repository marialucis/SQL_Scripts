USE sakila;
/*USANDO A FUNÇÃO CHAR_LENGTH PARA RETORNAR A QUANTIDADE DE CARACTERES*/
SELECT first_name, CHAR_LENGTH(first_name) AS qtd_chars
FROM actor
WHERE CHAR_LENGTH(first_name) > 9;


SELECT address_id, address, postal_code, CHAR_LENGTH(postal_code) AS 'qtd_chars CEP'
FROM address
WHERE CHAR_LENGTH(postal_code) <=7
ORDER BY address_id DESC;


/*USANDO A FUNCAO CONCAT PARA CONCATENAR/UNIR DUAS OU MAIS STRINGS*/
USE empresa;
SELECT CONCAT(nome, "tem", idade, "anos de idade!") AS nome_e_idade
FROM funcionarios;

USE sakila;
SELECT actor_id, CONCAT(first_name, " " ,last_name) AS 'nome_completo'
FROM actor;


/*USANOD O CONCAT_WS PARA CONCATENAR DUAS OU MAIS STRINGS COM UM SEPARADOR COMUM*/
SELECT actor_id, CONCAT_WS("/", actor_id, first_name) AS 'infomacoes'
FROM actor; 



/*USANDO O FORMAT PARA FORMATAR UM NUMERO COM UM NUMERO DE CASAS DETERMINADO POR ARGUMENTOS */
USE sakila;
SELECT * FROM payment;

SELECT customer_id, amount, FORMAT(amount,1)
FROM payment;


/*INSTR - RETORNANDO A POSIÇÃO DO CARACTER*/
SELECT email, INSTR(email, "@") FROM customer;


/*FUNCAO LCASE- TRANSFORMANDO O TEXTO PARA LETRAS MINUSCULAS*/
SELECT first_name, last_name,LCASE(CONCAT(first_name, " ", last_name)) AS nome_completo
FROM customer;



/*FUNCAO LEFT EXTRAI UMA QUANTIDADE DE CARACTERES DE UMA STRING*/
USE sakila;
SELECT title , LEFT(title,8) FROM film WHERE film_id =1;


SELECT address_id,  LEFT(last_update,10) AS 'data'
FROM address
WHERE address_id > 150;



/*REPLACE-TROCANDO PALAVRAS EM STRINGS COM REPALCE*/
SELECT REPLACE(name, "Action","Action & Adventure") AS name FROM category;


/*EXERCICIO 29*/
SELECT REPLACE(first_name,"MARY" ,"Mary") AS nome, REPLACE(last_name, "SMITH", "Smith") AS sobrenome
FROM customer
WHERE last_name = "SMITH";

SELECT first_name AS nome, last_name AS sobrenome, LCASE(CONCAT(first_name," ", last_name)) FROM customer
WHERE last_name LIKE '%SMITH%';


/*RIGHT-EXTRAINDO TEXTO COM RIGHT*/
SELECT * FROM CATEGORY;
SELECT RIGHT(last_update,8) AS horario FROM category; 


/*Funcao SUBSTR*/
SELECT last_update, SUBSTR(last_update,9,2) AS dia,
SUBSTR(last_update,6,2) AS mes,
SUBSTR(last_update,1,4) AS ano
FROM actor;


/*Funcao UCASE transforma todas as letras MAIUSCULAS */
SELECT description FROM film;
SELECT UCASE(description) FROM film;

SELECT * FROM country;
SELECT country_id, UCASE(country) AS 'país'
FROM country;