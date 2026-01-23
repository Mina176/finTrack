import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/authentication/presentation/button_with_icon.dart';
import 'package:fintrack/features/authentication/presentation/login_screen.dart';
import 'package:fintrack/features/authentication/presentation/auth_field.dart';
import 'package:fintrack/features/authentication/logic/auth_repository.dart';
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
  final _formKey = GlobalKey<FormState>();
  final AuthRepository _authRepo = AuthRepository();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailErrorText;
  String? _passwordErrorText;
  String name = '';
  String email = '';

  bool _isLoading = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void _submit() async {
    // 1. CLEAR OLD ERRORS & STATE
    setState(() {
      _emailErrorText = null;
      _passwordErrorText = null;
    });

    final email = _emailController.text.trim();

    _emailErrorText = validateEmail(email);

    // 3. STANDARD FORM VALIDATION
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() => _isLoading = true);

      try {
        // 4. ATTEMPT SIGN UP
        await _authRepo.signUpUser(
          name: _nameController.text.trim(),
          email: email,
          password: _passwordController.text.trim(),
        );

        // 5. SUCCESS
        if (mounted) context.go('/home');
      } catch (e) {
        String errorMsg = e.toString();

        // CASE A: Account Exists -> SHOW DIALOG
        if (errorMsg.contains('email-already-in-use') ||
            errorMsg.contains('already registered')) {
          if (mounted) {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Account Exists"),
                content: const Text(
                  "This email is already registered, log in instead.",
                ),
                actions: [
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: const Text("Cancel"),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            context.go('/login');
                          },
                          child: const Text("Log In"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        } else if (errorMsg.contains('weak-password')) {
          setState(() => _passwordErrorText = "Password is too weak");
          _formKey.currentState!.validate();
        } else {
          setState(() => _emailErrorText = errorMsg);
          _formKey.currentState!.validate();
        }
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
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
                        autovalidateMode: autovalidateMode,
                        child: Column(
                          spacing: 12,
                          children: [
                            AuthField(
                              controller: _nameController,
                              label: 'Full Name',
                              hintText: 'John Doe',
                              validator: (value) =>
                                  value!.isEmpty ? 'Name is required' : null,
                              onSaved: (value) => name = value!.trim(),
                            ),
                            AuthField(
                              controller: _emailController,
                              label: 'Email',
                              hintText: 'john@example.com',
                              errorText: _emailErrorText,
                              validator: validateEmail,
                              onSaved: (value) => email = value!.trim(),
                            ),
                            AuthField(
                              controller: _passwordController,
                              label: 'Password',
                              hintText: '••••••••',
                              errorText: _passwordErrorText,
                              isPassword: true,
                              validator: validatePassword,
                            ),
                            AuthField(
                              label: 'Confirm Password',
                              hintText: '••••••••',
                              isPassword: true,
                              validator: (value) => validateConfirmPassword(
                                _passwordController.text,
                                value,
                              ),
                            ),
                            gapH4,
                            ElevatedButton(
                              onPressed: _isLoading ? null : _submit,
                              child: _isLoading
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
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
      r'^[^@]+@[^@]+\.[^@]+',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? password, String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm Password';
    } else if (password != value) {
      return 'Password doesn\'t match';
    }
    return null;
  }
}
