from connection.database_connection import get_connection
from .get_one_character import get_one_character
from tabulate import tabulate


def delete_character():
    charTable = get_one_character()

    if len(charTable) > 0:
        character, headers = charTable[0], charTable[1]
        print(tabulate(character, headers=headers, tablefmt="fancy_grid"))
    else:
        return

    choice = input("\nDeseja excluir esse personagem ? (S/N): ")

    if choice == "S" or choice == "s":
        conexao = get_connection()
        charId = charTable[0][0][0]

        if conexao:
            cursor = conexao.cursor()
            query = "DELETE FROM Personagem WHERE id = %s;"
            cursor.execute(query, (charId,))
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
