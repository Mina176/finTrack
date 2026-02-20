import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/controllers/keyboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayAmount extends ConsumerWidget {
  const DisplayAmount({
    super.key,
    required this.amount,
  });
  final String amount;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isKeypadVisible = ref.watch(keypadControllerProvider);
    return Column(
      children: [
        const Text(
          "Amount (USD)",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            ref.read(keypadControllerProvider.notifier).show();
          },
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                amount,
                style: TextStyles.amount.copyWith(
                  color: isKeypadVisible ? null : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
