import 'dart:ui';

import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/widgets.dart';

class ExpenseOrIncome extends StatefulWidget {
  const ExpenseOrIncome({super.key});

  @override
  State<ExpenseOrIncome> createState() => _ExpenseOrIncomeState();
}

class _ExpenseOrIncomeState extends State<ExpenseOrIncome> {
  final List<String> expenseOrIncome = ['Expense', 'Income'];
  int selectedIndex = 0;
  void selectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected(int index) => selectedIndex == index;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final pillWidth = (width - 12) / 2;
        return Container(
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 100),
                curve: Curves.easeInCubic,
                left: selectedIndex == 0 ? 4 : width - 4 - pillWidth,
                top: 6,
                bottom: 6,
                width: pillWidth,
                onEnd: () {
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == 0
                        ? Color(0xFF3F1212)
                        : AppColors.kBarGraphNotHighest,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  2,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: () => selectItem(index),
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        alignment: Alignment.center,
                        child: AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 100),
                          style: TextStyles.hintText.copyWith(
                            color: isSelected(index) && selectedIndex == 0
                                ? Color(0xFFFF453A)
                                : isSelected(index) && selectedIndex == 1
                                ? AppColors.kPrimaryColor
                                : AppColors.kSubtitleColor,
                          ),
                          child: Text(
                            expenseOrIncome[index],
                            style: TextStyle(
                              color: isSelected(index) && selectedIndex == 0
                                  ? Color(0xFFFF453A)
                                  : isSelected(index) && selectedIndex == 1
                                  ? AppColors.kPrimaryColor
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
