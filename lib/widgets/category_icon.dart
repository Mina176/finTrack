import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.backgoroundColor,
    required this.categoryType,
    this.hasLabel = false,
  });
  final IconData iconData;
  final Color iconColor;
  final Color backgoroundColor;
  final CategoryTypes categoryType;
  final bool hasLabel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgoroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              iconData,
              color: iconColor,
            ),
          ),
        ),
        gapH4,
        hasLabel
            ? Text(
                categoryType.name,
                style: TextStyles.subtitle.copyWith(fontSize: 12),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
