enum AppRoutes {
  splash,
  onboarding,
  signIn,
  signUp,
  home,
  forgotPassword,
  profile,
  addTransaction,
  chooseCategory,
  addAccount,
  selectAccount,
}

extension AppRoutesExtension on AppRoutes {
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
      case AppRoutes.addTransaction:
        return '/addTransaction';
      case AppRoutes.chooseCategory:
        return '/chooseCategory';
      case AppRoutes.addAccount:
        return '/addAccount';
      case AppRoutes.selectAccount:
        return '/selectAccount';
    }
  }
}
