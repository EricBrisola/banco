from connection.database_connection import get_connection
from .get_one_guilds import get_one_guilds
from tabulate import tabulate


def delete_guilds():
    charTable = get_one_guilds()

    if len(charTable) > 0:
        character, headers = charTable[0], charTable[1]
        print(tabulate(character, headers=headers, tablefmt="fancy_grid"))
    else:
        return

    choice = input("\nDeseja excluir essa guilda? (S/N): ")

    if choice == "S" or choice == "s":
        conexao = get_connection()
        persId = charTable[0][0][0]

        if conexao:
            cursor = conexao.cursor()
            query = "DELETE FROM Guilda WHERE id = %s;"
            cursor.execute(query, (persId,))
            conexao.commit()

            print(f'{cursor.rowcount} registro(s) removido(s).')

            cursor.close()
            conexao.close()
    elif choice == "N" or choice == "n":
        print("\nOperação cancelada! Retornando...")
        return
    else:
        print("\nEscolha nao encontrada! Retornando...")
        return
