import os
from flask import Flask, render_template, request
from markupsafe import escape

def create_app():
    app = Flask(__name__, instance_relative_config=False)
    app.config.from_mapping(
        SECRET_KEY="dev",
        DB_HOST="localhost",
        DB_USER="projeto",
        DB_PASSWORD="Projeto123!",
        DB_NAME="projeto"
    )
    app.config.from_pyfile('aluno/config.py', silent=False)
    
    from . import db
    db.init_app(app)
    
    from .aluno import util
    util.init_app(app)
    
    def render_html(template_name, page_name, is_table=False, action='view',
                    inserted=False, row=None, changed=False, executed=False,
                    cur=None):
        return render_template(template_name, 
                               project_name=app.config.get('NOME_PROJETO', 'Projeto'),
                               page_name=page_name,
                               is_table=is_table,
                               action=action,
                               inserted=inserted,
                               row=row,
                               changed=changed,
                               executed=executed,
                               cur=cur)
    
    @app.route('/')
    def index():
        return render_html('home.html', 'Home')
    
    @app.route('/sql')
    def sql():
        return render_html('sql.html', 'SQL')
    
    @app.route('/sql/execute', methods=['POST'])
    def sql_exec():
        cur = db.sql_exec(request.form)
        return render_html('sql.html', 'SQL', executed=True, cur=cur)
    
    @app.route('/table/<tablename>')
    def table(tablename):
        tablename = escape(tablename)
        return render_html(f'aluno/{tablename}.html', tablename, is_table=True)
    
    @app.route('/table/<tablename>/delete/<key>')
    def delete(tablename, key):
        tablename, key = map(escape, [tablename, key])
        util.delete(tablename, key)
        return render_html(f'aluno/{tablename}.html', tablename, is_table=True)
    
    @app.route('/table/<tablename>/insert', methods=['GET', 'POST'])
    def insert(tablename):
        tablename = escape(tablename)
        inserted = False
        if request.method == 'POST':
            inserted = True
            util.insert(tablename, request.form)
        return render_html(f'aluno/{tablename}.html', tablename, is_table=True, action='insert', inserted=inserted)
    
    @app.route('/table/<tablename>/open/<key>')
    def open_record(tablename, key):
        tablename, key = map(escape, [tablename, key])
        row = util.open_record(tablename, key)
        return render_html(f'aluno/{tablename}.html', tablename, is_table=True, action='open', row=row)
    
    @app.route('/table/<tablename>/update/<key>', methods=['POST'])
    def update(tablename, key):
        tablename, key = map(escape, [tablename, key])
        util.update(tablename, key, request.form)
        row = util.open_record(tablename, key)
        return render_html(f'aluno/{tablename}.html', tablename, is_table=True, action='open', changed=True, row=row)
    
    return app
