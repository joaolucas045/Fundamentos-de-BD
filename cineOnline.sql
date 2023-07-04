create database cineOnline;
use cineOnline;

create table cinema(
cinema_codigo int NOT NULL,
cinema_nome varchar(40) NOT NULL,
cinema_sala varchar(2) NOT NULL,
cinema_capacidade int NOT NULL,
cinema_cidade varchar(50) NOT NULL,
PRIMARY KEY(cinema_codigo)
);

create table filmes(
fil_codigo int NOT NULL,
fil_titulo varchar(50) NOT NULL,
fil_genero varchar(30) NOT NULL,
fil_censura char(8) NOT NULL DEFAULT 'Livre',
PRIMARY KEY(fil_codigo)
);

create table sessao(
ses_codigo int NOT NULL,
ses_codfilme int NOT NULL,
ses_codcinema int NOT NULL,
ses_datahora datetime NOT NULL,
ses_preco numeric(9,2) NOT NULL,
PRIMARY KEY (ses_codigo),
FOREIGN KEY (ses_codfilme) REFERENCES filmes (fil_codigo),
FOREIGN KEY (ses_codcinema) REFERENCES cinema (cinema_codigo)
);

CREATE TABLE clientes
(
cli_codigo int NOT NULL,
cli_nome varchar(50) NOT NULL,
cli_email varchar (60) NOT NULL,
cli_cpf char(12) not null,
cli_compras int NOT NULL,
PRIMARY KEY (cli_codigo),
FOREIGN KEY (cli_compras) REFERENCES compras (comp_cod)
);

CREATE TABLE compras
(
comp_cod int NOT NULL auto_increment,
comp_valor int NOT NULL,
comp_nome varchar(50) NOT NULL,
comp_fil int NOT NULL,
PRIMARY KEY (comp_cod),
FOREIGN KEY (comp_fil) REFERENCES filmes (fil_codigo)
);

-- inserindo dados

INSERT INTO cinema (cinema_codigo, cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES('1', 'São Paulo', '02', 25, 'Itapipoca');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES('2', 'Classita', '03', 20, 'Itapajé');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES('3', 'Mangueirão', '02', 25, 'Itapipoca');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES('4', 'Cearazinho', '03', 20, 'Brasília');

INSERT INTO filmes (fil_codigo, fil_titulo, fil_genero, fil_censura) VALUES('1', 'Esse é meu garoto', 'Comedia', 18);
INSERT INTO filmes (fil_codigo, fil_titulo, fil_genero, fil_censura) VALUES('2', 'Projeto X', 'Comedia', 18);
INSERT INTO filmes (fil_codigo, fil_titulo, fil_genero, fil_censura) VALUES('3', 'Lula, o filho do Brasil.', 'Terror', 21);
INSERT INTO filmes (fil_codigo, fil_titulo, fil_genero, fil_censura) VALUES('4', 'Pele', 'Drama', 15);

INSERT INTO sessao (ses_codigo, ses_codfilme, ses_codcinema, ses_datahora, ses_preco) VALUES(1, 2, 1, '1999-09-10', 19.85);
INSERT INTO sessao (ses_codigo, ses_codfilme, ses_codcinema, ses_datahora, ses_preco) VALUES(2, 2, 1, '2000-10-09', 19.90);
INSERT INTO sessao (ses_codigo, ses_codfilme, ses_codcinema, ses_datahora, ses_preco) VALUES(3, 3, 1, '1999-09-10', 19.85);
INSERT INTO sessao (ses_codigo, ses_codfilme, ses_codcinema, ses_datahora, ses_preco) VALUES(4, 1, 4, '2000-10-09', 19.90);

INSERT INTO compras (comp_valor, comp_nome, comp_fil) VALUES(20, 'jl', 2);
INSERT INTO compras (comp_valor, comp_nome, comp_fil) VALUES(22, 'jotaeli', 2);
INSERT INTO compras (comp_valor, comp_nome, comp_fil) VALUES(20, 'jotinha', 3);
INSERT INTO compras (comp_valor, comp_nome, comp_fil) VALUES(22, 'jota', 1);

INSERT INTO clientes (cli_codigo, cli_nome, cli_email, cli_cpf, cli_compras) VALUES(1, 'jota', 'jota@hotmail.com', '40028922', 2);
INSERT INTO clientes (cli_codigo, cli_nome, cli_email, cli_cpf, cli_compras) VALUES(2, 'jl', 'jl@alu.ufc.br', '3631333', 2);
INSERT INTO clientes (cli_codigo, cli_nome, cli_email, cli_cpf, cli_compras) VALUES(3, 'jotaeli', 'jotaeli@hotmail.com', '2222222222', 3);
INSERT INTO clientes (cli_codigo, cli_nome, cli_email, cli_cpf, cli_compras) VALUES(4, 'jotinha', 'jotinha@gmail.com', '007123321', 1);

select * from cinema;
select * from filmes;
select * from sessao;
select * from clientes;
select * from compras;

/**/
SELECT cli_nome, fil_titulo
FROM clientes 
CROSS JOIN filmes;

SELECT cinema_nome, cinema_sala
FROM filmes, sessao, cinema
WHERE fil_titulo = 'Projeto X'
AND ses_codfilme = fil_codigo
AND cinema_codigo = ses_codcinema;

SELECT fil_titulo as Titulo, cinema_nome as Cinema, cinema_sala as Sala
FROM filmes, sessao, cinema
WHERE fil_titulo <> 'Projeto X'
AND ses_codfilme = fil_codigo
AND cinema_codigo = ses_codcinema;

SELECT * FROM clientes CROSS JOIN filmes;

SELECT cinema_nome, cinema_sala, fil_titulo 
FROM cinema, filmes 
WHERE fil_titulo = 'Pele';

SELECT * FROM clientes CROSS JOIN filmes;

SELECT cinema_nome, cinema_sala, fil_titulo 
FROM cinema, filmes
WHERE fil_titulo = 'Projeto X' 
GROUP BY fil_titulo;


 /**/
/* EXERCÍCIO - AULA 14 */
-- 01. A diferença é que o comando select simples a busca é realizada em uma única tabela, enquanto o select com conexão cartesiana 
-- busca em duas ou mais tabelas de uma só vez.

-- 02. SELECT * FROM clientes CROSS JOIN filmes --> A execução dessa linha de código retorna todas as tabelas de clientes e de filmes juntas.

-- 03. SELECT cinema_nome, cinema_sala, fil_titulo FROM cinema, filmes WHERE fil_titulo = 'Procurando Nemo' GROUP BY cinema_nome ->
-- Se essa linha de código for acionada no meu BD irá retornar vazio pois eu não tenho o titulo 'Procurando Nemo', no entanto se for colocado  
-- um título que possuo irá retornará o cimena, a sala do cinema de onde e o nome do filme que é possível a exibição.

-- 04. Se diferenciam que na saída da questão 2 além do nome do cinema e a sala(que é exibido no exemplo 1) também é retornado o título que foi feito na consulta. 

-- 05. Sim. Como no exemplo abaixo.
/* SELECT comp_fil AS Filme, MAX(comp_fil) AS Maior_Cod 
FROM compras, filmes, sessao, cinema 
WHERE fil_titulo <> 'Pele' 
AND ses_codfilme = fil_codigo 
AND cinema_codigo = ses_codcinema 
GROUP BY comp_fil; */
