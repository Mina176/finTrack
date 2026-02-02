import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/constants.dart';
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
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.kHorizontalPadding,
                  vertical: Sizes.kVerticalPadding,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 80,
                  mainAxisSpacing: Sizes.kVerticalPadding,
                  crossAxisSpacing: Sizes.kHorizontalPadding,
                ),
                itemCount: spendingCategoriesList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.pop(
                    context,
                    spendingCategoriesList[index],
                  ),
                  child: spendingCategoriesList[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
