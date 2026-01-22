import 'package:fintrack/constants/app_colors.dart';
import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/onboarding/presentation/onboarding_card.dart';
import 'package:fintrack/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B12),
      body: Container(
        decoration: BoxDecoration(gradient: gradientColors),
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            curve: Curves.linear,
            duration: Duration(milliseconds: 1200),
            builder: (context, opacity, child) {
              return Opacity(
                opacity: opacity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OnboardingCard(
                      width: 120,
                      height: 120,
                      title: 'FinTrack',
                      subTitle: 'Master your money',
                      icon: Icons.account_balance_wallet,
                      borderRadius: Sizes.p24,
                    ),
                  ],
                ),
              );
            },
            onEnd: () => context.go(AppRouter.kOnBoardingScreen),
          ),
        ),
      ),
    );
  }
}
