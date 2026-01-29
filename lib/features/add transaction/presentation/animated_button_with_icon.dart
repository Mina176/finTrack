
import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/duration_constants.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedButtonWithIcon extends StatelessWidget {
  const AnimatedButtonWithIcon({
    super.key,
    required this.onTap,
    required this.expenseOrIncome,
    required this.color,
    required this.label,
    required this.icon,
  });

  final VoidCallback onTap;
  final int expenseOrIncome;
  final Color color;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: Sizes.p48,
      duration: addTransactionAnimationDuration,
      decoration: BoxDecoration(
        color: expenseOrIncome == 0
            ? Colors.red
            : AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyles.buttonLabel.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
