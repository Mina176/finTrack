import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/features/currency/logic/currency_provider.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:fintrack/widgets/category_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TransactionCard extends ConsumerWidget {
  const TransactionCard({super.key, required this.transaction});
  final TransactionModel transaction;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySymbol = ref.watch(currencySymbolProvider);
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
        formatDouble(transaction.amount, transaction.isExpense, currencySymbol),
        style: TextStyles.title.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: transaction.isExpense ? null : AppColors.kPrimaryColor,
        ),
      ),
    );
  }

  String formatDouble(double d, bool isExpense, String symbol) {
    String sign = isExpense ? "-" : "";
    return sign + symbol + d.toString().replaceFirst(RegExp(r'\.0*$'), '');
  }
}
