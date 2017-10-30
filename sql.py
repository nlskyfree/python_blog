import DBUtils import sql

@sql
def queryUser(cursor):
    cursor.execute(r'select * from user')
    data = cursor.fetchall()
    return data

print(queryUser())


