import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
    required this.icon,
    required this.borderRadius,
    required this.width,
    required this.height,
    required this.title,
    required this.subTitle,
  });
  final IconData icon;
  final double borderRadius;
  final double width;
  final double height;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.kCardColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Icon(
            icon,
            color: AppColors.kPrimaryColor,
            size: 60,
          ),
        ),
        gapH24,
        Text(
          title,
          style: TextStyles.title,
          textAlign: TextAlign.center,
        ),
        gapH12,
        Text(
          subTitle,
          style: TextStyles.subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
