import 'package:flutter_riverpod/flutter_riverpod.dart';

final currencyCodeProvider = StateProvider<String>((ref) => 'USD');

final currencySymbolProvider = StateProvider<String>((ref) => '\$');
