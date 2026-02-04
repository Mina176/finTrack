import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.isSelected,
  });
  final Widget child;
  final bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: BoxBorder.all(
            color: isSelected == true
                ? AppColors.kPrimaryColor
                : AppColors.kDividerColor,
            width: 1,
          ),
          color: AppColors.kCustomContainerBackground,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22.0),
          child: child,
        ),
      ),
    );
  }
}
