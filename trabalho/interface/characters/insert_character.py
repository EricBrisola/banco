from connection.database_connection import get_connection


def insert_new_character() -> None:
    conexao = get_connection()

    nome = input('Nome: ')
    hp = int(input('Vida: '))
    forca = int(input('Força: '))
    stamina = int(input('Stamina: '))
    classe = input(f'Classe\nApenas Ladrão, Mago, Guerreiro ou Necromante: ')
    hasGuild = input('Deseja pertencer a uma guilda ? (S/N): ')

    if conexao:
        cursor = conexao.cursor()
        if hasGuild == "S":
            # Inserir a função de buscar guilda para inserir o personagem nela
            guildId = input("Id da guilda: ")
            queryWithGuild = 'INSERT INTO Personagem (idGuilda, nome, hp, forca, stamina, classe) VALUES (%s, %s, %s, %s, %s, %s)'
            characterWithGuild = (guildId, nome, hp, forca, stamina, classe)
            cursor.execute(queryWithGuild, characterWithGuild)
        else:
            queryWithoutGuild = 'INSERT INTO Personagem (nome, hp, forca, stamina, classe) VALUES (%s, %s, %s, %s, %s)'
            characterWithoutGuild = (nome, hp, forca, stamina, classe)
            cursor.execute(queryWithoutGuild, characterWithoutGuild)

        conexao.commit()

        print(f'{cursor.rowcount} registro(s) inserido(s).')
        # chamar a funçao de listar 1 personagem para mostrar ele no banco

        cursor.close()
        conexao.close()
