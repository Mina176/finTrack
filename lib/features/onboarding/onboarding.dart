import 'package:fintrack/features/onboarding/onboarding_card.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B12),
      body: Center(
        child: OnboardingCard(
          icon: Icons.account_balance_wallet,
          borderRadius: 24,
        ),
      ),
    );
  }
}
