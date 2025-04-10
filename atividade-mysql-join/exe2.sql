CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE IF NOT EXISTS tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT 
);

CREATE TABLE IF NOT EXISTS tb_pizzas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL, 
    preco DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(20) NOT NULL, 
    ingredientes TEXT NOT NULL, 
    categoria_id BIGINT, 
    
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias (id)
);

INSERT INTO tb_categorias (nome, descricao)
VALUES
('Salgada', 'Pizzas tradicionais com sabores salgados'),
('Doce', 'Pizzas doces para sobremesas'),
('Vegetariana', 'Pizzas sem carne, com ingredientes frescos'),
('Vegana', 'Pizzas feitas com ingredientes de origem vegetal'),
('Especial', 'Pizzas exclusivas da casa');

INSERT INTO tb_pizzas (nome, preco, tamanho, ingredientes, categoria_id)
VALUES
('Margarita', 40.00, 'Média', 'Molho de tomate, mussarela, manjericão', 1),
('Calabresa', 35.00, 'Grande', 'Molho de tomate, calabresa, cebola, mussarela', 1),
('Chocolate com Morango', 60.00, 'Pequena', 'Chocolate, morango', 2),
('Vegetariana', 45.00, 'Média', 'Molho de tomate, mussarela, tomate, cebola, pimentão, azeitona', 3),
('Vegana', 50.00, 'Grande', 'Queijo vegano, tomate, pimentão, cogumelos', 4),
('Banana com Canela', 35.00, 'Pequena', 'Banana, canela, leite condensado', 2),
('Frango Catupiry', 55.00, 'Grande', 'Molho de tomate, frango desfiado, catupiry', 5),
('Quatro Queijos', 50.00, 'Média', 'Molho de tomate, mussarela, provolone, parmesão, gorgonzola', 1);

-- Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias. 
SELECT tb_pizzas.id, tb_pizzas.nome, tb_pizzas.preco, tb_categorias.nome AS tipo FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica (Exemplo: Todas as pizzas que são doce).
SELECT tb_pizzas.id, tb_pizzas.nome, tb_pizzas.preco, tb_categorias.nome AS tipo FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = 'Doce';