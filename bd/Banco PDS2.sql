-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pds
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pds
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pds` DEFAULT CHARACTER SET utf8 ;
USE `pds` ;

-- -----------------------------------------------------
-- Table `pds`.`coordenador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`coordenador` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pds`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`curso` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  `coordenador_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_pa19bna93huihor0jox21mewk` (`coordenador_id` ASC),
  CONSTRAINT `FK_pa19bna93huihor0jox21mewk`
    FOREIGN KEY (`coordenador_id`)
    REFERENCES `pds`.`coordenador` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pds`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`disciplina` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  `curso_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_da9gikdh9y8mf853f732xebuq` (`curso_id` ASC),
  CONSTRAINT `FK_da9gikdh9y8mf853f732xebuq`
    FOREIGN KEY (`curso_id`)
    REFERENCES `pds`.`curso` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pds`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`aluno` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `matricula` INT(11) NOT NULL,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  `disciplina_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_jgguvythtkprq1i95bygf630b` (`disciplina_id` ASC),
  CONSTRAINT `FK_jgguvythtkprq1i95bygf630b`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `pds`.`disciplina` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pds`.`aluno_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`aluno_aluno` (
  `Aluno_id` BIGINT(20) NOT NULL,
  `monitor_id` BIGINT(20) NOT NULL,
  INDEX `FK_hrrk0vsyqvmq7ag7gca4y9y8e` (`monitor_id` ASC),
  INDEX `FK_qdrytshoaj6qkyft00dmtnp4n` (`Aluno_id` ASC),
  CONSTRAINT `FK_hrrk0vsyqvmq7ag7gca4y9y8e`
    FOREIGN KEY (`monitor_id`)
    REFERENCES `pds`.`aluno` (`id`),
  CONSTRAINT `FK_qdrytshoaj6qkyft00dmtnp4n`
    FOREIGN KEY (`Aluno_id`)
    REFERENCES `pds`.`aluno` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pds`.`sala`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`sala` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `dataFim` DATETIME NULL DEFAULT NULL,
  `dataInicio` DATETIME NULL DEFAULT NULL,
  `numero` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pds`.`monitoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pds`.`monitoria` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `diaFim` DATETIME NULL DEFAULT NULL,
  `diaInicio` DATETIME NULL DEFAULT NULL,
  `vaga` INT(11) NOT NULL,
  `disciplina_id` BIGINT(20) NULL DEFAULT NULL,
  `monitor_id` BIGINT(20) NULL DEFAULT NULL,
  `sala_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_abs5wofj86j8gej9q9u3l4wgc` (`disciplina_id` ASC),
  INDEX `FK_hipp4ekqaq84n938wvh967enw` (`monitor_id` ASC),
  INDEX `FK_bluq3qraw1kt63d9j9r1whjv4` (`sala_id` ASC),
  CONSTRAINT `FK_abs5wofj86j8gej9q9u3l4wgc`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `pds`.`disciplina` (`id`),
  CONSTRAINT `FK_bluq3qraw1kt63d9j9r1whjv4`
    FOREIGN KEY (`sala_id`)
    REFERENCES `pds`.`sala` (`id`),
  CONSTRAINT `FK_hipp4ekqaq84n938wvh967enw`
    FOREIGN KEY (`monitor_id`)
    REFERENCES `pds`.`aluno` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

show tables;

select * from sala;

insert into coordenador(id,nome)
values(20141189,'José da Silva Melo');

insert into coordenador(id,nome)
values(20141190,'Maria Alvarenga'),
(20141191,'Lucas Santana');

insert into coordenador(id,nome)
values(20141192,'Andrea Mendonça'),
(20141193,'Sergio Bezerra'),
(201411100,'Jorge Abilio'),
(201411120,'Marcelo Chamy ');

insert into sala(id,numero)values(001,04);

insert into sala values 
(002,'2017-01-05','2017-02-03',10);

insert into sala values 
(003,'2017/01/06','2017/03/03',06);

insert into sala(id,numero)values (004,05);

insert into sala values
(005,'2017-05-04','2017-02-03',03),
(006,'2016-03-05','2016-07-03',02);

insert into sala values
(007,'2016-10-11','2016-10-09',01),
(008,'2016-09-10','2016-12-09',07),
(009,'2017-08-08','2017-09-07',08),
(010,'2017-04-09','2017-10-08',09);

select * from curso;

desc curso;

insert into curso (id,nome,coordenador_id)
values(2009200,'Tecnologia Analise Desenvolvimento Sistemas',20141192);

insert into curso values(2009220,'Tecnologia Processos Quimicos', 20141189),
(2009230,'Engenharia Civil',20141190),(2009240,'Ciencias Biologicas',20141191),
(2009250,'Fisica',20141193),(2009260,'Engenharia Mecanica',201411100),
(2009270,'Prodição Publicitaria',201411120);

select * from curso
inner join coordenador on idCoordenador = coordenador_id;

alter table curso change id
idCurso bigint(20)not null auto_increment;

alter table coordenador change id
idCoordenador bigint(20)not null auto_increment;

alter table disciplina change id
idDisciplina bigint(20)not null auto_increment;


alter table aluno change id
idAluno bigint(20)not null auto_increment;


alter table sala change id
idSala bigint(20)not null auto_increment;


alter table monitoria change id
idMonitoria bigint(20)not null auto_increment;

desc curso;
select * from disciplina;

rename table aluno_aluno to aluno_monitor;

insert into disciplina(id,nome,curso_id)
values(10020,'Calculo Diferencial Integral',2009200);

insert into disciplina values(10030,'Algoritimos e técnicas de Programação',2009200);

insert into disciplina(id,nome)
values(10040, 'Estrutura de Dados'),
(10050,'Engenharia de Requisitos e Analise de Sistemas'),
(10060,'Linguagem e Programação Orientada a Objetos'),
(10070,'Filosofia Aplicada a computação'),
(10080,'Padrões de Projeto'),
(10090,'Projeto de Interface Grafica'),
(10100,'Desenvovimento Web');


insert into disciplina values(20020,'Quimica Geral',2009220),
(20030,'Fisico-Quimica 1',2009220);

insert into disciplina(id,nome)
values(20040,'Tecnicas de Leitura e Redação'),
(20050,'Metodologia Cientifica'),
(20060,'Fundamentos de Biologia'),
(20070,'Quimica Organica 1'),
(20080,'Fisico-Quimica2'),
(20090,'Quimica Analitica 2'),
(20100,'Fenomenos dos Transportes');



insert into disciplina values(30020,'Algebra Linear',2009230),
(30030,'Ciencia dos Materiais',2009230),
(30040,'Mêcanica dos Fluidos',2009230);

insert into disciplina(id,nome)
values(30050,'Topografia 2'),
(30060,'Fisica 4'),
(30070,'Hidraulica'),
(30080,'Laboratorios de Materiais de Construção'),
(30090,'Estabilidade das Construções 1'),
(30100,'Hidrologia');

insert into disciplina values(40020,'Biologia Celular',2009240),
(40030,'Laboratorio de Quimica Geral',2009240),
(40040,'Ecologia Básica',2009240);

insert into disciplina (id,nome)
values(40050,'Educação e Realidade Brasileira'),
(40060,'Biologia e Ecologia de Algas e Briofitas'),
(40070,'Plantas Vasculares: Celulares e Tecidos'),
(40080,'Embriologia Básica'),(40090,'Zoologia dos Invertebrados 1'),
(40100,'Psicologia do Desenvolvimento da Aprendizagem');


insert into aluno(id,email,matricula,nome,disciplina_id)
values(100,'ph.silva@gmail.com',2013118970,'Paulo da Silva Martins',30020);

insert into aluno values(110,'felipe.ferreira@bol.com',2014118975,'Felipe Ferreira Rodrigues',30050),
(120,'Jean.2009@hotmail.com',2015118980,'Jean Bezerra',40060);

insert into aluno(id,email,matricula,nome) 
values(130,'jhon.snow@gmail.com',2015118970,'João das Neves');
insert into aluno(id,email,matricula,nome) values
(140,'co_vida@hotmail.com',2014118945,'Maria Ferreira Coelho');
insert into aluno(id,email,matricula,nome) values
(150,'2008-jonjon@hotmail.com',2012118970,'Jonathan Cabral'),
(160,'melo@gmail.com',2013118988,'Lucas de Melo');
insert into aluno(id,email,matricula,nome)values
(170,'pascal.kle@hotmail.com',2014118920,'Kleiton Pascarreli'),
(180,'silva_thays@hotmail.com',2014118930,'Tays Silva'),
(190,'tav.2020@gmail.com',2016118999,'Anderson Tavares'),
(200,'sob.tav@bol.com',2014118990,'Felipe Caneiro Sobrinho');
insert into aluno(id,email,matricula,nome) values
(210,'anderso_costa@gmail.com',2013118960,'Anderson Costa'),
(220,'carvalho_lima@gmail.com',2014118934,'Jessica Pereira Carvalho'),
(230,'silva.fatima_deb@hotmail.com',2016118976,'Fatima Lima e Silva');
insert into aluno(id,email,matricula,nome) values
(240,'Orlando_Costa@gmail.com',2015118998,'Orlando Costa Pereira'),
(250,'Mendonca&Sousa@gmail.com',2014118953,'Eliel Mendonça e Sousa'),
(260,'Costa_Carneiro@hotmail.com',2014118967,'Elieferson Carneiro da Costa'),
(270,'fernando200920@gmail.com',2017118901,'Fernado Oliveira Martins'),
(280,'cavalcante.2020@hotmail',2017118910,'Heitor Cavalcante');
insert into aluno(id,email,matricula,nome) values
(290,'fernando@gmail.com',2017118940,'Fernanda de Carvalho Lemos'),
(145,'matos-costa@hotmail.com',2016118913,'Daniel Costa de Matos'),
(155,'camargo_luiz@gmail.com',2015118947,'Luiz Sales Camargo'),
(165,'lorena_chagas_loreiro@gmail.com',2012118920,'Lorena Chagas Loreiro');
insert into aluno(id,email,matricula,nome)values
(171,'dasmaceno@hotmail.com',2012118930,'Marcelo Dasmaceno Rezende'),
(175,'lucios.com@gmail.com',2012118990,'Lucifer da Silva Pinto'),
(185,'araujo&oliveira@gmail.com',2012118956,'Douglas de Oliveira Araújo'),
(195,'dobis_20@hotmail.com',2013118948,'Dobismar da Costa Barbosa'),
(215,'marina.taua@bol.com',2013118978,'Marina Barbosa Ruiz'),
(225,'marianaChagasPinheiro@gmail.com',2013118949,'Mariana Chagas Pinheiro');
insert into aluno(idAluno,email,matricula,nome)values
(283,'alexander@gmail.com',2015118933,'Alex Oliver'),
(226,'souza&souza@gmail.com',2016897020,'Hana Meireles Souza'),
(187,'victorCosta@hotmail.com',2017897031,'Victor da Costa Pereira'),
(182,'camila.feitosa@gmail.com',2011897012,'Camila Araújo Feitosa'),
(126,'oliveira_silva@hotmail.com',2014118970,'Fernanda Oliveira Silva'),
(279,'santos-barbosa@gmail.com',2013118949,'Marcos dos Santos Barbosa');

insert into aluno_monitor(Aluno_id,monitor_id) values
(283,187);
insert into aluno_monitor(Aluno_id,monitor_id) values
(279,187),(226,187),(283,187),(126,279),(185,279),(145,279);
insert into aluno_monitor values(215,126),(171,165),(182,155),(187,195);

select * from monitoria;

insert into monitoria(id,diaFim,diaInicio,vaga,disciplina_id,monitor_id,sala_id)values
(1001,'2017-03-07','2017-06-04',2,20040,279,001);
insert into monitoria(id,diaFim,diaInicio,vaga,disciplina_id,monitor_id,sala_id)values
(1002,'2016-03-07','2016-06-04',6,20050,187,002),
(1003,'2017-07-07','2017-011-04',8,20100,126,003),
(1004,'2017-03-07','2017-06-04',10,20040,165,004),
(1005,'2017-04-07','2017-07-04',4,40040,155,005),
(1006,'2017-08-07','2017-11-04',6,10100,195,006);






