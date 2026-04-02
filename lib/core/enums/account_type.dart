import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fynt/core/extensions/localization_extension.dart';

enum AccountType {
  debitCard(
    label: 'Debit Card',
    icon: Icons.credit_card,
  ),
  creditCard(
    label: 'Credit Card',
    icon: FontAwesomeIcons.ccVisa,
  ),
  cashWallet(
    label: 'Cash Wallet',
    icon: Icons.wallet,
  ),
  investment(
    label: 'Investment',
    icon: FontAwesomeIcons.arrowTrendUp,
  )
  ;

  final String label;
  final IconData icon;

  const AccountType({
    required this.label,
    required this.icon,
  });

  String localizedLabel(BuildContext context) {
    switch (this) {
      case AccountType.debitCard:
        return context.l10n.debitCard;
      case AccountType.creditCard:
        return context.l10n.creditCard;
      case AccountType.cashWallet:
        return context.l10n.cashWallet;
      case AccountType.investment:
        return context.l10n.investment;
    }
  }
}
