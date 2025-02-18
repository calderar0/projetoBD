#Retorne a série e a sala do aluno "João Silva".
SELECT t.Serie, t.Sala
FROM Turma t, Aluno a
WHERE t.IdTurma = a.IdTurma AND a.Nome = "João Silva";
#Retorne o ID de todos os professores que ensinam a matéria "Biologia"

SELECT p.IdFuncionario
FROM Professor p, Leciona l, Disciplina d
WHERE p.IdFuncionario = l.IdFuncProf AND l.IdDisciplina = d.IdDisciplina AND d.NomeDisc = "Biologia";

#O título do projeto científico no qual a aluna "Fernanda Lima" participa.
SELECT p2.Titulo
FROM Aluno a, Participa p, ProjetoCientifico p2
WHERE a.IdAluno = p.IdAluno AND p.IdProjeto = p2.IdProjeto AND a.Nome = "Fernanda Lima";

#Nome do projeto, o nome da tecnologia sustentável que este usa e a descrição da tecnologia.
SELECT p.Titulo, t.Nome, t.Descricao
FROM TecnologiaSustentavel t, Utiliza u, ProjetoCientifico p
WHERE t.IdTecnologia = u.IdTecnologia AND u.IdProjeto = p.IdProjeto;

#Retorne o ID do professor e o projeto que ele orienta.
SELECT p.IdFuncionario, p2.Titulo
FROM Professor p JOIN ProjetoCientifico p2 ON (p.IdFuncionario = p2.IdFuncProf);

#Nomes de todos os alunos (independentemente da classe) e os projetos científicos que participam. 
SELECT a.Nome, p2.Titulo
FROM Aluno a LEFT JOIN Participa p on(a.IdAluno = p.IdAluno) LEFT JOIN ProjetoCientifico p2 on(p.IdProjeto = p2.IdProjeto)
ORDER BY a.Nome;

#Todos os Ids dos professores e as séries que ensinam.
SELECT p.IdFuncionario, t.Serie
FROM Professor p LEFT JOIN Ensina e on(p.IdFuncionario = e.IdFuncProf) LEFT JOIN Turma t on(e.IdTurma = t.IdTurma);

#Retorne o Id da turma e também a contagem do total de alunos por turma, exiba de forma decrescente.
SELECT IdTurma, COUNT(*) AS TotalAlunos
FROM Aluno
GROUP BY IdTurma
ORDER BY TotalAlunos DESC;

#Retorne o Id da disciplina em que a média de notas foi maior que 8.
SELECT IdDisciplina, AVG(Nota) AS MediaNota
FROM Faz
GROUP BY IdDisciplina
HAVING AVG(Nota) > 8;

#Retorne a soma de cargas horárias e a formação acadêmica de cada funcionário, agrupe pela formação acadêmica.
SELECT FormacaoAcademica, SUM(CargaHoraria) AS CargaHorariaTotal
FROM Funcionario
GROUP BY FormacaoAcademica;

#Retorne a formação acadêmica e a contagem total de professores, agrupe por formação acadêmica e ordene decrescentemente pelo número de professores.
SELECT FormacaoAcademica, COUNT(*) AS TotalProfessores
FROM Funcionario
GROUP BY FormacaoAcademica
ORDER BY TotalProfessores DESC;

#Retorne o ano da data de nascimento e a média de salário dos funcionários, agrupe por ano de nascimento e ordene de forma decrescente por salário.
SELECT YEAR(DataNasc) AS AnoNascimento, AVG(Salario) AS SalarioMedio
FROM Funcionario
GROUP BY YEAR(DataNasc)
ORDER BY SalarioMedio DESC;
