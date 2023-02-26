import 'package:equatable/equatable.dart';

void main() {}

class Money extends Equatable {
  final int amout;
  final String? currency;

  Money({required this.amout, this.currency});

  static Money dollar(int amout, String currency) {
    return new Dollar(amout: amout, currency: currency);
  }

  static Money franc(int amout, String currency) {
    return new Franc(amout: amout, currency: currency);
  }

  String? coin() {
    return currency;
  }

  times(int multiplier) {
    return new Money(amout: amout * multiplier, currency: currency);
  }

  @override
  List<Object?> get props {
    return [amout, coin()];
  }
}

class Dollar extends Money {
  final int amout;
  final String? currency;

  Dollar({required this.amout, this.currency})
      : super(amout: amout, currency: currency);

  String? coin() {
    return currency;
  }

  times(int multiplier) {
    return new Dollar(amout: amout * multiplier, currency: currency);
  }
}

class Franc extends Money {
  final int amout;
  final String? currency;

  Franc({required this.amout, this.currency}) : super(amout: amout);

  String? coin() {
    return currency;
  }

  times(int multiplier) {
    return new Franc(amout: amout * multiplier, currency: currency);
  }
}
