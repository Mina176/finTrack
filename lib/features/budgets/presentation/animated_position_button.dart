import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/features/authentication/presentation/button_with_icon.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedPositionButton extends StatelessWidget {
  const AnimatedPositionButton({
    super.key,
    required this.showCustomKeypad,
    required this.keypadHeight,
    required this.buttonAreaHeight,
    required this.safeAreaBottom,
    required this.onTap,
    required this.isLoading,
  });

  final VoidCallback onTap;
  final bool showCustomKeypad;
  final double keypadHeight;
  final double buttonAreaHeight;
  final double safeAreaBottom;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      left: 0,
      right: 0,
      bottom: showCustomKeypad ? keypadHeight : 0,
      height: buttonAreaHeight + (showCustomKeypad ? 0 : safeAreaBottom),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: Sizes.kHorizontalPadding - 4,
        ),
        child: ButtonWithIcon(
          onPressed: onTap,
          label: "Save Bugdet",
          icon: Icon(Icons.check_circle_rounded),
          isLoading: isLoading,
          backgroundColor: AppColors.kPrimaryColor,
          borderColor: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
