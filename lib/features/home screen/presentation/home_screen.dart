import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_app_bar.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:fintrack/features/home%20screen/presentation/last_month_container.dart';
import 'package:fintrack/features/home%20screen/presentation/transaction_card.dart';
import 'package:fintrack/features/home%20screen/presentation/weekly_spending_summary.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$845.20',
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
                                savingPercentage: -5,
                              ),
                            ],
                          ),
                          gapH32,
                          WeeklySpendingSummary(),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recent Transactions', style: TextStyles.header),
                        Text('See All', style: TextStyles.headerLink),
                      ],
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: gapH20,
              ),
              SliverList.separated(
                itemCount: 5,
                separatorBuilder: (context, index) => gapH16,
                itemBuilder: (context, index) => TransactionCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


