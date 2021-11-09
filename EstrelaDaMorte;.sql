– NO CASO FOI CRIADO O BANCO DE DADOS
use master;
go;

CREATE DATABASE EstrelaDaMorte;


use EstrelaDaMorte;
go

---CRIANDO TABELA PLANETAS
---CREATE TABLE Planetas
--(
--IdPlaneta int NOT NULL,
--Nome VARCHAR(50) NOT NULL,
--Rotacao float NOT NULL,
--Orbita float NOT NULL,
--Diametro float NOT NULL,
--Clima varchar(50) NOT NULL,
--Populacao int NOT NULL,
--)
--GO

--ALTER TABLE Planetas ADD CONSTRAINT PK_Planetas PRIMARY KEY (IdPlaneta);


---CRIANDO TABELA NAVES
--CREATE TABLE Naves
--(
 --   IdNave int NOT NULL,
  --  Nome varchar(100) NOT NULL,
  --  Modelo varchar(50) NOT NULL,
  --  Passageiros int NOT NULL,
  --  Carga float NOT NULL,
  --  Classe varchar(100)

--);
--GO
--ALTER TABLE Naves ADD CONSTRAINT PK_Naves PRIMARY KEY (IdNave);


---CRIANDO TABELA PILOTOS
--CREATE TABLE Pilotos
--(
    --IdPiloto int NOT NULL,
    --Nome VARCHAR(50) NOT NULL,
    --AnoNascimento varchar(10) NOT NULL,
    --IdPlaneta int NOT NULL ---Chave estrangeira que é carrega pelo piloto como 
    ---foi discutida no começo
--);
--GO
--ALTER TABLE Pilotos ADD Constraint PK_Pilotos PRIMARY KEY (IdPiloto);
--GO
--ALTER TABLE Pilotos ADD CONSTRAINT FK_Pilotos_Planetas FOREIGN KEY (IdPlaneta)
--REFERENCES Planetas (IdPlaneta);


---CRIANDO TABLEA INTERMEDIARIA NAVES PILOTOS
--CREATE TABLE PilotosNaves
--(
 --   IdPiloto int NOT NULL,
 --   IdNave int NOT NULL,
 --   FlagAutorizado bit NOT NULL,
--)
--GO
--ALTER TABLE  PilotosNaves ADD CONSTRAINT PK_PilotosNaves PRIMARY KEY (IdPiloto,IdNave);
--GO

--ALTER TABLE PilotosNaves ADD CONSTRAINT FK_PilotosNaves_Pilotos FOREIGN KEY (IdPiloto)
--REFERENCES Pilotos(IdPiloto);
--GO

--ALTER TABLE PilotosNaves ADD Constraint FK_PilotosNaves_Naves FOREIGN KEY (IdNave)
--REFERENCES Naves(IdNave);
--go

--ALTER TABLE PilotosNaves ADD CONSTRAINT DF_PilotosNaves_FlagAutorizado DEFAULT(1) FOR FlagAutorizado;


CREATE TABLE HistoricoViagens
(
    IdNave int NOT NULL,
    IdPiloto int NOT NULL,
    DtSaida datetime NOT NULL,
    DtChegada datetime NOT NULL

);
go

ALTER TABLE HistoricoViagens ADD CONSTRAINT FK_HistoricoViagens_PilotosNaves FOREIGN KEY (IdPiloto,IdNave)
REFERENCES PilotosNaves(IdPiloto,IdNave);
GO

ALTER TABLE HistoricoViagens CHECK CONSTRAINT FK_HistoricoViagens_PilotosNaves
