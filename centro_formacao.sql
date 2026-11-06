CREATE DATABASE IF NOT EXISTS centro_formacao;
USE centro_formacao;

/* idTurmaCurso INT, 
FOREIGN KEY (idTurmaCurso) REFERENCES turma_curso(idTurmaCurso) */
CREATE TABLE turma (
idTurma INT AUTO_INCREMENT PRIMARY KEY,
designacaoTurma VARCHAR(40),
datacriacao DATE
);

CREATE TABLE curso (
idCurso INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
inicio DATE,
cargaHorária DATETIME
);

CREATE TABLE turma_curso (
idTurmaCurso INT AUTO_INCREMENT PRIMARY KEY,
idCurso INT, 
FOREIGN KEY (idCurso) REFERENCES curso(idCurso),
idTurma INT, 
FOREIGN KEY (idTurma) REFERENCES turma(idTurma) 
);


CREATE TABLE formando (
idFormando INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(60) NOT NULL,
numIdentificacao INT NOT NULL,
dataNasc DATE,
idTurma INT, 
FOREIGN KEY (idTurma) REFERENCES turma(idTurma) 
);

