import 'package:fintrack/features/home%20screen/presentation/home_screen.dart';
import 'package:fintrack/features/onboarding/presentation/onboarding_screen.dart';
import 'package:fintrack/features/onboarding/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String kSplashScreen = '/';
  static const String kOnBoardingScreen = '/onboarding';
  static const String kHomeScreen = '/home';
  // GoRouter configuration
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
