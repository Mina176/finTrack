import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.onSaved,
    this.validator,
    this.errorText,
    this.onChanged,
  });
  final String label;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final FormFieldSetter<String>? onSaved;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? errorText;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextStyles.labelText),
        gapH4,
        TextFormField(
          controller: widget.controller,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          obscureText: isObscured && widget.isPassword == true,
          validator: (val) {
            // Priority 1: Custom Error (from your Submit logic)
            if (widget.errorText != null) return widget.errorText;
            // Priority 2: Standard Validator (if provided)
            if (widget.validator != null) return widget.validator!(val);
            return null;
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            errorText: widget.errorText,
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
        ),
      ],
    );
  }
}
