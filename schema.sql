def init_db():
    with app.app_context():
        db = get_db()
        # Tabela de produtos
        db.execute('''
            CREATE TABLE IF NOT EXISTS produtos (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                nome TEXT NOT NULL,
                codigo REAL NOT NULL,
                custo REAL,
                marca TEXT,
                informacoes TEXT,
                quantidade INTEGER,
                data_inclusao TEXT,
                data_validade TEXT
            )
        ''')
        # Tabela de saídas
        db.execute('''
            CREATE TABLE IF NOT EXISTS saidas (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                produto_id INTEGER NOT NULL,
                quantidade INTEGER NOT NULL,
                data_saida TEXT NOT NULL,
                FOREIGN KEY (produto_id) REFERENCES produtos (id)
            )
        ''')
        db.commit()
