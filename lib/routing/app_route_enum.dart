// app_route_enum.dart

enum AppRoutes {
  splash,
  onboarding,
  signIn,
  signUp,
  home,
  forgotPassword,
  profile,
}

extension AppRoutesExtension on AppRoutes {
  // static const String kSplashScreen = '/';
  // static const String kOnBoardingScreen = '/onboarding';
  // static const String kHomeScreen = '/home';
  // static const String kLoginScreen = '/login';
  // static const String kSignUpScreen = '/signUp';
  // static const String kForgotPasswordScreen = '/forgotPassword';
  // static const String kResetPasswordScreen = '/resetPassword';
  String get path {
    switch (this) {
      case AppRoutes.splash:
        return '/';
      case AppRoutes.onboarding:
        return '/onboarding';
      case AppRoutes.signIn:
        return '/signin';
      case AppRoutes.signUp:
        return '/signup';
      case AppRoutes.forgotPassword:
        return '/forgotPassword';
      case AppRoutes.home:
        return '/home';
      case AppRoutes.profile:
        return '/profile';
    }
  }
}
