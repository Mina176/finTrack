import 'package:fintrack/features/onboarding/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // GoRouter configuration

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
    ],
  );
}
