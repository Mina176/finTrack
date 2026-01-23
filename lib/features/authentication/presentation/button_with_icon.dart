import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.label,
    required this.textColor,
    required this.icon,
  });
  final VoidCallback onPressed;
  final String label;
  final Color textColor;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(color: AppColors.kButtonBorderColor),
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
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}