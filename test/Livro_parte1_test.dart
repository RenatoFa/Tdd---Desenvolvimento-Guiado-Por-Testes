import 'package:test/test.dart';

import '../Livro_parte1.dart';

main() {
  test('dollar test', () {
    Money five = Money.dollar(5);

    expect(Money.dollar(10), five.times(2));
    expect(Money.dollar(15), five.times(3));
  });
  test('franc test', () {
    Money five = Money.franc(5);

    expect(Money.franc(10), five.times(2));
    expect(Money.franc(15), five.times(3));
  });

  test('test equality', () {
    expect(Money.dollar(5), equals(Money.dollar(5)));
    expect(Money.dollar(5), isNot(equals(Money.dollar(6))));
    expect(Money.franc(5), isNot(equals(Money.dollar(5))));
  });

  test('test currency', () {
    expect('USD', Money.dollar(1).coin());
    expect('CHF', Money.franc(1).coin());
  });

  test('simple addition', () {
    Money five = Money.dollar(5);
    Expression sum = five.plus(five);
    Bank bank = new Bank();
    Money reduced = bank.reduce(sum, 'USD');

    expect(Money.dollar(10), reduced);
  });

  test('plus return sum', () {
    Money five = Money.dollar(5);
    Sum sum = Sum(addend: five, augend: five);

    expect(five, sum.augend);
    expect(five, sum.addend);
  });

  test('test reduce sum', () {
    Expression sum = new Sum(addend: Money.dollar(3), augend: Money.dollar(4));
    Bank bank = new Bank();
    Money result = bank.reduce(sum, 'USD');
    expect(Money.dollar(7), result);
  });

  test('test reduce money', () {
    Bank bank = new Bank();
    Money result = bank.reduce(Money.dollar(1), 'USD');
    expect(Money.dollar(1), result);
  });

  test('test identity rate', () {
    expect(1, new Bank().rate('USD', 'USD'));
  });

  test('mixed addition', () {
    Expression fiveBucks = Money.dollar(5);
    Expression tenFrancs = Money.franc(10);

    Bank bank = new Bank();
    bank.addRate('CHF', 'USD', 2);
    Money result = bank.reduce(fiveBucks.plus(tenFrancs), 'USD');

    expect(Money.dollar(10), result);
  });

  test('test sum plus money', () {
    Expression fiveBucks = Money.dollar(5);
    Expression tenFrancs = Money.franc(10);

    Bank bank = new Bank();
    bank.addRate('CHF', 'USD', 2);
    Expression sum =
        new Sum(augend: fiveBucks, addend: tenFrancs).plus(fiveBucks);
    Money result = bank.reduce(sum, 'USD');

    expect(Money.dollar(15), result);
  });

  test('sum times', () {
    Expression fiveBucks = Money.dollar(5);
    Expression tenFrancs = Money.franc(10);

    Bank bank = new Bank();
    bank.addRate('CHF', 'USD', 2);
    Expression sum = new Sum(augend: fiveBucks, addend: tenFrancs).times(2);
    Money result = bank.reduce(sum, 'USD');

    expect(Money.dollar(20), result);
  });
}
