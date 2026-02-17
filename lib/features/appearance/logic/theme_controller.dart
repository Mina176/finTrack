import 'package:fintrack/features/appearance/data/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeControllerProvider = NotifierProvider<ThemeController, ThemeMode>(
  () {
    return ThemeController();
  },
);

class ThemeController extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    final repository = ref.watch(themeServiceProvider);
    return repository.getThemeMode();
  }

  void setTheme(ThemeMode mode) {
    state = mode;
    ref.read(themeServiceProvider).setThemeMode(mode);
  }
}
