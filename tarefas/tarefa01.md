# Tarefa 01 - Consultas Aninhadas, Visões e CTEs

## Links 

- Esquema relacional: https://github.com/StenioEric/banco_de_dados2/blob/main/tarefas/tarefa01-create.sql
- Povoamento relacional: https://github.com/StenioEric/banco_de_dados2/blob/main/tarefas/tarefa01-inserts.sql
### Questões
- Questão 1: https://github.com/StenioEric/banco_de_dados2/blob/main/tarefas/tarefa01-q01.sql
- Questão 4: https://github.com/StenioEric/banco_de_dados2/blob/main/tarefas/tarefa01-q04.sql
- Questão 7: https://github.com/StenioEric/banco_de_dados2/blob/main/tarefas/tarefa01-q07.sql
- Questão 13: https://github.com/StenioEric/banco_de_dados2/blob/main/tarefas/tarefa01-q13.sql
- Questão 16: https://github.com/StenioEric/banco_de_dados2/blob/main/tarefas/tarefa01-q16.sql


# NATURAL JOIN e CROSS JOIN em SQL

## 🔗 NATURAL JOIN

O `NATURAL JOIN` é uma forma de `JOIN` que combina automaticamente tabelas com base em colunas que possuem **o mesmo nome e tipo** em ambas as tabelas. Ele é basicamente um `INNER JOIN` implícito, que **não exige que você escreva a condição ON**.

### 🧠 Características:
- Usa apenas colunas com o **mesmo nome** em ambas as tabelas.
- Evita a repetição da cláusula `ON`.
- Pode causar ambiguidades se houver mais colunas em comum do que o esperado.

### 📌 Exemplo:

Tabelas:

**cliente**
| cod_cliente | nome       |
|-------------|------------|
| 1           | João       |
| 2           | Maria      |

**pedido**
| cod_pedido | cod_cliente | valor |
|------------|-------------|-------|
| 101        | 1           | 200   |
| 102        | 2           | 150   |

Consulta:

SELECT * 
FROM cliente 
NATURAL JOIN pedido;


## CROSS JOIN

O `CROSS JOIN` (ou produto cartesiano) combina **todas as linhas da primeira tabela com todas as linhas da segunda**. Pode ser útil para gerar combinações, mas deve ser usado com cuidado por gerar muitos resultados.

### Exemplo:
```sql
SELECT f.nome, d.descricao
FROM funcionario f
CROSS JOIN departamento d;
```

## Window Functions no PostgreSQL

As `Window Functions` permitem aplicar funções agregadas **sem agrupar os dados**, mantendo o contexto linha a linha. São ideais para calcular rankings, totais acumulados, comparações dentro de grupos, etc.

### Exemplo 1: Ranking de salários
```sql
SELECT nome, salario,
       RANK() OVER (ORDER BY salario DESC) AS ranking
FROM funcionario;
```

### Exemplo 2: Maior salário por departamento
```sql
SELECT nome, salario, cod_depto,
       MAX(salario) OVER (PARTITION BY cod_depto) AS max_salario_no_depto
FROM funcionario;
```

Essas funções são altamente poderosas para análises avançadas em SQL.

