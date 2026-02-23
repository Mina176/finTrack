// No manual colors needed here anymore!
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/features/add%20transaction/presentation/category_icon_with_label.dart';
import 'package:fintrack/widgets/category_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<CategoryIcon> spendingCategoriesList = [
  CategoryIcon(categoryType: CategoryTypes.food),
  CategoryIcon(categoryType: CategoryTypes.transport),
  CategoryIcon(categoryType: CategoryTypes.health),
  CategoryIcon(categoryType: CategoryTypes.housing),
  CategoryIcon(categoryType: CategoryTypes.entertainment),
  CategoryIcon(categoryType: CategoryTypes.shopping),
  CategoryIcon(categoryType: CategoryTypes.bills),
];

final List<CategoryIcon> incomeCategoriesList = [
  CategoryIcon(categoryType: CategoryTypes.freelance),
  CategoryIcon(categoryType: CategoryTypes.investment),
  CategoryIcon(categoryType: CategoryTypes.salary),
  CategoryIcon(categoryType: CategoryTypes.gifts),
];

final List<CategoryIconWithLabel> spendingCategoriesWithLabelsList = [
  CategoryIconWithLabel(categoryType: CategoryTypes.food),
  CategoryIconWithLabel(categoryType: CategoryTypes.transport),
  CategoryIconWithLabel(categoryType: CategoryTypes.health),
  CategoryIconWithLabel(categoryType: CategoryTypes.housing),
  CategoryIconWithLabel(categoryType: CategoryTypes.entertainment),
  CategoryIconWithLabel(categoryType: CategoryTypes.shopping),
  CategoryIconWithLabel(categoryType: CategoryTypes.bills),
];
final List<CategoryIconWithLabel> incomeCategoriesWithLabelsList = [
  CategoryIconWithLabel(categoryType: CategoryTypes.freelance),
  CategoryIconWithLabel(categoryType: CategoryTypes.investment),
  CategoryIconWithLabel(categoryType: CategoryTypes.salary),
  CategoryIconWithLabel(categoryType: CategoryTypes.gifts),
];

final List<Map<String, dynamic>> accountTypes = [
  {'icon': Icons.credit_card, 'label': 'Debit Card'},
  {'icon': Icons.credit_card, 'label': 'Credit Card'},
  {'icon': Icons.wallet, 'label': 'Cash Wallet'},
  {'icon': FontAwesomeIcons.arrowTrendUp, 'label': 'Investment'},
];

final List<AccountIcon> accountTypesList = [
  AccountIcon(accountTypes: AccountTypes.cashWallet),
  AccountIcon(accountTypes: AccountTypes.debitCard),
  AccountIcon(accountTypes: AccountTypes.creditCard),
  AccountIcon(accountTypes: AccountTypes.investment),
];
