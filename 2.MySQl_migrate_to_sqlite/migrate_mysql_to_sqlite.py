import mysql.connector
import sqlite3
import os

# MySQL 配置
mysql_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '123456',
    'database': 'notebook'
}

# SQLite 数据库文件
sqlite_db_file = 'notebook_mojoru.db'

def migrate_data():
    # 连接到 MySQL 数据库
    mysql_conn = mysql.connector.connect(**mysql_config)
    mysql_cursor = mysql_conn.cursor()

    # 查询数据
    mysql_cursor.execute("SELECT * FROM message")
    rows = mysql_cursor.fetchall()

    # 连接到 SQLite 数据库
    sqlite_conn = sqlite3.connect(sqlite_db_file)
    sqlite_cursor = sqlite_conn.cursor()

    # 创建表（如果不存在）
    sqlite_cursor.execute('''
        CREATE TABLE IF NOT EXISTS message (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            body TEXT,
            timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
        )
    ''')
    
    print("Table 'message' created or already exists.")

    # 插入数据
    for row in rows:
        sqlite_cursor.execute('''
            INSERT INTO message (name, body, timestamp) VALUES (?, ?, ?)
        ''', (row[1], row[2], row[3]))

    # 提交并关闭连接
    sqlite_conn.commit()
    sqlite_cursor.close()
    sqlite_conn.close()
    
    mysql_cursor.close()
    mysql_conn.close()

    print(f"成功迁移 {len(rows)} 条记录到 SQLite 数据库 '{sqlite_db_file}'")

if __name__ == "__main__":
    print("Current working directory:", os.getcwd())
    migrate_data()
