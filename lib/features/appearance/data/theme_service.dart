import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeServiceProvider = Provider<ThemeRepository>((ref) {
  throw UnimplementedError();
});

class ThemeRepository {
  final SharedPreferences _prefs;
  static const _key = 'theme_mode';

  ThemeRepository(this._prefs);

  Future<void> setThemeMode(ThemeMode mode) async {
    if (mode == ThemeMode.light) {
      await _prefs.setString(_key, 'light');
    } else if (mode == ThemeMode.dark) {
      await _prefs.setString(_key, 'dark');
    } else {
      await _prefs.setString(_key, 'system');
    }
  }

  ThemeMode getThemeMode() {
    final saved = _prefs.getString(_key);
    if (saved == 'light') return ThemeMode.light;
    if (saved == 'dark') return ThemeMode.dark;
    return ThemeMode.system;
  }
}
