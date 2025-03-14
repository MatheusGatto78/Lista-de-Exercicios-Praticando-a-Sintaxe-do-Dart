import 'dart:io';

void main() {
  Map<int, Map<String, dynamic>> tarefas = {};

  while (true) {
    print("--- GERENCIADOR DE TAREFAS ---");
    print("1. Adicionar tarefa");
    print("2. Listar tarefas");
    print("3. Remover tarefa");
    print("4. Sair");

    stdout.write('O que deseja fazer: ');
    int? escolha = int.tryParse(stdin.readLineSync() ?? '');

    switch (escolha) {
      case 1:
        print("---ADICIONAR TAREFAS---");

        stdout.write('Digite o ID da tarefa: ');
        int id = int.parse(stdin.readLineSync()!);

        stdout.write('Digite o nome da tarefa: ');
        String nome = stdin.readLineSync()!;

        stdout.write('Digite a descrição da tarefa: ');
        String descricao = stdin.readLineSync()!;

        stdout.write('Digite a importância (1 a 5): ');
        int importancia = int.parse(stdin.readLineSync()!);

        if (tarefas.containsKey(id)) {
          print('Já existe uma tarefa com esse ID!');
        } else {
          tarefas[id] = {
            'nome': nome,
            'descricao': descricao,
            'importancia': importancia,
          };
          print('Tarefa adicionada com sucesso!');
        }
        break;

      case 2:
        if (tarefas.isEmpty) {
          print('Nenhuma tarefa cadastrada.');
        } else {
          print('---LISTA DE TAREFAS---');
          tarefas.forEach((id, detalhes) {
            print('-------------------');
            print('ID: $id');
            print('Nome: ${detalhes['nome']}');
            print('Descrição: ${detalhes['descricao']}');
            print('Importância: ${detalhes['importancia']}');
          });
          print('-------------------\n');
        }
        break;

      case 3:
        print("---EXCLUIR TAREFA---");
        stdout.write('Digite o ID da tarefa que deseja remover: ');
        int idRemover = int.parse(stdin.readLineSync()!);

        if (tarefas.remove(idRemover) != null) {
          print('Tarefa removida com sucesso!');
        } else {
          print('ID não encontrado. Nenhuma tarefa removida.');
        }
        break;

      case 4:
        print("SAINDO...");
        break;

      default:
        print("Opção inválida.");
    }
  }
}
