import mysql.connector
from mysql.connector.connection_cext import CMySQLConnection


def get_connection() -> CMySQLConnection:
    dbConfig = {
        'host': "localhost",
        'user': "admin_jogorpg",
        'password': "SenhaForteAdmin123",
        'database': "JogoRpg"
    }
    try:
        conexao = mysql.connector.connect(**dbConfig)
        return conexao
    except mysql.connector.Error as err:
        print(f'Erro ao conectar ao jogo de RPG: {err}')
