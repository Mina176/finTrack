import 'package:fintrack/features/authentication/presentation/button_with_icon.dart';
import 'package:fintrack/features/authentication/presentation/text_field_with_label.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.gradientColors),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    gapH48,
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
                    TextFieldWithLabel(
                      label: 'Email Address',
                      hintText: 'name@example.com',
                    ),
                    TextFieldWithLabel(
                      label: 'Password',
                      hintText: '••••••••',
                      isObscure: true,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_red_eye_rounded,
                        ),
                      ),
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyles.hintText.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    gapH8,
                    ElevatedButton(onPressed: () {}, child: Text('Login')),
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
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: TextStyles.hintText.color,
                          ),
                        ),
                        gapW4,
                        Text('OR', style: TextStyles.hintText),
                        gapW4,
                        Expanded(
                          child: Divider(
                            color: TextStyles.hintText.color,
                          ),
                        ),
                      ],
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
                          onTap: () {},
                          child: Text(
                            ' Sign Up',
                            style: TextStyle(color: AppColors.kPrimaryColor),
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
    );
  }
}
