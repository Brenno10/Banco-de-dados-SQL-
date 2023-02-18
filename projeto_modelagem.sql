CREATE DATABASE hospital_db;

USE hospital_db;

CREATE TABLE hospital (
	id_hospital INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255) NOT NULL,
	cnpj INT NOT NULL,
	PRIMARY KEY (id_hospital)
);

CREATE TABLE alas (
	id_ala INT NOT NULL IDENTITY(1,1),
	tipo_de_ala VARCHAR(255) NOT NULL,
	identificador VARCHAR(5) NOT NULL,
	id_hospital INT NOT NULL,
	PRIMARY KEY (id_ala),
	FOREIGN KEY (id_hospital) REFERENCES hospital(id_hospital)
);

CREATE TABLE enfermeira_chefe (
	id_chefe INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255) NOT NULL,
	cre VARCHAR(255) NOT NULL,
	id_ala INT NOT NULL,
	PRIMARY KEY (id_chefe),
	FOREIGN KEY (id_ala) REFERENCES alas(id_ala)
);

CREATE TABLE enfermeira (
	id_enfermeira INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255) NOT NULL,
	cre VARCHAR(255) NOT NULL,
	id_chefe INT NOT NULL,
	PRIMARY KEY (id_enfermeira),
	FOREIGN KEY (id_chefe) REFERENCES enfermeira_chefe(id_chefe)
);

CREATE TABLE plano_saude (
	id_plano INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255) NOT NULL,
	telefone VARCHAR(255) NOT NULL,
	operadora VARCHAR(255) NOT NULL,
	id_hospital INT NOT NULL,
	PRIMARY KEY (id_plano),
	FOREIGN KEY (id_hospital) REFERENCES hospital(id_hospital)
);

CREATE TABLE paciente (
	id_paciente INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255) NOT NULL,
	nascimento DATE NOT NULL,
	telefone VARCHAR(255),
	PRIMARY KEY(id_paciente)
);

CREATE TABLE credenciado (
	id_credenciado INT NOT NULL IDENTITY(1,1),
	id_plano INT NOT NULL,
	id_paciente INT NOT NULL,
	PRIMARY KEY (id_credenciado),
	FOREIGN KEY (id_plano) REFERENCES plano_saude(id_plano),
	FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

CREATE TABLE medico (
	id_medico INT NOT NULL IDENTITY(1,1),
	crm VARCHAR(255) NOT NULL,
	nome VARCHAR(255) NOT NULL,
	especialidade VARCHAR(255),
	PRIMARY KEY (id_medico)
);

CREATE TABLE atendimento (
	id_atendimento INT NOT NULL IDENTITY(1,1),
	data_atendimento DATE NOT NULL,
	id_medico INT NOT NULL,
	id_paciente INT NOT NULL,
	PRIMARY KEY (id_atendimento),
	FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
	FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);
