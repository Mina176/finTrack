import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:fintrack/widgets/category_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.transaction});
  final TransactionModel transaction;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CategoryIcon(categoryType: transaction.category),
      title: Text(
        transaction.category.name[0].toUpperCase() +
            transaction.category.name.substring(1),
        style: TextStyles.title.copyWith(fontSize: 16),
      ),
      subtitle: Text(
        DateFormat('EEE, MMM d').format(transaction.date),
        style: TextStyles.subtitle.copyWith(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      trailing: Text(
        formatDouble(transaction.amount, transaction.isExpense).hardcoded,
        style: TextStyles.title.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: transaction.isExpense ? null : AppColors.kPrimaryColor,
        ),
      ),
    );
  }

  String formatDouble(double d, bool isExpense) {
    String sign = isExpense ? "-" : "";
    String currencySymbol = '\$';
    return sign +
        currencySymbol +
        d.toString().replaceFirst(RegExp(r'\.0*$'), '');
  }
}
