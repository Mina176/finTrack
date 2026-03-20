import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_service.g.dart';

@Riverpod(keepAlive: true)
ThemeRepository themeService(Ref ref) {
  throw UnimplementedError('themeService must be overridden in main()');
}

class ThemeRepository {
  final SharedPreferences _prefs;

  ThemeRepository(this._prefs);

  static const _key = 'theme_mode';

  Future<void> setThemeMode(ThemeMode mode) async {
    await _prefs.setString(_key, mode.name);
  }

  ThemeMode getThemeMode() {
    final saved = _prefs.getString(_key) ?? ThemeMode.dark.name;
    return ThemeMode.values.firstWhere(
      (element) => element.name == saved,
      orElse: () => ThemeMode.dark,
    );
  }
}
