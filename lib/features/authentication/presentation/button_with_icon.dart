import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.label,
    required this.foregroundColor,
    this.backgroundColor = Colors.transparent,
    this.borderColor = AppColors.kButtonBorderColor,
    required this.icon,
  });
  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          gapW4,
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyles.buttonLabel.copyWith(
              color: foregroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
