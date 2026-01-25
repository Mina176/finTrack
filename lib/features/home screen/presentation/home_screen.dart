import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/authentication/logic/auth_controller.dart';
import 'package:fintrack/features/home%20screen/presentation/bar%20graph/my_bar_graph.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:fl_chart/fl_chart.dart';
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
              CustomContainer(
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
              CustomContainer(
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

class WeeklySpendingSummary extends StatefulWidget {
  const WeeklySpendingSummary({super.key});

  @override
  State<WeeklySpendingSummary> createState() => _WeeklySpendingSummaryState();
}

class _WeeklySpendingSummaryState extends State<WeeklySpendingSummary> {
  List<double> weeklySummary = [
    50,
    60,
    70,
    80,
    90,
    100,
    100,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: MyBarGraph(
        weeklySummary: weeklySummary,
      ),
    );
  }
}

class LastMonthContainer extends StatelessWidget {
  const LastMonthContainer({super.key, required this.isSaving});
  final bool isSaving;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kButtonBorderColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          '+12% vs last month'.hardcoded,
          textAlign: TextAlign.center,
          style: TextStyles.buttonLabel.copyWith(
            color: AppColors.kPrimaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.widget,
  });
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kCustomContainerBackground,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22.0),
        child: widget,
      ),
    );
  }
}

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => ref.read(authControllerProvider.notifier).signOut(),
          child: CircleAvatar(
            radius: 24,
            child: ClipOval(
              child: Image.asset(
                'assets/9440461.jpg',
              ),
            ),
          ),
        ),
        gapW8,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'WELCOME BACK',
              style: TextStyles.subtitle.copyWith(fontSize: 14),
            ),
            Text(
              'Alex Morgan'.hardcoded,
              style: TextStyles.title.copyWith(fontSize: 18),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
          ),
        ),
      ],
    );
  }
}
