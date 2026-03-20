import 'package:fynt/features/appearance/data/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
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
