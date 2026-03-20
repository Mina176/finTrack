import 'package:fynt/core/enums/account_type.dart';
import 'package:fynt/core/enums/category_type.dart';
import 'package:fynt/features/transactions/data/transaction_model.dart';
import 'package:fynt/features/settings/appearance/logic/theme_controller.dart';
import 'package:fynt/core/utils/category_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryIcon extends ConsumerWidget {
  const CategoryIcon({
    super.key,
    required this.categoryType,
    this.themeMode,
  });
  final CategoryType categoryType;
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

class AccountIcon extends ConsumerWidget {
  const AccountIcon({
    super.key,
    required this.accountType,
  });
  final AccountType accountType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = getAccountStyle(
      accountType,
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
