/*Operadores lógicos*/
/*AND-*/
SELECT * FROM salaries WHERE salary > 125000 AND from_date > "1998-12-12" AND emp_no > 12800;

/*OR retorna qualquer uma das informações forem verdadeiras*/
SELECT * FROM titles WHERE title = 'Senior Engineer' || title = 'Staff' || emp_no > 12500 ORDER BY emp_no  DESC;

/*NOT iverte uma clausula*/
SELECT * FROM titles WHERE NOT title = 'Staff' AND NOT title = 'Senior Engineer';



/*Utilizando o ORDER BY*/
SELECT * FROM salaries ORDER BY emp_no ASC;
SELECT * FROM salaries ORDER BY salary DESC;
SELECT * FROM titles ORDER BY title DESC;



