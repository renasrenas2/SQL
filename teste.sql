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