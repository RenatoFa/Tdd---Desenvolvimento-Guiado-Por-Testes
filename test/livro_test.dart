import 'package:test/test.dart';

import '../Livro.dart';

main() {
  test('dollar test', () {
    Money five = Money.dollar(5, 'USD');
    expect(new Dollar(amout: 10, currency: 'USD'), five.times(2));
    expect(new Dollar(amout: 15, currency: 'USD'), five.times(3));
  });
  test('franc test', () {
    Money five = Money.franc(5, 'CHF');
    expect(new Franc(amout: 10, currency: 'CHF'), five.times(2));
    expect(new Franc(amout: 15, currency: 'CHF'), five.times(3));
  });

  test('test equality', () {
    final Dollar dollar1 = new Dollar(amout: 5);
    final Dollar dollar2 = new Dollar(amout: 5);
    final Dollar dollar3 = new Dollar(amout: 6);
    expect(dollar1, equals(dollar2));
    expect(dollar1, isNot(equals(dollar3)));
    expect(new Franc(amout: 5), equals(new Franc(amout: 5)));
    expect(new Franc(amout: 5), isNot(equals(new Franc(amout: 6))));
    expect(new Franc(amout: 5), isNot(equals(new Dollar(amout: 5))));
  });

  test('test currency', () {
    expect('USD', Money.dollar(1, 'USD').coin());
    expect('CHF', Money.franc(1, 'CHF').coin());
  });

  // test('Teste de igualdade de Money e Franc', () {
  //   final money = Money(amout: 10, currency: 'C');
  //   final franc = Franc(amout: 10, currency: 'CHF');

  //   expect(money, equals(franc));
  // });
}
