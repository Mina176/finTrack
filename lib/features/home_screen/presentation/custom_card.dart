import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.isSelected,
    this.height,
    this.padding,
  });
  final Widget child;
  final bool? isSelected;
  final double? height;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: BoxBorder.all(
            color: isSelected == true
                ? AppColors.kPrimaryColor
                : Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 12, vertical: 22.0),
          child: child,
        ),
      ),
    );
  }
}
