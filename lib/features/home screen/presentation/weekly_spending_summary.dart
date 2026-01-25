import 'package:fintrack/features/home%20screen/presentation/bar%20graph/my_bar_graph.dart';
import 'package:flutter/material.dart';

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
    150,
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
