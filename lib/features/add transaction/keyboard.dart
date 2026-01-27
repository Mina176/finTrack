import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/keyboard_input.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({
    super.key,
    required this.onBtnTap,
    required this.controller,
    required this.focusNode,
  });
  final Function(int) onBtnTap;
  final TextEditingController controller;
  final FocusNode focusNode;
  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _focusNode = widget.focusNode;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kKeyboardColor,
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        childAspectRatio: 1.8,
        children: List.generate(
          keyboardInputs.length,
          (index) => GestureDetector(
            onTap: widget.onBtnTap(index),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.kKeyboardKeyColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    keyboardInputs[index],
                    style: TextStyles.keyboardKey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _input(String text) {
    final value = widget.controller.text + text;
    widget.controller.text = value;
  }

  void _backspace() {
    final value = widget.controller.text;
    if (value.isNotEmpty) {
      widget.controller.text = value.substring(0, value.length - 1);
    }
  }
}
