import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_controller.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError(
    'sharedPreferencesProvider must be overridden in main.dart',
  );
}

@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
  static const _key = 'theme_mode';

  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final saved = prefs.getString(_key);
    if (saved != null) {
      return ThemeMode.values.byName(saved);
    }
    return ThemeMode.dark;
  }

  void setTheme(ThemeMode mode) {
    state = mode;
    ref.read(sharedPreferencesProvider).setString(_key, mode.name);
  }
}
