import sqlite3

def sql(func):
    def wrapper():
        conn = sqlite3.connect('blog.db')
        cursor = conn.cursor()
        data = func(cursor)
        conn.commit()
        conn.close()
        return data
    return wrapper
