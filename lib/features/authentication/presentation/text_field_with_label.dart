import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:flutter/material.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    super.key,
    required this.label,
    required this.hintText,
    this.isObscure = false,
    this.suffixIcon,
  });
  final String label;
  final String hintText;
  final Widget? suffixIcon;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.labelText),
        gapH4,
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          obscureText: isObscure,
        ),
      ],
    );
  }
}
