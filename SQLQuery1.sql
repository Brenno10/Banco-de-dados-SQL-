CREATE DATABASE escola_db;

USE escola_db;


CREATE TABLE estudantes (
	id INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(255),
	data_nascimento DATE,
	PRIMARY KEY(id)
);

ALTER TABLE estudantes ADD mensalidade NUMERIC;

/* 
	Syntax:
	INSERT INTO <tabela> (<valores a colocar>...) VALUES (<valores>...); 
*/
INSERT INTO estudantes(nome, email, data_nascimento, mensalidade) VALUES ('Mariana', 'mariana@hotmai.com', '01-01-1996', 350.0);
INSERT INTO estudantes (nome, email, data_nascimento, mensalidade) VALUES ( 'Mariane', 'mariane@hotmail.com', '01-01-1996', 350.00);
INSERT INTO estudantes (nome, email, data_nascimento, mensalidade) VALUES ( 'Rafaela', 'rafaela@hotmail.com', '01-04-1995', 250.00);
INSERT INTO estudantes (nome, email, data_nascimento, mensalidade) VALUES ( 'Douglas', 'douglas@hotmail.com', '05-07-1993', 250.00);
INSERT INTO estudantes (nome, email, data_nascimento, mensalidade) VALUES ( 'Mauricio', 'mauricio@hotmail.com', '01-10-1990', 300.00);
INSERT INTO estudantes (nome, email, data_nascimento, mensalidade) VALUES ( 'Roberto', 'robertoo@gmail.com', '01-10-1989', 400.00);
INSERT INTO estudantes (nome, email, data_nascimento, mensalidade) VALUES ( 'Helena', 'helena@gmail.com', '01-09-1992', 420.00);
INSERT INTO estudantes (nome, email, data_nascimento, mensalidade) VALUES ( 'Isabela', 'isabel@gmail.com', '09-10-1988', 420.00);

SELECT * FROM estudantes;


CREATE TABLE telefones (
	id INT NOT NULL IDENTITY(1,1),
	telefone CHAR(11) NOT NULL,
	estudante_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY(estudante_id) REFERENCES estudantes(id)
);

INSERT INTO telefones (telefone, estudante_id) VALUES ('11998101123', 1);
INSERT INTO telefones (telefone, estudante_id) VALUES ('11998333323', 1);
INSERT INTO telefones (telefone, estudante_id) VALUES ('11998444423', 1);
INSERT INTO telefones (telefone, estudante_id) VALUES ('14998107773', 2);
INSERT INTO telefones (telefone, estudante_id) VALUES ('19998105555', 3);
INSERT INTO telefones (telefone, estudante_id) VALUES ('19998100000', 3);

SELECT * FROM telefones;


SELECT * FROM estudantes ORDER BY mensalidade DESC; /* DESC = decrescente */

SELECT nome AS estudante,
	data_nascimento,
	mensalidade AS valor_mensalidade
FROM estudantes

SELECT * FROM estudantes WHERE mensalidade IN (250, 300, 400);

SELECT * FROM estudantes WHERE email LIKE '%@gmail.com%';

SELECT COUNT(*) FROM estudantes WHERE data_nascimento < '01-01-1995';

SELECT * FROM estudantes 
	WHERE mensalidade IN (250, 300, 400)
	AND data_nascimento < '01-01-1992'
ORDER BY mensalidade DESC;

