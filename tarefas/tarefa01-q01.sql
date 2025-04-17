SELECT nome
FROM funcionario
WHERE salario > ALL (
    SELECT salario
    FROM funcionario
    WHERE cod_depto = 2
);