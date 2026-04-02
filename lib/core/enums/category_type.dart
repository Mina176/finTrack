import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fynt/core/extensions/localization_extension.dart';

enum CategoryType {
  food(
    label: 'Food',
    icon: Icons.fastfood,
    isIncome: false,
  ),
  transport(
    label: 'Transport',
    icon: Icons.directions_car,
    isIncome: false,
  ),
  entertainment(
    label: 'Entertainment',
    icon: Icons.sports_esports,
    isIncome: false,
  ),
  shopping(
    label: 'Shopping',
    icon: Icons.shopping_bag,
    isIncome: false,
  ),
  bills(
    label: 'Bills',
    icon: Icons.receipt_long,
    isIncome: false,
  ),
  salary(
    label: 'Salary',
    icon: Icons.attach_money,
    isIncome: true,
  ),
  freelance(
    label: 'Freelance',
    icon: Icons.work,
    isIncome: true,
  ),
  investment(
    label: 'Investment',
    icon: FontAwesomeIcons.arrowTrendUp,
    isIncome: true,
  ),
  housing(
    label: 'Housing',
    icon: Icons.home,
    isIncome: false,
  ),
  health(
    label: 'Health',
    icon: Icons.medical_services,
    isIncome: false,
  ),
  gifts(
    label: 'Gifts',
    icon: Icons.card_giftcard,
    isIncome: true,
  ),
  others(
    label: 'Others',
    icon: Icons.more_horiz,
    isIncome: false,
  ),
  othersIncome(
    label: 'Others',
    icon: Icons.more_horiz,
    isIncome: true,
  ),
  ;

  final String label;
  final IconData icon;
  final bool isIncome;

  const CategoryType({
    required this.label,
    required this.icon,
    required this.isIncome,
  });

  String localizedLabel(BuildContext context) {
    switch (this) {
      case CategoryType.food:
        return context.l10n.food;
      case CategoryType.transport:
        return context.l10n.transport;
      case CategoryType.entertainment:
        return context.l10n.entertainment;
      case CategoryType.shopping:
        return context.l10n.shopping;
      case CategoryType.bills:
        return context.l10n.bills;
      case CategoryType.salary:
        return context.l10n.salary;
      case CategoryType.freelance:
        return context.l10n.freelance;
      case CategoryType.investment:
        return context.l10n.investment;
      case CategoryType.housing:
        return context.l10n.housing;
      case CategoryType.health:
        return context.l10n.health;
      case CategoryType.gifts:
        return context.l10n.gifts;
      case CategoryType.others:
        return context.l10n.other;
      case CategoryType.othersIncome:
        return context.l10n.other;
    }
  }
}
