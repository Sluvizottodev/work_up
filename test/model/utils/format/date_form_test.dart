import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:work_up/utils/format/date_form.dart';

void main() {
  group('DateFormatter', () {
    test('deve formatar data corretamente no formato dd/MM/yyyy', () {
      final date = DateTime(2023, 1, 15); // 15 de janeiro de 2023
      expect(DateFormatter.formatDate(date), "15/01/2023");
    });

    test('deve formatar data com dia e mês de um dígito com zeros à esquerda', () {
      final date = DateTime(2023, 5, 7); // 7 de maio de 2023
      expect(DateFormatter.formatDate(date), "07/05/2023");
    });

    test('deve formatar data corretamente no início do ano', () {
      final date = DateTime(2024, 1, 1); // 1 de janeiro de 2024
      expect(DateFormatter.formatDate(date), "01/01/2024");
    });

    test('deve formatar data corretamente no final do ano', () {
      final date = DateTime(2023, 12, 31); // 31 de dezembro de 2023
      expect(DateFormatter.formatDate(date), "31/12/2023");
    });
  });
}