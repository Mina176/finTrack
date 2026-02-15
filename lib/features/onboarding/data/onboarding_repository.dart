import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  throw UnimplementedError();
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
