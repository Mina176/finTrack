import 'package:fintrack/features/authentication/logic/auth_repository.dart';
import 'package:fintrack/features/authentication/presentation/button_with_icon.dart';
import 'package:fintrack/features/authentication/presentation/auth_field.dart';
import 'package:fintrack/features/authentication/utils/validators.dart';
import 'package:fintrack/router.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authRepo = AuthRepository();

  // State variables for field-level errors
  String? emailError;
  String? passwordError;
  bool isLoading = false;

  void _login() async {
    // 1. Clear old errors
    setState(() {
      emailError = null;
      passwordError = null;
    });

    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        await authRepo.login(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
        if (mounted) {
          context.go(AppRouter.kHomeScreen);
        }
      } catch (e) {
        String error = e.toString();

        // 3. Handle Firebase Errors on specific fields
        if (error.contains('user-not-found') ||
            error.contains('invalid-email')) {
          setState(() => emailError = "No account found with this email");
        } else if (error.contains('wrong-password')) {
          setState(() => passwordError = "Incorrect password");
        } else if (emailController.text.isEmpty) {
          setState(() => emailError = "Email is required");
        }
        // Force the UI to update with red text
        formKey.currentState!.validate();
      } finally {
        if (mounted) setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.gradientColors),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      gapH32,
                      Text(
                        'Welcome Back',
                        style: TextStyles.title,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Track your wealth securely.\n Please log in to your account.',
                        style: TextStyles.subtitle,
                        textAlign: TextAlign.center,
                      ),
                      gapH16,
                      Form(
                        key: formKey,
                        child: Column(
                          spacing: 12,
                          children: [
                            AuthField(
                              label: 'Email Address',
                              hintText: 'name@example.com',
                              controller: emailController,
                              errorText: emailError, 
                              validator: Validators.validateEmail,
                              onChanged: (val) {
                                if (emailError != null) {
                                  setState(() => emailError = null);
                                }
                              },
                            ),
                            AuthField(
                              label: 'Password',
                              hintText: '••••••••',
                              controller: passwordController,
                              isPassword: true,
                              errorText: passwordError,
                              onChanged: (val) {
                                if (passwordError != null) {
                                  setState(() => passwordError = null);
                                }
                              },
                            ),
                          ],
                        ),
                      ),

                      Text(
                        'Forgot Password?',
                        style: TextStyles.hintText.copyWith(
                          color: AppColors.kPrimaryColor,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      gapH4,
                      ElevatedButton(
                        onPressed: isLoading ? null : _login,
                        child: isLoading
                            ? SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(),
                              )
                            : Text('Login'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(color: AppColors.kButtonBorderColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.fingerprint_rounded,
                              color: AppColors.kTransparentButtonlabelColor,
                            ),
                            gapW4,
                            Text(
                              'Sign in with Face ID',
                              style: TextStyles.buttonLabel.copyWith(
                                color: AppColors.kTransparentButtonlabelColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomDivider(
                        centeredText: 'OR',
                      ),
                      ButtonWithIcon(
                        label: 'Continue with Google',
                        onPressed: () {},
                        icon: SizedBox(
                          height: Sizes.p32,
                          child: Image.asset(
                            'assets/google-logo-png-29546.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        textColor: AppColors.kTitleColor,
                      ),
                      ButtonWithIcon(
                        label: 'Continue with Apple',
                        onPressed: () {},
                        icon: SizedBox(
                          height: Sizes.p24,
                          width: Sizes.p24,
                          child: Image.asset(
                            'assets/Apple-Logo-500x281.png',
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                        ),
                        textColor: AppColors.kTitleColor,
                      ),
                      gapH4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?'),
                          GestureDetector(
                            onTap: () => context.push(AppRoutes.signUp.path),
                            child: Text(
                              ' Sign Up',
                              style: TextStyle(
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      gapH4,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.centeredText,
  });
  final String centeredText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: TextStyles.hintText.color,
          ),
        ),
        gapW4,
        Text(centeredText, style: TextStyles.hintText),
        gapW4,
        Expanded(
          child: Divider(
            color: TextStyles.hintText.color,
          ),
        ),
      ],
    );
  }
}
