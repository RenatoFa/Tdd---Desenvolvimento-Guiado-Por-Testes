import 'package:equatable/equatable.dart';

void main() {}

abstract class Expression {
  Expression augend;
  Expression addend;

  Expression({required this.augend, required this.addend});

  Money reduce(Bank bank, String to);

  Expression plus(Expression addend);

  Expression times(int multiplier);
}

class Sum implements Expression {
  Expression augend;
  Expression addend;

  Sum({required this.augend, required this.addend});

  Money reduce(Bank bank, String to) {
    double amout =
        augend.reduce(bank, to).amout + addend.reduce(bank, to).amout;
    return new Money(amout: amout, currency: to);
  }

  Expression plus(Expression addend) {
    return new Sum(augend: this, addend: addend);
  }

  Expression times(int multiplier) {
    return new Sum(
        augend: augend.times(multiplier), addend: addend.times(multiplier));
  }
}

class Bank {
  Map<String, int> _rates = {};

  Money reduce(Expression source, String to) {
    return source.reduce(this, to);
  }

  addRate(String source, String to, int rate) {
    _rates['$source:$to'] = rate;
  }

  int? rate(String? source, String to) {
    if (source == to) {
      return 1;
    } else {
      return _rates['$source:$to'];
    }
  }
}

class Pair {
  String from;
  String to;

  Pair({required this.from, required this.to});

  bool equals() {
    Pair pair = Pair(from: this.from, to: this.to);
    return this.from == pair.from && this.to == pair.to;
  }

  int get hashCode {
    return 0;
  }
}

class Money extends Equatable implements Expression {
  final double amout;
  final String? currency;

  Money({required this.amout, this.currency});

  static Money dollar(double amout) {
    return new Money(amout: amout, currency: 'USD');
  }

  static Money franc(double amout) {
    return new Money(amout: amout, currency: 'CHF');
  }

  Money reduce(Bank bank, String to) {
    int? rate = bank.rate(currency, to);
    return new Money(amout: amout / rate!, currency: to);
  }

  Expression plus(Expression addend) {
    return new Sum(augend: this, addend: addend);
  }

  String? coin() {
    return currency;
  }

  Expression times(int multiplier) {
    return new Money(amout: amout * multiplier, currency: currency);
  }

  @override
  List<Object?> get props {
    return [amout, coin()];
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
