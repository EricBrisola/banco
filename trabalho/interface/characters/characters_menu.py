from .get_all_characters import get_all_characters
from .get_one_character import get_one_character
from .insert_character import insert_new_character
from .delete_character import delete_character
from tabulate import tabulate


def characters_menu():
    while True:
        print("\n----------------------------------")
        print("Tabela Personagem")
        print("----------------------------------")

        try:
            charChoice = int(input(
                "\n1- Listar todos\n2- Listar apenas um\n3- Inserir novo\n4- Atualizar\n5- Remover\n6- Sair\nEscolha: "))

            if charChoice >= 6 or charChoice < 1:
                print("\nSaindo...")
                break
            elif charChoice == 5:
                print("\nRemover\n")
                delete_character()
            elif charChoice == 4:
                print("\nAtualizar\n")
            elif charChoice == 3:
                print("\nInserir novo\n")
                insert_new_character()
            elif charChoice == 2:
                print("\nListar apenas um\n")

                charTable = get_one_character()
                print(charTable)
                if len(charTable) > 0:
                    character, headers = charTable[0], charTable[1]
                    print(tabulate(character, headers=headers, tablefmt="fancy_grid"))
            elif charChoice == 1:
                print("\nListar todos\n")
                get_all_characters()

        except ValueError:
            print("\nDigite uma entrada válida")
