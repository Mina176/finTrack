
import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/features/add%20transaction/utils/helpers.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:fintrack/widgets/category_icon.dart';
import 'package:flutter/material.dart';

class CategoryDetails {
  final CategoryTypes categoryType;
  final double amountSpent;
  final double spendLimit;

  CategoryDetails({
    required this.categoryType,
    required this.amountSpent,
    required this.spendLimit,
  });
}

class CategoryRemainingCard extends StatelessWidget {
  const CategoryRemainingCard({
    super.key,
    required this.categoryDetails,
  });
  final CategoryDetails categoryDetails;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryIcon(
                categoryType: categoryDetails.categoryType,
              ),
              gapW8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getCategoryName(categoryDetails.categoryType),
                    style: TextStyles.title.copyWith(fontSize: 14),
                  ),
                  gapH4,
                  Text(
                    '\$${(categoryDetails.spendLimit - categoryDetails.amountSpent).toStringAsFixed(0)} remaining',
                    style: TextStyles.subtitle.copyWith(fontSize: 12),
                  ),
                ],
              ),
              Spacer(),
              Text(
                '${(categoryDetails.amountSpent * 100 / categoryDetails.spendLimit).toStringAsFixed(0)}%',
                style: TextStyles.title.copyWith(fontSize: 14),
              ),
            ],
          ),
          gapH12,
          LinearProgressIndicator(
            value: categoryDetails.amountSpent / categoryDetails.spendLimit,
            backgroundColor: Colors.black,
            minHeight: 6,
            borderRadius: BorderRadius.circular(8),
          ),
          SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${(categoryDetails.amountSpent).toStringAsFixed(0)} spent',
                style: TextStyles.subtitle.copyWith(
                  fontSize: 10,
                  color: Colors.grey[500],
                ),
              ),
              Text(
                '\$${(categoryDetails.spendLimit).toStringAsFixed(0)} limit',
                style: TextStyles.subtitle.copyWith(
                  fontSize: 10,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}