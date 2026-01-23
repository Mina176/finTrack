import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/authentication/presentation/button_with_icon.dart';
import 'package:fintrack/features/authentication/presentation/login_screen.dart';
import 'package:fintrack/features/authentication/presentation/text_field_with_label.dart';
import 'package:fintrack/router.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                      TextFieldWithLabel(
                        label: 'Full Name',
                        hintText: 'John Doe',
                      ),
                      TextFieldWithLabel(
                        label: 'Email',
                        hintText: 'john@example.com',
                      ),
                      TextFieldWithLabel(
                        label: 'Password',
                        hintText: '••••••••',
                        isPassword: true,
                      ),
                      TextFieldWithLabel(
                        label: 'Confirm Password',
                        hintText: '••••••••',
                        isPassword: true,
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
}
