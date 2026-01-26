import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/expense_or_income.dart';
import 'package:fintrack/features/authentication/presentation/button_with_icon.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AddTransationScreen extends StatefulWidget {
  const AddTransationScreen({super.key});

  @override
  State<AddTransationScreen> createState() => _AddTransationScreenState();
}

class _AddTransationScreenState extends State<AddTransationScreen> {
  int selectedIndex = 0;
  void selectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(
          horizontal: Sizes.kHorizontalPadding,
        ),
        centerTitle: true,
        title: Text(
          'Add Transaction',
          style: TextStyles.header,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.kHorizontalPadding,
        ),
        child: Column(
          spacing: 8,
          children: [
            ExpenseOrIncome(
              onChanged: (index) => selectItem(index),
              selectedIndex: selectedIndex,
            ),
            Text('Amount (USD)'.hardcoded),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '0.00',
                  style: TextStyles.amount.copyWith(),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceDark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.kDividerColor,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  CustomTile(
                    onTap: () {},
                    icon: Icons.fastfood,
                    titleAndSubtitle: [
                      Text(
                        'Category',
                        style: TextStyles.subtitle.copyWith(fontSize: 12),
                      ),
                      Text(
                        'Food & Dining',
                        style: TextStyles.labelText,
                      ),
                    ],
                  ),
                  Divider(
                    height: 0.1,
                    color: AppColors.kDividerColor,
                  ),
                  CustomTile(
                    onTap: () {},
                    icon: Icons.calendar_today,
                    titleAndSubtitle: [
                      Text(
                        'Date',
                        style: TextStyles.subtitle.copyWith(fontSize: 12),
                      ),
                      Text(
                        'Today, 24 Oct',
                        style: TextStyles.labelText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceDark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.kDividerColor,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                child: Row(
                  children: [
                    CustomIcon(icon: FontAwesomeIcons.noteSticky),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        child: Text(
                          'Add a note...'.hardcoded,
                          style: TextStyles.subtitle.copyWith(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            AnimatedButtonWithIcon(
              onPressed: () {},
              label: 'Add Transaction',
              icon: Icon(Icons.check_circle, color: Colors.white, size: 20),
              selectedIndex: selectedIndex,
            ),
            gapH4,
          ],
        ),
      ),
    );
  }
}

class AnimatedButtonWithIcon extends StatelessWidget {
  const AnimatedButtonWithIcon({
    super.key,
    required this.selectedIndex,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.foregroundColor,
    this.borderColor,
  });
  final int selectedIndex;
  final VoidCallback onPressed;
  final String label;
  final Color? foregroundColor;
  final Color? borderColor;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: Sizes.p48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: selectedIndex == 0
            ? Color.fromARGB(255, 233, 65, 65)
            : AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          gapW4,
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyles.buttonLabel.copyWith(
              color: foregroundColor ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
