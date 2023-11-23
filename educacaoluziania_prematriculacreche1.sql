-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 23/11/2023 às 14:24
-- Versão do servidor: 5.7.44
-- Versão do PHP: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `educacaoluziania_prematriculacreche1`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acessos`
--

CREATE TABLE `acessos` (
  `id` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL,
  `chave` varchar(35) NOT NULL,
  `grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `acessos`
--

INSERT INTO `acessos` (`id`, `nome`, `chave`, `grupo`) VALUES
(2, 'Home', 'home', 0),
(4, 'Usuários', 'usuarios', 1),
(5, 'Leitores', 'leitores', 1),
(6, 'Livros', 'livros', 2),
(7, 'Categorias', 'categorias', 2),
(8, 'Cargos', 'cargos', 2),
(9, 'Locais', 'locais', 2),
(10, 'Editoras', 'editoras', 2),
(11, 'Grupos', 'grupos', 2),
(12, 'Acessos', 'acessos', 2),
(13, 'Empréstimos Ativos', 'emprestimos', 3),
(14, 'Lista de Devoluções', 'devolucoes', 3),
(15, 'Devoluções de Hoje', 'devolucoes_hoje', 3),
(16, 'Devoluções em Atraso', 'devolucoes_atraso', 3),
(17, 'Todos os Empréstimos', 'todos_emprestimos', 3),
(18, 'Configurações', 'config', 0),
(19, 'Solicitações', 'solicitacoes', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `cargos`
--

INSERT INTO `cargos` (`id`, `nome`) VALUES
(1, 'Administrador'),
(3, 'Solicitante Público');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(1, 'PRÉ I'),
(2, 'PRÉ II'),
(3, 'CRECHE I'),
(4, 'CRECHE II'),
(5, 'CRECHE III');

-- --------------------------------------------------------

--
-- Estrutura para tabela `config`
--

CREATE TABLE `config` (
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `icone` varchar(100) DEFAULT NULL,
  `logo_rel` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `marca_dagua` varchar(5) NOT NULL,
  `dias_entrega` int(11) NOT NULL,
  `instancia_api` varchar(50) DEFAULT NULL,
  `token_api` varchar(50) DEFAULT NULL,
  `api_whatsapp` varchar(5) NOT NULL,
  `emprestimos_leitor` int(11) DEFAULT NULL,
  `ativo` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `config`
--

INSERT INTO `config` (`nome`, `email`, `telefone`, `endereco`, `instagram`, `logo`, `icone`, `logo_rel`, `id`, `marca_dagua`, `dias_entrega`, `instancia_api`, `token_api`, `api_whatsapp`, `emprestimos_leitor`, `ativo`) VALUES
('EDUCAÇÃO INFANTIL', 'valterpcjr@gmail.com', '(61) 99286-5640', ' Rua João Paulo 58, Centro Luziânia - 72800-120', '', 'logo.png', 'icone.png', 'logo.jpg', 1, 'Sim', 366, '8MG021023075947OWN377', 'P5KB8-F5V-552N0', 'Sim', 1, 'Sim');

-- --------------------------------------------------------

--
-- Estrutura para tabela `editoras`
--

CREATE TABLE `editoras` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `editoras`
--

INSERT INTO `editoras` (`id`, `nome`) VALUES
(1, 'SMEL-Secretaria Municipal de Educação');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id` int(11) NOT NULL,
  `livro` int(11) NOT NULL,
  `leitor` int(11) NOT NULL,
  `data_emprestimo` date NOT NULL,
  `data_devolucao` date NOT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `funcionario` int(11) NOT NULL,
  `devolvido` varchar(5) NOT NULL,
  `hash` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupos`
--

CREATE TABLE `grupos` (
  `id` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `grupos`
--

INSERT INTO `grupos` (`id`, `nome`) VALUES
(1, 'Pessoas'),
(2, 'Cadastros'),
(3, 'Empréstimos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `leitores`
--

CREATE TABLE `leitores` (
  `id` int(11) NOT NULL,
  `nomeResp` varchar(150) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `data_cad` date NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `obs` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `subtitulo` varchar(100) DEFAULT NULL,
  `autor` varchar(50) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `editora` int(11) NOT NULL,
  `edicao` varchar(50) DEFAULT NULL,
  `categoria` int(11) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `local` int(11) NOT NULL,
  `status` varchar(25) NOT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `data_cad` date NOT NULL,
  `emprestimos` int(11) DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id`, `codigo`, `titulo`, `subtitulo`, `autor`, `ano`, `editora`, `edicao`, `categoria`, `foto`, `local`, `status`, `obs`, `data_cad`, `emprestimos`, `estoque`, `quantidade`) VALUES
(1, '1', 'CRECHE I - CMEB Maria de Nondas - CAIC', 'PARA CRECHE I', 'CMEB Maria de Nondas - CAIC', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 1, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 18, 18),
(2, '2', 'CRECHE I - CMEI Lucinda Leite', 'PARA CRECHE I', 'CMEI Lucinda Leite', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 2, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 18, 18),
(3, '3', 'CRECHE I - CMEI Aglaia Lima Costa', 'PARA CRECHE I', 'CMEI Aglaia Lima Costa', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 3, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 18, 18),
(4, '4', 'CRECHE I - CMEI Célia dos Santos Oliveira de Jesus', 'PARA CRECHE I', 'CMEI Célia dos Santos', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 4, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 18, 18),
(5, '5', 'CRECHE I - CMEI Dona Luzia Pereira dos Santos', 'PARA CRECHE I', 'CMEI Dona Luzia', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 5, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 18, 18),
(6, '6', 'CRECHE I - CMEI Dona Nenzica - Centro Luziânia', 'PARA CRECHE I', 'CMEI Dona Nenzica', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 6, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 18, 18),
(7, '7', 'CRECHE I - CMEI Antônio Sebastião da Silva', 'PARA CRECHE I', 'CMEI  Antônio Sebastião da Silva', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 7, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 18, 18),
(8, '8', 'CRECHE I - CMEI Espedita Furtado Vieira', 'PARA CRECHE I', 'CMEI  Espedita Furtado Vieira ', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 8, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 18, 18),
(9, '9', 'CRECHE I - CMEI José Antônio da Rocha', 'PARA CRECHE I', 'CMEI José Antônio da Rocha', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 9, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 18, 18),
(10, '10', 'CRECHE I - CEMEI Nélia de Almeida Rodrigues ', 'PARA CRECHE I', 'CEMEI Nélia de Almeida Rodrigues ', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 10, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 18, 18),
(11, '11', 'CRECHE I - Instituto de Educação Estrela de Belém', 'PARA CRECHE I', 'Instituto de Educação Estrela de Belém', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 11, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 18, 18),
(12, '12', 'CRECHE I - CMEI Profª Lydia Heringer Emerick ', 'PARA CRECHE I', 'CMEI Profª Lydia Heringer Emerick', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 12, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 18, 18),
(13, '13', 'CRECHE I - CMEI Nilza Ribeiro de Queiroz', 'PARA CRECHE I', 'CMEI Nilza Ribeiro de Queiroz ', 2024, 1, 'VAGAS CRECHE I', 3, 'sem-foto.jpg', 13, 'Disponível', 'CRECHE I - SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATÉ 31/03/2024', '2023-11-23', NULL, 36, 36);

-- --------------------------------------------------------

--
-- Estrutura para tabela `locais`
--

CREATE TABLE `locais` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `locais`
--

INSERT INTO `locais` (`id`, `nome`) VALUES
(1, 'CMEB  Maria de Nondas - CAIC'),
(2, 'CMEB Maria Lucinda Leite – Parque Industrial Luziânia '),
(3, 'CMEI Aglaia Lima Costa – Setor Mandu II'),
(4, 'CMEI Célia dos Santos Oliveira de Jesus – Parque Estrela Dalva IX Jardim Ingá'),
(5, 'CMEI Dona Luzia Pereira dos Santos – Jardim Brasília Sul'),
(6, 'CMEI Dona Nenzica – Centro Luziânia'),
(7, 'CMEI  Antônio Sebastião da Silva – Parque Estrela Dalva IX Jardim Ingá'),
(8, 'CMEI  Espedita Furtado Vieira – Parque Mingone II'),
(9, 'CMEI José Antônio da Rocha – Parque Estrela Dalva X Jardim Ingá'),
(10, 'CEMEI Nélia de Almeida Rodrigues – Parque Estrela Dalva II'),
(11, 'Instituto de Educação Estrela de Belém -  Parque Estrela Dalva II'),
(12, 'CMEI Profª Lydia Heringer Emerick – Setor Fumal'),
(13, 'CMEI Nilza Ribeiro de Queiroz – Pró Lote Jardim Ingá');

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacoes`
--

CREATE TABLE `solicitacoes` (
  `id` int(11) NOT NULL,
  `leitor` int(11) NOT NULL,
  `livro` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `senha_crip` varchar(130) NOT NULL,
  `nivel` varchar(25) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `senha_crip`, `nivel`, `ativo`, `telefone`, `endereco`, `foto`, `data`) VALUES
(1, 'Valter Júnior', 'valterpcjr@gmail.com', '123', '202cb962ac59075b964b07152d234b70', 'Administrador', 'Sim', '(61) 99679-9844', 'Rua Dona Geralda Quadra 10, Casa 14 - SHIS - Luziânia-GO', '30-08-2023-10-03-07-pasta_image.png', '2023-02-27'),
(2, 'Solicitante Público', 'solicitante@educacao.luziania.go.gov.br', '123', '202cb962ac59075b964b07152d234b70', 'Solicitante Público', 'Sim', '(61) 33906-3482', ' Rua João Paulo 58, Centro Luziânia - 72800-120', 'sem-foto.jpg', '2023-09-26'),
(3, 'Divisão Infantil', 'infantil@educacao.luziania.go.gov.br', '123', '202cb962ac59075b964b07152d234b70', 'Administrador', 'Sim', '(61) 99286-5640', 'SMEL', 'sem-foto.jpg', '2023-11-22');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios_permissoes`
--

CREATE TABLE `usuarios_permissoes` (
  `id` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `permissao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `usuarios_permissoes`
--

INSERT INTO `usuarios_permissoes` (`id`, `usuario`, `permissao`) VALUES
(49, 19, 2),
(50, 27, 2),
(53, 27, 5),
(54, 27, 6),
(55, 27, 10),
(56, 27, 7),
(57, 27, 9),
(58, 27, 13),
(59, 27, 14),
(60, 27, 15),
(61, 27, 16),
(62, 27, 17),
(63, 28, 2),
(65, 28, 5),
(66, 28, 6),
(67, 28, 7),
(68, 28, 9),
(69, 28, 10),
(70, 28, 13),
(71, 28, 14),
(72, 28, 15),
(73, 28, 16),
(74, 28, 17),
(75, 29, 2),
(76, 29, 5),
(77, 29, 6),
(78, 29, 7),
(79, 29, 9),
(80, 29, 10),
(81, 29, 13),
(82, 29, 17),
(83, 29, 14),
(84, 29, 15),
(85, 29, 16),
(121, 30, 5),
(122, 30, 6),
(123, 30, 7),
(125, 30, 9),
(126, 30, 10),
(129, 30, 13),
(130, 30, 14),
(131, 30, 15),
(132, 30, 16),
(133, 30, 17),
(136, 30, 2),
(137, 31, 5),
(138, 2, 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `editoras`
--
ALTER TABLE `editoras`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `leitores`
--
ALTER TABLE `leitores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `locais`
--
ALTER TABLE `locais`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `solicitacoes`
--
ALTER TABLE `solicitacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios_permissoes`
--
ALTER TABLE `usuarios_permissoes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `editoras`
--
ALTER TABLE `editoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `leitores`
--
ALTER TABLE `leitores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `locais`
--
ALTER TABLE `locais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `solicitacoes`
--
ALTER TABLE `solicitacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios_permissoes`
--
ALTER TABLE `usuarios_permissoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
