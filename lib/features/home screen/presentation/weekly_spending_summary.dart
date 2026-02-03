import 'package:fintrack/features/home%20screen/presentation/bar%20graph/my_bar_graph.dart';
import 'package:flutter/material.dart';

class WeeklySpendingSummary extends StatelessWidget {
  const WeeklySpendingSummary({super.key, required this.weeklySummary});

  final List<double> weeklySummary;

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
