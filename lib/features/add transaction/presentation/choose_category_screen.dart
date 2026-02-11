import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/utils/categories_lists.dart';
import 'package:flutter/material.dart';

class ChooseCategoryScreen extends StatelessWidget {
  const ChooseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Choose Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.kHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Spending',
              style: TextStyles.subtitle.copyWith(fontSize: 14),
            ),
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.kHorizontalPadding,
                  vertical: Sizes.kVerticalPadding,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 70,
                  mainAxisSpacing: Sizes.kVerticalPadding,
                  crossAxisSpacing: Sizes.kHorizontalPadding,
                ),
                itemCount: spendingCategoriesWithLabelsList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.pop(
                    context,
                    spendingCategoriesList[index],
                  ),
                  child: spendingCategoriesWithLabelsList[index],
                ),
              ),
            ),
            Text(
              'Income',
              style: TextStyles.subtitle.copyWith(fontSize: 14),
            ),
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.kHorizontalPadding,
                  vertical: Sizes.kVerticalPadding,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 70,
                  mainAxisSpacing: Sizes.kVerticalPadding,
                  crossAxisSpacing: Sizes.kHorizontalPadding,
                ),
                itemCount: incomeCategoriesWithLabelsList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.pop(
                    context,
                    incomeCategoriesList[index],
                  ),
                  child: incomeCategoriesWithLabelsList[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
