import 'package:fintrack/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const title = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    letterSpacing: 0.0,
    height: 1.2,
  );

  static const subtitle = TextStyle(
    color: kSubtitleColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.2,
  );

  static const buttonLabel = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  // Regular text (for add/edit task pages)
  static const content = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22,
    height: 1.2,
  );
}
