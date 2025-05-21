import pyodbc

conn = pyodbc.connect(
    "DRIVER={PostgreSQL Unicode};"
    "SERVER=localhost;"
    "PORT=5432;"
    "DATABASE=AtividadesBD;"
    "UID=atividades_user;"
    "PWD=atividades_pass;"
)

cursor = conn.cursor()

# Inserir uma atividade
cursor.execute("""
INSERT INTO atividade (descricao, id_projeto) VALUES ('Nova Atividade', 1);
""")

# Atualizar o líder
cursor.execute("""
UPDATE projeto SET id_lider = 2 WHERE id_projeto = 1;
""")

# Listar projetos e atividades
cursor.execute("""
SELECT p.nome, a.descricao FROM projeto p
JOIN atividade a ON p.id_projeto = a.id_projeto;
""")

for row in cursor.fetchall():
    print(row)

conn.commit()
conn.close()