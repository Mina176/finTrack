import 'package:fintrack/constants/keyboard_input.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    super.key,
    required this.onBtnTap,
  });
  final void Function(String) onBtnTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kKeyboardColor,
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        childAspectRatio: 2.15,
        children: List.generate(
          keyboardInputs.length,
          (index) => InkWell(
            onTap: () => onBtnTap(keyboardInputs[index]),
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
}
