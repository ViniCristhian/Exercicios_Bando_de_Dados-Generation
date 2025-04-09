-- Criação do bando de dados da escola
CREATE SCHEMA db_escola;

-- Criação da tabela alunos com seus atributos
CREATE TABLE tb_alunos(
	rm DECIMAL(11),
    nome VARCHAR(120) NOT NULL,
    data_nascimento DATE NOT NULL,
    nota_final DECIMAL(3,1) NOT NULL,
    escola_anterior VARCHAR(150),
    
    PRIMARY KEY(rm)
);

-- Inserindo dados na tabela alunos
INSERT INTO tb_alunos (rm, nome, data_nascimento, nota_final, escola_anterior) VALUES
(20230000001, 'Ana Maria Silva', '2010-05-15', 10.0, 'Escola Fundamental Aurora'),
(20230000002, 'Lucas Pereira Santos', '2009-11-23', 7.8, 'Escola Municipal Nova Vida'),
(20230000003, 'Fernanda Costa', '2010-03-10', 9.0, 'Colégio Águia Branca'),
(20230000004, 'Ricardo Almeida', '2008-07-07', 6.7, 'Escola Estadual Monte Azul'),
(20230000005, 'Beatriz Oliveira', '2011-01-25', 6.9, NULL),
(20230000006, 'João Vitor Souza', '2010-09-12', 7.5, 'Escola Integrada São Paulo'),
(20230000007, 'Carolina Mendes', '2009-06-30', 9.3, 'Colégio Estrela do Norte'),
(20230000008, 'Guilherme Torres', '2011-04-18', 5.5, 'Escola Municipal Jardim das Flores');

-- Mostrando todos os alunos com a nota maior que 7.0
SELECT * FROM tb_alunos WHERE nota_final > 7;

-- Mostrando todos os alunos com a nota menor que 7.0
SELECT * FROM tb_alunos WHERE nota_final < 7;

-- Atualizando dados dos alunos
UPDATE tb_alunos SET data_nascimento = '2022-05-30' WHERE rm = 20230000005;