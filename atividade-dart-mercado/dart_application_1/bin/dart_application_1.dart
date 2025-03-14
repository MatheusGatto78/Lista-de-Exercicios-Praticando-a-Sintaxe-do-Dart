import 'dart:io';

void main() {
  List<Map<String, dynamic>> estoque = [];

  while (true) {
    print('--- Controle de Estoque ---');
    print('1. Cadastrar Produto');
    print('2. Listar Produtos');
    print('3. Excluir Produto');
    print('4. Alterar Quantidade');
    print('5. Sair');

    stdout.write('--> ');
    int? escolha = int.tryParse(stdin.readLineSync() ?? '');

    switch (escolha) {
      case 1:
        stdout.write('Nome: ');
        String nome = stdin.readLineSync()!;
        stdout.write('Quantidade: ');
        int qtd = int.parse(stdin.readLineSync()!);
        stdout.write('Preço: ');
        double preco = double.parse(stdin.readLineSync()!);
        estoque.add({'nome': nome, 'quantidade': qtd, 'preco': preco});
        print('Produto cadastrado!');
        break;

      case 2:
        if (estoque.isEmpty) {
          print('Estoque vazio.');
        } else {
          for (var p in estoque) {
            print(
              '${p['nome']} - ${p['quantidade']} unidades - R\$ ${p['preco']}',
            );
          }
        }
        break;

      case 3:
        stdout.write('Nome do produto: ');
        String nome = stdin.readLineSync()!;
        estoque.removeWhere((p) => p['nome'] == nome);
        print('Produto removido!');
        break;

      case 4:
        stdout.write('Nome do produto: ');
        String nome = stdin.readLineSync()!;
        var produto = estoque.firstWhere(
          (p) => p['nome'] == nome,
          orElse: () => {},
        );

        if (produto.isEmpty) {
          print('Produto não encontrado!');
        } else {
          stdout.write('Quantidade (+/-): ');
          produto['quantidade'] += int.parse(stdin.readLineSync()!);
          print('Quantidade atualizada!');
        }
        break;

      case 5:
        print('Saindo...');
        return;

      default:
        print('Opção inválida!');
        break;
    }
  }
}
