import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/onboarding/onboarding_card.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B12),
      body: Center(
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
                    icon: Icons.account_balance_wallet,
                    borderRadius: Sizes.p24,
                  ),
                  gapH24,
                  Text('FinTrack', style: TextStyles.title),
                  gapH4,
                  Text('Master Your Money', style: TextStyles.subtitle),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
