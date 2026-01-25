import 'package:fintrack/features/authentication/logic/auth_repository.dart';
import 'package:fintrack/features/authentication/presentation/forgot_password_screen.dart';
import 'package:fintrack/features/authentication/presentation/login_screen.dart';
import 'package:fintrack/features/authentication/presentation/profile_screen.dart';
import 'package:fintrack/features/authentication/presentation/sign_up_screen.dart';
import 'package:fintrack/features/home%20screen/presentation/root_home.dart';
import 'package:fintrack/features/onboarding/presentation/onboarding_screen.dart';
import 'package:fintrack/features/onboarding/presentation/splash_screen.dart';
import 'package:fintrack/routing/app_route_enum.dart';
import 'package:fintrack/utils/refresh_listenable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // accessing the auth repository
  final authRepo = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash.path,
    refreshListenable: GoRouterRefreshStream(authRepo.authStateChanges()),
    redirect: (context, state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;

      final isLoginRoute = state.matchedLocation == AppRoutes.signIn.path;
      final isSignUpRoute = state.matchedLocation == AppRoutes.signUp.path;
      final isOnboarding = state.matchedLocation == AppRoutes.onboarding.path;
      final isForgotPassword =
          state.matchedLocation == AppRoutes.forgotPassword.path;
      final isResetPassword = state.matchedLocation == AppRoutes.profile.path;
      final isSplash = state.matchedLocation == AppRoutes.splash.path;

      // If NOT logged in, but trying to access Home -> Redirect to Login

      if (!isLoggedIn) {
        if (isLoginRoute ||
            isSignUpRoute ||
            isOnboarding ||
            isForgotPassword ||
            isResetPassword) {
          return null;
        }
        return AppRoutes.signIn.path;
      }

      // If LOGGED IN, but sitting on Login/SignUp -> Redirect to Home
      if (isLoggedIn) {
        if (isLoginRoute ||
            isSignUpRoute ||
            isOnboarding ||
            isForgotPassword ||
            isResetPassword ||
            isSplash) {
          return AppRoutes.home.path;
        }
      }

      return null;
    },
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
        path: AppRoutes.profile.path,
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.home.path,
        builder: (context, state) => RootHomeScreen(),
      ),
    ],
  );
});
