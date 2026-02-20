import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.label,
    this.foregroundColor = Colors.black,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.borderColor = AppColors.kButtonBorderColor,
    required this.icon,
    this.isLoading = false,
  });
  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;
  final Widget icon;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor ?? backgroundColor),
      ),
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Row(
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
