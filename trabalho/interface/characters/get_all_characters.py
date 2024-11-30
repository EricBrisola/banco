from connection.database_connection import get_connection
from tabulate import tabulate


def get_all_characters():
    conexao = get_connection()

    if conexao:
        cursor = conexao.cursor()
        query = 'SELECT p.id AS Código , p.nome AS Nome, g.nome AS Guilda, p.classe AS Classe, p.hp AS Vida, p.forca AS Força, p.stamina AS Energia FROM Personagem p LEFT JOIN Guilda g ON p.idGuilda = g.id'
        cursor.execute(query)
        characters = cursor.fetchall()

        colunas = [desc[0] for desc in cursor.description]

        print(tabulate(characters, headers=colunas,
              tablefmt="fancy_grid"))

        cursor.close()
        conexao.close()
