import 'package:fintrack/features/authentication/presentation/forgot_password_screen.dart';
import 'package:fintrack/features/authentication/presentation/login_screen.dart';
import 'package:fintrack/features/authentication/presentation/reset_Password_screen.dart';
import 'package:fintrack/features/authentication/presentation/sign_up_screen.dart';
import 'package:fintrack/features/home%20screen/presentation/home_screen.dart';
import 'package:fintrack/features/onboarding/presentation/onboarding_screen.dart';
import 'package:fintrack/features/onboarding/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String kSplashScreen = '/';
  static const String kOnBoardingScreen = '/onboarding';
  static const String kHomeScreen = '/home';
  static const String kLoginScreen = '/login';
  static const String kSignUpScreen = '/signUp';
  static const String kForgotPasswordScreen = '/forgotPassword';
  static const String kResetPasswordScreen = '/resetPassword';
  // GoRouter configuration
  static final router = GoRouter(
    initialLocation: kLoginScreen,
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
        path: kSignUpScreen,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: kForgotPasswordScreen,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: kResetPasswordScreen,
        builder: (context, state) => ResetPasswordScreen(),
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
