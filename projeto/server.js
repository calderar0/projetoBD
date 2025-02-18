const express = require("express");
const mysql = require("mysql");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "###", // Defina a senha correta
    database: "###",
});


db.connect((err) => {
    if (err) {
        console.error("Erro ao conectar ao banco de dados:", err);
        return;
    }
    console.log("Conectado ao MySQL");
});

// Rota para buscar alunos
app.get("/aluno", (req, res) => {
    db.query("SELECT * FROM aluno", (err, results) => {
        if (err) {
            res.status(500).send("Erro ao buscar alunos");
            return;
        }
        res.json(results);
    });
});

// Iniciar servidor
app.listen(3001, () => {
    console.log("Servidor rodando na porta 3001");
});
