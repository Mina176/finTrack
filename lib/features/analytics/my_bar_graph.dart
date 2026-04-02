import 'package:fynt/core/enums/weekday.dart';
import 'package:fynt/features/settings/currency/currency_provider.dart';
import 'package:fynt/features/analytics/bar_data.dart';
import 'package:fynt/core/theming/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyBarGraph extends ConsumerWidget {
  const MyBarGraph({super.key, required this.weeklySummary});
  final List<double> weeklySummary;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySymbol = ref.watch(currencySymbolProvider);

    BarData myBarData = BarData(amounts: weeklySummary);
    // getting highest spend
    List<double> sortedList = List.from(weeklySummary)..sort();
    double highestSpend = sortedList.last;
    myBarData.getBarData();
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipPadding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            tooltipMargin: 2,
            getTooltipColor: (group) => AppColors.kBackgroundColor,
            tooltipBorderRadius: BorderRadius.circular(6),
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '$currencySymbol${rod.toY.toInt()}',
                const TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) =>
                  getBottomTitles(value, meta, context),
            ),
          ),
        ),
        maxY: highestSpend,
        minY: 0,
        barGroups: myBarData.getBarData().map((data) {
          return BarChartGroupData(
            barsSpace: 6,
            x: data.x,
            showingTooltipIndicators:
                highestSpend == data.y && highestSpend != 0 ? [0] : [],
            barRods: [
              BarChartRodData(
                toY: data.y,
                color: data.y == highestSpend
                    ? AppColors.kPrimaryColor
                    : AppColors.kBarGraphNotHighest,
                width: 26,
                borderRadius: const BorderRadius.all(Radius.circular(0)),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta, BuildContext context) {
    final day = WeekDays.values[value.toInt()];
    return SideTitleWidget(
      meta: meta,
      space: 8.0,
      child: Text(day.localizedLabel(context), style: WeekDays.style),
    );
  }
}
