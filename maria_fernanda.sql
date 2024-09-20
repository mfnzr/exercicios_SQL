-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 20/09/2024 às 18:51
-- Versão do servidor: 9.0.1
-- Versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `maria_fernanda`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `exercicio_funcionarios`
--

CREATE TABLE `exercicio_funcionarios` (
  `nome` varchar(100) NOT NULL,
  `funcao` varchar(100) NOT NULL,
  `salario` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `exercicio_funcionarios`
--

INSERT INTO `exercicio_funcionarios` (`nome`, `funcao`, `salario`) VALUES
('Eduarda', 'Desenvolvedora Back-end', '7.654,32'),
('Julia', 'Desenvolvedora Front-end', '6.543,21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_cidade`
--

CREATE TABLE `tabela_cidade` (
  `codCidade` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `siglaEstado` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tabela_cidade`
--

INSERT INTO `tabela_cidade` (`codCidade`, `nome`, `siglaEstado`) VALUES
(1, 'Guarapuava', 'PR'),
(2, 'Florianópolis', 'SC'),
(3, 'São Paulo', 'SP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_classe`
--

CREATE TABLE `tabela_classe` (
  `codClasse` int NOT NULL,
  `sigla` varchar(12) DEFAULT NULL,
  `nome` varchar(40) NOT NULL,
  `descricaoo` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_cliente`
--

CREATE TABLE `tabela_cliente` (
  `codCliente` int NOT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `codCidade` int NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `dataCadastro` date DEFAULT (curdate()),
  `cep` char(8) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_clienteFisico`
--

CREATE TABLE `tabela_clienteFisico` (
  `codCliente` int DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `rg` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_clienteJuridico`
--

CREATE TABLE `tabela_clienteJuridico` (
  `codCliente` int NOT NULL,
  `nomeFantasia` varchar(80) DEFAULT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `ie` varchar(20) NOT NULL,
  `cgc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_departamento`
--

CREATE TABLE `tabela_departamento` (
  `codDepartamento` int NOT NULL,
  `nome` varchar(40) NOT NULL,
  `descricaoFuncional` varchar(100) DEFAULT NULL,
  `localizacao` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tabela_departamento`
--

INSERT INTO `tabela_departamento` (`codDepartamento`, `nome`, `descricaoFuncional`, `localizacao`) VALUES
(1, 'JD', 'Jurídico', 'Predio 3C, Sala 2'),
(2, 'CM', 'Comercial', 'Predio 3C, Sala 3'),
(4, 'AM', 'Jurídico', 'Predio 3C, Sala 2'),
(7, 'PD', 'Produto', 'Predio 3C, Sala 1'),
(8, 'MK', 'Marketing', 'Predio 3C, Sala 4');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_estado`
--

CREATE TABLE `tabela_estado` (
  `siglaEstado` char(2) DEFAULT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tabela_estado`
--

INSERT INTO `tabela_estado` (`siglaEstado`, `nome`) VALUES
('PR', 'Paraná'),
('SC', 'Santa Catarina'),
('AC', 'ACRE'),
('SP', 'SÃO PAULO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_fornecedor`
--

CREATE TABLE `tabela_fornecedor` (
  `codFornecedor` int NOT NULL,
  `nomeFantasia` varchar(80) DEFAULT NULL,
  `razaoSocial` varchar(80) DEFAULT NULL,
  `ie` varchar(20) NOT NULL,
  `cgc` varchar(20) NOT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `codCidade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_itemPedido`
--

CREATE TABLE `tabela_itemPedido` (
  `codPedido` int NOT NULL,
  `codProduto` int NOT NULL,
  `quantidade` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_itemVenda`
--

CREATE TABLE `tabela_itemVenda` (
  `codVenda` int NOT NULL,
  `codProduto` int NOT NULL,
  `numeroLote` int NOT NULL,
  `quantidade` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_pedido`
--

CREATE TABLE `tabela_pedido` (
  `codPedido` int NOT NULL,
  `dataRealizacao` date DEFAULT (curdate()),
  `dataEntrega` date DEFAULT NULL,
  `codFornecedor` int NOT NULL,
  `valor` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_produto`
--

CREATE TABLE `tabela_produto` (
  `codProduto` int NOT NULL,
  `descricao` varchar(40) NOT NULL,
  `unidadeMedida` char(2) DEFAULT NULL,
  `embalagem` varchar(15) DEFAULT (_utf8mb4'Fardo'),
  `codClasse` int DEFAULT NULL,
  `precoVenda` decimal(14,2) DEFAULT NULL,
  `estoqueMinimo` decimal(14,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_produtoLote`
--

CREATE TABLE `tabela_produtoLote` (
  `codProduto` int NOT NULL,
  `numeroLote` int NOT NULL,
  `quantidadeAdquirida` decimal(14,2) DEFAULT NULL,
  `quantidadeVendida` decimal(14,2) DEFAULT NULL,
  `precoCusto` decimal(14,2) DEFAULT NULL,
  `dataValidade` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_venda`
--

CREATE TABLE `tabela_venda` (
  `codVenda` int NOT NULL,
  `codCliente` int NOT NULL,
  `codVendedor` int NOT NULL,
  `dataVenda` date DEFAULT (curdate()),
  `enderecoEntrega` varchar(60) DEFAULT NULL,
  `situacao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_vendedor1`
--

CREATE TABLE `tabela_vendedor1` (
  `codVendedor` int NOT NULL,
  `nome` varchar(60) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `codCidade` int DEFAULT NULL,
  `dataContratacao` date DEFAULT (curdate()),
  `codDepartamento` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_vendedor2`
--

CREATE TABLE `tabela_vendedor2` (
  `codVendedor` int NOT NULL,
  `nome` varchar(60) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `codCidade` int DEFAULT NULL,
  `dataContratacao` date DEFAULT (curdate()),
  `codDepartamento` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `exercicio_funcionarios`
--
ALTER TABLE `exercicio_funcionarios`
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `tabela_cidade`
--
ALTER TABLE `tabela_cidade`
  ADD PRIMARY KEY (`codCidade`);

--
-- Índices de tabela `tabela_classe`
--
ALTER TABLE `tabela_classe`
  ADD PRIMARY KEY (`codClasse`);

--
-- Índices de tabela `tabela_cliente`
--
ALTER TABLE `tabela_cliente`
  ADD PRIMARY KEY (`codCliente`);

--
-- Índices de tabela `tabela_clienteFisico`
--
ALTER TABLE `tabela_clienteFisico`
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `codCliente` (`codCliente`);

--
-- Índices de tabela `tabela_clienteJuridico`
--
ALTER TABLE `tabela_clienteJuridico`
  ADD PRIMARY KEY (`codCliente`),
  ADD UNIQUE KEY `razaoSocial` (`razaoSocial`),
  ADD UNIQUE KEY `ie` (`ie`),
  ADD UNIQUE KEY `cgc` (`cgc`),
  ADD UNIQUE KEY `nomeFantasia` (`nomeFantasia`);

--
-- Índices de tabela `tabela_departamento`
--
ALTER TABLE `tabela_departamento`
  ADD PRIMARY KEY (`codDepartamento`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `tabela_itemVenda`
--
ALTER TABLE `tabela_itemVenda`
  ADD UNIQUE KEY `codProduto` (`codProduto`);

--
-- Índices de tabela `tabela_produto`
--
ALTER TABLE `tabela_produto`
  ADD PRIMARY KEY (`codProduto`),
  ADD UNIQUE KEY `codClasse` (`codClasse`);

--
-- Índices de tabela `tabela_produtoLote`
--
ALTER TABLE `tabela_produtoLote`
  ADD UNIQUE KEY `codProduto` (`codProduto`),
  ADD UNIQUE KEY `numeroLote` (`numeroLote`);

--
-- Índices de tabela `tabela_venda`
--
ALTER TABLE `tabela_venda`
  ADD UNIQUE KEY `codVenda` (`codVenda`),
  ADD UNIQUE KEY `codCliente` (`codCliente`),
  ADD UNIQUE KEY `codVendedor` (`codVendedor`);

--
-- Índices de tabela `tabela_vendedor1`
--
ALTER TABLE `tabela_vendedor1`
  ADD PRIMARY KEY (`codVendedor`);

--
-- Índices de tabela `tabela_vendedor2`
--
ALTER TABLE `tabela_vendedor2`
  ADD PRIMARY KEY (`codVendedor`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `codCidade` (`codCidade`),
  ADD UNIQUE KEY `codDepartamento` (`codDepartamento`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tabela_cidade`
--
ALTER TABLE `tabela_cidade`
  MODIFY `codCidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tabela_classe`
--
ALTER TABLE `tabela_classe`
  MODIFY `codClasse` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tabela_cliente`
--
ALTER TABLE `tabela_cliente`
  MODIFY `codCliente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tabela_departamento`
--
ALTER TABLE `tabela_departamento`
  MODIFY `codDepartamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tabela_produto`
--
ALTER TABLE `tabela_produto`
  MODIFY `codProduto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tabela_vendedor1`
--
ALTER TABLE `tabela_vendedor1`
  MODIFY `codVendedor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tabela_vendedor2`
--
ALTER TABLE `tabela_vendedor2`
  MODIFY `codVendedor` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
