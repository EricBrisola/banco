from connection.database_connection import get_connection
from tabulate import tabulate


def get_all_guilds() -> None:
    conexao = get_connection()

    if conexao:
        cursor = conexao.cursor()
        query = 'SELECT g.id AS Código, g.nome as Guilda, p.nome AS Líder FROM Guilda g JOIN Personagem p ON g.idLider = p.id;'
        cursor.execute(query)
        guilds = cursor.fetchall()

        colunas = [desc[0] for desc in cursor.description]

        print(tabulate(guilds, headers=colunas,
              tablefmt="fancy_grid"))

        cursor.close()
        conexao.close()


