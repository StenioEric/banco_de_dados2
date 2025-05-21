# 📚 ODBC e ORM com Python

## 📂 Scripts

- 📄 [Script de criação do banco (DDL + DML)](https://github.com/StenioEric/banco_de_dados2/blob/main/tarefas/tarefa01-create.sql)
- 📄 [Script de povoamento do banco](https://github.com/StenioEric/banco_de_dados2/blob/main/tarefas/tarefa01-inserts.sql)
- 🐍 [Script do programa ODBC](odbc-program.py)
- 🐍 [Script do programa ORM](orm-program.py)

---

## 🔗 ODBC (Open Database Connectivity) em Python

ODBC (Open Database Connectivity) é um padrão de interface criado para permitir que aplicações se conectem a diferentes sistemas de gerenciamento de banco de dados (SGBDs) de forma independente do sistema operacional ou do fornecedor do banco. Ele funciona como uma camada intermediária entre o aplicativo e o banco, utilizando drivers ODBC específicos para cada tipo de banco.

### ✅ Vantagens do ODBC:
- **Independência de SGBD**: permite que a aplicação se conecte a diferentes bancos usando a mesma interface.
- **Flexibilidade**: compatível com diversos tipos de bancos de dados (PostgreSQL, MySQL, SQL Server, Oracle, etc).
- **Compatibilidade com SQL padrão**.

### 🐍 Uso em Python com `pyodbc`

O pacote mais comum para utilizar ODBC em Python é o [`pyodbc`](https://github.com/mkleehammer/pyodbc).

#### 📌 Exemplo de conexão com PostgreSQL:
```python
import pyodbc

conn = pyodbc.connect(
    "DRIVER={PostgreSQL Unicode};"
    "SERVER=localhost;"
    "PORT=5432;"
    "DATABASE=meubanco;"
    "UID=usuario;"
    "PWD=senha;"
)

cursor = conn.cursor()
cursor.execute("SELECT * FROM tabela_exemplo")

for row in cursor.fetchall():
    print(row)
```

> ⚠️ **Nota:** É necessário instalar o driver ODBC do banco e o `pyodbc` com:
> ```
> pip install pyodbc
> ```

---

## 🧱 ORM (Object Relational Mapping) com SQLAlchemy

ORM (Mapeamento Objeto-Relacional) é uma técnica que permite mapear objetos de uma linguagem de programação orientada a objetos para tabelas de um banco de dados relacional. Isso facilita a manipulação dos dados como objetos, evitando a escrita direta de comandos SQL.

### ✅ Vantagens do ORM:
- **Abstração do SQL**: permite manipular dados com código Python ao invés de comandos SQL.
- **Produtividade**: gera automaticamente queries complexas a partir de objetos.
- **Segurança**: reduz riscos como SQL Injection ao utilizar parâmetros preparados.

### 📦 Uso do SQLAlchemy

[SQLAlchemy](https://www.sqlalchemy.org/) é uma biblioteca ORM poderosa e popular no ecossistema Python. Suporta dois modos principais:

- **SQLAlchemy Core**: mais próximo do SQL, baseado em expressões.
- **SQLAlchemy ORM**: abstração completa, baseada em classes.

#### 📌 Exemplo com SQLAlchemy ORM:
```python
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Definindo a base e o modelo
Base = declarative_base()

class Usuario(Base):
    __tablename__ = 'usuarios'
    id = Column(Integer, primary_key=True)
    nome = Column(String)
    email = Column(String)

# Criando a conexão com o banco de dados
engine = create_engine('postgresql+psycopg2://usuario:senha@localhost:5432/meubanco')
Base.metadata.create_all(engine)

# Criando a sessão
Session = sessionmaker(bind=engine)
session = Session()

# Inserindo um novo usuário
novo_usuario = Usuario(nome='João', email='joao@email.com')
session.add(novo_usuario)
session.commit()
```

> ⚠️ **Nota:** Para usar com PostgreSQL, é necessário instalar o `psycopg2`:
> ```
> pip install psycopg2
> ```

---

🎯 **Conclusão**: O uso de ODBC e ORM em Python oferece duas abordagens diferentes para conectar e manipular bancos de dados. ODBC é ideal para aplicações que precisam de flexibilidade e compatibilidade com múltiplos bancos. Já o ORM com SQLAlchemy é mais indicado para projetos Python orientados a objetos que buscam produtividade e manutenção mais simples.
