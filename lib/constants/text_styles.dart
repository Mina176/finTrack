import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const title = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 32,
    letterSpacing: 0.1,
    height: 1.2,
  );

  static const subtitle = TextStyle(
    color: AppColors.kSubtitleColor,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.4,
  );

  static const buttonLabel = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const hintText = TextStyle(
    color: Color(0xFF5A8069),
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const labelText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}
