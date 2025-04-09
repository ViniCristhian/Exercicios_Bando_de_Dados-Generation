-- Criação do Banco de Dados
CREATE SCHEMA db_recuros_humanos;

-- Selecionando o Banco de Dados
USE db_recuros_humanos;

-- Criação da tabela de colaboradores
CREATE TABLE tb_colaboradores (
	cpf DECIMAL(11) NOT NULL UNIQUE,
    nome VARCHAR(256) NOT NULL,
    data_nascimento DATE NOT NULL,
    salario DECIMAL(8,2) NOT NULL,
    funcao VARCHAR(90) NOT NULL,
    setor VARCHAR(90),
    
    PRIMARY KEY(cpf)
);

-- Inserindo Dados da Tabela
INSERT INTO tb_coladoradores (cpf, nome, data_nascimento, salario, funcao, setor) 
	VALUE (12221352366, "Julia Lima", "2004-02-18", 4200.43, "Desenvolvedora Java Junior", "TI"),
	(89967745099, "Fabricio De Oliveira", "2001-03-29", 14200.43, "Desenvolvedor Java Pleno", "TI"),
    (00932267769, "Camillas Borges", "2001-02-22", 3200.43, "Faxineira", "Limpeza"),
    (89427276075, "José Algusto", "1990-10-15", 3200.43, "Faxineiro", "Limpeza"),
    (93796012790, "Jamille De Cezar", "2006-09-07", 1800.43, "Estagiaria", "RH"),
    (98896012430, "Jalimor Da Costa", "2006-01-17", 1750.44, "Estagiario", NULL),
    (98437033612, "Joséfa Manzano", "1980-08-14", 30300.45, "Desenvolvedora Java Senior", "TI");
    
-- Colaboradores com salário maior que R$ 2000
SELECT * FROM tb_colaboradores WHERE salario > 2000;

-- Colaboradores com salário menor que R$ 2000
SELECT * FROM tb_colaboradores WHERE salario < 2000;

-- Atualizando um colaborador
UPDATE tb_colaboradores SET setor = "Montagem" WHERE cpf = 98896012430;