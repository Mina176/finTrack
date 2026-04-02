import 'package:flutter/material.dart';
import 'package:fynt/core/extensions/localization_extension.dart';

enum RecurrenceDuration {
  weekly(
    infoText: 'The budget will reset automatically on Monday of every week.',
  ),
  monthly(
    infoText: 'The budget will reset automatically on 1st of every month.',
  ),
  yearly(
    infoText: 'The budget will reset automatically on 1st Jan of every year.',
  )
  ;

  final String infoText;
  const RecurrenceDuration({required this.infoText});

  String localizedName(BuildContext context) {
    switch (this) {
      case RecurrenceDuration.weekly:
        return context.l10n.weekly;
      case RecurrenceDuration.monthly:
        return context.l10n.monthly;
      case RecurrenceDuration.yearly:
        return context.l10n.yearly;
    }
  }

  String localizedInfoText(BuildContext context) {
    switch (this) {
      case RecurrenceDuration.weekly:
        return context.l10n.weeklyResetInfo;
      case RecurrenceDuration.monthly:
        return context.l10n.monthlyResetInfo;
      case RecurrenceDuration.yearly:
        return context.l10n.yearlyResetInfo;
    }
  }
}
