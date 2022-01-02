/*Utilizando Limit*/
SELECT * FROM titles LIMIT 5;
SELECT * FROM titLes ORDER BY title LIMIT 5;



/*Funcoes no SQL, MIN, MAX, COUNT, AVG, SUM
order by + limit*/

/*usando o order by e limit */
SELECT salary FROM salaries ORDER BY salary ASC LIMIT 1;
/*unsando a funcao MIN */
SELECT MIN(salary) AS salary FROM salaries;

/*Usando a funcao MAX*/
SELECT MAX(salary) AS maior_salario FROM salaries;

/*usando order by e limit*/
SELECT salary FROM salaries ORDER BY salary DESC LIMIT 1;

/*usando o count para cntar o numero de resultados*/
SELECT COUNT(*) AS mulheres FROM employees WHERE gender = "F";
SELECT COUNT(*) AS registros FROM departments;


/*usando o avg para ter resultado da media*/
SELECT AVG(salary) AS media FROM salaries;
SELECT AVG(salary) FROM SALARIES where SALARY > 100000;

/*usando o SUM para calculo*/
SELECT SUM(salary) AS soma FROM salaries;



/*OPERADOR LIKE*/
SELECT * FROM employees WHERE first_name LIKE '%ber%' AND gender = 'F';
SELECT * FROM employees WHERE last_name LIKE '%mc%';

SELECT * FROM titles WHERE title LIKE '%Engineer%';


/*OPERADOR IN*/
SELECT * FROM employees WHERE last_name IN('Facello','Peac') AND gender= 'F';

/*OPERADOR BETWEEN*/
SELECT * FROM dept_emp WHERE dept_no BETWEEN 'd001' AND 'd005' ORDER BY dept_no DESC;
SELECT * FROM salaries WHERE salary BETWEEN '125000' AND '175000';


/*ALIAS serve para renomear uma coluna para melhor entendimento*/
SELECT dept_no AS "Nuemro Departamento", dept_name AS "Nome Departamento" FROM departments;

