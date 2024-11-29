from interface.connection.database_connection import get_connection


def raid() -> None:
    conexao = get_connection()

    nome = input('Nome: ')
    idraid = int(input('ID da Raid: '))
    boss = int(input('1-Morrok, o Devorador\n 2-Cavaleiro do Vazio\n 3-Geodrax, o Guardião da Pedra \n4-Feiticeiro ZulVaar\n5-Hidrax, o Mutante\n6-Lich Mortífero\n7-Pyroclasto, o Infernal\n8-General Kaltor\nQual Boss deseja enfrentar?: '))
    nivel = int(10,15,22,28,30,36,44,50)
    idinimigo = int(input(""))
    dano = int()
    idtipoini = int()
    nometipo = str('Criaturas Fantásticas', 'Humanos e Humanoides', 'Monstros Elementais', 'Criaturas Sombrias' )

    #forca = int(input('Força: '))
    #stamina = int(input('Stamina: '))
    #classe = input(f'Classe\nApenas Ladrão, Mago, Guerreiro ou Necromante: ')
    #hasGuild = input('Deseja pertencer a uma guilda ? (S/N): ')

    if conexao:
        cursor = conexao.cursor()
        if hasGuild == "S":
            guildId = input("Id da guilda: ")
            queryWithGuild = 'INSERT INTO Personagem (idGuilda, nome, hp, forca, stamina, classe) VALUES (%s, %s, %s, %s, %s, %s)'
            characterWithGuild = (guildId, nome, idraid, forca, stamina, classe)
            cursor.execute(queryWithGuild, characterWithGuild)
        else:
            queryWithoutGuild = 'INSERT INTO Personagem (nome, hp, forca, stamina, classe) VALUES (%s, %s, %s, %s, %s)'
            characterWithoutGuild = (nome, idraid, forca, stamina, classe)
            cursor.execute(queryWithoutGuild, characterWithoutGuild)

        conexao.commit()

        print(f'{cursor.rowcount} registro(s) inserido(s).')
        # chamar a funçao de listar 1 personagem para mostrar ele no banco

        cursor.close()
        conexao.close()


raid()
