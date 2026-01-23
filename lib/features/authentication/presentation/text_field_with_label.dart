import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:flutter/material.dart';

class TextFieldWithLabel extends StatefulWidget {
  const TextFieldWithLabel({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
  });
  final String label;
  final String hintText;
  final bool isPassword;

  @override
  State<TextFieldWithLabel> createState() => _TextFieldWithLabelState();
}

class _TextFieldWithLabelState extends State<TextFieldWithLabel> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextStyles.labelText),
        gapH4,
        TextField(
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                    icon: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : null,
          ),
          obscureText: isObscured,
        ),
      ],
    );
  }
}
