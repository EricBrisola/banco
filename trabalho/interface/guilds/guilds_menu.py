from .insert_new_guilds import insert_new_guilds
from .get_all_guilds import get_all_guilds
from .delete_guilds import delete_guilds
from .get_one_guilds import get_one_guilds
from .update_guilds import update_guild

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
                print("\nRemover guilda\n")
                delete_guilds()
            elif charChoice == 4:
                print("\nAtualizar guilda\n")
                update_guild()
            elif charChoice == 3:
                print("\nInserir nova guilda\n")
                insert_new_guilds()
            elif charChoice == 2:
                print("\nListar apenas uma\n")

                charTable = get_one_guilds()
                if len(charTable) > 0:
                    character, headers = charTable[0], charTable[1]
                    print(tabulate(character, headers=headers, tablefmt="fancy_grid"))
            elif charChoice == 1:
                print("\nListar todas\n")
                get_all_guilds()

        except ValueError:
            print("\nDigite uma entrada válida")
