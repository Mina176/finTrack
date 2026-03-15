import 'package:riverpod_annotation/riverpod_annotation.dart';

// Make sure this matches your file name!
// If your file is called 'currency_provider.dart', this must be 'currency_provider.g.dart'
part 'currency_provider.g.dart';

@riverpod
class CurrencyCode extends _$CurrencyCode {
  @override
  String build() {
    return 'USD';
  }

  void setCurrencyCode(String newCode) {
    state = newCode;
  }
}

@riverpod
class CurrencySymbol extends _$CurrencySymbol {
  @override
  String build() {
    return '\$';
  }

  void setCurrencySymbol(String newSymbol) {
    state = newSymbol;
  }
}
