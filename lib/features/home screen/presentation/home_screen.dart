import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_app_bar.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:fintrack/features/home%20screen/presentation/fab_bottom_app_bar.dart';
import 'package:fintrack/features/home%20screen/presentation/last_month_container.dart';
import 'package:fintrack/features/home%20screen/presentation/weekly_spending_summary.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                      widget: Column(
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
                      widget: Column(
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
                          Divider(
                            height: 16,
                            thickness: 0.3,
                            color: Colors.grey.shade500,
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

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.backgoroundColor,
  });
  final IconData iconData;
  final Color iconColor;
  final Color backgoroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgoroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          iconData,
          color: iconColor,
        ),
      ),
    );
  }
}
