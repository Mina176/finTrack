import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/features/appearance/logic/theme_controller.dart';
import 'package:fintrack/utils/category_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryIcon extends ConsumerWidget {
  const CategoryIcon({
    super.key,
    required this.categoryType,
    this.themeMode,
  });
  final CategoryTypes categoryType;
  final ThemeMode? themeMode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = getCategoryStyle(
      categoryType,
      ref.watch(themeControllerProvider),
    );
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

class OtherIcons extends StatelessWidget {
  const OtherIcons(this.otherIconTypes, {super.key});
  final OtherIconTypes otherIconTypes;
  @override
  Widget build(BuildContext context) {
    final style = getIconStyle(otherIconTypes);
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
