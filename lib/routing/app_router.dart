import 'package:fintrack/features/authentication/logic/auth_repository.dart';
import 'package:fintrack/features/authentication/presentation/forgot_password_screen.dart';
import 'package:fintrack/features/authentication/presentation/login_screen.dart';
import 'package:fintrack/features/authentication/presentation/reset_Password_screen.dart';
import 'package:fintrack/features/authentication/presentation/sign_up_screen.dart';
import 'package:fintrack/features/home%20screen/presentation/home_screen.dart';
import 'package:fintrack/features/onboarding/presentation/onboarding_screen.dart';
import 'package:fintrack/features/onboarding/presentation/splash_screen.dart';
import 'package:fintrack/routing/app_route_enum.dart';
import 'package:fintrack/utils/refresh_listenable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final appRouter = AppRouter();
  return appRouter.router(ref);
}

class AppRouter {
  // GoRouter configuration
  GoRouter router(Ref ref) {
    // accessing the auth repository
    final auth = ref.watch(authRepositoryProvider);
    return GoRouter(
      initialLocation: AppRoutes.splash.path,
      routes: [
        GoRoute(
          path: AppRoutes.splash.path,
          builder: (context, state) => SplashScreen(),
        ),
        GoRoute(
          path: AppRoutes.onboarding.path,
          builder: (context, state) => OnboardingScreen(),
        ),
        GoRoute(
          path: AppRoutes.signUp.path,
          builder: (context, state) => SignUpScreen(),
        ),
        GoRoute(
          path: AppRoutes.signIn.path,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: AppRoutes.forgotPassword.path,
          builder: (context, state) => ForgotPasswordScreen(),
        ),
        GoRoute(
          path: AppRoutes.resetPassword.path,
          builder: (context, state) => ResetPasswordScreen(),
        ),
        GoRoute(
          path: AppRoutes.home.path,
          builder: (context, state) => HomeScreen(),
        ),
      ],
      refreshListenable: GoRouterRefreshStream(auth.authStateChanges()),
      redirect: (context, state) async {
        final bool isLoggedIn = auth.currentUser != null;
        final bool isLoggingIn =
            state.matchedLocation == AppRoutes.signIn.path ||
            state.matchedLocation == AppRoutes.signUp.path;

        // should redirect the user to the sign in page if they are not logged in
        if (!isLoggedIn && !isLoggingIn) {
          return AppRoutes.signIn.path;
        }

        // should redirect the user after they have logged in
        if (isLoggedIn && isLoggingIn) {
          return AppRoutes.home.path;
        }
        // do not redirect
        return null;
      },
    );
  }
}
