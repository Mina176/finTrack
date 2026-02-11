import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/features/add%20transaction/utils/helpers.dart';
import 'package:fintrack/features/budgets/presentation/category_remaining_card.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:fintrack/widgets/category_icon.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:flutter/material.dart';

class BudgetsScreen extends StatelessWidget {
  const BudgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(
          'My Budgets',
          style: TextStyles.header,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.kHorizontalPadding,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeftToSpendCard(),
                  gapH16,
                  Text('Categories', style: TextStyles.header),
                  gapH8,
                ],
              ),
            ),
            SliverList.separated(
              itemBuilder: (context, index) {
                return CategoryRemainingCard(
                  categoryDetails: CategoryDetails(
                    categoryType: CategoryTypes.transport,
                    amountSpent: 120,
                    spendLimit: 200,
                  ),
                );
              },
              itemCount: 5,
              separatorBuilder: (context, index) {
                return gapH8;
              },
            ),
          ],
        ),
      ),
    );
  }
}
class LeftToSpendCard extends StatelessWidget {
  const LeftToSpendCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LEFT TO SPEND',
              style: TextStyles.headerLink,
            ),
            Text(
              '\$1,300',
              style: TextStyles.header.copyWith(fontSize: 32),
            ),
            gapH16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Spent',
                  style: TextStyles.subtitle.copyWith(fontSize: 12),
                ),
                Text(
                  '\$700 / \$2,000'.hardcoded,
                  style: TextStyles.subtitle.copyWith(fontSize: 12),
                ),
              ],
            ),
            gapH8,
            LinearProgressIndicator(
              value: 0.35,
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
