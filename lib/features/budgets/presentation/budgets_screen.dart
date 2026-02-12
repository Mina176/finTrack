import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/features/budgets/logic/budget_controller.dart';
import 'package:fintrack/features/budgets/logic/budget_supabase.dart';
import 'package:fintrack/features/budgets/presentation/category_remaining_card.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:fintrack/routing/app_route_enum.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BudgetsScreen extends ConsumerWidget {
  const BudgetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetsAsync = ref.watch(getBudgetsProvider);
    final budgetsDetails = ref.watch(getAllBudgetsDetailsProvider);
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
                onPressed: () {
                  context.push(AppRoutes.addBudget.path);
                },
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
                  LeftToSpendCard(
                    leftToSpendAmount: budgetsDetails.value?.totalLimit ?? 0.0,
                    spentAmount: budgetsDetails.value?.totalSpent ?? 0.0,
                    spendLimit: budgetsDetails.value?.totalLimit ?? 0.0,
                  ),
                  gapH16,
                  Text('Categories', style: TextStyles.header),
                  gapH8,
                ],
              ),
            ),
            budgetsAsync.when(
              data: (budgets) => SliverList.builder(
                itemCount: budgets.length,
                itemBuilder: (context, index) {
                  final budget = budgets[index];
                  return Column(
                    children: [
                      CategoryRemainingCard(
                        categoryDetails: CategoryDetails(
                          categoryType: budget.category,
                          amountSpent: budget.spent,
                          spendLimit: budget.limit,
                        ),
                      ),
                      gapH12,
                    ],
                  );
                },
              ),
              loading: () => const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stackTrace) => SliverToBoxAdapter(
                child: Center(
                  child: Text('Error loading budgets'),
                ),
              ),
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
    required this.leftToSpendAmount,
    required this.spentAmount,
    required this.spendLimit,
  });
  final double leftToSpendAmount;
  final double spentAmount;
  final double spendLimit;

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
              '\$${leftToSpendAmount.toStringAsFixed(0)}',
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
                  '\$${spentAmount.toStringAsFixed(0)} / \$${spendLimit.toStringAsFixed(0)}'
                      .hardcoded,
                  style: TextStyles.subtitle.copyWith(fontSize: 12),
                ),
              ],
            ),
            gapH8,
            LinearProgressIndicator(
              value: spentAmount / spendLimit,
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
