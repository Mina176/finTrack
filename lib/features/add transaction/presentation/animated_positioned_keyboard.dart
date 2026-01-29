import 'package:fintrack/features/add%20transaction/presentation/keyboard.dart';
import 'package:flutter/material.dart';

class AnimatedPositionedKeyboard extends StatelessWidget {
  const AnimatedPositionedKeyboard({
    super.key,
    required this.onKeyTap,
    required this.showCustomKeypad,
    required this.hiddenOffset,
    required this.keypadHeight,
    required this.safeAreaBottom,
  });
  final void Function(String) onKeyTap;
  final bool showCustomKeypad;
  final double hiddenOffset;
  final double keypadHeight;
  final double safeAreaBottom;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      left: 0,
      right: 0,
      bottom: showCustomKeypad ? 0 : hiddenOffset,
      height: keypadHeight + safeAreaBottom,
      child: GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: Keyboard(onBtnTap: onKeyTap),
      ),
    );
  }
}
