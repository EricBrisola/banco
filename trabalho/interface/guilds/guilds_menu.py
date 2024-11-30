from .insert_new_guilds import insert_new_guilds
from .get_all_guilds import get_all_guilds
#from delete_guilds import
#from get_one_builds import

from tabulate import tabulate


def guilds_menu():
    while True:
        print("\n----------------------------------")
        print("Tabela Guildas")
        print("----------------------------------")

        try:
            charChoice = int(input(
                "\n1- Listar todas\n2- Listar apenas uma\n3- Inserir nova\n4- Atualizar\n5- Remover\n6- Sair\nEscolha: "))

            if charChoice >= 6 or charChoice < 1:
                print("\nSaindo...")
                break
            elif charChoice == 5:
                print("\nRemover\n")
                delete_guilds()
            elif charChoice == 4:
                print("\nAtualizar\n")
            elif charChoice == 3:
                print("\nInserir novo\n")
                insert_new_guilds()
            elif charChoice == 2:
                print("\nListar apenas um\n")

                charTable = get_one_builds()
                print(charTable)
                if len(charTable) > 0:
                    character, headers = charTable[0], charTable[1]
                    print(tabulate(character, headers=headers, tablefmt="fancy_grid"))
            elif charChoice == 1:
                print("\nListar todos\n")
                get_all_guilds()

        except ValueError:
            print("\nDigite uma entrada válida")
