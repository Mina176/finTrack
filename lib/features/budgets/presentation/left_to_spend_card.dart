import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:flutter/material.dart';

class LeftToSpendCard extends StatelessWidget {
  const LeftToSpendCard({
    super.key,
    required this.spentAmount,
    required this.spendLimit,
    required this.leading,
  });
  final double spentAmount;
  final double spendLimit;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    final double progressValue = spendLimit == 0
        ? 0.0
        : (spentAmount / spendLimit).clamp(0.0, 1.0);
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            leading,
            gapH16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Spent',
                  style: TextStyles.subtitle.copyWith(fontSize: 12),
                ),
                Text(
                  '\$${spentAmount.toStringAsFixed(0)} / \$${spendLimit.toStringAsFixed(0)}',
                  style: TextStyles.subtitle.copyWith(fontSize: 12),
                ),
              ],
            ),
            gapH8,
            LinearProgressIndicator(
              value: progressValue,
              backgroundColor: Colors.black,
              minHeight: 6,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
      ),
    );
  }
}
