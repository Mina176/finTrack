import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/features/authentication/presentation/button_with_icon.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedPositionButton extends StatelessWidget {
  const AnimatedPositionButton({
    super.key,
    required this.onTap,
    required this.isLoading,
  });

  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      left: 0,
      right: 0,
      bottom: 0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SafeArea(
          minimum: const EdgeInsets.all(8),
          child: ButtonWithIcon(
            onPressed: onTap,
            label: "Save Bugdet",
            icon: Icon(Icons.check_circle_rounded),
            isLoading: isLoading,
            backgroundColor: AppColors.kPrimaryColor,
            borderColor: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
