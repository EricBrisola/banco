from connection.database_connection import get_connection
from .get_one_character import get_one_character
from tabulate import tabulate
from guilds.get_one_guilds import get_one_guilds


def update_character():
    charTable = get_one_character()

    if len(charTable) > 0:
        character, headers = charTable[0], charTable[1]
        print(tabulate(character, headers=headers, tablefmt="fancy_grid"))
    else:
        return

    choice = input("\nDeseja Atualizar esse personagem ? (S/N): ")
    charId = charTable[0][0][0]

    if choice.lower() == "s":
        query = ""
        while True:
            conexao = get_connection()
            charAttribute = int(input(
                "\nQual atributo deseja alterar ?\n1- Nome\n2- HP\n3- Força\n4- Stamina\n5- Classe\n6- Guilda\n7- Sair\nEscolha: "))

            if charAttribute >= 7 or charAttribute < 1:
                print("\nSaindo da atualização de personagem...")
                break
            elif charAttribute == 6:
                guildTable = get_one_guilds()
                if len(guildTable) > 0:

                    newGuild = guildTable[0][0][0]
                    query = "UPDATE Personagem SET idGuilda = %s WHERE id = %s"

                    cursor = conexao.cursor()
                    cursor.execute(query, (newGuild, charId))
                    conexao.commit()

                else:
                    return

            elif charAttribute == 5:
                newClass = input(
                    "\nNova classe\nApenas Ladrão, Mago, Guerreiro ou Necromante: ")
                query = "UPDATE Personagem SET classe = %s WHERE id = %s;"

                cursor = conexao.cursor()
                cursor.execute(query, (newClass, charId))
                conexao.commit()

            elif charAttribute == 4:
                newStamina = int(input("\nNova quantidade de stamina: "))
                query = "UPDATE Personagem SET stamina = %s WHERE id = %s;"

                cursor = conexao.cursor()
                cursor.execute(query, (newStamina, charId))
                conexao.commit()
            elif charAttribute == 3:
                newstrength = int(input("\nNova quantidade de força: "))
                query = "UPDATE Personagem SET forca = %s WHERE id = %s;"

                cursor = conexao.cursor()
                cursor.execute(query, (newstrength, charId))
                conexao.commit()
            elif charAttribute == 2:
                newHp = int(input("\nNova quantidade de HP: "))
                query = "UPDATE Personagem SET hp = %s WHERE id = %s;"

                cursor = conexao.cursor()
                cursor.execute(query, (newHp, charId))
                conexao.commit()
            elif charAttribute == 1:
                name = input("\nNovo nome do personagem: ")
                query = "UPDATE Personagem SET nome = %s WHERE id = %s;"

                cursor = conexao.cursor()
                cursor.execute(query, (name, charId))
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
