import 'package:flutter/material.dart';
import 'package:fynt/core/constants/text_styles.dart';
import 'package:fynt/core/enums/recurrence_type.dart';
import 'package:fynt/core/theming/app_colors.dart';

class ChoosePeriodHorizontalListView extends StatelessWidget {
  const ChoosePeriodHorizontalListView({
    super.key,
    required this.selectedPeriod,
    required this.onPeriodSelected,
  });
  final RecurrenceDuration selectedPeriod;
  final ValueChanged<RecurrenceDuration> onPeriodSelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Row(
        children: List.generate(
          RecurrenceDuration.values.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoosePeriodHorizontalListViewItem(
              isSelected: selectedPeriod == RecurrenceDuration.values[index],
              period: RecurrenceDuration.values[index],
              onTap: () {
                onPeriodSelected(RecurrenceDuration.values[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ChoosePeriodHorizontalListViewItem extends StatelessWidget {
  const ChoosePeriodHorizontalListViewItem({
    super.key,
    required this.isSelected,
    required this.period,
    required this.onTap,
  });
  final bool isSelected;
  final RecurrenceDuration period;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.kPrimaryColor
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: AppColors.kPrimaryColor.withOpacity(0.5),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Center(
            child: Text(
              period.name.toUpperCase()[0] + period.name.substring(1),
              style: TextStyles.title.copyWith(
                fontSize: 12,
                color: isSelected ? Colors.black : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
