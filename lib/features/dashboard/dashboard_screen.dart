import 'package:fynt/core/constants/app_sizes.dart';
import 'package:fynt/features/dashboard/widgets/recent_transaction_header.dart';
import 'package:fynt/features/dashboard/widgets/recent_transaction_list.dart';
import 'package:fynt/features/dashboard/widgets/total_balance_card.dart';
import 'package:fynt/features/dashboard/widgets/weekly_dashboard.dart';
import 'package:fynt/features/dashboard/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.kHorizontalPadding,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH4,
                    CustomAppBar(),
                    gapH16,
                    TotalBalanceCard(),
                    gapH16,
                    WeeklyDashboard(),
                    gapH16,
                    RecentTransactionHeader(),
                  ],
                ),
              ),
              RecentTransactionList(),
            ],
          ),
        ),
      ),
    );
  }
}
