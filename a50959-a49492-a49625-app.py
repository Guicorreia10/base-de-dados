import pyodbc

conn_str = (
    "Driver={SQL Server};"
    "Server=SOUSABOT\SQLEXPRESS;"
    "Database=Trabalho;"
)
def get_db_connection():
    conn = pyodbc.connect(conn_str)
    return conn



#PROJETO
##add projeto
def add_projeto():
    print("\nAdicionar Projeto\n")
    id_projeto = input("ID do Projeto: ")
    nome = input("Nome: ")
    titulo_pt = input("Título em Português: ")
    titulo_en = input("Título em Inglês: ")
    descricao_pt = input("Descrição em Português: ")
    descricao_en = input("Descrição em Inglês: ")
    url_projeto = input("URL do Projeto: ")
    estado = input("Estado (Ativo, Concluído, Cancelado): ")
    data_inicio = input("Data de Início (AAAA-MM-DD): ")
    data_fim = input("Data de Fim (AAAA-MM-DD): ")
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('''
        INSERT INTO projeto (ID_Projeto, Nome, Titulo_PT, Titulo_EN, Descricao_PT, Descricao_EN, URL_Projeto, Estado, Data_Inicio, Data_Fim) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', (id_projeto, nome, titulo_pt, titulo_en, descricao_pt, descricao_en, url_projeto, estado, data_inicio, data_fim))

    conn.commit()
    cursor.close()
    conn.close()
    print("Projeto adicionado com sucesso!")
##mostrar projeto
def mostrar_projeto():
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute('''
            SELECT ID_Projeto, Nome, Titulo_PT, Titulo_EN, Descricao_PT, Descricao_EN, URL_Projeto, Estado, Data_Inicio, Data_Fim
            FROM Projeto
        ''')
        projetos = cursor.fetchall()
        print("ID\tNome do Projeto")
        for projeto in projetos:
            print(f"{projeto.ID_Projeto}\t{projeto.Nome}\t{projeto.Titulo_PT}\t{projeto.Titulo_PT}\t{projeto.Descricao_PT}\t{projeto.Descricao_EN}\t{projeto.URL_Projeto}\t{projeto.Estado}\t{projeto.Data_Inicio}\t{projeto.Data_Fim}")
    except pyodbc.Error as e:
        print("Erro ao recuperar projetos:", e)
    finally:
        cursor.close()
        conn.close()
##remover projeto
def remover_projeto():
    id_projeto = input("ID do projeto que deseja remover: ")

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute('''
            DELETE FROM Projeto
            WHERE ID_Projeto = ?
        ''', (id_projeto,))
        conn.commit()
        print("projeto removido com sucesso!")
    except pyodbc.Error as e:
        conn.rollback()
        print("Erro ao remover projeto:", e)
    finally:
        cursor.close()
        conn.close()



#MEMBRO
##add membro
def add_membro():
    print ("Adicionar membro\n")
    id_membro = input ("id do membro: ")
    nome_membro = input("Nome do membro: ")
    papel_projeto = input ("Papel no projeto (investigador responsavel, promotor, copromotor, líder, participante): ")
    orcid = input ("Orcid: ")
    percentagem_alocação = input ("Percentagem da sua alocação: ")
    informação_membro_pt = input ("informação membro em PT: ")
    informação_membro_en = input ("informação membro em EN: ")
    numero_funcionario = input("Numero de funcionario: ")

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('''
        INSERT INTO membro (ID_Membro, Nome_Membro, Papel_Projeto, Orcid, Percentagem_Alocação, Informação_Membro_PT, Informação_Membro_EN, Numero_Funcionario) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ''', (id_membro, nome_membro, papel_projeto, orcid, percentagem_alocação, informação_membro_pt, informação_membro_en, numero_funcionario))

    conn.commit()
    cursor.close()
    conn.close()
    print("Membro adicionado com sucesso!")
##mostrar os membros
def mostrar_membros():
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute('''
            SELECT ID_Membro, Nome_Membro, Papel_Projeto, Orcid, Percentagem_Alocação, Informação_Membro_PT, Informação_Membro_EN, Numero_Funcionario
            FROM Membro
        ''')
        members = cursor.fetchall()
        print("ID\tNome do Membro")
        for member in members:
            print(f"{member.ID_Membro}\t{member.Nome_Membro}\t{member.Papel_Projeto}\t{member.Orcid}\t{member.Percentagem_Alocação}\t{member.Informação_Membro_PT}\t{member.Informação_Membro_EN}\t{member.Numero_Funcionario}")
    except pyodbc.Error as e:
        print("Erro ao recuperar membros:", e)
    finally:
        cursor.close()
        conn.close()
##remover membros
def remover_membero():
    id_membro = input("ID do membro que deseja remover: ")

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute('''
            DELETE FROM Membro
            WHERE ID_Membro = ?
        ''', (id_membro,))
        conn.commit()
        print("Membro removido com sucesso!")
    except pyodbc.Error as e:
        conn.rollback()
        print("Erro ao remover membro:", e)
    finally:
        cursor.close()
        conn.close()








#add entidade financiadora
def add_entidade_financiadora():
    id_entidade = input("ID da Entidade: ")
    nome_entidade = input("Nome da Entidade: ")
    descrição_pt = input("Descrição da Entidade em PT: ")
    descrição_en = input("Descrição da Entidade em EN: ")
    sigla = input("Sigla:")
    url_financiamento = input("URL da Entidade fianciadora: ")
    país = input ("País: ")
    morada = input ("Morada: ")
    telefone = input ("Telefone: ")
    email = input ("Email: ")
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('''
        INSERT INTO entidade_financiadora (ID_Entidade, Nome_Entidade, Descrição_PT, Descrição_EN, Sigla, URL_financiamento, País, Morada, Telefone, Email) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', (id_entidade, nome_entidade, descrição_pt, descrição_en, sigla, url_financiamento, país, morada, telefone, email))

    conn.commit()
    cursor.close()
    conn.close()
    
    print ("")
    print("Entidade financiadora adicionada com sucesso!")





#add programa financiamento
def add_programa():
    id_PF = input("ID do Programa de financiamento: ")
    nome_PF = input("Nome do Programa de financiamento: ")
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('''
        INSERT INTO programa_financiamento (ID_PF, Nome_PF) 
        VALUES (?, ?)
    ''', (id_PF, nome_PF))
    conn.commit()
    cursor.close()
    conn.close()
    print("Programa de financiamento adicionado com sucesso!")




#ESTATISTICAS
##mostrar estatisticas
def mostrar_estatisticas():
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute('''
            SELECT ID_Estatisticas, Numero_atividades, Duracao_Total, Ano
            FROM Estatisticas
        ''')
        estatistica = cursor.fetchall()
        print("ID\t\tNumero\t\t\tDuração\t\t\tAno")
        for estatistica in estatistica:
            print(f"{estatistica.ID_Estatisticas}\t\t\t{estatistica.Numero_atividades}\t\t\t{estatistica.Duracao_Total}\t\t\t{estatistica.Ano}")
    except pyodbc.Error as e:
        print("Erro ao recuperar estatisticas:", e)
    finally:
        cursor.close()
        conn.close()
##adicionar estatisticas
def adicionar_estatisticas():
    ID_Estatiscicas = input("ID da estatistica: ")
    Numero_atividades = input("Numero de atividades: ")
    Duracao_Total = input("Duracao total: ")
    Ano = input("Ano da estatistica: ")
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('''
        INSERT INTO Estatisticas (ID_Estatisticas, Numero_atividades, Duracao_Total, Ano) 
        VALUES (?, ?, ?, ?)
    ''', (ID_Estatiscicas, Numero_atividades, Duracao_Total, Ano))
    conn.commit()
    cursor.close()
    conn.close()
    print("Estatistica adicionada com sucesso!")









#menu inicial
def main_menu():
    while True:
        print("\nMenu Principal")
        print("1. Adicionar/ Aterar Projeto")
        print("2. Remover Projeto")
        print("3. Adicionar Entidade Financiadora")
        print("4. Adicionar Programa de Financiamento")
        print("5. Mostrar a situação atual de um projeto/serviço")
        print("6. Estatisticas anuais")
        print("7. Adicionar Estatisticas")
        print("8. Sair")
        
        choice = input("Escolha uma opção: ")
        
        if choice == '1':
            print("1 Já tenho projeto")
            print("2 Não tenho projeto")
            choice = input("Escolha uma opção: ")

            if choice == '1':
                print("1 Adicionar membro ")
                print("2 Remover membro ")
                choice = input("Escolha uma opção: ")
                
                if choice == '1':
                    mostrar_membros()
                    
                    add_membro()
                elif choice == '2':
                    mostrar_membros()
                    remover_membero()

        elif choice == '2':
            mostrar_projeto()
            remover_projeto()

        elif choice == '3':
            add_entidade_financiadora()

        elif choice == '4':
            add_programa()

        elif choice == '5':
            mostrar_projeto()
        
        elif choice == '6':
            mostrar_estatisticas()
        
        elif choice == '7':
            adicionar_estatisticas()
        
        elif choice == '8':
            print("Saindo...")
            

            break
        else:
            print("Opção inválida. Tente novamente.")

if __name__ == '__main__':
    main_menu()
