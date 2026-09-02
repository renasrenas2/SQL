CREATE TABLE bar (
    id_bar SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    id_endereco INTEGER REFERENCES endereco(id_endereco) NOT NULL
);

CREATE TABLE endereco (
    id_endereco SERIAL PRIMARY KEY,
    descricao VARCHAR(400) NOT NULL,
    bairro VARCHAR(200) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    cep CHAR(8) NOT NULL
);

CREATE TABLE telefone (
    id_telefone SERIAL PRIMARY KEY,
    numero CHAR(9) NOT NULL,
    ddd CHAR(3) NOT NULL, 
    id_frequentador INTEGER REFERENCES frequentador(id_frequentador) NOT NULL
);

CREATE TABLE frequentador (
    id_frequentador SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    id_endereco INTEGER REFERENCES endereco(id_endereco) NOT NULL,
    id_cervejaf INTEGER REFERENCES cerveja(id_cervejaf) NOT NULL
);

CREATE TABLE cerveja (
    id_cerveja SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_fabricante INTEGER REFERENCES fabricante(id_fabricante) NOT NULL
);

CREATE TABLE fabricante (
    id_fabricante SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    id_endereco INTEGER REFERENCES endereco(id_endereco) NOT NULL
);

CREATE TABLE aprecia (
    id_frequentador INTEGER REFERENCES frequentador(id_frequentador),
    id_cerveja INTEGER REFERENCES cerveja(id_cerveja),
    PRIMARY KEY(id_frequentador, id_cerveja)
);

CREATE TABLE servi (
    id_cerveja INTEGER REFERENCES cerveja(id_cerveja),
    id_bar INTEGER REFERENCES bar(id_bar),
    preco NUMERIC(6,2) NOT NULL,
    PRIMARY KEY(id_cerveja, id_bar)
);

CREATE TABLE frequenta (
    id_frequentador INTEGER REFERENCES frequentador(id_frequentador),
    id_bar INTEGER REFERENCES bar(id_bar),
    PRIMARY KEY(id_frequentador, id_bar)
);

-- COMO FAZER QUANDO É CHAVE PRIMÁRIA E ESTRANGEIRA
-- RESTRIÇÃO DE COLUNA COLOCA COMO ESTRANGEIRA, 
-- NO FINAL DA TABELA COLOCA COMO PRIMARIA