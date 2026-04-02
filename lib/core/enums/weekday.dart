import 'package:flutter/material.dart';
import 'package:fynt/core/extensions/localization_extension.dart';

enum WeekDays {
  mon,
  tue,
  wed,
  thu,
  fri,
  sat,
  sun
  ;

  static const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );

  String localizedLabel(BuildContext context) {
    switch (this) {
      case WeekDays.mon:
        return context.l10n.mondayShort;
      case WeekDays.tue:
        return context.l10n.tuesdayShort;
      case WeekDays.wed:
        return context.l10n.wednesdayShort;
      case WeekDays.thu:
        return context.l10n.thursdayShort;
      case WeekDays.fri:
        return context.l10n.fridayShort;
      case WeekDays.sat:
        return context.l10n.saturdayShort;
      case WeekDays.sun:
        return context.l10n.sundayShort;
    }
  }
}
