CREATE DATABASE client_db;

USE client_db;

CREATE TABLE client(
	id_client INT NOT NULL IDENTITY(1,1) primary key,
	nome VARCHAR(255) NOT NULL,
	idade int NOT NULL,
	sexo CHAR(1),
	cpf CHAR(11) NOT NULL,
	email VARCHAR(255)
);


INSERT INTO client (nome, idade, sexo, cpf) VALUES ('robson', 40,'M', '12312312312');
INSERT INTO client (nome, idade, sexo, cpf) VALUES ('Denise', 35,'F', '18989888812');
INSERT INTO client (nome, idade, sexo, cpf) VALUES ('Madalena', 55,'F', '34534534545');
INSERT INTO client (nome, idade, sexo, cpf) VALUES ('Jorge', 60, 'M', '89089089090');
INSERT INTO client (nome, idade, sexo, cpf) VALUES ('Ana', 18, 'F','90909009090');
INSERT INTO client (nome, idade, sexo, cpf) VALUES ('Bruna', 26, 'F','78568945239');

SELECT * FROM client;

SELECT * FROM client WHERE sexo='M';

SELECT * FROM client WHERE sexo='F' AND idade>30 ORDER BY idade DESC;


--


CREATE TABLE departamentos (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	departamento VARCHAR(20)
);

CREATE TABLE funcionarios (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(50),
	sexo CHAR(1),
	data_nasc DATE NOT NULL,
	salario NUMERIC,
	departamento_id INT NOT NULL,
	FOREIGN KEY(departamento_id) REFERENCES departamentos(id)
);

INSERT INTO departamentos (departamento) VALUES
	('Vendas'),
	('Marketing'),
	('RH'),
	('TI'),
	('Admnistrativo'),
	('Desenvolvimento')
;

INSERT INTO funcionarios (nome, email, sexo, data_nasc, salario, departamento_id) VALUES
	('Luana', 'luana@gmail.com', 'F', '01-05-1996', 3000, 1),
	('Marilia', 'marilia@hotmail.com', 'F', '03-05-1995', 3100, 2),
	('Raquel', 'raquel@gmail.com', 'F', '15-07-1994', 3050, 3),
	('Joana', 'joana@gmail.com', 'F', '03-07-1995', 3000, 4),
	('Fabricio', 'fabricio@gmail.com', 'M', '01-05-1993', 4700, 5),
	('Everaldo', 'everaldo@hotmail.com', 'M', '07-05-1993', 4600, 6),
	('Ricardo', 'ricardo@gmail.com', 'M', '15-05-1998', 3500, 1),
	('Cleber', 'cleber@hotmail.com', 'M', '01-05-1997', 3300, 3),
	('Fernando', 'fernando@hotmail.com', 'M', '03-05-1989', 3000, 2),
	('Felipe', 'felipe@hotmail.com', 'M', '03-05-1996', 3070, 4),
	('Matheus', 'matheus@hotmail.com', 'M', '15-05-1989', 4060, 5),
	('Rodrigo', 'rodrigo@hotmail.com', 'M', '01-05-1996', 3060, 6),
	('Luma', 'luma@gmail.com', 'F', '01-05-1996', 3700, 1),
	('Rafael', 'rafael@gmail.com', 'M', '15-03-1991', 3500, 4),
	('Mariana', 'mariana@gmail.com', 'F', '01-07-1998', 3900, 4),
	('Monique', 'monique@gmail.com', 'F', '15-07-1993', 4100, 2),
	('Joaquim', 'joaquim@hotmail.com', 'M', '01-05-1994', 3300, 3),
	('Sandro', 'sandro@gmail.com', 'M', '01-05-1996', 4700, 5),
	('Henrique', 'henrique@gmail.com', 'M', '07-07-1995', 3500, 6),
	('Maria', 'maria@gmail.com', 'F', '07-07-1995', 4100, 3),
	('Penha', 'penha@gmail.com', 'F', '07-07-1988', 5000, 5),
	('Laura', 'laura@gmail.com', 'F', '07-07-1990', 5500, 5)
;

SELECT * FROM funcionarios ORDER BY data_nasc DESC;

SELECT COUNT(*) AS contagem_funcionario FROM funcionarios WHERE sexo='M'; -- contagem

SELECT AVG(salario) AS media_salario FROM funcionarios; -- média

SELECT SUM(salario) AS soma_salario FROM funcionarios; -- soma

SELECT MIN(salario) AS menor_salario FROM funcionarios; -- mínimo

SELECT MAX(salario) AS maior_salario FROM funcionarios; -- máximo

SELECT departamento_id, 
	MIN(salario) AS menor_salario, 
	MAX(salario) AS maior_salario 
	FROM funcionarios 
	GROUP BY departamento_id
;

SELECT sexo,
	AVG(salario) AS media_salario,
	COUNT(sexo) AS quantidade_pessoas
	FROM funcionarios
	GROUP BY sexo
;
