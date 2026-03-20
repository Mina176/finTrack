import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'currency_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrencyCode extends _$CurrencyCode {
  @override
  String build() {
    return 'USD';
  }

  void setCurrencyCode(String newCode) {
    state = newCode;
  }
}

@Riverpod(keepAlive: true)
class CurrencySymbol extends _$CurrencySymbol {
  @override
  String build() {
    return '\$';
  }

  void setCurrencySymbol(String newSymbol) {
    state = newSymbol;
  }
}
