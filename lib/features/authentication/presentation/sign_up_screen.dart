import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/authentication/logic/signup_view_model.dart';
import 'package:fintrack/features/authentication/presentation/button_with_icon.dart';
import 'package:fintrack/features/authentication/presentation/login_screen.dart';
import 'package:fintrack/features/authentication/presentation/auth_field.dart';
import 'package:fintrack/features/authentication/logic/auth_repository.dart';
import 'package:fintrack/features/authentication/utils/validators.dart';
import 'package:fintrack/router.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // 1. Initialize the ViewModel
  final _vm = SignUpViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _vm.dispose(); // VM handles controller cleanup
    super.dispose();
  }

  void _onSubmit() async {
    // 1. Run Client-side Validation (Regex checks)
    if (_formKey.currentState!.validate()) {
      // 2. Call VM Logic (Server-side checks)
      await _vm.signUp();

      // 3. Handle Result
      if (!mounted) return;

      if (_vm.status == SignUpStatus.success) {
        context.go(AppRouter.kHomeScreen);
      } else if (_vm.status == SignUpStatus.accountExists) {
        _showAccountExistsDialog();
      }
    }
  }

  void _showAccountExistsDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Account Exists"),
        content: const Text(
          "This email is already registered. Log in instead?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop(); // Close dialog
              context.go(AppRoutes.signIn.path); // Go to Login
            },
            child: const Text("Log In"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.gradientColors),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListenableBuilder(
              listenable: _vm,
              builder: (context, child) => CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () => context.pop(),
                          icon: Icon(Icons.arrow_back_ios_new),
                        ),
                        Text(
                          'Start Tracking Today',
                          style: TextStyles.title,
                        ),
                        Text(
                          'Take control of your finances.',
                          style: TextStyles.subtitle,
                        ),
                        gapH16,
                        Form(
                          key: _formKey,
                          child: Column(
                            spacing: 12,
                            children: [
                              AuthField(
                                controller: _vm.nameController,
                                label: 'Full Name',
                                hintText: 'John Doe',
                                validator: (value) =>
                                    value!.isEmpty ? 'Name is required' : null,
                              ),
                              AuthField(
                                controller: _vm.emailController,
                                label: 'Email',
                                hintText: 'john@example.com',
                                errorText: _vm.emailErrorText,
                                validator: Validators.validateEmail,
                              ),
                              AuthField(
                                controller: _vm.passwordController,
                                label: 'Password',
                                hintText: '••••••••',
                                errorText: _vm.passwordErrorText,
                                isPassword: true,
                                validator: Validators.validatePassword,
                              ),
                              AuthField(
                                label: 'Confirm Password',
                                hintText: '••••••••',
                                isPassword: true,
                                validator: (value) =>
                                    Validators.validateConfirmPassword(
                                      _vm.passwordController.text,
                                      value,
                                    ),
                              ),
                              gapH4,
                              ElevatedButton(
                                onPressed: _vm.status == SignUpStatus.loading
                                    ? null
                                    : _onSubmit,
                                child: _vm.status == SignUpStatus.loading
                                    ? SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text('Sign Up'),
                              ),
                            ],
                          ),
                        ),
                        CustomDivider(
                          centeredText: 'Or continue with',
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
                            height: Sizes.p28,
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
                              onTap: () => context.go(AppRouter.kLoginScreen),
                              child: Text(
                                ' Log in',
                                style: TextStyle(
                                  color: AppColors.kPrimaryColor,
                                  fontWeight: FontWeight.w900,
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
      ),
    );
  }
}
