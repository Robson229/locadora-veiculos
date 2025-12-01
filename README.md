# locadora-veiculos

Este projeto representa um minimundo de um sistema de locadora de veículos, modelado por meio de um banco de dados relacional em SQL.
O objetivo é fornecer uma estrutura de tabelas e relacionamentos essenciais para operações de aluguel, manutenção, controle de clientes e gestão da frota.

Entidades Principais
O sistema é composto por quatro entidades fundamentais:
1. Cliente
Armazena informações pessoais dos clientes que realizam aluguéis.
2. Veículo
Cadastro da frota de veículos disponíveis, alugados ou em manutenção.
3. Aluguel
Registro das operações de retirada e devolução de veículos pelos clientes.
4. Manutenção
Controle de manutenção preventiva e corretiva da frota.

Estrutura do Banco de Dados
O script inclui:
- Criação do banco LocadoraVeiculos
- Criação das tabelas:
-- Cliente
-- Veiculo
-- Aluguel
-- Manutenção
- Definição de chaves primárias e estrangeiras
- Restrições: UNIQUE, NOT NULL, DEFAULT
- Inserts iniciais para popular o banco

Relacionamentos
- Cliente 1:N Aluguel
  Um cliente pode realizar vários aluguéis.
- Veículo 1:N Aluguel
  Um veículo pode ser alugado diversas vezes.
- Veículo 1:N Manutenção
  Um veículo pode passar por várias manutenções.

Como Executar o Script
1. Abra seu SGBD (MySQL Workbench, DBeaver, phpMyAdmin ou outro).
2. Crie um novo script SQL.
3. Copie e cole o conteúdo do arquivo locadora.sql.
4. Execute o script completo ou por blocos.

Exemplos de Dados Inseridos
O script contém:
- 3 clientes cadastrados
- 3 veículos cadastrados
- 2 aluguéis registrados
- 2 manutenções registradas
Isso permite testar consultas e operações básicas desde o início.

