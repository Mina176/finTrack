import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  // 1. Define the Light Theme
  static ThemeData get darkTheme {
    final base = ThemeData.dark();
    final baseTextTheme = GoogleFonts.interTextTheme(base.textTheme);
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.kPrimaryColor,
        secondary: AppColors.kPrimaryColor,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.kTitleColor,
      ),
      textTheme: baseTextTheme.copyWith(
        displayLarge: baseTextTheme.displayLarge?.copyWith(
          color: AppColors.kTitleColor,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          color: AppColors.kSubtitleColor,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, Sizes.p48),
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: AppColors.kButtonLabelColor,
          textStyle: TextStyles.buttonLabel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        suffixIconColor: Color(0xFF92C9A4),
        filled: true,
        fillColor: Color(0xFF193322),
        hintStyle: TextStyles.hintText,
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: AppColors.kButtonBorderColor),
  );
}
