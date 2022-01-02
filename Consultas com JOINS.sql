/*UNINDO TABELAS COM JOINS*/

/*USANDO O INNER JOIN PARA CONSULTA UTILIZANDO DUAS TABELAS*/
SELECT employees.first_name AS "Nome", employees.last_name AS "Sobrenome", salaries.salary AS "Salario"
FROM employees /*informando qual a tabela principal*/
INNER JOIN salaries /*declarando ao select que vamos fazer o JOIN na tabela */
ON employees.emp_no = salaries.emp_no /*ON Informando aonde vou trazer os registros pelo identificador das tabelas */
WHERE salaries.salary >= 120000 
ORDER BY salaries.salary DESC;

/*USANDO O INNER JOIN NOVAMENTE*/
SELECT employees.first_name AS "Nome", employees.gender AS "Genero", titles.title AS "Cargo"
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no


/*USANO O LEFT JOIN*/
SELECT employees.last_name AS "Sobrenome", salaries.salary AS "Salario"
FROM employees /*informando qual a tabela principal*/
LEFT JOIN salaries /*declarando ao select que vamos fazer o JOIN na tabela */
ON employees.emp_no = salaries.emp_no ;/*ON Informando aonde vou trazer os registros pelo identificador das tabelas */


/*USANDO O INNER JOIN COM MAIS DE DUAS TABELAS*/
SELECT employees.first_name, salaries.salary, titles.title
FROM employees
INNER JOIN salaries
ON employees.emp_no= salaries.emp_no
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE salaries.salary > 125000;
