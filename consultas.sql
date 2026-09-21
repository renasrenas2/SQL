CREATE TABLE medico (
	idmedico SERIAL PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
	crm VARCHAR(10) NOT NULL UNIQUE,
	especialidade VARCHAR(300) NOT NULL
);

CREATE TABLE paciente (
	idpaciente SERIAL PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
	cpf CHAR(11) NOT NULL UNIQUE,
	sexo CHAR(1) NOT NULL CHECK (sexo IN ('M', 'F', 'm', 'f')),
	idade INTEGER NOT NULL,
	peso NUMERIC(5, 2),
	altura NUMERIC(3, 2)
);

CREATE TABLE consulta (
	idconsulta SERIAL PRIMARY KEY,
	doenca VARCHAR(300),
	receita VARCHAR(500),
	idpaciente INTEGER REFERENCES paciente(idpaciente) NOT NULL,
	idmedico INTEGER REFERENCES medico(idmedico) NOT NULL
);

INSERT INTO medico (nome, crm, especialidade)
VALUES
	('Maria Fernanda', '25687-DF', 'Pediatra'),
	('Luis Guilherme', '12326-DF', 'Clínica Geral'),
	('Eduardo Ferreira', '23698-GO', 'Cardiologista'),
	('Letícia Miranda', '478521-PA', 'Oftamologia'),
	('Daniel Lopes', '65842-DF', 'Endocrinologia');

INSERT INTO paciente (nome, cpf, sexo, idade, peso, altura)
VALUES
	('Ludimila Oliveira', '36985214715', 'F', 19, 55.0, 1.68),
	('Geovana Silva', '85471236989', 'F', 25, 75.0, 1.65),
	('Lucio Alves', '52369874125', 'M', 23, 54.0, 1.70),
	('Rodrigo Pereira', '25631478965', 'M', 35, 70.0, 1.69),
	('Henrique Freitas', '56987421369', 'M', 36, 98.0, 1.86);

INSERT INTO consulta (doenca, receita, idpaciente, idmedico)
VALUES
	('gripe', 'Cimegripe e cama', 4, 2),
	('miopia', 'Óculos com 4 graus', 1, 4),
	('Amor não correspondido', 'Viajar', 3, 3),
	('Hipertireoidismo', 'Reposição hormonal', 5, 5),
	('Catapora', 'Talco mentolado', 2, 1);

-- 4.
-- a.
SELECT * FROM paciente
ORDER BY nome;

-- b.
SELECT * FROM medico
WHERE especialidade = 'Clínica Geral'
ORDER BY nome;

-- c.
SELECT COUNT(*) AS total_consultas FROM medico;
SELECT COUNT(*) AS total_consultas FROM paciente;
SELECT COUNT(*) AS total_consultas FROM consulta;

-- d.
SELECT * FROM medico
WHERE CAST(crm AS VARCHAR) LIKE '1%' AND crm LIKE '%DF';

-- e.
select paciente.nome from paciente
inner join consulta on paciente.idpaciente = consulta.idpaciente
where doenca = 'gripe';

-- f.
SELECT medico.nome, paciente.nome, consulta.doenca, consulta.receita
FROM medico INNER JOIN consulta ON medico.idmedico = consulta.idmedico
INNER JOIN paciente ON paciente.idpaciente = consulta.idpaciente;