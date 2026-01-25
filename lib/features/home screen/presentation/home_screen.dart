import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_app_bar.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:fintrack/features/home%20screen/presentation/last_month_container.dart';
import 'package:fintrack/features/home%20screen/presentation/weekly_spending_summary.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.kVerticalPadding,
            horizontal: Sizes.kHorizontalPadding,
          ),
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
                      isSaving: true,
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
            ],
          ),
        ),
      ),
    );
  }
}


