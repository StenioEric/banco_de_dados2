WITH gerentes AS (
    SELECT d.codigo AS depto_id, f.codigo AS gerente_id, f.salario AS salario_gerente
    FROM departamento d
    JOIN funcionario f ON d.cod_gerente = f.codigo
),
responsaveis AS (
    SELECT DISTINCT f.codigo AS func_id, f.nome, f.salario, f.cod_depto
    FROM projeto p
    JOIN funcionario f ON p.cod_responsavel = f.codigo
)
SELECT r.nome, r.salario
FROM responsaveis r
LEFT JOIN gerentes g ON r.cod_depto = g.depto_id
WHERE r.func_id = g.gerente_id OR r.salario > g.salario_gerente;