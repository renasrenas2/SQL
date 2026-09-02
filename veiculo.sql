create table veiculos (
placa char(8) primary key,
chassi varchar(18) not null unique,
ano integer not null, 
cor varchar(100) not null, 
idcategoria integer references categoria(idcategoria) not null
);

create table categoria(
idcategoria integer primary key,
nome varchar(200) not null, 
descricao varchar(500)
);

-- Insira 5 registros em todas as tabelas do banco de dados
-- veículos;
-- Atualize 2 registros em todas as tabelas do banco de dados
-- veículos;
-- Apague 1 registro em todas as tabelas do banco de dados
-- veículos.

INSERT INTO categoria (nome) VALUES
	('Esportivo'),
	('Passeio'),
	('Utilitário'),
	('Carga'),
	('Transporte');


INSERT INTO veiculos VALUES
('PAJ-7654', 'HDAS89ADS8SDY', 2020, 'Branco', 2),
('IFB-0098', 'HDAS8192362DY', 2008, 'Branco', 1),
('PAZ-0001', 'odAS89as08yDY', 2026, 'Branco', 5),
('KDK-8376', 'HDAaysd897pDY', 2022, 'Branco', 3),
('YEN-5327', 'caAS89das89DY', 2012, 'Branco', 4);

UPDATE veiculos SET ano = 2024, id_categoria = 3 WHERE placa = 'IFB-0098';
UPDATE veiculos SET cor = 'Preto' WHERE placa = 'PAZ-0001'

UPDATE categoria SET nome = 'Caminhão' WHERE nome = 'Carga';
UPDATE categoria SET descricao = 'Carros utilizados para passeio' WHERE nome = 'Passeio';

DELETE FROM veiculos WHERE id_categoria = 2;
DELETE FROM categoria WHERE nome = 'Passeio';

