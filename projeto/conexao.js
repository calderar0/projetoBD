async function carregarAlunos() {
    const resposta = await fetch("http://localhost:3001/aluno");
    const alunos = await resposta.json();
    const tabela = document.getElementById("aluno");

    tabela.innerHTML = "";
    alunos.forEach(aluno => {
        const linha = `<tr>
            <td>${aluno.IdAluno}</td>
            <td>${aluno.Nome}</td>
            <td>${aluno.DataNasc}</td>
            <td>${aluno.Email}</td>
            <td>${aluno.CPF}</td>
            <td>${aluno.Nacionalidade}</td>
            <td>${aluno.Endereco}</td>
            <td>${aluno.Tel}</td>
            <td>${aluno.IdTurma}</td>
        </tr>`;
        tabela.innerHTML += linha;
    });
}

function toggleTabela() {
    const tabela = document.getElementById("tabela");
    if (tabela.style.display === "none" || tabela.style.display === "") {
        tabela.style.display = "table";
        carregarAlunos();
    } else {
        tabela.style.display = "none";
    }
}