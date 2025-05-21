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

>>>>>>> a7cf2c2 (feat: questão 5.f da lista #1)
