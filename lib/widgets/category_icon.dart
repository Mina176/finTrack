import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/utils/category_style.dart';
import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    super.key,
    required this.categoryType,
  });
  final CategoryTypes categoryType;
  @override
  Widget build(BuildContext context) {
    final style = getCategoryStyle(categoryType);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          style.icon,
          color: style.color,
        ),
      ),
    );
  }
}
class AccountIcon extends StatelessWidget {
  const AccountIcon({
    super.key,
    required this.accountTypes,
  });
  final AccountTypes accountTypes;
  @override
  Widget build(BuildContext context) {
    final style = getAccountStyle(accountTypes);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          style.icon,
          color: style.color,
        ),
      ),
    );
  }
}
