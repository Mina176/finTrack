import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
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
      scaffoldBackgroundColor: AppColors.kBackgroundColor,
      cardColor: AppColors.kCardColor,
      textTheme: baseTextTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      dividerColor: Color(0xFF334155),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.kPrimaryColor,
        refreshBackgroundColor: Colors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
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
        border: buildBorder(AppColors.kButtonBorderColor),
        enabledBorder: buildBorder(AppColors.kButtonBorderColor),
        focusedBorder: buildBorder(AppColors.kButtonBorderColor),
        suffixIconColor: Color(0xFF92C9A4),
        filled: true,
        fillColor: AppColors.kTextFieldFillColor,
        hintStyle: TextStyles.hintText,
      ),
    );
  }

  static ThemeData get lightTheme {
    final base = ThemeData.light();
    final baseTextTheme = GoogleFonts.interTextTheme(base.textTheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColors.kPrimaryColor,
        secondary: AppColors.kPrimaryColor,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      scaffoldBackgroundColor: const Color(
        0xFFF5F5F5,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      dividerTheme: DividerThemeData(
        color: const Color(0xFFE5E5EA),
        thickness: 1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: AppColors.kButtonLabelColor,
          textStyle: TextStyles.buttonLabel,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: buildBorder(Color(0xFFEDEFF2)),
        enabledBorder: buildBorder(Color(0xFFEDEFF2)),
        focusedBorder: buildBorder(Color(0xFFEDEFF2)),
        suffixIconColor: Color(0xFF92C9A4),
        filled: true,
        fillColor: Color(0xFFF9FAFB),
        hintStyle: TextStyles.hintText,
      ),
      textTheme: baseTextTheme.apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
    );
  }
}

OutlineInputBorder buildBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color),
  );
}
