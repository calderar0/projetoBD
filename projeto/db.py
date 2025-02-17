import os
import mysql.connector

import click
from flask import current_app, g
from flask.cli import with_appcontext

def close_db(e=None):
    """Fecha o banco de dados."""
    db = g.pop('db', None)
    if db is not None:
        db.close()

def get_db():
    """Retorna o banco de dados."""
    if 'db' not in g:
        g.db = mysql.connector.connect(
            host=current_app.config['DB_HOST'],
            user=current_app.config['DB_USER'],
            password=current_app.config['DB_PASSWORD'],
            database=current_app.config['DB_NAME']
        )
    return g.db

def get_menu():
    """Retorna todas as tabelas do banco de dados."""
    cur = get_db().cursor()
    cur.execute("SHOW TABLES")
    return [row[0] for row in cur.fetchall()]

def init_db():
    """Inicia o banco de dados e cria tabelas de exemplo."""
    db = get_db()
    cur = db.cursor()
    
    cur.execute('''CREATE TABLE IF NOT EXISTS estado_civil (
                    cod_ecivil VARCHAR(1) PRIMARY KEY,
                    estado_civil VARCHAR(50) NOT NULL)''')
    
    cur.execute('''CREATE TABLE IF NOT EXISTS funcionario (
                    cod_func INT PRIMARY KEY AUTO_INCREMENT,
                    nome VARCHAR(50) NOT NULL,
                    cod_ecivil VARCHAR(1),
                    FOREIGN KEY(cod_ecivil) REFERENCES estado_civil(cod_ecivil))''')
    
    cur.executemany("INSERT IGNORE INTO estado_civil (cod_ecivil, estado_civil) VALUES (%s, %s)",
                    [('c', 'Casado(a)'), ('e', 'Enrolado'), ('n', 'Namorando'), ('r', 'Em um relacionamento sério'), ('s', 'Solteiro(a)')])
    
    cur.executemany("INSERT IGNORE INTO funcionario (nome, cod_ecivil) VALUES (%s, %s)",
                    [('Maria', 's'), ('Pedro', 'c')])
    
    db.commit()

def sql_exec(form):
    """Executa uma instrução SQL por vez."""
    db = get_db()
    cur = db.cursor()
    cur.execute(form['sql'])
    db.commit()
    return cur

@click.command('init-db')
@with_appcontext
def init_db_command():
    """Inicia banco de dados."""
    init_db()
    click.echo('Banco de dados MySQL iniciado.')

def init_app(app):
    """Registra funções do banco de dados."""
    app.teardown_appcontext(close_db)
    app.cli.add_command(init_db_command)
    app.jinja_env.globals.update(get_menu=get_menu)
