import 'package:fintrack/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class ButtonLabelWithIcon extends StatelessWidget {
  const ButtonLabelWithIcon({
    super.key,
    required this.label,
    required this.icon,
    this.isTextFirst = true,
  });
  final String label;
  final IconData icon;
  final bool isTextFirst;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isTextFirst
            ? Text(label)
            : Icon(
                icon,
                fontWeight: FontWeight.w600,
              ),
        gapW4,
        isTextFirst
            ? Icon(
                icon,
                fontWeight: FontWeight.w600,
              )
            : Text(label),
      ],
    );
  }
}
