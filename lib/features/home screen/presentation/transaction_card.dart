import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:fintrack/widgets/category_icon.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, this.isIncome = false});
  final bool isIncome;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          CategoryIcon(
            iconData: Icons.fastfood,
            iconColor: Colors.orange,
            backgoroundColor: Colors.orange.shade100,
            categoryType: CategoryTypes.food,
          ),
          gapW12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Food & Dining'.hardcoded,
                style: TextStyles.title.copyWith(fontSize: 16),
              ),
              Text(
                'Today'.hardcoded,
                style: TextStyles.subtitle.copyWith(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            '-\$45.00'.hardcoded,
            style: TextStyles.title.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isIncome ? Colors.green : null,
            ),
          ),
        ],
      ),
    );
  }
}