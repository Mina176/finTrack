import 'package:flutter/widgets.dart';
import 'package:fynt/core/constants/text_styles.dart';
import 'package:fynt/features/budgets/presentation/widgets/left_to_spend_card.dart';

class LeftToSpendSection extends StatelessWidget {
  const LeftToSpendSection({
    super.key,
    required this.currencySymbol,
    required this.spendLimit,
    required this.spentAmount,
  });

  final String currencySymbol;
  final double spendLimit;
  final double spentAmount;

  @override
  Widget build(BuildContext context) {
    return LeftToSpendCard(
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'LEFT TO SPEND',
                style: TextStyles.headerLink,
              ),
              Text(
                '$currencySymbol${spendLimit == 0 ? 0 : (spendLimit - spentAmount).round()}',
                style: TextStyles.header.copyWith(fontSize: 32),
              ),
            ],
          ),
          Text(
            '${spendLimit == 0 ? 0 : (spentAmount * 100 / spendLimit).round()}%',
            style: TextStyles.title.copyWith(fontSize: 14),
          ),
        ],
      ),
      spentAmount: spentAmount,
      spendLimit: spendLimit,
    );
  }
}
