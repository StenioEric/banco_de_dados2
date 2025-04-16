-- Inserindo dados na tabela departamento
INSERT INTO departamento (codigo, descricao, cod_gerente) VALUES
(1, 'Recursos Humanos', NULL),
(2, 'Tecnologia da Informação', NULL),
(3, 'Financeiro', NULL),
(4, 'Marketing', NULL),
(5, 'Logística', NULL);

-- Inserindo dados na tabela funcionario
INSERT INTO funcionario (codigo, nome, sexo, dt_nasc, salario, cod_depto) VALUES
(101, 'Ana Souza', 'F', '1990-05-10', 5000.00, 1),
(102, 'Carlos Lima', 'M', '1985-08-15', 7000.00, 2),
(103, 'Fernanda Costa', 'F', '1992-11-23', 6500.00, 3),
(104, 'Marcos Silva', 'M', '1988-02-14', 6000.00, 4),
(105, 'Juliana Pereira', 'F', '1995-07-19', 4800.00, 5);

-- Atualizando cod_gerente agora que temos funcionários cadastrados
UPDATE departamento SET cod_gerente = 101 WHERE codigo = 1;
UPDATE departamento SET cod_gerente = 102 WHERE codigo = 2;
UPDATE departamento SET cod_gerente = 103 WHERE codigo = 3;
UPDATE departamento SET cod_gerente = 104 WHERE codigo = 4;
UPDATE departamento SET cod_gerente = 105 WHERE codigo = 5;

-- Inserindo dados na tabela projeto
INSERT INTO projeto (codigo, nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
(201, 'Projeto RH Digital', 'Automatização de processos de RH', 1, 101, '2025-01-01', '2025-06-30'),
(202, 'Sistema Web', 'Desenvolvimento de um portal corporativo', 2, 102, '2025-02-15', '2025-08-15'),
(203, 'Controle Orçamentário', 'Revisão de gastos da empresa', 3, 103, '2025-03-01', '2025-09-30'),
(204, 'Campanha Publicitária', 'Nova campanha de marketing', 4, 104, '2025-01-20', '2025-05-20'),
(205, 'Rastreamento Logístico', 'Sistema de rastreio de entregas', 5, 105, '2025-04-01', '2025-10-01');

-- Inserindo dados na tabela atividade
INSERT INTO atividade (codigo, nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
(301, 'Levantamento de Requisitos', 'Identificação de necessidades', 102, '2025-02-01', '2025-02-10'),
(302, 'Design de Interface', 'Protótipos e wireframes', 102, '2025-02-11', '2025-03-05'),
(303, 'Implementação Backend', 'Programação do servidor', 102, '2025-03-06', '2025-04-15'),
(304, 'Análise Financeira', 'Estudo de custos', 103, '2025-03-10', '2025-04-10'),
(305, 'Planejamento de Campanha', 'Estratégias de divulgação', 104, '2025-01-22', '2025-02-15');

-- Inserindo dados na tabela atividade_projeto
INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
(202, 301),
(202, 302),
(202, 303),
(203, 304),
(204, 305);
