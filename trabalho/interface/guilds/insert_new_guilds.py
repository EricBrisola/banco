from connection.database_connection import get_connection
from characters.get_one_character import get_one_character


def insert_new_guilds() -> None:
    conexao = get_connection()

    nome = input('Qual o nome da Guilda: ')
    print("\nPara criar uma guilda, precisamos de um líder")
    personagem = get_one_character()

    persId = personagem[0][0][0]
    guilda = personagem[0][0][2]

    print(personagem)
    
    if guilda == None:
        if conexao:
            cursor = conexao.cursor()

            # Inserir a função de buscar guilda para inserir o personagem nela
            query = 'INSERT INTO Guilda (nome, idLider ) VALUES (%s, %s)'
            guildaDados = (nome, persId)
            cursor.execute(query, guildaDados)
            conexao.commit()
            print(f'{cursor.rowcount} registro(s) inserido(s).')
        # chamar a funçao de listar 1 personagem para mostrar ele no banco

        cursor.close()
        conexao.close()
    else:
        print("Personagem já está em uma guilda") 
        return
    conexao.close()