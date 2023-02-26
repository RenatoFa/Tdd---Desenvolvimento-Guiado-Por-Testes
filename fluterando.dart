import 'person.dart';

void main() {
  final person = Person(name: 'Renato', age: 32, height: 1.82, weight: 108.00);

  print('Imc deve vir 33.0: ${person.imc == 32.6}');
}
