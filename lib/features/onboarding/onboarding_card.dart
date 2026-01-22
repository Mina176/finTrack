import 'package:fintrack/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
    required this.icon,
    required this.borderRadius,
  });
  final IconData icon;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.07),
            spreadRadius: 120,
            blurRadius: 120,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: kPrimaryColor,
        size: 60,
      ),
    );
  }
}
