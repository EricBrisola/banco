from connection.database_connection import get_connection
from tabulate import tabulate


def get_one_guilds():
    conexao = get_connection()
    choice = input("Deseja buscar com id ou Nome: ")
    query = ""
    persId, guildName, parameter = 0, "", ""

    if choice == "id" or choice == "Id":
        persId = int(input("\nDigite o id: "))
        query = 'SELECT g.id AS Código, g.nome as Guilda, p.nome AS Líder FROM Guilda g JOIN Personagem p ON g.idLider = p.id where g.id = %s;'
        parameter = persId
    elif choice == "nome" or choice == "Nome":
        guildName = input("Digite o nome: ")
        parameter = guildName
        query = 'SELECT g.id AS Código, g.nome as Guilda, p.nome AS Líder FROM Guilda g JOIN Personagem p ON g.idLider = p.id where g.nome = %s;'
    else:
        print("\nEscolha nao encontrada! Retornando...")
        return []

    if conexao:
        cursor = conexao.cursor()
        cursor.execute(query, (parameter,))
        guild = cursor.fetchall()

        colunas = [desc[0] for desc in cursor.description]

        if (len(guild) < 1):
            print("\nGuilda não encontrada!")
            return guild

        print("\nGuilda encontrada!\n")
        cursor.close()
        conexao.close()

        return guild, colunas
