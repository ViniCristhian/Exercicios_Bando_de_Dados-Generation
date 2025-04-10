CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    validade DATE,
    categoria_id BIGINT,
    
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias (id)
);

INSERT INTO tb_categorias (nome, descricao)
VALUES
('Medicamentos', 'Produtos para tratamento de doenças e condições de saúde'),
('Cosméticos', 'Produtos para cuidados pessoais e beleza'),
('Suplementos', 'Produtos para nutrição e bem-estar'),
('Higiene', 'Produtos para higiene pessoal e limpeza'),
('Infantil', 'Produtos voltados para cuidados com crianças');

INSERT INTO tb_produtos (nome, preco, quantidade, validade, categoria_id)
VALUES
('Paracetamol', 15.00, 100, '2025-12-31', 1),
('Creme Hidratante', 55.00, 50, '2024-06-30', 2),
('Vitamina C', 60.00, 200, '2025-03-15', 3),
('Sabonete Líquido', 25.00, 150, '2024-09-01', 4),
('Fralda Infantil', 40.00, 300, '2025-01-20', 5),
('Shampoo Anticaspa', 70.00, 80, '2024-11-10', 2),
('Ômega 3', 85.00, 120, '2025-07-25', 3),
('Desodorante', 30.00, 200, '2024-08-15', 4);

-- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT tb_produtos.id, tb_produtos.nome, tb_produtos.preco, tb_categorias.nome FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria cosméticos).
SELECT tb_produtos.id, tb_produtos.nome, tb_produtos.preco, tb_categorias.nome FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE tb_categorias.nome = 'Cosméticos';