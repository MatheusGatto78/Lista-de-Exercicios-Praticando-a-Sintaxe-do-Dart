import 'dart:io';

void main() {
  int AndarAtual = 0;

  while (true) {
    print("---ELEVADOR---");
    print("1. Subir");
    print("2. Descer");
    print("3. Ver andar atual");
    print("4. Sair");
    stdout.write("O que deseja fazer?: ");
    int? escolha = int.tryParse(stdin.readLineSync() ?? '');

    switch (escolha) {
      case 1:
        print("---SUBIR---");
        print('Andar Atual: $AndarAtual');
        stdout.write("Para qual andar deseja subir?: ");
        int? andar_cima = int.tryParse(stdin.readLineSync() ?? '');

        if (andar_cima == null) {
          print('Por favor, digite um número válido.');
          continue;
        }
        if (andar_cima > 10) {
          print('O andar máximo é 10.');
          continue;
        }
        if (andar_cima < AndarAtual) {
          print('O andar precisa ser maior que o que você está.');
          continue;
        }
        if (andar_cima == AndarAtual) {
          print('Você já está nesse andar.');
          continue;
        }

        print('Movendo o elevador...');
        for (int i = AndarAtual + 1; i <= andar_cima; i++) {
          print('Andar $i');
          sleep(Duration(milliseconds: 300));
        }

        AndarAtual = andar_cima;

      case 2:
        print("---DESCER---");
        print('Andar Atual: $AndarAtual');
        stdout.write("Para qual andar deseja descer?: ");
        int? andar_baixo = int.tryParse(stdin.readLineSync() ?? '');

        if (andar_baixo == null) {
          print('Por favor, digite um número válido.');
          continue;
        }
        if (andar_baixo < 0) {
          print('O andar máximo é 10.');
          continue;
        }
        if (andar_baixo > AndarAtual) {
          print('O andar precisa ser maior que o que você está.');
          continue;
        }
        if (andar_baixo == AndarAtual) {
          print('Você já está nesse andar.');
          continue;
        }

        print('Movendo o elevador...');
        for (int i = AndarAtual - 1; i >= andar_baixo; i--) {
          print('Andar $i');
          sleep(Duration(milliseconds: 500));
        }

        AndarAtual = andar_baixo;

      case 3:
        print("---ANDAR ATUAL---");
        print('Andar Atual: $AndarAtual');

      case 4:
        print("SAINDO...");
        break;

      default:
        print("Opção inválida.");
    }
  }
}
