-- ======================================================
-- CRIAÇÃO DO BANCO DE DADOS
-- ======================================================
CREATE DATABASE LocadoraVeiculos;
USE LocadoraVeiculos;

-- ======================================================
-- TABELA CLIENTE
-- ======================================================
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- ======================================================
-- TABELA VEÍCULO
-- ======================================================
CREATE TABLE Veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    categoria VARCHAR(50),      -- Ex: Popular, SUV, Caminhonete
    km_atual INT DEFAULT 0,
    status VARCHAR(20) DEFAULT 'Disponível'  -- Disponível, Alugado, Manutenção
);

-- ======================================================
-- TABELA ALUGUEL
-- ======================================================
CREATE TABLE Aluguel (
    id_aluguel INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_veiculo INT NOT NULL,
    data_retirada DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    valor_diaria DECIMAL(10,2) NOT NULL,
    valor_total DECIMAL(10,2),

    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);

-- ======================================================
-- TABELA MANUTENÇÃO
-- ======================================================
CREATE TABLE Manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT NOT NULL,
    tipo VARCHAR(100) NOT NULL,          -- Ex: Troca de óleo, Pneus, Revisão
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    custo DECIMAL(10,2),

    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);

-- ======================================================
-- INSERINDO DADOS INICIAIS
-- ======================================================

-- Clientes
INSERT INTO Cliente (nome, cpf, telefone, email) VALUES
('João Silva', '12345678900', '11987654321', 'joao@gmail.com'),
('Maria Santos', '98765432100', '11911112222', 'maria@gmail.com'),
('Carlos Pereira', '45678912300', '11955556666', 'carlos@gmail.com');

-- Veículos
INSERT INTO Veiculo (marca, modelo, ano, placa, categoria, km_atual) VALUES
('Fiat', 'Argo', 2022, 'ABC1D23', 'Popular', 15000),
('Volkswagen', 'T-Cross', 2021, 'BCD2E34', 'SUV', 28000),
('Chevrolet', 'Onix', 2020, 'CDE3F45', 'Popular', 32000);

-- Aluguéis
INSERT INTO Aluguel (id_cliente, id_veiculo, data_retirada, data_prevista_devolucao, valor_diaria)
VALUES 
(1, 1, '2025-12-01', '2025-12-05', 120.00),
(2, 2, '2025-12-02', '2025-12-10', 200.00);

-- Manutenções
INSERT INTO Manutencao (id_veiculo, tipo, descricao, data_inicio, custo)
VALUES
(3, 'Troca de Óleo', 'Troca de óleo e filtro', '2025-11-28', 180.00),
(2, 'Revisão Completa', 'Revisão de 30.000 km', '2025-11-20', 850.00);

