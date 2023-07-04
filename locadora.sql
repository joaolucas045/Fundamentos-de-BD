create database locadora;
use locadora;

create table clientes(
	cli_codigo int,
    cli_nome varchar(30),
    cli_cpf char(12),
    cli_data_nasc date,
    cli_sexo char(1),
    cli_email varchar(50)
);

create table filmes(
	fil_codigo int,
    fil_titulo varchar(40),
    fil_genero varchar(15),
    fil_duracao time,
    fil_situacao varchar(12),
    fil_preco numeric(3,2)
);

insert into clientes (cli_codigo, cli_nome, cli_cpf, cli_data_nasc, cli_sexo, cli_email) 
values (1, 'José da Silva', '123456789-10', '1980-12-10', 'M', 'joseSilva@cursoSQL.com');

insert into clientes (cli_codigo, cli_email, cli_nome, cli_cpf, cli_data_nasc, cli_sexo)
values (2, 'mariaSilva@cursoSQL.com', 'Maria da Silva', '012345678-99', '1982-02-28', 'F');

INSERT INTO clientes
values ( 3, 'Francisco da Silva', '109876543-21', '1990-01-01', 'M', 'franciscoSilva@cursoSQL.com');

INSERT INTO clientes (cli_codigo, cli_nome, cli_sexo, cli_email)
VALUES (4, 'Francisca da Silva', 'F', 'franciscaSilva@cursoSQL.com');

insert into clientes (cli_codigo, cli_email, cli_nome, cli_cpf, cli_data_nasc, cli_sexo)
values (5, 'NeyMDM@hotmail.com', 'Neymar Jr', '010101010-10', '2002-11-02', 'M');


INSERT INTO filmes (fil_codigo, fil_titulo, fil_genero, fil_duracao, fil_situacao, fil_preco) 
values (1, 'E o vento Levou', 'romance', '0:02:00', 'alugado', 5.00);

INSERT INTO filmes (fil_codigo, fil_titulo, fil_genero, fil_duracao, fil_situacao, fil_preco)
VALUES (2, 'O silêncio dos inocentes', 'policial', '0:02:00', 'disponível', 02.50);

INSERT INTO filmes VALUES (3, 'Procurando Nemo', 'animação', '0:01:40', 'alugado', 02.50);

INSERT INTO filmes (fil_codigo, fil_titulo, fil_genero, fil_situacao, fil_duracao) 
VALUES (4, 'Cidade de Deus', 'ação', 'disponível', '0:02:10');

INSERT INTO filmes (fil_codigo, fil_titulo, fil_genero, fil_situacao, fil_duracao) 
VALUES (5, 'Neymar', 'romance', 'disponível', '0:01:10');

update clientes
set cli_email = 'silvajose@email.com'
where cli_nome = 'José da Silva';

update clientes
set cli_email = 'mariaSilva@gmail.com'
where cli_nome = 'Maria da Silva';

UPDATE filmes
SET fil_preco = fil_preco - 1;

UPDATE filmes
SET fil_preco = 4.50
where fil_titulo = 'Cidade de Deus';

UPDATE filmes
SET fil_preco = 6.00
where fil_titulo = 'Neymar';

SELECT cli_nome, cli_email
FROM clientes
WHERE cli_nome='José da Silva';

desc filmes;
select * from filmes;

desc clientes;
select * from clientes;

/* EXERCÍCIO 1 - AULA 11*/
SELECT cli_nome, cli_cpf
FROM clientes;

select * from filmes;

SELECT cli_nome, cli_email
FROM clientes
WHERE cli_sexo = 'M';

SELECT fil_codigo, fil_titulo
FROM filmes;

SELECT fil_duracao
FROM filmes
WHERE fil_titulo = 'E o vento levou';

/**/
 

SELECT fil_titulo, fil_situacao
FROM filmes
WHERE fil_situacao <> 'alugado';
SELECT cli_nome
FROM clientes WHERE cli_data_nasc >= '1990-1-1';
SELECT fil_titulo
FROM filmes 
WHERE fil_genero= 'romance' OR fil_genero = 'animação';
SELECT fil_titulo, fil_codigo
FROM filmes WHERE fil_codigo BETWEEN 2 AND 20;
SELECT cli_nome, cli_data_nasc
FROM clientes 
WHERE cli_data_nasc BETWEEN '1990-1-1' AND '2000-1-1';
SELECT cli_email
FROM clientes 
WHERE cli_nome BETWEEN 'A' AND 'G';
SELECT cli_nome
FROM clientes 
WHERE cli_email LIKE '%gmail.com';


desc clientes;
select * from clientes;

/* EXERCÍCIO 2 - AULA 11 */
select fil_titulo
from filmes
where fil_preco >= 2.5;

select cli_nome
from clientes
where cli_sexo = 'M';

select fil_titulo
from filmes
where fil_genero in ('comedia', 'policial');

select cli_nome
from clientes
where cli_nome not like 'A' and not 'B';
/**/

/*Aula 12*/
SELECT cli_nome, cli_email
FROM clientes
ORDER BY cli_nome;

SELECT cli_nome, cli_email
FROM clientes
ORDER BY cli_nome DESC;

SELECT cli_nome, cli_email
FROM clientes
WHERE cli_nome LIKE 'F%'
ORDER BY cli_nome;

/*Exercício 1 - AULA 12*/
SELECT cli_nome, cli_cpf
FROM clientes
ORDER BY cli_nome;

SELECT *
FROM filmes
ORDER BY fil_codigo DESC;

SELECT cli_nome, cli_email
FROM clientes
WHERE cli_sexo = 'M'
ORDER BY cli_nome DESC;

SELECT cli_nome, cli_data_nasc
FROM clientes
WHERE cli_email like '%@hotmail.com'
ORDER BY cli_nome;
/**/

select fil_preco
from filmes
group by fil_preco;
SELECT COUNT(fil_titulo)
FROM filmes;
SELECT COUNT(DISTINCT fil_titulo)
FROM filmes;
SELECT MIN(fil_preco), AVG(fil_preco), MAX(fil_preco)
FROM filmes;
SELECT cli_sexo, COUNT(cli_sexo)
FROM clientes
GROUP BY cli_sexo;
SELECT fil_titulo, COUNT(fil_titulo) AS Unidades
FROM filmes
GROUP BY fil_titulo;
SELECT fil_titulo AS Titulo, COUNT(fil_titulo) AS Quantidade
FROM filmes
GROUP BY fil_titulo
HAVING COUNT(fil_titulo)>1;

/*EXERCICIO 2 - AULA 12*/
SELECT fil_situacao, COUNT(fil_situacao)
FROM filmes 
GROUP BY fil_situacao;
SELECT fil_situacao AS Situacao, COUNT(fil_situacao) AS Quantidade
FROM filmes 
GROUP BY fil_situacao;

SELECT fil_genero, COUNT(fil_genero)
FROM filmes 
GROUP BY fil_genero;
SELECT fil_genero AS Genero, COUNT(fil_genero) AS Quantidade 
FROM filmes 
GROUP BY fil_genero;

SELECT fil_preco, SUM(fil_preco)
FROM filmes 
WHERE fil_situacao = 'alugado';
SELECT fil_preco AS Preco_unitario, SUM(fil_preco) AS Total 
FROM filmes 
WHERE fil_situacao = 'alugado'
group by fil_preco;
/**/
SELECT DISTINCT ROUND(AVG(fil_preco),2)
FROM filmes;

SELECT DISTINCT UPPER(fil_titulo)
FROM filmes
WHERE fil_situacao='alugado';

SELECT cli_nome, EXTRACT(year FROM cli_data_nasc)
FROM clientes
WHERE cli_sexo='F';

SELECT cli_nome, DATE_FORMAT(cli_data_nasc,'%d %m, %Y') AS Data_de_nasc
FROM clientes
ORDER BY cli_nome;

ALTER TABLE clientes ADD cli_endereco VARCHAR(100);
desc clientes;

ALTER TABLE filmes
ADD fil_direcao VARCHAR(50)
FIRST;
desc filmes;

ALTER TABLE filmes
ADD fil_atores VARCHAR(200)
AFTER fil_direcao;

ALTER TABLE filmes DROP COLUMN fil_direcao;
desc filmes;

ALTER TABLE filmes DROP COLUMN fil_atores;
desc filmes;

ALTER TABLE clientes 
CHANGE COLUMN cli_email cli_endereco_eletronico varchar(80);

ALTER TABLE clientes MODIFY COLUMN cli_nome varchar(50);

/* Exercício - Aula 13 */
/*  As duas são funções para alterações na tabela mas o CHANGE COLUMN possibilita renomear e alterar características, 
enquanto o MODIFY COLUMN apenas altera as características da coluna sem renomear.*/

