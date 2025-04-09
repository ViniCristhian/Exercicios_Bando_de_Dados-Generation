-- Criação do Banco de Dados do E-Commerce e Usando ele
CREATE SCHEMA db_ecommerce;
USE db_ecommerce;

-- Criação da Tabela Produto
CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    data_vencimento DATE,
    
    PRIMARY KEY(id)
);

-- Isereindo os dados na tabela
INSERT INTO tb_produtos (nome, marca, preco, data_vencimento) VALUES
('Notebook Gamer', 'TechPower', 4999.99, '2026-01-15'),
('Smartphone Pro', 'PhoneStar', 2199.90, '2025-11-30'),
('Cadeira Gamer', 'ComfortPlay', 749.99, NULL),
('Headset Bluetooth', 'SoundMax', 299.90, '2025-08-20'),
('Monitor UltraWide', 'ScreenView', 1299.99, '2026-05-01'),
('Mouse Sem Fio', 'ClickTech', 149.50, NULL),
('Teclado Mecânico RGB', 'TypePro', 899.90, '2025-07-15'),
('Power Bank 20.000mAh', 'ChargeFast', 399.90, '2025-06-10');

-- Mostrando todos os produtos com o preço maior que 500
SELECT * FROM tb_produtos WHERE preco > 500;

-- Mostrando todos os produtos com o preço menor que 500
SELECT * FROM tb_produtos WHERE preco < 500;

-- Atualizando dados na tabela
UPDATE tb_produtos SET data_vencimento = '2028-05-30' WHERE id = 1;