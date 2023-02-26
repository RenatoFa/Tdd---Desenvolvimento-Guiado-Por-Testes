import 'package:test/test.dart';

import '../person.dart';

void main() {
  teste_person();
}

teste_person() {
  final person = Person(name: 'Renato', age: 32, height: 1.82, weight: 108.00);
  test('IMC deve vir 32.6', () {
    expect(person.imc, isA<double>());
    expect(person.imc, 32.6);
  });

  test('Se a idade for maior que 18, entao isOlder deve ser true', () {
    expect(person.isOlder, true);
  });

  test('Se a idade for igual a 18, entao isOlder deve ser true', () {
    final person =
        Person(name: 'Renato', age: 18, height: 1.82, weight: 108.00);
    expect(person.isOlder, true);
  });
}
