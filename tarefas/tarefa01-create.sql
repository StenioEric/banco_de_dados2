-- Tabela: funcionario
CREATE TABLE funcionario (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    dt_nasc DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    cod_depto INT,
    -- FK: funcionário trabalha em um departamento
    FOREIGN KEY (cod_depto) REFERENCES departamento(codigo)
);

-- Tabela: departamento
CREATE TABLE departamento (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    cod_gerente INT,
    -- FK: gerente é um funcionário
    FOREIGN KEY (cod_gerente) REFERENCES funcionario(codigo)
);

-- Tabela: projeto
CREATE TABLE projeto (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    cod_depto INT,
    cod_responsavel INT,
    data_inicio DATE,
    data_fim DATE,
    -- FK: projeto pertence a um departamento
    FOREIGN KEY (cod_depto) REFERENCES departamento(codigo),
    -- FK: responsável é um funcionário
    FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo)
);

-- Tabela: atividade
CREATE TABLE atividade (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    cod_responsavel INT,
    data_inicio DATE,
    data_fim DATE,
    -- FK: responsável é um funcionário
    FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo)
);

-- Tabela: associação entre atividades e projetos
CREATE TABLE atividade_projeto (
    cod_projeto INT,
    cod_atividade INT,
    PRIMARY KEY (cod_projeto, cod_atividade),
    -- FK: atividade pertence a um projeto
    FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo),
    -- FK: atividade associada
    FOREIGN KEY (cod_atividade) REFERENCES atividade(codigo)
);
