import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:flutter/material.dart';

class LastMonthContainer extends StatelessWidget {
  const LastMonthContainer({super.key, required this.isSaving});
  final bool isSaving;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kButtonBorderColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          '+12% vs last month'.hardcoded,
          textAlign: TextAlign.center,
          style: TextStyles.buttonLabel.copyWith(
            color: AppColors.kPrimaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
