import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/logic/transaction_controller.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_app_bar.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:fintrack/features/home%20screen/presentation/last_month_container.dart';
import 'package:fintrack/features/home%20screen/presentation/transaction_card.dart';
import 'package:fintrack/features/home%20screen/presentation/weekly_spending_summary.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(getTransactionsProvider);
    final weeklyDashboardAsync = ref.watch(getWeeklyDashboardDataProvider);
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.kVerticalPadding,
            horizontal: Sizes.kHorizontalPadding,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  spacing: 16,
                  children: [
                    CustomAppBar(),
                    CustomCard(
                      child: Column(
                        spacing: 4,
                        children: [
                          Text(
                            'Total Balance'.hardcoded,
                            style: TextStyles.subtitle.copyWith(fontSize: 14),
                          ),
                          Text(
                            '\$14,235.00'.hardcoded,
                            style: TextStyles.title,
                          ),
                          LastMonthContainer(
                            savingPercentage: 12,
                          ),
                        ],
                      ),
                    ),
                    CustomCard(
                      child: weeklyDashboardAsync.when(
                        data: (weeklyDashboardData) {
                          final totalWeeklySpendings = weeklyDashboardData
                              .weeklySpendings
                              .fold(
                                0.0,
                                (sum, item) => sum + item,
                              );
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '\$${totalWeeklySpendings.toStringAsFixed(2)}',
                                        style: TextStyles.title.copyWith(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Total spent this week',
                                        style: TextStyles.subtitle.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  LastMonthContainer(
                                    isShrinked: true,
                                    savingPercentage:
                                        weeklyDashboardData.percentChange,
                                  ),
                                ],
                              ),
                              Divider(
                                color: AppColors.kDividerColor,
                                height: 12,
                              ),
                              gapH32,
                              WeeklySpendingSummary(
                                weeklySummary:
                                    weeklyDashboardData.weeklySpendings,
                              ),
                            ],
                          );
                        },
                        loading: () => SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        error: (error, stackTrace) => Center(
                          child: Text('Error: $error'),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recent Transactions', style: TextStyles.header),
                        Text('See All'.hardcoded, style: TextStyles.headerLink),
                      ],
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: gapH20,
              ),
              transactionsAsync.when(
                data: (transactions) {
                  if (transactions.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 250,
                        child: Center(
                          child: Text("No transactions yet"),
                        ),
                      ),
                    );
                  }
                  return SliverList.separated(
                    itemCount: transactions.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return TransactionCard(transaction: transactions[index]);
                    },
                  );
                },
                loading: () => const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 250,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
                error: (error, stack) => SliverToBoxAdapter(
                  child: Center(child: Text('Error: $error')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
