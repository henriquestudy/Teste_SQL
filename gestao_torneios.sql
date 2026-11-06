CREATE DATABASE IF NOT EXISTS gestao_torneios;
USE gestao_torneios;

-- Tabela Equipas
CREATE TABLE Equipas (
ID_Equipa INT AUTO_INCREMENT PRIMARY KEY,
Nome_Equipa VARCHAR(100) NOT NULL,
Data_Criacao DATE NOT NULL
);

-- Tabela Jogadores
CREATE TABLE Jogadores (
ID_Jogador INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(100) NOT NULL,
Nickname VARCHAR(50) NOT NULL,
Data_Nascimento DATE NOT NULL,
ID_Equipa INT NOT NULL,
FOREIGN KEY (ID_Equipa)
REFERENCES Equipas(ID_Equipa)
);

-- Tabela Torneios
CREATE TABLE Torneios (
ID_Torneio INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(100) NOT NULL,
Data_Inicio DATE NOT NULL,
Premio_Monetario DECIMAL(10,2) NOT NULL,
CHECK (Premio_Monetario >= 0)
);

-- Tabela Participacoes
CREATE TABLE Participacoes (
ID_Equipa INT NOT NULL,
ID_Torneio INT NOT NULL,
PRIMARY KEY (ID_Equipa, ID_Torneio),
FOREIGN KEY (ID_Equipa)
REFERENCES Equipas(ID_Equipa),
FOREIGN KEY (ID_Torneio)
REFERENCES Torneios(ID_Torneio)
);

INSERT INTO Equipas(Nome_Equipa, Data_Criacao) VALUES ("Flamengo", "2000-06-20"), ("Barcelona", "1998-02-20");
SELECT * FROM Equipas;


INSERT INTO Jogadores(Nome, Nickname, Data_Nascimento, ID_Equipa) VALUES("Henrique", "Henrique M.", "2009-05-19", 2), ("Casemiro", "Casemiro S.", "1996-08-23", 1);
SELECT * FROM Jogadores;


INSERT INTO Torneios(Nome, Data_Inicio, Premio_Monetario) VALUES("Champions","2027-03-12", 100000), ("Fundo do quintal", "2026-08-23", 10), ("Bola nos pes", "2028-02-16", 300);
SELECT * FROM Torneios;


INSERT INTO Participacoes(ID_Torneio, ID_Equipa) VALUES(1, 2), (1, 1), (2, 1), (3, 2);
SELECT * FROM Participacoes;




/* a) */ 
SELECT * FROM Jogadores ORDER BY Nome;

/* b) */ 
SELECT Nome, ID_Equipa FROM Jogadores;


/* c) */ 
SELECT * FROM Equipas INNER JOIN Participacoes ON Equipas.ID_Equipa = Participacoes.ID_Equipa INNER JOIN Torneios ON Participacoes.ID_Torneio = Torneios.ID_Torneio;






