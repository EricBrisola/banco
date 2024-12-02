from connection.database_connection import get_connection
from .get_one_guilds import get_one_guilds
from tabulate import tabulate


def update_guild():
    charTable = get_one_guilds()

    if len(charTable) > 0:
        nome, headers = charTable[0], charTable[1]
        print(tabulate(nome, headers=headers, tablefmt="fancy_grid"))
    else:
        return

    choice = input("\nDeseja Atualizar essa guilda ? (S/N): ")
    charId = charTable[0][0][0]

    if choice.lower() == "s":
        query = ""
        while True:
            conexao = get_connection()
            charAttribute = int(input(
                "\nQual atributo deseja alterar ?\n1- Nome\n2- Id do líder\n3- Sair\nEscolha: "))

            if charAttribute >= 3 or charAttribute < 1:
                print("\nSaindo da atualização da guilda...")
                break
            elif charAttribute == 2:
                newlider = int(input(
                    "\nID do novo líder: "))
                query = "UPDATE Guilda SET idLider = %s WHERE id = %s;"

                cursor = conexao.cursor()
                cursor.execute(query, (newlider, charId))
                conexao.commit()

                print(f'{cursor.rowcount} registro(s) removido(s).')
            elif charAttribute == 1:
                newName = input("\nNovo nome para a guilda: ")
                query = "UPDATE Guilda SET nome = %s WHERE id = %s;"

                cursor = conexao.cursor()
                cursor.execute(query, (newName, charId))
                conexao.commit()
            else:
                print("\nEscolha nao encontrada! Retornando...")
                break

            if conexao:
                print(f'{cursor.rowcount} registro(s) alterado(s).')
                cursor.close()
                conexao.close()

    elif choice.lower() == "n":
        print("\nOperação cancelada! Retornando...")
        return
    else:
        print("\nEscolha nao encontrada! Retornando...")
        return
