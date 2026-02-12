import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/features/add%20transaction/presentation/animated_button_with_icon.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedPositionColorButton extends StatelessWidget {
  const AnimatedPositionColorButton({
    super.key,
    required this.showCustomKeypad,
    required this.keypadHeight,
    required this.buttonAreaHeight,
    required this.safeAreaBottom,
    required this.expenseOrIncome,
    required this.onTap,
    required this.isLoading,
  });

  final VoidCallback onTap;
  final bool showCustomKeypad;
  final double keypadHeight;
  final double buttonAreaHeight;
  final double safeAreaBottom;
  final bool isLoading;
  final int expenseOrIncome;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      left: 0,
      right: 0,
      bottom: showCustomKeypad ? keypadHeight : 0,
      height: buttonAreaHeight + (showCustomKeypad ? 0 : safeAreaBottom),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black54, Colors.black],
            stops: [0.0, 0.4],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: Sizes.kHorizontalPadding,
          ),
          child: AnimatedButtonWithIcon(
            onTap: onTap,
            expenseOrIncome: expenseOrIncome,
            color: expenseOrIncome == 0 ? Colors.red : AppColors.kPrimaryColor,
            label: "Add Transaction",
            icon: Icons.check_circle_rounded,
            isLoading: isLoading,
          ),
        ),
      ),
    );
  }
}
