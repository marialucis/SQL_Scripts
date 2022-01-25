/*FUNCAO CEIL- SERVE PARA ARREDONDAMNTO */
SELECT amount,CEIL(amount) AS 'Arredondamento' FROM payment;

/*FUNCAO COUNT- CONTAR REGUSTROS DA TABELA*/
SELECT COUNT(*) FROM category;

/*EXERCICIO 31*/
SELECT COUNT(*) FROM customer;

/*FLOOR- ARRENDONDAMENTO PARA BAIXO*/
SELECT amount, CEIL(amount) AS para_cima, FLOOR(amount) AS para_baixo 
FROM payment;


/*FUNCAO MAX RETORNA O MAIOR VALOR DE UMA COLUNA*/
SELECT MAX(amount) AS maior_numero
FROM payment;


/*FUNCAO MIN RETORNA O MENOR VALOR DE UMA COLUNA*/
SELECT MIN(amount) AS menor_valor
FROM payment; 

/*FUNCAO SUM*/
USE sakila;
SELECT SUM(amount) FROM payment;

/*EXERCICIO 32 */
USE employees;
SELECT * FROM salaries;
/*selecionando o maior e o menor salario*/
SELECT MAX(salary) AS 'Maior salario', MIN(salary) AS 'Menor salario'
FROM salaries;
