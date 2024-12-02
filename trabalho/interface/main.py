from characters.characters_menu import characters_menu
from guilds.guilds_menu import guilds_menu

while True:
    print("----------------------------------")
    print("SISTEMA GERENCIADOR DO JOGO DE RPG")
    print("----------------------------------")
    print("Digite qual tabela deseja entrar/acessar\n")

    try:
        choice = int(
            input("1- Personagem\n2- Guilda\n3- Raid\n4- Sair\nEscolha: "))

        if choice >= 4 or choice < 1:
            print("\nSaindo...")
            break
        elif choice == 3:
            while True:
                print("\nRaid")
        elif choice == 2:
            guilds_menu()
            print("\nGuilda")
        elif choice == 1:
            characters_menu()

    except ValueError:
        print("\nDigite uma entrada válida")
