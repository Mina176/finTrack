import 'dart:ui' as ui;

import 'package:flutter/painting.dart';
import 'package:fynt/features/settings/appearance/logic/theme_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_controller.g.dart';

@Riverpod(keepAlive: true)
class LanguageController extends _$LanguageController {
  static const _key = 'language';

  @override
  Locale build() {
    final prefs = ref.watch(sharedPreferencesProvider);

    final savedLanguageCode = prefs.getString(_key);

    if (savedLanguageCode != null) {
      return Locale(savedLanguageCode);
    }

    final systemLanguageCode =
        ui.PlatformDispatcher.instance.locale.languageCode;

    if (systemLanguageCode == 'ar') {
      return const Locale('ar');
    }

    return const Locale('en');
  }

  void setLanguage(Locale newLocale) {
    state = newLocale;

    ref.read(sharedPreferencesProvider).setString(_key, newLocale.languageCode);
  }
}
