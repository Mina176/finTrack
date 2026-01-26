import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/expense_or_income.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddTransationScreen extends StatelessWidget {
  const AddTransationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(
          horizontal: Sizes.kHorizontalPadding,
        ),
        centerTitle: true,
        title: Text(
          'Add Transaction',
          style: TextStyles.header,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.kHorizontalPadding,
        ),
        child: Column(
          children: [
            ExpenseOrIncome(),
          ],
        ),
      ),
    );
  }
}

