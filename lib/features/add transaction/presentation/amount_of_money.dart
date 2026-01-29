import 'package:fintrack/constants/text_styles.dart';
import 'package:flutter/material.dart';

class AmountOfMoney extends StatelessWidget {
  const AmountOfMoney({
    super.key,
    required this.screenSize,
    required this.amount,
    required this.showCustomKeypad,
    required this.activateCustomKeypad,
  });

  final VoidCallback activateCustomKeypad;
  final Size screenSize;
  final String amount;
  final bool showCustomKeypad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: activateCustomKeypad,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: screenSize.height * 0.15,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            amount,
            style: TextStyles.amount.copyWith(
              color: showCustomKeypad ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
