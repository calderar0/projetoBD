from projeto import db

def delete(tablename, key):
    """Exclui um registro."""
    cur = db.get_db().cursor()
    cur.execute(f'DELETE FROM {tablename} WHERE id = %s', (key,))
    db.get_db().commit()

def insert(tablename, form):
    """Insere um registro dinamicamente."""
    cur = db.get_db().cursor()
    columns = ', '.join(form.keys())
    placeholders = ', '.join(['%s'] * len(form))
    values = tuple(form.values())
    cur.execute(f'INSERT INTO {tablename} ({columns}) VALUES ({placeholders})', values)
    db.get_db().commit()

def update(tablename, key, form):
    """Atualiza um registro dinamicamente."""
    cur = db.get_db().cursor()
    updates = ', '.join([f'{col} = %s' for col in form.keys()])
    values = tuple(form.values()) + (key,)
    cur.execute(f'UPDATE {tablename} SET {updates} WHERE id = %s', values)
    db.get_db().commit()

def open_record(tablename, key):
    """Retorna um registro pelo ID."""
    cur = db.get_db().cursor(dictionary=True)
    cur.execute(f'SELECT * FROM {tablename} WHERE id = %s', (key,))
    return cur.fetchone()

def get_all(tablename):
    """Retorna todos os registros de uma tabela."""
    cur = db.get_db().cursor(dictionary=True)
    cur.execute(f'SELECT * FROM {tablename}')
    return cur.fetchall()

def init_app(app):
    """Registra funções para serem usadas nas páginas HTML."""
    app.jinja_env.globals.update(get_all=get_all)
