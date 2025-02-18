CREATE TABLE Disciplina(
	IdDisciplina INT,
	NomeDisc VARCHAR(40) NOT NULL,
	CargaHoraria INT NOT NULL,
	Descricao VARCHAR(30),
	PRIMARY KEY(IdDisciplina)
);

CREATE TABLE Turma(
	IdTurma INT,
	QuantAlunos INT,
	Sala INT,
	Serie INT,
	Ano INT,
	PRIMARY KEY(IdTurma)
);

CREATE TABLE Funcionario(
	IdFuncionario INT,
	Nome VARCHAR(40) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	DataNasc DATE,
	CPF VARCHAR(11) NOT NULL,
	FormacaoAcademica VARCHAR(30),
	CargaHoraria INT,
	Salario INT,
	Tel VARCHAR(12),
	PRIMARY KEY(IdFuncionario)
);

CREATE TABLE TecnologiaSustentavel(
	IdTecnologia INT,
	Nome VARCHAR(40) NOT NULL,
	Descricao VARCHAR(60),
	PRIMARY KEY(IdTecnologia)
);

CREATE TABLE ParceiroInstitucional(
	IdParceiro INT,
	Nome VARCHAR(40) NOT NULL,
	Tipo VARCHAR(30),
	PRIMARY KEY(IdParceiro)
);

CREATE TABLE Aluno(
	IdAluno INT,
	Nome VARCHAR(40) NOT NULL,
	DataNasc DATE,
	Email VARCHAR(30) NOT NULL,
	CPF VARCHAR(11) NOT NULL,
	Nacionalidade VARCHAR(30),
	Endereco VARCHAR(50),
	Tel VARCHAR(12),
	IdTurma INT,
	PRIMARY KEY(IdAluno),
	FOREIGN KEY(IdTurma) REFERENCES Turma(IdTurma)
);

CREATE TABLE Coordenador(
	IdFuncionario INT,
	Area VARCHAR(20),
	PRIMARY KEY(IdFuncionario),
	FOREIGN KEY(IdFuncionario) REFERENCES Funcionario(IdFuncionario)
);

CREATE TABLE Diretor(
	IdFuncionario INT,
	Vigencia INT,
	PRIMARY KEY(IdFuncionario),
	FOREIGN KEY(IdFuncionario) REFERENCES Funcionario(IdFuncionario)
);

CREATE TABLE Professor(
	IdFuncionario INT,
	Contrato VARCHAR(20),
	PRIMARY KEY(IdFuncionario),
	FOREIGN KEY(IdFuncionario) REFERENCES Funcionario(IdFuncionario)
);

CREATE TABLE ProjetoCientifico(
	IdProjeto INT,
	Titulo VARCHAR(30) NOT NULL,
	Descricao VARCHAR(60),
	DataInicio DATE,
	DataFim DATE,
	IdFuncProf INT,
	IdParceiro INT,
	PRIMARY KEY(IdProjeto),
	FOREIGN KEY(IdFuncProf) REFERENCES Professor(IdFuncionario),
	FOREIGN KEY(IdParceiro) REFERENCES ParceiroInstitucional(IdParceiro)
);
CREATE TABLE Leciona(
	IdFuncProf INT,
	IdDisciplina INT,
	Ano INT,
	Semestre INT,
	Horario INT,
	PRIMARY KEY(IdFuncProf,IdDisciplina),
	FOREIGN KEY(IdFuncProf) REFERENCES Professor(IdFuncionario),
	FOREIGN KEY(IdDisciplina) REFERENCES Disciplina(IdDisciplina)
);

CREATE TABLE Ensina(
	IdFuncProf INT,
	IdTurma INT,
	PRIMARY KEY(IdFuncProf,IdTurma),
	FOREIGN KEY(IdFuncProf) REFERENCES Professor(IdFuncionario),
	FOREIGN KEY(IdTurma) REFERENCES Turma(IdTurma)
);

CREATE TABLE Faz(
	IdAluno INT,
	IdDisciplina INT,
	Nota INT,
	PRIMARY KEY(IdAluno,IdDisciplina),
	FOREIGN KEY(IdAluno) REFERENCES Aluno(IdAluno),
	FOREIGN KEY(IdDisciplina) REFERENCES Disciplina(IdDisciplina)
);

CREATE TABLE Participa(
	IdAluno INT,
	IdProjeto INT,
	DataInicio DATE,
	DataFim DATE,
	PRIMARY KEY(IdAluno,IdProjeto),
	FOREIGN KEY(IdAluno) REFERENCES Aluno(IdAluno),
	FOREIGN KEY(IdProjeto) REFERENCES ProjetoCientifico(IdProjeto)
);

CREATE TABLE Utiliza(
	IdProjeto INT,
	IdTecnologia INT,
	PRIMARY KEY(IdProjeto,IdTecnologia),
	FOREIGN KEY(IdProjeto) REFERENCES ProjetoCientifico(IdProjeto),
	FOREIGN KEY(IdTecnologia) REFERENCES TecnologiaSustentavel(IdTecnologia)
);
