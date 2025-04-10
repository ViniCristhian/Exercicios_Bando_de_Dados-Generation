CREATE DATABASE IF NOT EXISTS db_generation_game_online;

CREATE TABLE IF NOT EXISTS tb_personagens(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    nivel BIGINT(3) DEFAULT(1),
    defese BIGINt(6) NOT NULL,
    ataque BIGINT(6) NOT NULL,
    classe_id BIGINT,
    
    FOREIGN KEY (classe_id) REFERENCES tb_classes (id)
);

CREATE TABLE tb_classes(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    defesa_adicional DECIMAL(3)
);

INSERT INTO tb_classes (nome, defesa_adicional)
VALUES 
('Guerreiro', 15),
('Mago', NULL),
('Arqueiro', 8),
('Ladino', NULL),
('Paladino', 20);

INSERT INTO tb_personagens (nome, nivel, defese, ataque, classe_id)
VALUES
('Arthas', null, 50, 70, 1), -- Guerreiro
('Gandalf', 150, 333, 3455, 2), -- Mago
('Legolas', 230, 450, 5500, 3), -- Arqueiro
('Robin', 90, 85, 450, 4), -- Ladino
('Uther', 12, 60, 75, 5), -- Paladino
('Sylvanas', 142, 299, 1230, 3), -- Arqueiro
('Jaina', 135, 232, 900, 2), -- Mago
('Varian', 14, 55, 95, 1); -- Guerreiro

-- 6 - Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.
SELECT * FROM tb_personagens WHERE ataque > 2000;

-- 7 - Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
SELECT * FROM tb_personagens WHERE ataque BETWEEN 1000 AND 2000;

-- 8 - Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
SELECT * FROM tb_personagens WHERE nome LIKE '%c%';

-- 9 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
SELECT * FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id;

-- 10 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).
SELECT * FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classe_id = 3 AND tb_classes.id = 3;