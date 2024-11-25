from interface.connection.database_connection import get_connection
from tabulate import tabulate


def get_one_character() -> None:
    conexao = get_connection()
    id = int(input('Insira o id do personagem a buscar: '))
    # pedir id e passa-lo como parametro quando for colocar no main

    if conexao:
        cursor = conexao.cursor()
        query = 'SELECT p.id AS Código , p.nome AS Nome, g.nome AS Guilda, p.classe AS Classe, p.hp AS Vida, p.forca AS Força, p.stamina AS Energia FROM Personagem p JOIN Guilda g ON p.idGuilda = g.id WHERE p.id = %s'
        cursor.execute(query, (id,))
        characters = cursor.fetchall()

        colunas = [desc[0] for desc in cursor.description]

        print(tabulate(characters, headers=colunas,
              tablefmt="fancy_grid"))

        cursor.close()
        conexao.close()
        # trocar para retornar a string tabulate ao inves de printala aqui


# cancelar a chamada da função nesse arquivo
get_one_character()
