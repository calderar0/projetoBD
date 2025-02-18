INSERT INTO Turma(IdTurma, QuantAlunos, Sala, Serie, Ano) 
VALUES
(1, 30, 101, 1, 2021),
(2, 25, 102, 1, 2024),
(3, 28, 103, 3, 2023),
(4, 22, 104, 2, 2022),
(5, 20, 105, 4, 2021),
(6, 30, 106, 4, 2023),
(7, 25, 107, 6, 2022),
(8, 28, 108, 5, 2024),
(9, 22, 109, 8, 2024),
(10, 20, 110, 5, 2021);

INSERT INTO Disciplina(IdDisciplina, NomeDisc, CargaHoraria, Descricao) 
VALUES
(1, 'Matemática', 60, 'Introdução à matemática básica'),
(2, 'Português', 50, 'Gramática e redação'),
(3, 'História', 40, 'História do Brasil'),
(4, 'Geografia', 40, 'Geografia mundial'),
(5, 'Ciências', 50, 'Ciências naturais'),
(6, 'Física', 60, 'Física básica'),
(7, 'Química', 60, 'Química geral'),
(8, 'Biologia', 50, 'Biologia celular'),
(9, 'Inglês', 40, 'Inglês básico'),
(10, 'Artes', 30, 'Artes visuais');

INSERT INTO Aluno(IdAluno, Nome, DataNasc, Email, CPF, Nacionalidade, Endereco, Tel, IdTurma) 
VALUES 
(1, 'João Silva', '2000-05-15', 'joao.silva@email.com', '12345678901', 'Brasileiro', 'Rua A, 123', '11987654321', 1),
(2, 'Maria Oliveira', '2001-08-22', 'maria.oliveira@email.com', '23456789012', 'Brasileira', 'Rua B, 456', '11987654322', 1),
(3, 'Carlos Souza', '1999-03-10', 'carlos.souza@email.com', '34567890123', 'Brasileiro', 'Rua C, 789', '11987654323', 2),
(4, 'Ana Costa', '2002-11-05', 'ana.costa@email.com', '45678901234', 'Brasileira', 'Rua D, 101', '11987654324', 2),
(5, 'Pedro Rocha', '2000-07-19', 'pedro.rocha@email.com', '56789012345', 'Brasileiro', 'Rua E, 202', '11987654325', 3),
(6, 'Fernanda Lima', '2001-09-30', 'fernanda.lima@email.com', '67890123456', 'Brasileira', 'Rua F, 303', '11987654326', 3),
(7, 'Ricardo Santos', '1998-12-25', 'ricardo.santos@email.com', '78901234567', 'Brasileiro', 'Rua G, 404', '11987654327', 4),
(8, 'Juliana Pereira', '2002-02-14', 'juliana.pereira@email.com', '89012345678', 'Brasileira', 'Rua H, 505', '11987654328', 4),
(9, 'Lucas Almeida', '2000-06-18', 'lucas.almeida@email.com', '90123456789', 'Brasileiro', 'Rua I, 606', '11987654329', 5),
(10, 'Patricia Gonçalves', '2001-04-12', 'patricia.goncalves@email.com', '01234567890', 'Brasileira', 'Rua J, 707', '11987654330', 5);

INSERT INTO Funcionario(IdFuncionario, Nome, Email, DataNasc, CPF, FormacaoAcademica, CargaHoraria, Salario, Tel) 
VALUES
(1, 'Roberto Carlos', 'roberto.carlos@email.com', '1980-02-06', '12345678901', 'Mestrado em Matemática ', 40, 5000.00, '11987654321'),
(2, 'Ana Paula', 'ana.paula@email.com', '1980-07-15', '23456789012', 'Doutorado em Letras', 40, 6000.00, '11987654322'),
(3, 'Marcos Lima', 'marcos.lima@email.com', '1978-11-10', '34567890123', 'Mestrado em História', 40, 5500.00, '11987654323'),
(4, 'Carla Souza', 'carla.souza@email.com', '1975-07-24', '45678901234', 'Doutorado em Geografia', 40, 7000.00, '11987654324'),
(5, 'Fernando Rocha', 'fernando.rocha@email.com', '1980-07-20', '56789012345', 'Mestrado em Ciências', 40, 6500.00, '11987654325'),
(6, 'Juliana Costa', 'juliana.costa@email.com', '1982-12-30', '67890123456', 'Doutorado em Física', 40, 7200.00, '11987654326'),
(7, 'Ricardo Almeida', 'ricardo.almeida@email.com', '1976-02-14', '78901234567', 'Mestrado em Química', 40, 5800.00, '11987654327'),
(8, 'Patricia Santos', 'patricia.santos@email.com', '1980-09-20', '89012345678', 'Doutorado em Biologia', 40, 6800.00, '11987654328'),
(9, 'Lucas Pereira', 'lucas.pereira@email.com', '1975-01-28', '90123456789', 'Mestrado em Inglês', 40, 5300.00, '11987654329'),
(10, 'Mariana Gonçalves', 'mariana.goncalves@email.com', '1987-08-05', '01234567890', 'Doutorado em Artes', 40, 7500.00, '11987654330');

INSERT INTO Coordenador(IdFuncionario, Area) 
VALUES
(1, 'Matemática'),
(2, 'Letras'),
(3, 'História'),
(4, 'Biologia'),
(5, 'Física'),
(6, 'Química'),
(7, 'Geografia'),
(8, 'Artes'),
(9, 'Inglês'),
(10, 'Ciências');

INSERT INTO Diretor(IdFuncionario, Vigencia) 
VALUES
(1, 5),
(2, 5),
(3, 8),
(4, 13),
(5, 3),
(6, 8),
(7, 4),
(8, 2),
(9, 1),
(10, 9);

INSERT INTO Professor(IdFuncionario, Contrato) 
VALUES
(1, 'CLT'),
(2, 'PJ'),
(3, 'CLT'),
(4, 'PJ'),
(5, 'CLT'),
(6, 'PJ'),
(7, 'CLT'),
(8, 'PJ'),
(9, 'CLT'),
(10, 'PJ');

INSERT INTO ParceiroInstitucional(IdParceiro, Nome, Tipo) 
VALUES
(1, 'GreenTech', 'Empresa'),
(2, 'EcoRecicla', 'ONG'),
(3, 'AgroSustentável', 'Cooperativa'),
(4, 'EduVerde', 'Instituição de Ensino'),
(5, 'WindPower', 'Empresa'),
(6, 'BioEnergy', 'Empresa'),
(7, 'CleanWater', 'ONG'),
(8, 'UrbanGreen', 'Cooperativa'),
(9, 'SolarFuture', 'Empresa'),
(10, 'EcoSolutions', 'Instituição de Ensino');

INSERT INTO TecnologiaSustentavel(IdTecnologia, Nome, Descricao) 
VALUES
(1, 'Painel Solar', 'Painel solar de alta eficiência'),
(2, 'Recicladora Automática', 'Máquina para reciclagem de plásticos'),
(3, 'Irrigação Inteligente', 'Sistema de irrigação automatizado'),
(4, 'Composteira Doméstica', 'Composteira para resíduos orgânicos'),
(5, 'Turbina Eólica', 'Turbina eólica de pequeno porte'),
(6, 'Sensor de Qualidade do Ar', 'Sensor para monitoramento da qualidade do ar'),
(7, 'Lâmpada LED', 'Lâmpada de baixo consumo energético'),
(8, 'Cisterna', 'Sistema de captação de água da chuva'),
(9, 'Bicicleta Elétrica', 'Bicicleta com motor elétrico'),
(10, 'Energia de Biomassa', 'Sistema de geração de energia a partir de biomassa');

INSERT INTO ProjetoCientifico(IdProjeto, Titulo, Descricao, DataInicio, DataFim, IdFuncProf, IdParceiro) 
VALUES
(1, 'Energia Solar', 'Estudo sobre a eficiência da energia solar', '2023-01-01', '2023-12-31', 1, 1),
(2, 'Reciclagem de Plásticos', 'Métodos inovadores para reciclagem', '2023-02-01', '2023-11-30', 2, 2),
(3, 'Agricultura Sustentável', 'Técnicas de agricultura sustentável', '2023-03-01', '2023-10-31', 3, 3),
(4, 'Educação Ambiental', 'Projeto de conscientização ambiental', '2023-04-01', '2023-09-30', 4, 4),
(5, 'Energia Eólica', 'Estudo sobre a viabilidade da energia eólica', '2023-05-01', '2023-08-31', 5, 5),
(6, 'Biodiversidade', 'Estudo da biodiversidade local', '2023-06-01', '2023-12-31', 6, 6),
(7, 'Energia Hidrelétrica', 'Impactos ambientais da energia hidrelétrica', '2023-07-01', '2023-11-30', 7, 7),
(8, 'Gestão de Resíduos', 'Soluções para gestão de resíduos urbanos', '2023-08-01', '2023-10-31', 8, 8),
(9, 'Energia Geotérmica', 'Potencial da energia geotérmica no Brasil', '2023-09-01', '2023-12-31', 9, 9),
(10, 'Sustentabilidade Urbana', 'Práticas sustentáveis em áreas urbanas', '2023-10-01', '2023-12-31', 10, 10);

INSERT INTO Leciona(IdFuncProf, IdDisciplina, Ano, Semestre, Horario) 
VALUES
(1, 1, 2023, 1, '4'),
(2, 2, 2023, 1, '3'),
(3, 3, 2023, 1, '1'),
(4, 4, 2023, 1, '4'),
(5, 5, 2023, 1, '5'),
(6, 6, 2023, 1, '3'),
(7, 7, 2023, 1, '5'),
(8, 8, 2023, 1, '4'),
(9, 9, 2023, 1, '2'),
(10, 10, 2023, 1, '2');

INSERT INTO Ensina(IdFuncProf, IdTurma) 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO Faz(IdAluno, IdDisciplina, Nota) 
VALUES
(1, 1, 8.5),
(2, 2, 9.0),
(3, 3, 7.5),
(4, 4, 8.0),
(5, 5, 9.5),
(6, 6, 7.0),
(7, 7, 8.5),
(8, 8, 9.0),
(9, 9, 7.5),
(10, 10, 8.0);

INSERT INTO Participa(IdAluno, IdProjeto, DataInicio, DataFim) 
VALUES
(1, 1, '2023-01-01', '2023-12-31'),
(2, 2, '2023-02-01', '2023-11-30'),
(3, 3, '2023-03-01', '2023-10-31'),
(4, 4, '2023-04-01', '2023-09-30'),
(5, 5, '2023-05-01', '2023-08-31'),
(6, 6, '2023-06-01', '2023-12-31'),
(7, 7, '2023-07-01', '2023-11-30'),
(8, 8, '2023-08-01', '2023-10-31'),
(9, 9, '2023-09-01', '2023-12-31'),
(10, 10, '2023-10-01', '2023-12-31');

INSERT INTO Utiliza (IdProjeto, IdTecnologia) 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
