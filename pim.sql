/*
Navicat MySQL Data Transfer

Source Server         : pedro
Source Server Version : 50744
Source Host           : localhost:3306
Source Database       : pim

Target Server Type    : MYSQL
Target Server Version : 50744
File Encoding         : 65001

Date: 2026-10-22 00:17:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `caixa`
-- ----------------------------
DROP TABLE IF EXISTS `caixa`;
CREATE TABLE `caixa` (
  `id_caixa` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `data_abertura` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_abertura` decimal(12,2) NOT NULL DEFAULT '0.00',
  `data_fechamento` datetime DEFAULT NULL,
  `valor_fechamento` decimal(12,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_caixa`),
  KEY `usuario` (`id_usuario`),
  CONSTRAINT `caixa_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of caixa
-- ----------------------------
INSERT INTO `caixa` VALUES ('1', '1', '2026-10-05 19:42:08', '100.00', '2026-10-05 19:42:56', '0.00', '0');
INSERT INTO `caixa` VALUES ('2', '1', '2026-10-05 19:43:25', '100.00', '2026-10-05 19:42:56', '0.00', '0');
INSERT INTO `caixa` VALUES ('3', '1', '2026-10-05 20:18:50', '100.00', '2026-10-05 21:45:45', '190.00', '0');
INSERT INTO `caixa` VALUES ('4', '1', '2026-10-05 21:59:39', '100.00', '2026-10-05 21:59:46', '100.00', '0');
INSERT INTO `caixa` VALUES ('5', '1', '2026-10-05 22:03:05', '100.00', '2026-10-05 22:03:08', '100.00', '0');
INSERT INTO `caixa` VALUES ('6', '1', '2026-10-05 22:06:57', '100.00', '2026-10-05 22:07:29', '100.00', '0');
INSERT INTO `caixa` VALUES ('7', '1', '2026-10-05 22:15:03', '100.00', '2026-10-14 21:42:52', '100.00', '0');
INSERT INTO `caixa` VALUES ('8', '1', '2026-10-14 21:42:56', '100.00', '2026-10-22 21:42:52', '100.00', '0');
INSERT INTO `caixa` VALUES ('9', '5', '2026-10-15 21:42:10', '100.00', '2026-10-21 21:46:42', '100.00', '0');
INSERT INTO `caixa` VALUES ('10', '5', '2026-10-21 21:55:49', '100.00', '2026-10-22 00:16:16', '17.00', '0');
INSERT INTO `caixa` VALUES ('11', '5', '2026-10-22 00:16:25', '110.00', null, null, '1');

-- ----------------------------
-- Table structure for `caixa_movimentacao`
-- ----------------------------
DROP TABLE IF EXISTS `caixa_movimentacao`;
CREATE TABLE `caixa_movimentacao` (
  `id_movimentacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_caixa` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` decimal(12,2) NOT NULL,
  `data_movimentacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_movimentacao`),
  KEY `caixa` (`id_caixa`),
  CONSTRAINT `movimentacao_caixa` FOREIGN KEY (`id_caixa`) REFERENCES `caixa` (`id_caixa`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of caixa_movimentacao
-- ----------------------------
INSERT INTO `caixa_movimentacao` VALUES ('1', '2', '1', 'Venda #1', '180.00', '2026-10-05 19:45:12');
INSERT INTO `caixa_movimentacao` VALUES ('2', '2', '2', 'Estorno da Venda #1', '180.00', '2026-10-05 19:47:12');
INSERT INTO `caixa_movimentacao` VALUES ('3', '3', '1', 'Venda #2', '90.00', '2026-10-05 20:45:53');
INSERT INTO `caixa_movimentacao` VALUES ('4', '3', '1', 'Venda #3', '106.30', '2026-10-05 21:01:40');
INSERT INTO `caixa_movimentacao` VALUES ('5', '3', '1', 'Venda #4', '90.00', '2026-10-05 21:22:50');
INSERT INTO `caixa_movimentacao` VALUES ('6', '3', '2', 'Estorno da Venda #4', '90.00', '2026-10-05 21:23:02');
INSERT INTO `caixa_movimentacao` VALUES ('7', '3', '2', 'Estorno da Venda #3', '106.30', '2026-10-05 21:23:04');
INSERT INTO `caixa_movimentacao` VALUES ('8', '3', '2', 'Estorno da Venda #2', '90.00', '2026-10-05 21:23:05');
INSERT INTO `caixa_movimentacao` VALUES ('9', '3', '1', 'Venda #5', '90.00', '2026-10-05 21:23:16');
INSERT INTO `caixa_movimentacao` VALUES ('10', '3', '1', 'Venda #6', '90.00', '2026-10-05 21:23:43');
INSERT INTO `caixa_movimentacao` VALUES ('11', '3', '2', 'Estorno da Venda #6', '90.00', '2026-10-05 21:25:22');
INSERT INTO `caixa_movimentacao` VALUES ('12', '3', '2', 'Estorno da Venda #5', '90.00', '2026-10-05 21:25:23');
INSERT INTO `caixa_movimentacao` VALUES ('13', '3', '1', 'Venda #7', '90.00', '2026-10-05 21:26:41');
INSERT INTO `caixa_movimentacao` VALUES ('14', '6', '1', 'Venda #8', '90.00', '2026-10-05 22:07:20');
INSERT INTO `caixa_movimentacao` VALUES ('15', '6', '2', 'Estorno da Venda #8', '90.00', '2026-10-05 22:07:24');
INSERT INTO `caixa_movimentacao` VALUES ('16', '7', '1', 'Venda #9', '11.00', '2026-10-05 22:15:20');
INSERT INTO `caixa_movimentacao` VALUES ('17', '7', '1', 'Venda #10', '10.00', '2026-10-05 22:15:30');
INSERT INTO `caixa_movimentacao` VALUES ('18', '7', '2', 'Estorno da Venda #10', '10.00', '2026-10-05 22:15:58');
INSERT INTO `caixa_movimentacao` VALUES ('19', '7', '2', 'Estorno da Venda #9', '11.00', '2026-10-05 22:15:59');
INSERT INTO `caixa_movimentacao` VALUES ('20', '8', '1', 'Venda #11', '12.00', '2026-10-14 21:55:17');
INSERT INTO `caixa_movimentacao` VALUES ('21', '8', '2', 'Estorno da Venda #11', '12.00', '2026-10-14 21:55:28');
INSERT INTO `caixa_movimentacao` VALUES ('22', '9', '1', 'Venda #12', '90.00', '2026-10-15 21:42:21');
INSERT INTO `caixa_movimentacao` VALUES ('23', '9', '1', 'Venda #13', '11.00', '2026-10-20 21:29:54');
INSERT INTO `caixa_movimentacao` VALUES ('24', '9', '2', 'Estorno da Venda #13', '11.00', '2026-10-20 21:30:00');
INSERT INTO `caixa_movimentacao` VALUES ('25', '9', '1', 'Venda #14', '10.00', '2026-10-20 21:30:46');
INSERT INTO `caixa_movimentacao` VALUES ('26', '10', '1', 'Venda #15', '12.00', '2026-10-21 21:55:59');
INSERT INTO `caixa_movimentacao` VALUES ('27', '10', '1', 'Venda #16', '11.00', '2026-10-21 23:41:23');
INSERT INTO `caixa_movimentacao` VALUES ('28', '10', '2', 'Estorno da Venda #16', '11.00', '2026-10-21 23:41:42');
INSERT INTO `caixa_movimentacao` VALUES ('29', '9', '2', 'Estorno da Venda #14', '10.00', '2026-10-21 23:51:33');
INSERT INTO `caixa_movimentacao` VALUES ('30', '10', '1', 'Venda #17', '28.90', '2026-10-22 00:16:10');
INSERT INTO `caixa_movimentacao` VALUES ('31', '10', '2', 'Estorno da Venda #17', '28.90', '2026-10-22 00:16:30');

-- ----------------------------
-- Table structure for `classe`
-- ----------------------------
DROP TABLE IF EXISTS `classe`;
CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL AUTO_INCREMENT,
  `nome_classe` varchar(255) DEFAULT NULL,
  `ativo` char(255) DEFAULT NULL,
  `desconto` int(11) DEFAULT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao` datetime DEFAULT NULL,
  `data_inativacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_classe`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of classe
-- ----------------------------
INSERT INTO `classe` VALUES ('1', 'testepao', 'S', '10', '2026-10-21 22:23:24', '2026-10-21 22:43:15', null);
INSERT INTO `classe` VALUES ('2', 'ai ai ai', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('3', 'teste', 'S', '50', '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('4', 'Higiene Pessoal', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('5', 'Produtos de Limpeza', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('6', 'Frios e Laticínios', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('7', 'Carnes', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('8', 'Hortifruti', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('9', 'Padaria', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('10', 'Massas', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('11', 'Enlatados', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('12', 'Condimentos', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('13', 'Doces e Chocolates', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('14', 'Cereais', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('15', 'Produtos para Bebê', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('16', 'Papelaria', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('17', 'Utilidades Domésticas', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('18', 'Pet Shop', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('19', 'Higiene e Cuidados', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('20', 'Diversos', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('21', 'Alimentos', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('22', 'Bebidas', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('23', 'Biscoitos', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('24', 'lucas', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('25', 'dota2', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('26', '3 mangos 2 tangos', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('27', 'TESTE CHAVES', 'S', null, '2026-10-21 22:23:24', null, null);
INSERT INTO `classe` VALUES ('28', 'TESTE DATA  HORA SELOCO', 'N', null, '2026-10-21 22:33:11', '2026-10-21 22:38:21', '2026-10-21 22:38:24');

-- ----------------------------
-- Table structure for `formas_pagamento`
-- ----------------------------
DROP TABLE IF EXISTS `formas_pagamento`;
CREATE TABLE `formas_pagamento` (
  `id_forma_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `nome_forma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_forma_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of formas_pagamento
-- ----------------------------
INSERT INTO `formas_pagamento` VALUES ('1', 'DINHEIRO');
INSERT INTO `formas_pagamento` VALUES ('2', 'PIX');
INSERT INTO `formas_pagamento` VALUES ('3', 'CREDITO');
INSERT INTO `formas_pagamento` VALUES ('4', 'DEBITO');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `acao` varchar(50) NOT NULL,
  `tabela` varchar(100) NOT NULL,
  `id_registro` int(11) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `data_log` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`),
  KEY `usuario` (`id_usuario`),
  CONSTRAINT `log_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '1', 'CRIAR', 'produtos', '1', 'Produto \'arroz\' cadastrado.', '2026-10-03 21:42:09');
INSERT INTO `log` VALUES ('2', '1', 'INATIVAR', 'produtos', '1', 'Produto ID 1 inativado.', '2026-10-03 21:50:19');
INSERT INTO `log` VALUES ('3', '1', 'ATIVAR', 'produtos', '1', 'Produto ID 1 ativado.', '2026-10-03 21:50:20');
INSERT INTO `log` VALUES ('4', '1', 'INATIVAR', 'produtos', '1', 'Produto ID 1 inativado.', '2026-10-03 21:50:22');
INSERT INTO `log` VALUES ('5', '1', 'ATIVAR', 'produtos', '1', 'Produto ID 1 ativado.', '2026-10-03 21:50:45');
INSERT INTO `log` VALUES ('6', '1', 'ALTERAR', 'produtos', '54', 'Produto \'Sabonete 90g\' alterado.', '2026-10-03 21:52:29');
INSERT INTO `log` VALUES ('7', '1', 'ALTERAR', 'produtos', '54', 'Produto \'Sabonete 90g\' alterado.', '2026-10-03 21:53:17');
INSERT INTO `log` VALUES ('8', '1', 'INATIVAR', 'produtos', '1', 'Produto ID 1 inativado.', '2026-10-04 16:43:26');
INSERT INTO `log` VALUES ('9', '1', 'ATIVAR', 'produtos', '1', 'Produto ID 1 ativado.', '2026-10-04 16:43:27');
INSERT INTO `log` VALUES ('10', '1', 'INATIVAR', 'produtos', '1', 'Produto ID 1 inativado.', '2026-10-04 16:43:27');
INSERT INTO `log` VALUES ('11', '1', 'ATIVAR', 'produtos', '1', 'Produto ID 1 ativado.', '2026-10-04 16:43:28');
INSERT INTO `log` VALUES ('12', '1', 'ALTERAR', 'produtos', '53', 'Produto \'Suco de Laranja 1L\' alterado para \'Suco de Laranja 1L\'.', '2026-10-04 18:34:54');
INSERT INTO `log` VALUES ('13', '1', 'ALTERAR', 'produtos', '55', 'Produto \'Shampoo 350ml\' alterado.', '2026-10-04 18:36:43');
INSERT INTO `log` VALUES ('14', '1', 'ALTERAR', 'produtos', '1', 'Produto \'arroz\' alterado.', '2026-10-04 18:43:53');
INSERT INTO `log` VALUES ('15', '1', 'ALTERAR', 'produtos', '1', 'Produto \'arroz\' alterado.', '2026-10-04 18:44:08');
INSERT INTO `log` VALUES ('16', '1', 'ALTERAR', 'produtos', '1', 'Produto \'arroz\' alterado.', '2026-10-04 18:44:30');
INSERT INTO `log` VALUES ('17', '1', 'ALTERAR', 'produtos', '1', 'Produto \'arroz\' alterado.', '2026-10-04 18:45:03');
INSERT INTO `log` VALUES ('18', '1', 'ALTERAR', 'produtos', '1', 'Produto \'arroz 22\' alterado.', '2026-10-04 18:45:09');
INSERT INTO `log` VALUES ('19', '1', 'ALTERAR', 'produtos', '1', 'Produto \'arroz 22\' alterado.', '2026-10-04 18:57:15');
INSERT INTO `log` VALUES ('20', '1', 'ALTERAR', 'produtos', '1', 'Produto \'arroz 22\' alterado.', '2026-10-04 18:58:22');
INSERT INTO `log` VALUES ('21', '1', 'CRIAR', 'produtos', '62', 'Produto \'teste estoque\' cadastrado.', '2026-10-04 19:02:41');
INSERT INTO `log` VALUES ('22', '1', 'ALTERAR', 'produtos', '1', 'Produto \'arroz 22\' alterado.', '2026-10-04 19:03:41');
INSERT INTO `log` VALUES ('23', '1', 'EXCLUIR', 'produtos', '62', 'Produto ID 62 excluído.', '2026-10-04 19:08:08');
INSERT INTO `log` VALUES ('24', '1', 'CRIAR', 'produtos', '63', 'Produto \'sarcisha\' cadastrado.', '2026-10-04 19:08:29');
INSERT INTO `log` VALUES ('25', '1', 'ALTERAR', 'produtos', '63', 'Produto \'sarcisha\' alterado.', '2026-10-04 19:08:50');
INSERT INTO `log` VALUES ('26', '1', 'ALTERAR', 'produtos', '63', 'Produto \'sarcisha\' alterado.', '2026-10-04 19:09:28');
INSERT INTO `log` VALUES ('27', '1', 'ALTERAR', 'produtos', '63', 'Produto \'sarcisha\' alterado.', '2026-10-04 19:12:58');
INSERT INTO `log` VALUES ('28', '1', 'ALTERAR', 'produtos', '63', 'Produto \'sarcisha\' alterado.', '2026-10-04 19:13:24');
INSERT INTO `log` VALUES ('29', '1', 'ALTERAR', 'produtos', '63', 'Produto \'sarcisha\' alterado.', '2026-10-04 19:13:42');
INSERT INTO `log` VALUES ('30', '1', 'ALTERAR', 'produtos', '52', 'Produto \'Água Mineral 500ml\' alterado.', '2026-10-04 19:13:55');
INSERT INTO `log` VALUES ('31', '1', 'INATIVAR', 'produtos', '63', 'Produto ID 63 inativado.', '2026-10-04 19:17:14');
INSERT INTO `log` VALUES ('32', '1', 'ATIVAR', 'produtos', '63', 'Produto ID 63 ativado.', '2026-10-04 19:17:15');
INSERT INTO `log` VALUES ('34', '4', 'CADASTRO', 'usuarios', '4', 'Usuário \'xerecas\' cadastrado.', '2026-10-04 19:44:11');
INSERT INTO `log` VALUES ('35', '4', 'EXCLUSÃO', 'usuarios', '4', 'Usuário \'xerecas\' foi excluído.', '2026-10-04 19:48:10');
INSERT INTO `log` VALUES ('36', '4', 'EXCLUSÃO', 'usuarios', '4', 'Usuário \'xerecas\' foi excluído.', '2026-10-04 19:54:12');
INSERT INTO `log` VALUES ('37', '4', 'EXCLUSÃO', 'usuarios', '4', 'Usuário \'xerecas\' foi excluído.', '2026-10-04 19:56:01');
INSERT INTO `log` VALUES ('38', '1', 'EXCLUSÃO', 'usuarios', '4', 'Usuário \'xerecas\' foi excluído.', '2026-10-04 20:07:21');
INSERT INTO `log` VALUES ('39', '1', 'EXCLUSÃO', 'usuarios', '4', 'Usuário \'xerecas\' foi excluído.', '2026-10-04 20:07:43');
INSERT INTO `log` VALUES ('40', '1', 'INATIVAÇÃO', 'usuarios', '4', 'Usuário \'xerecas\' foi inativado.', '2026-10-04 20:07:49');
INSERT INTO `log` VALUES ('41', '1', 'ALTERAÇÃO', 'usuarios', '4', 'Usuário \'xerecas1\' alterado.', '2026-10-04 20:07:57');
INSERT INTO `log` VALUES ('42', '1', 'ATIVAÇÃO', 'usuarios', '4', 'Usuário \'xerecas1\' foi ativado.', '2026-10-04 20:10:50');
INSERT INTO `log` VALUES ('43', '1', 'INATIVAÇÃO', 'usuarios', '4', 'Usuário \'xerecas1\' foi inativado.', '2026-10-04 20:10:52');
INSERT INTO `log` VALUES ('44', '1', 'ATIVAÇÃO', 'usuarios', '4', 'Usuário \'xerecas1\' foi ativado.', '2026-10-04 20:27:05');
INSERT INTO `log` VALUES ('45', '1', 'CADASTRO', 'produtos', '64', 'Produto \'1 mango e 1 tango\' cadastrado.', '2026-10-04 20:42:45');
INSERT INTO `log` VALUES ('46', '1', 'CADASTRO', 'classes', '25', 'Classe \'dota2\' cadastrada.', '2026-10-04 20:42:50');
INSERT INTO `log` VALUES ('47', '1', 'ALTERAÇÃO', 'produtos', '64', 'Produto \'1 mango e 1 tango\' alterado.', '2026-10-04 20:42:57');
INSERT INTO `log` VALUES ('48', '1', 'MOVIMENTAÇÃO_ESTOQUE', 'movimentacao_estoque', '4', 'Produto \'1 mango e 1 tango\' - Saída de 21 unidade(s). Estoque: 23 -> 2.', '2026-10-04 20:43:25');
INSERT INTO `log` VALUES ('49', '1', 'INATIVAÇÃO', 'usuarios', '1', 'Usuário \'pedro\' foi inativado.', '2026-10-04 20:43:41');
INSERT INTO `log` VALUES ('50', '1', 'INATIVAÇÃO', 'usuarios', '4', 'Usuário \'xerecas1\' foi inativado.', '2026-10-04 20:43:43');
INSERT INTO `log` VALUES ('51', '1', 'ATIVAÇÃO', 'usuarios', '1', 'Usuário \'pedro\' foi ativado.', '2026-10-04 20:43:45');
INSERT INTO `log` VALUES ('52', '1', 'INATIVAÇÃO', 'produtos', '1', 'Produto \'arroz 22\' foi inativado.', '2026-10-04 21:01:58');
INSERT INTO `log` VALUES ('53', '1', 'ATIVAÇÃO', 'produtos', '1', 'Produto \'arroz 22\' foi ativado.', '2026-10-04 21:01:59');
INSERT INTO `log` VALUES ('54', '1', 'ALTERAÇÃO', 'usuarios', '4', 'Usuário \'xerecas1\' alterado.', '2026-10-04 22:01:04');
INSERT INTO `log` VALUES ('55', '1', 'CRIAR', 'vendas', '1', 'Venda #1 realizada no valor de R$ 180,00.', '2026-10-05 19:45:12');
INSERT INTO `log` VALUES ('56', '1', 'ESTORNAR', 'vendas', '1', 'Venda #1 estornada no valor de R$ 180,00.', '2026-10-05 19:47:12');
INSERT INTO `log` VALUES ('57', '1', 'CADASTRO', 'classes', '26', 'Classe \'3 mangos 2 tangos\' cadastrada.', '2026-10-05 20:14:21');
INSERT INTO `log` VALUES ('58', '1', 'CADASTRO', 'produtos', '65', 'Produto \'2 mango 3 tango\' cadastrado.', '2026-10-05 20:14:38');
INSERT INTO `log` VALUES ('59', '1', 'MOVIMENTAÇÃO_ESTOQUE', 'movimentacao_estoque', '7', 'Produto \'2 mango 3 tango\' - Saída de 5 unidade(s). Estoque: 10 -> 5.', '2026-10-05 20:14:54');
INSERT INTO `log` VALUES ('60', '1', 'INATIVAÇÃO', 'usuarios', '1', 'Usuário \'pedro\' foi inativado.', '2026-10-05 20:15:01');
INSERT INTO `log` VALUES ('61', '1', 'ATIVAÇÃO', 'usuarios', '1', 'Usuário \'pedro\' foi ativado.', '2026-10-05 20:15:02');
INSERT INTO `log` VALUES ('62', '1', 'CRIAR', 'vendas', '2', 'Venda #2 realizada no valor de R$ 90,00.', '2026-10-05 20:45:53');
INSERT INTO `log` VALUES ('63', '1', 'CRIAR', 'vendas', '3', 'Venda #3 realizada. Subtotal: R$ 132,88. Desconto: R$ 26,58. Total: R$ 106,30.', '2026-10-05 21:01:40');
INSERT INTO `log` VALUES ('64', '1', 'CRIAR', 'vendas', '4', 'Venda #4 realizada no valor de R$ 90,00.', '2026-10-05 21:22:50');
INSERT INTO `log` VALUES ('65', '1', 'ESTORNAR', 'vendas', '4', 'Venda #4 estornada no valor de R$ 90,00.', '2026-10-05 21:23:02');
INSERT INTO `log` VALUES ('66', '1', 'ESTORNAR', 'vendas', '3', 'Venda #3 estornada no valor de R$ 106,30.', '2026-10-05 21:23:04');
INSERT INTO `log` VALUES ('67', '1', 'ESTORNAR', 'vendas', '2', 'Venda #2 estornada no valor de R$ 90,00.', '2026-10-05 21:23:05');
INSERT INTO `log` VALUES ('68', '1', 'CRIAR', 'vendas', '5', 'Venda #5 realizada no valor de R$ 90,00.', '2026-10-05 21:23:16');
INSERT INTO `log` VALUES ('69', '1', 'CRIAR', 'vendas', '6', 'Venda #6 realizada no valor de R$ 90,00.', '2026-10-05 21:23:43');
INSERT INTO `log` VALUES ('70', '1', 'ESTORNAR', 'vendas', '6', 'Venda #6 estornada no valor de R$ 90,00.', '2026-10-05 21:25:22');
INSERT INTO `log` VALUES ('71', '1', 'ESTORNAR', 'vendas', '5', 'Venda #5 estornada no valor de R$ 90,00.', '2026-10-05 21:25:23');
INSERT INTO `log` VALUES ('72', '1', 'CRIAR', 'vendas', '7', 'Venda #7 realizada no valor de R$ 90,00.', '2026-10-05 21:26:41');
INSERT INTO `log` VALUES ('73', '1', 'CRIAR', 'vendas', '8', 'Venda #8 realizada no valor de R$ 90,00.', '2026-10-05 22:07:20');
INSERT INTO `log` VALUES ('74', '1', 'ESTORNAR', 'vendas', '8', 'Venda #8 estornada no valor de R$ 90,00.', '2026-10-05 22:07:24');
INSERT INTO `log` VALUES ('75', '1', 'CRIAR', 'vendas', '9', 'Venda #9 realizada no valor de R$ 11,00.', '2026-10-05 22:15:20');
INSERT INTO `log` VALUES ('76', '1', 'CRIAR', 'vendas', '10', 'Venda #10 realizada no valor de R$ 10,00.', '2026-10-05 22:15:30');
INSERT INTO `log` VALUES ('77', '1', 'ESTORNAR', 'vendas', '10', 'Venda #10 estornada no valor de R$ 10,00.', '2026-10-05 22:15:58');
INSERT INTO `log` VALUES ('78', '1', 'ESTORNAR', 'vendas', '9', 'Venda #9 estornada no valor de R$ 11,00.', '2026-10-05 22:15:59');
INSERT INTO `log` VALUES ('79', '1', 'CADASTRO', 'produtos', '66', 'Produto \'Lucas viadinho\' cadastrado.', '2026-10-11 18:24:39');
INSERT INTO `log` VALUES ('80', '1', 'MOVIMENTAÇÃO_ESTOQUE', 'movimentacao_estoque', '33', 'Produto \'arroz 22\' - Ajuste de 22 unidade(s). Estoque: 59 -> 22.', '2026-10-11 18:32:11');
INSERT INTO `log` VALUES ('81', '1', 'MOVIMENTAÇÃO_ESTOQUE', 'movimentacao_estoque', '34', 'Produto \'Lucas viadinho\' - Ajuste de 13 unidade(s). Estoque: 22 -> 13.', '2026-10-11 19:01:10');
INSERT INTO `log` VALUES ('82', '1', 'CADASTRO', 'produtos', '67', 'Produto \'ana banana\' cadastrado.', '2026-10-11 19:07:14');
INSERT INTO `log` VALUES ('83', '1', 'MOVIMENTAÇÃO_ESTOQUE', 'movimentacao_estoque', '35', 'Produto \'Lucas viadinho\' - Ajuste de 90 unidade(s). Estoque: 13 -> 90.', '2026-10-11 19:07:14');
INSERT INTO `log` VALUES ('84', '1', 'MOVIMENTAÇÃO_ESTOQUE', 'movimentacao_estoque', '36', 'Produto \'Lucas viadinho\' - Ajuste de 90 unidade(s). Estoque: 90 -> 90.', '2026-10-11 19:07:14');
INSERT INTO `log` VALUES ('85', '1', 'CADASTRO', 'produtos', '68', 'Produto \'teste jwt\' cadastrado.', '2026-10-14 21:42:01');
INSERT INTO `log` VALUES ('86', '1', 'INATIVAÇÃO', 'produtos', '68', 'Produto \'teste jwt\' foi inativado.', '2026-10-14 21:42:06');
INSERT INTO `log` VALUES ('87', '1', 'ATIVAÇÃO', 'produtos', '68', 'Produto \'teste jwt\' foi ativado.', '2026-10-14 21:42:10');
INSERT INTO `log` VALUES ('88', '5', 'CADASTRO', 'produtos', '69', 'Produto \'ovo ovo ovo\' cadastrado.', '2026-10-14 21:54:42');
INSERT INTO `log` VALUES ('89', '1', 'CRIAR', 'vendas', '11', 'Venda #11 realizada no valor de R$ 12,00.', '2026-10-14 21:55:17');
INSERT INTO `log` VALUES ('90', '1', 'ESTORNAR', 'vendas', '11', 'Venda #11 estornada no valor de R$ 12,00.', '2026-10-14 21:55:28');
INSERT INTO `log` VALUES ('91', '5', 'CADASTRO', 'classes', '27', 'Classe \'TESTE CHAVES\' cadastrada.', '2026-10-15 19:55:57');
INSERT INTO `log` VALUES ('92', '5', 'CRIAR', 'vendas', '12', 'Venda #12 realizada no valor de R$ 90,00.', '2026-10-15 21:42:21');
INSERT INTO `log` VALUES ('93', '5', 'CADASTRO', 'produtos', '70', 'Produto \'TESTE\' cadastrado.', '2026-10-15 21:51:14');
INSERT INTO `log` VALUES ('94', '5', 'CADASTRO', 'produtos', '71', 'Produto \'LUCAS AVIADADO\' cadastrado.', '2026-10-15 21:54:18');
INSERT INTO `log` VALUES ('95', '5', 'CADASTRO', 'produtos', '72', 'Produto \'NOTEBOKK\' cadastrado.', '2026-10-16 21:12:57');
INSERT INTO `log` VALUES ('96', '5', 'CADASTRO', 'produtos', '73', 'Produto \'TESTE CELULAR\' cadastrado.', '2026-10-16 21:14:42');
INSERT INTO `log` VALUES ('97', '5', 'CADASTRO', 'produtos', '74', 'Produto \'TESTE JWT AAAA\' cadastrado.', '2026-10-19 20:34:43');
INSERT INTO `log` VALUES ('98', '5', 'CADASTRO', 'produtos', '75', 'Produto \'EQWEQE\' cadastrado.', '2026-10-19 20:37:28');
INSERT INTO `log` VALUES ('99', '5', 'CADASTRO', 'produtos', '76', 'Produto \'DADSADAD\' cadastrado.', '2026-10-19 20:40:31');
INSERT INTO `log` VALUES ('100', '5', 'CRIAR', 'vendas', '13', 'Venda #13 realizada no valor de R$ 11,00.', '2026-10-20 21:29:54');
INSERT INTO `log` VALUES ('101', '5', 'ESTORNAR', 'vendas', '13', 'Venda #13 estornada no valor de R$ 11,00.', '2026-10-20 21:30:00');
INSERT INTO `log` VALUES ('102', '5', 'CRIAR', 'vendas', '14', 'Venda #14 realizada no valor de R$ 10,00.', '2026-10-20 21:30:46');
INSERT INTO `log` VALUES ('103', '5', 'INATIVAÇÃO', 'produtos', '1', 'Produto \'arroz 22\' foi inativado.', '2026-10-20 21:32:48');
INSERT INTO `log` VALUES ('104', '5', 'ATIVAÇÃO', 'produtos', '1', 'Produto \'arroz 22\' foi ativado.', '2026-10-20 21:32:48');
INSERT INTO `log` VALUES ('105', '5', 'CADASTRO', 'produtos', '79', 'Produto \'TESTE BANCO NOVO\' cadastrado.', '2026-10-21 21:54:26');
INSERT INTO `log` VALUES ('106', '5', 'CADASTRO', 'produtos', '80', 'Produto \'TESTE BANCO NOVO 2\' cadastrado.', '2026-10-21 21:54:52');
INSERT INTO `log` VALUES ('107', '5', 'CADASTRO', 'usuarios', '6', 'Usuário \'testebanconovo\' cadastrado.', '2026-10-21 21:55:23');
INSERT INTO `log` VALUES ('108', '5', 'CRIAR', 'vendas', '15', 'Venda #15 realizada no valor de R$ 12,00.', '2026-10-21 21:55:59');
INSERT INTO `log` VALUES ('109', '5', 'CADASTRO', 'produtos', '81', 'Produto \'TESASDASD\' cadastrado.', '2026-10-21 22:16:59');
INSERT INTO `log` VALUES ('110', '5', 'CADASTRO', 'classes', '28', 'Classe \'TESTE DATA  HORA SELOCO\' cadastrada.', '2026-10-21 22:33:11');
INSERT INTO `log` VALUES ('111', '5', 'INATIVAÇÃO', 'classes', '28', 'Classe \'TESTE DATA  HORA SELOCO\' foi inativada.', '2026-10-21 22:33:34');
INSERT INTO `log` VALUES ('112', '5', 'ATIVAÇÃO', 'classes', '28', 'Classe \'TESTE DATA  HORA SELOCO\' foi ativada.', '2026-10-21 22:33:38');
INSERT INTO `log` VALUES ('113', '5', 'INATIVAÇÃO', 'classes', '28', 'Classe \'TESTE DATA  HORA SELOCO\' foi inativada.', '2026-10-21 22:38:19');
INSERT INTO `log` VALUES ('114', '5', 'ATIVAÇÃO', 'classes', '28', 'Classe \'TESTE DATA  HORA SELOCO\' foi ativada.', '2026-10-21 22:38:21');
INSERT INTO `log` VALUES ('115', '5', 'INATIVAÇÃO', 'classes', '28', 'Classe \'TESTE DATA  HORA SELOCO\' foi inativada.', '2026-10-21 22:38:24');
INSERT INTO `log` VALUES ('116', '5', 'ALTERAÇÃO', 'classes', '1', 'Classe \'testepao\' alterada.', '2026-10-21 22:43:15');
INSERT INTO `log` VALUES ('117', '5', 'ALTERAÇÃO', 'produtos', '1', 'Produto \'arroz 22\' alterado.', '2026-10-21 22:56:55');
INSERT INTO `log` VALUES ('118', '5', 'INATIVAÇÃO', 'produtos', '1', 'Produto \'arroz 22\' foi inativado.', '2026-10-21 22:57:11');
INSERT INTO `log` VALUES ('119', '5', 'ATIVAÇÃO', 'produtos', '1', 'Produto \'arroz 22\' foi ativado.', '2026-10-21 22:57:15');
INSERT INTO `log` VALUES ('120', '5', 'ALTERAÇÃO', 'produtos', '1', 'Produto \'arroz 22\' alterado.', '2026-10-21 23:02:39');
INSERT INTO `log` VALUES ('121', '5', 'INATIVAÇÃO', 'usuarios', '6', 'Usuário \'testebanconovo\' foi inativado.', '2026-10-21 23:09:05');
INSERT INTO `log` VALUES ('122', '5', 'CRIAR', 'vendas', '16', 'Venda #16 realizada no valor de R$ 11,00.', '2026-10-21 23:41:23');
INSERT INTO `log` VALUES ('123', '5', 'ESTORNAR', 'vendas', '16', 'Venda #16 estornada no valor de R$ 11,00.', '2026-10-21 23:41:42');
INSERT INTO `log` VALUES ('124', '5', 'ESTORNAR', 'vendas', '14', 'Venda #14 estornada no valor de R$ 10,00.', '2026-10-21 23:51:33');
INSERT INTO `log` VALUES ('125', '5', 'CADASTRO', 'produtos', '82', 'Produto \'TESTE COME DESCONTO EMAIL MARKUP\' cadastrado.', '2026-10-22 00:15:24');
INSERT INTO `log` VALUES ('126', '5', 'CRIAR', 'vendas', '17', 'Venda #17 realizada no valor de R$ 28,90.', '2026-10-22 00:16:10');
INSERT INTO `log` VALUES ('127', '5', 'ESTORNAR', 'vendas', '17', 'Venda #17 estornada no valor de R$ 28,90.', '2026-10-22 00:16:30');

-- ----------------------------
-- Table structure for `movimentacoes_estoque`
-- ----------------------------
DROP TABLE IF EXISTS `movimentacoes_estoque`;
CREATE TABLE `movimentacoes_estoque` (
  `id_movimentacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `estoque_anterior` int(11) NOT NULL,
  `estoque_atual` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data_movimentacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_movimentacao`),
  KEY `produto` (`id_produto`),
  KEY `usuario` (`id_usuario`),
  CONSTRAINT `mov_estoque_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `mov_estoque_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of movimentacoes_estoque
-- ----------------------------
INSERT INTO `movimentacoes_estoque` VALUES ('1', '1', '1', '2', '30', '50', '20', 'Ajuste de estoque - saída', '2026-10-04 18:56:58');
INSERT INTO `movimentacoes_estoque` VALUES ('2', '1', '1', '1', '40', '20', '60', 'Ajuste de estoque - entrada', '2026-10-04 18:57:48');
INSERT INTO `movimentacoes_estoque` VALUES ('3', '63', '1', '2', '980', '1000', '20', 'Ajuste de estoque - saída', '2026-10-04 19:16:42');
INSERT INTO `movimentacoes_estoque` VALUES ('4', '64', '1', '2', '21', '23', '2', 'Ajuste de estoque - saída', '2026-10-04 20:43:25');
INSERT INTO `movimentacoes_estoque` VALUES ('5', '1', '1', '2', '2', '60', '58', 'Venda realizada #1', '2026-10-05 19:45:12');
INSERT INTO `movimentacoes_estoque` VALUES ('6', '1', '1', '1', '2', '58', '60', 'Estorno da Venda #1', '2026-10-05 19:47:12');
INSERT INTO `movimentacoes_estoque` VALUES ('7', '65', '1', '2', '5', '10', '5', 'Ajuste de estoque - saída', '2026-10-05 20:14:54');
INSERT INTO `movimentacoes_estoque` VALUES ('8', '1', '1', '2', '1', '60', '59', 'Venda realizada #2', '2026-10-05 20:45:53');
INSERT INTO `movimentacoes_estoque` VALUES ('9', '1', '1', '2', '1', '59', '58', 'Venda realizada #3', '2026-10-05 21:01:40');
INSERT INTO `movimentacoes_estoque` VALUES ('10', '65', '1', '2', '1', '5', '4', 'Venda realizada #3', '2026-10-05 21:01:40');
INSERT INTO `movimentacoes_estoque` VALUES ('11', '46', '1', '2', '1', '60', '59', 'Venda realizada #3', '2026-10-05 21:01:40');
INSERT INTO `movimentacoes_estoque` VALUES ('12', '53', '1', '2', '1', '25', '24', 'Venda realizada #3', '2026-10-05 21:01:40');
INSERT INTO `movimentacoes_estoque` VALUES ('13', '57', '1', '2', '1', '30', '29', 'Venda realizada #3', '2026-10-05 21:01:40');
INSERT INTO `movimentacoes_estoque` VALUES ('14', '1', '1', '2', '1', '58', '57', 'Venda realizada #4', '2026-10-05 21:22:50');
INSERT INTO `movimentacoes_estoque` VALUES ('15', '1', '1', '1', '1', '57', '58', 'Estorno da Venda #4', '2026-10-05 21:23:02');
INSERT INTO `movimentacoes_estoque` VALUES ('16', '1', '1', '1', '1', '58', '59', 'Estorno da Venda #3', '2026-10-05 21:23:04');
INSERT INTO `movimentacoes_estoque` VALUES ('17', '65', '1', '1', '1', '4', '5', 'Estorno da Venda #3', '2026-10-05 21:23:04');
INSERT INTO `movimentacoes_estoque` VALUES ('18', '46', '1', '1', '1', '59', '60', 'Estorno da Venda #3', '2026-10-05 21:23:04');
INSERT INTO `movimentacoes_estoque` VALUES ('19', '53', '1', '1', '1', '24', '25', 'Estorno da Venda #3', '2026-10-05 21:23:04');
INSERT INTO `movimentacoes_estoque` VALUES ('20', '57', '1', '1', '1', '29', '30', 'Estorno da Venda #3', '2026-10-05 21:23:04');
INSERT INTO `movimentacoes_estoque` VALUES ('21', '1', '1', '1', '1', '59', '60', 'Estorno da Venda #2', '2026-10-05 21:23:05');
INSERT INTO `movimentacoes_estoque` VALUES ('22', '1', '1', '2', '1', '60', '59', 'Venda realizada #5', '2026-10-05 21:23:16');
INSERT INTO `movimentacoes_estoque` VALUES ('23', '1', '1', '2', '1', '59', '58', 'Venda realizada #6', '2026-10-05 21:23:43');
INSERT INTO `movimentacoes_estoque` VALUES ('24', '1', '1', '1', '1', '58', '59', 'Estorno da Venda #6', '2026-10-05 21:25:22');
INSERT INTO `movimentacoes_estoque` VALUES ('25', '1', '1', '1', '1', '59', '60', 'Estorno da Venda #5', '2026-10-05 21:25:23');
INSERT INTO `movimentacoes_estoque` VALUES ('26', '1', '1', '2', '1', '60', '59', 'Venda realizada #7', '2026-10-05 21:26:41');
INSERT INTO `movimentacoes_estoque` VALUES ('27', '1', '1', '2', '1', '59', '58', 'Venda realizada #8', '2026-10-05 22:07:20');
INSERT INTO `movimentacoes_estoque` VALUES ('28', '1', '1', '1', '1', '58', '59', 'Estorno da Venda #8', '2026-10-05 22:07:24');
INSERT INTO `movimentacoes_estoque` VALUES ('29', '64', '1', '2', '1', '2', '1', 'Venda realizada #9', '2026-10-05 22:15:20');
INSERT INTO `movimentacoes_estoque` VALUES ('30', '65', '1', '2', '1', '5', '4', 'Venda realizada #10', '2026-10-05 22:15:30');
INSERT INTO `movimentacoes_estoque` VALUES ('31', '65', '1', '1', '1', '4', '5', 'Estorno da Venda #10', '2026-10-05 22:15:58');
INSERT INTO `movimentacoes_estoque` VALUES ('32', '64', '1', '1', '1', '1', '2', 'Estorno da Venda #9', '2026-10-05 22:15:59');
INSERT INTO `movimentacoes_estoque` VALUES ('33', '1', '1', '3', '22', '59', '22', '', '2026-10-11 18:32:11');
INSERT INTO `movimentacoes_estoque` VALUES ('34', '66', '1', '3', '13', '22', '13', 'Ajuste via App', '2026-10-11 19:01:10');
INSERT INTO `movimentacoes_estoque` VALUES ('35', '66', '1', '3', '90', '13', '90', 'Ajuste via App', '2026-10-11 19:07:14');
INSERT INTO `movimentacoes_estoque` VALUES ('36', '66', '1', '3', '90', '90', '90', 'Ajuste via App', '2026-10-11 19:07:14');
INSERT INTO `movimentacoes_estoque` VALUES ('37', '69', '1', '2', '1', '12', '11', 'Venda realizada #11', '2026-10-14 21:55:17');
INSERT INTO `movimentacoes_estoque` VALUES ('38', '69', '1', '1', '1', '11', '12', 'Estorno da Venda #11', '2026-10-14 21:55:28');
INSERT INTO `movimentacoes_estoque` VALUES ('39', '1', '5', '2', '1', '22', '21', 'Venda realizada #12', '2026-10-15 21:42:21');
INSERT INTO `movimentacoes_estoque` VALUES ('40', '64', '5', '2', '1', '2', '1', 'Venda realizada #13', '2026-10-20 21:29:54');
INSERT INTO `movimentacoes_estoque` VALUES ('41', '64', '5', '1', '1', '1', '2', 'Estorno da Venda #13', '2026-10-20 21:30:00');
INSERT INTO `movimentacoes_estoque` VALUES ('42', '65', '5', '2', '1', '5', '4', 'Venda realizada #14', '2026-10-20 21:30:46');
INSERT INTO `movimentacoes_estoque` VALUES ('43', '80', '5', '2', '1', '11', '10', 'Venda realizada #15', '2026-10-21 21:55:59');
INSERT INTO `movimentacoes_estoque` VALUES ('44', '64', '5', '2', '1', '2', '1', 'Venda realizada #16', '2026-10-21 23:41:23');
INSERT INTO `movimentacoes_estoque` VALUES ('45', '64', '5', '1', '1', '1', '2', 'Estorno da Venda #16', '2026-10-21 23:41:42');
INSERT INTO `movimentacoes_estoque` VALUES ('46', '65', '5', '1', '1', '4', '5', 'Estorno da Venda #14', '2026-10-21 23:51:33');
INSERT INTO `movimentacoes_estoque` VALUES ('47', '42', '5', '2', '1', '50', '49', 'Venda realizada #17', '2026-10-22 00:16:10');
INSERT INTO `movimentacoes_estoque` VALUES ('48', '42', '5', '1', '1', '49', '50', 'Estorno da Venda #17', '2026-10-22 00:16:30');

-- ----------------------------
-- Table structure for `perfil`
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(255) NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of perfil
-- ----------------------------
INSERT INTO `perfil` VALUES ('1', 'ADMIN');
INSERT INTO `perfil` VALUES ('2', 'CAIXA');
INSERT INTO `perfil` VALUES ('3', 'ESTOQUISTA');

-- ----------------------------
-- Table structure for `produto`
-- ----------------------------
DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(255) NOT NULL,
  `barras` varchar(50) DEFAULT NULL,
  `estoque` int(11) NOT NULL DEFAULT '0',
  `id_classe` int(11) DEFAULT NULL,
  `valor_venda` decimal(12,2) NOT NULL DEFAULT '0.00',
  `valor_compra` decimal(12,2) NOT NULL DEFAULT '0.00',
  `estoque_minimo` int(11) NOT NULL DEFAULT '0',
  `ativo` char(255) NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao` datetime DEFAULT NULL,
  `data_inativacao` datetime DEFAULT NULL,
  `markup` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `classe` (`id_classe`),
  CONSTRAINT `classe` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of produto
-- ----------------------------
INSERT INTO `produto` VALUES ('1', 'arroz 22', '123456788', '21', '3', '100.00', '50.00', '10', 'S', '2026-10-21 22:49:27', '2026-10-21 23:02:39', null, '100');
INSERT INTO `produto` VALUES ('42', 'Arroz Tipo 1 5kg', '7891000100011', '50', '1', '28.90', '22.50', '10', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('43', 'Feijão Carioca 1kg', '7891000100028', '40', '1', '8.99', '6.50', '10', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('44', 'Açúcar Cristal 1kg', '7891000100035', '35', '1', '5.49', '4.10', '10', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('45', 'Café Torrado 500g', '7891000100042', '30', '1', '16.90', '12.50', '5', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('46', 'Leite Integral 1L', '7891000100059', '60', '2', '5.99', '4.30', '15', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('47', 'Óleo de Soja 900ml', '7891000100066', '45', '1', '7.49', '5.80', '10', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('48', 'Macarrão Espaguete 500g', '7891000100073', '50', '1', '4.99', '3.20', '10', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('49', 'Molho de Tomate 340g', '7891000100080', '35', '1', '3.79', '2.40', '8', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('50', 'Biscoito Recheado Chocolate', '7891000100097', '40', '3', '4.59', '3.00', '10', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('51', 'Refrigerante Cola 2L', '7891000100103', '30', '2', '9.99', '7.20', '8', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('52', 'Água Mineral 500ml', '7891000100110', '80', '2', '2.49', '1.30', '20', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('53', 'Suco de Laranja 1L', '7891000100127', '25', '2', '7.99', '5.50', '5', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('54', 'Sabonete 90g', '7891000100134', '50', '4', '3.49', '2.00', '10', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('55', 'Shampoo 350ml', '7891000100141', '25', '4', '14.90', '9.50', '5', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('56', 'Creme Dental 90g', '7891000100158', '35', '4', '6.99', '4.20', '8', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('57', 'Papel Higiênico 12un', '7891000100165', '30', '4', '18.90', '13.50', '5', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('58', 'Detergente 500ml', '7891000100172', '45', '5', '2.99', '1.80', '10', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('59', 'Desinfetante 2L', '7891000100189', '30', '5', '8.49', '5.70', '8', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('60', 'Esponja de Aço 8un', '7891000100196', '40', '5', '3.99', '2.40', '10', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('61', 'Sabão em Pó 1kg', '7891000100202', '25', '5', '12.90', '8.90', '5', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('63', 'sarcisha', '123456554242', '20', '17', '90.00', '10.00', '1000', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('64', '1 mango e 1 tango', '1231321', '2', '25', '11.00', '11.00', '23', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('65', '2 mango 3 tango', '123313123', '5', '26', '10.00', '10.00', '10', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('66', 'lucas teste', '1234567890', '90', '24', '22.00', '2.00', '22', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('67', 'ana banana', '0812371312', '22', '26', '22.00', '22.00', '22', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('68', 'teste jwt', '123123123123', '11', '2', '11.00', '11.00', '11', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('69', 'ovo ovo ovo', '123123123', '12', '6', '12.00', '12.00', '12', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('70', 'TESTE', '123213213', '12', '1', '12.00', '12.00', '12', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('72', 'NOTEBOKK', '4324234', '32', '26', '23.00', '23.00', '23', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('73', 'TESTE CELULAR', '1321312', '12', '21', '12.00', '332.00', '12', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('74', 'TESTE JWT AAAA', '3123213', '122', '17', '3123.00', '313.00', '122', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('75', 'EQWEQE', '13213132', '21', '1', '12.00', '21.00', '12', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('76', 'DADSADAD', '2313213123', '3123', '26', '3123.00', '3123.00', '3123', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('77', 'TESTE BANCO NOVO', '312312313', '111', '3', '11.00', '111.00', '111', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('78', 'TESTE BANCO NOVO', '312312313', '111', '3', '11.00', '111.00', '111', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('79', 'TESTE BANCO NOVO', '312312313', '111', '3', '11.00', '111.00', '111', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('80', 'TESTE BANCO NOVO 2', '13123132', '10', '1', '12.00', '12.00', '11', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('81', 'TESASDASD', '123123', '12', '1', '12.00', '12.00', '12', 'S', '2026-10-21 22:49:27', null, null, null);
INSERT INTO `produto` VALUES ('82', 'TESTE COME DESCONTO EMAIL MARKUP', '123213123', '12', '4', '12.00', '122.00', '12', 'S', '2026-10-22 00:15:24', null, null, null);

-- ----------------------------
-- Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `ativo` char(255) NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao` datetime DEFAULT NULL,
  `data_inativacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `perfil` (`id_perfil`),
  CONSTRAINT `perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'Admin', 'Admin@estoque', '123456', '1', 'S', '2026-10-21 23:08:11', null, null);
INSERT INTO `usuario` VALUES ('4', 'ana', 'ana@gmail.com', '123456', '3', 'S', '2026-10-21 23:08:11', null, null);
INSERT INTO `usuario` VALUES ('5', 'pedro', 'pedro@gmail.com', '123456', '1', 'S', '2026-10-21 23:08:11', null, null);
INSERT INTO `usuario` VALUES ('6', 'testebanconovo', 'testebanconovo@gmail.com', '123456', '1', 'N', '2026-10-21 23:08:11', null, '2026-10-21 23:09:05');

-- ----------------------------
-- Table structure for `venda`
-- ----------------------------
DROP TABLE IF EXISTS `venda`;
CREATE TABLE `venda` (
  `id_venda` int(11) NOT NULL AUTO_INCREMENT,
  `data_venda` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  `id_caixa` int(11) NOT NULL,
  `valor_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_venda`),
  KEY `usuario` (`id_usuario`),
  KEY `venda_caixa` (`id_caixa`),
  CONSTRAINT `usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `venda_caixa` FOREIGN KEY (`id_caixa`) REFERENCES `caixa` (`id_caixa`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of venda
-- ----------------------------
INSERT INTO `venda` VALUES ('1', '2026-10-05 19:45:12', '1', '2', '180.00', '0');
INSERT INTO `venda` VALUES ('2', '2026-10-05 20:45:53', '1', '3', '90.00', '0');
INSERT INTO `venda` VALUES ('3', '2026-10-05 21:01:40', '1', '3', '106.30', '0');
INSERT INTO `venda` VALUES ('4', '2026-10-05 21:22:50', '1', '3', '90.00', '0');
INSERT INTO `venda` VALUES ('5', '2026-10-05 21:23:16', '1', '3', '90.00', '0');
INSERT INTO `venda` VALUES ('6', '2026-10-05 21:23:43', '1', '3', '90.00', '0');
INSERT INTO `venda` VALUES ('7', '2026-10-05 21:26:41', '1', '3', '90.00', '1');
INSERT INTO `venda` VALUES ('8', '2026-10-05 22:07:20', '1', '6', '90.00', '0');
INSERT INTO `venda` VALUES ('9', '2026-10-05 22:15:19', '1', '7', '11.00', '0');
INSERT INTO `venda` VALUES ('10', '2026-10-05 22:15:30', '1', '7', '10.00', '0');
INSERT INTO `venda` VALUES ('11', '2026-10-14 21:55:17', '1', '8', '12.00', '0');
INSERT INTO `venda` VALUES ('12', '2026-10-15 21:42:21', '5', '9', '90.00', '1');
INSERT INTO `venda` VALUES ('13', '2026-10-20 21:29:53', '5', '9', '11.00', '0');
INSERT INTO `venda` VALUES ('14', '2026-10-20 21:30:46', '5', '9', '10.00', '0');
INSERT INTO `venda` VALUES ('15', '2026-10-21 21:55:59', '5', '10', '12.00', '1');
INSERT INTO `venda` VALUES ('16', '2026-10-21 23:41:23', '5', '10', '11.00', '0');
INSERT INTO `venda` VALUES ('17', '2026-10-22 00:16:09', '5', '10', '28.90', '0');

-- ----------------------------
-- Table structure for `vendas_item`
-- ----------------------------
DROP TABLE IF EXISTS `vendas_item`;
CREATE TABLE `vendas_item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` decimal(12,2) NOT NULL,
  `valor_total` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `venda` (`id_venda`),
  KEY `produto` (`id_produto`),
  CONSTRAINT `produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `venda` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vendas_item
-- ----------------------------
INSERT INTO `vendas_item` VALUES ('1', '1', '1', '2', '90.00', '180.00');
INSERT INTO `vendas_item` VALUES ('2', '2', '1', '1', '90.00', '90.00');
INSERT INTO `vendas_item` VALUES ('3', '3', '1', '1', '90.00', '90.00');
INSERT INTO `vendas_item` VALUES ('4', '3', '65', '1', '10.00', '10.00');
INSERT INTO `vendas_item` VALUES ('5', '3', '46', '1', '5.99', '5.99');
INSERT INTO `vendas_item` VALUES ('6', '3', '53', '1', '7.99', '7.99');
INSERT INTO `vendas_item` VALUES ('7', '3', '57', '1', '18.90', '18.90');
INSERT INTO `vendas_item` VALUES ('8', '4', '1', '1', '90.00', '90.00');
INSERT INTO `vendas_item` VALUES ('9', '5', '1', '1', '90.00', '90.00');
INSERT INTO `vendas_item` VALUES ('10', '6', '1', '1', '90.00', '90.00');
INSERT INTO `vendas_item` VALUES ('11', '7', '1', '1', '90.00', '90.00');
INSERT INTO `vendas_item` VALUES ('12', '8', '1', '1', '90.00', '90.00');
INSERT INTO `vendas_item` VALUES ('13', '9', '64', '1', '11.00', '11.00');
INSERT INTO `vendas_item` VALUES ('14', '10', '65', '1', '10.00', '10.00');
INSERT INTO `vendas_item` VALUES ('15', '11', '69', '1', '12.00', '12.00');
INSERT INTO `vendas_item` VALUES ('16', '12', '1', '1', '90.00', '90.00');
INSERT INTO `vendas_item` VALUES ('17', '13', '64', '1', '11.00', '11.00');
INSERT INTO `vendas_item` VALUES ('18', '14', '65', '1', '10.00', '10.00');
INSERT INTO `vendas_item` VALUES ('19', '15', '80', '1', '12.00', '12.00');
INSERT INTO `vendas_item` VALUES ('20', '16', '64', '1', '11.00', '11.00');
INSERT INTO `vendas_item` VALUES ('21', '17', '42', '1', '28.90', '28.90');

-- ----------------------------
-- Table structure for `vendas_pagamento`
-- ----------------------------
DROP TABLE IF EXISTS `vendas_pagamento`;
CREATE TABLE `vendas_pagamento` (
  `id_venda_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `id_forma_pagamento` int(11) NOT NULL,
  `valor` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_venda_pagamento`),
  KEY `venda` (`id_venda`),
  KEY `forma_pagamento` (`id_forma_pagamento`),
  CONSTRAINT `pagamento_forma` FOREIGN KEY (`id_forma_pagamento`) REFERENCES `formas_pagamento` (`id_forma_pagamento`),
  CONSTRAINT `pagamento_venda` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vendas_pagamento
-- ----------------------------
INSERT INTO `vendas_pagamento` VALUES ('1', '1', '1', '180.00');
INSERT INTO `vendas_pagamento` VALUES ('2', '2', '3', '90.00');
INSERT INTO `vendas_pagamento` VALUES ('3', '3', '3', '100.00');
INSERT INTO `vendas_pagamento` VALUES ('4', '3', '1', '6.30');
INSERT INTO `vendas_pagamento` VALUES ('5', '4', '3', '50.00');
INSERT INTO `vendas_pagamento` VALUES ('6', '4', '4', '40.00');
INSERT INTO `vendas_pagamento` VALUES ('7', '5', '3', '90.00');
INSERT INTO `vendas_pagamento` VALUES ('8', '6', '4', '90.00');
INSERT INTO `vendas_pagamento` VALUES ('9', '7', '4', '90.00');
INSERT INTO `vendas_pagamento` VALUES ('10', '8', '3', '90.00');
INSERT INTO `vendas_pagamento` VALUES ('11', '9', '3', '11.00');
INSERT INTO `vendas_pagamento` VALUES ('12', '10', '2', '10.00');
INSERT INTO `vendas_pagamento` VALUES ('13', '11', '4', '12.00');
INSERT INTO `vendas_pagamento` VALUES ('14', '12', '3', '90.00');
INSERT INTO `vendas_pagamento` VALUES ('15', '13', '3', '5.00');
INSERT INTO `vendas_pagamento` VALUES ('16', '13', '4', '6.00');
INSERT INTO `vendas_pagamento` VALUES ('17', '14', '3', '10.00');
INSERT INTO `vendas_pagamento` VALUES ('18', '15', '4', '12.00');
INSERT INTO `vendas_pagamento` VALUES ('19', '16', '3', '11.00');
INSERT INTO `vendas_pagamento` VALUES ('20', '17', '3', '28.90');

-- ----------------------------
-- Table structure for `__efmigrationshistory`
-- ----------------------------
DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of __efmigrationshistory
-- ----------------------------
INSERT INTO `__efmigrationshistory` VALUES ('20261016003859_CriacaoInicial', '9.0.9');
