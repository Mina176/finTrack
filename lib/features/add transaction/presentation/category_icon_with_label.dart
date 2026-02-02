import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/widgets/category_icon.dart';
import 'package:flutter/material.dart';

class CategoryIconWithLabel extends StatelessWidget {
  const CategoryIconWithLabel({super.key, required this.categoryType});

  final CategoryTypes categoryType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CategoryIcon(categoryType: categoryType),
        gapH4,
        Text(
          categoryType.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.subtitle.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
