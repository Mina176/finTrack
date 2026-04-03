import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fynt/features/settings/appearance/logic/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return OnboardingRepository(prefs);
});

class OnboardingRepository {
  final SharedPreferences sharedPreferences;

  OnboardingRepository(this.sharedPreferences);

  static const String onboardingKey = 'onboardingCompleted';

  bool get isOnboardingCompleted =>
      sharedPreferences.getBool(onboardingKey) ?? false;

  Future<void> setOnboardingCompleted() async {
    await sharedPreferences.setBool(onboardingKey, true);
  }
}
