from connection.database_connection import get_connection
from tabulate import tabulate


def get_one_guilds():
    conexao = get_connection()
    choice = input("Deseja buscar com id ou Nome: ")
    query = ""
    charId, charName, parameter = 0, "", ""

    if choice == "id" or choice == "Id":
        charId = int(input("\nDigite o id: "))
        query = 'SELECT p.id AS Código , p.nome AS Nome, g.nome AS Guilda, p.classe AS Classe, p.hp AS Vida, p.forca AS Força, p.stamina AS Energia FROM Personagem p LEFT JOIN Guilda g ON p.idGuilda = g.id WHERE p.id = %s'
        parameter = charId
    elif choice == "nome" or choice == "Nome":
        charName = input("Digite o nome: ")
        parameter = charName
        query = 'SELECT p.id AS Código , p.nome AS Nome, g.nome AS Guilda, p.classe AS Classe, p.hp AS Vida, p.forca AS Força, p.stamina AS Energia FROM Personagem p LEFT JOIN Guilda g ON p.idGuilda = g.id WHERE p.nome = %s'
    else:
        print("\nEscolha nao encontrada! Retornando...")
        return []

    if conexao:
        cursor = conexao.cursor()
        cursor.execute(query, (parameter,))
        character = cursor.fetchall()

        colunas = [desc[0] for desc in cursor.description]

        if (len(character) < 1):
            print("\nPersonagem não encontrado!")
            return character

        print("\nPersonagem encontrado!\n")
        cursor.close()
        conexao.close()

        return character, colunas
