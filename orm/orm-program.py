from sqlalchemy import create_engine, Column, Integer, String, ForeignKey
from sqlalchemy.orm import declarative_base, relationship, sessionmaker

Base = declarative_base()

class Projeto(Base):
    __tablename__ = 'projeto'
    id_projeto = Column(Integer, primary_key=True)
    nome = Column(String)
    id_lider = Column(Integer)
    atividades = relationship("Atividade", back_populates="projeto")

class Atividade(Base):
    __tablename__ = 'atividade'
    id_atividade = Column(Integer, primary_key=True)
    descricao = Column(String)
    id_projeto = Column(Integer, ForeignKey('projeto.id_projeto'))
    projeto = relationship("Projeto", back_populates="atividades")

engine = create_engine("postgresql+psycopg2://atividades_user:atividades_pass@localhost:5432/AtividadesBD")
Session = sessionmaker(bind=engine)
session = Session()

# Inserir uma atividade
atividade = Atividade(descricao='Atividade ORM', id_projeto=1)
session.add(atividade)

# Atualizar o líder
projeto = session.query(Projeto).filter_by(id_projeto=1).first()
projeto.id_lider = 3

# Listar todos os projetos e atividades
projetos = session.query(Projeto).all()
for p in projetos:
    print(f"{p.nome}: {[a.descricao for a in p.atividades]}")

session.commit()
session.close()