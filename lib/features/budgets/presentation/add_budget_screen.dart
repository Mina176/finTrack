import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/controllers/keyboard_controller.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/features/add%20transaction/presentation/animated_positioned_keyboard.dart';
import 'package:fintrack/features/add%20transaction/presentation/display_amount.dart';
import 'package:fintrack/features/add%20transaction/utils/categories_lists.dart';
import 'package:fintrack/features/authentication/presentation/auth_field.dart';
import 'package:fintrack/features/budgets/data/budget_model.dart';
import 'package:fintrack/features/budgets/logic/budget_controller.dart';
import 'package:fintrack/features/budgets/presentation/animated_position_button.dart';
import 'package:fintrack/features/budgets/presentation/recurrence_duration_selector.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/category_style.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddBudgetScreen extends ConsumerStatefulWidget {
  const AddBudgetScreen({super.key});

  @override
  ConsumerState<AddBudgetScreen> createState() => _AddBudgetScreenState();
}

class _AddBudgetScreenState extends ConsumerState<AddBudgetScreen> {
  String amount = "0.00";
  final nameController = TextEditingController();
  CategoryTypes selectedCategory = CategoryTypes.food;
  int selectedRecurrenceIndex = 1;
  @override
  void initState() {
    super.initState();
  }

  void _onKeyTap(String value) {
    setState(() {
      if (value == '⌫') {
        if (amount.length > 1) {
          amount = amount.substring(0, amount.length - 1);
        } else {
          amount = "0";
        }
      } else if (value == '.') {
        if (!amount.contains('.')) amount += value;
      } else {
        if (amount == "0.00" || amount == "0") {
          amount = value;
        } else {
          amount += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final showCustomKeypad = ref.watch(keypadControllerProvider);
    final Size screenSize = MediaQuery.of(context).size;
    final double keypadHeight = screenSize.height * 0.35;
    final double buttonAreaHeight = (screenSize.height * 0.1).clamp(
      70.0,
      100.0,
    );
    final double safeAreaBottom = MediaQuery.of(context).padding.bottom;
    final double hiddenOffset = -(keypadHeight + safeAreaBottom);
    final double listBottomPadding = showCustomKeypad
        ? (keypadHeight + buttonAreaHeight)
        : (buttonAreaHeight + safeAreaBottom + screenSize.height * 0.125);
    final isLoading = ref.watch(budgetControllerProvider).isLoading;
    ref.listen(budgetControllerProvider, (previous, next) {
      if (previous?.isLoading == true && !next.isLoading && !next.hasError) {
        context.pop();
      } else if (next.hasError) {
        print("Error: ${next.error}");
      }
    });
    return GestureDetector(
      onTap: ref.read(keypadControllerProvider.notifier).hide,
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: const Text('New Budget'),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DisplayAmount(
                    amount: amount,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.kHorizontalPadding,
                    ),
                    child: TextFieldWithLabel(
                      label: 'Budget Name',
                      hintText: 'e.g. Monthly Groceries',
                      controller: nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.kHorizontalPadding,
                    ),

                    child: Text('Category', style: TextStyles.labelText),
                  ),
                  ChooseCategoryHorizontalListView(
                    selectedCategory: selectedCategory,
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.kHorizontalPadding,
                    ),
                    child: Text(
                      'Recurrence Duration',
                      style: TextStyles.labelText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.kHorizontalPadding,
                    ),
                    child: RecurrenceDurationSelector(
                      selectedIndex: selectedRecurrenceIndex,
                      onChanged: (value) {
                        setState(() {
                          selectedRecurrenceIndex = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.kHorizontalPadding,
                    ),
                    child: Text(
                      getInfoText(selectedRecurrenceIndex),
                      style: TextStyles.subtitle.copyWith(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: listBottomPadding),
                ],
              ),
            ),
            AnimatedPositionButton(
              onTap: () async {
                if (isLoading) return;
                if (amount == "0.00") return;
                ref.read(keypadControllerProvider.notifier).hide();
                try {
                  await ref
                      .read(budgetControllerProvider.notifier)
                      .createBudget(
                        BudgetModel(
                          limit: amount.isEmpty ? 0.0 : double.parse(amount),
                          spent: 0.0,
                          budgetName: nameController.text.isEmpty
                              ? "Unnamed Budget"
                              : nameController.text,
                          category: selectedCategory,
                          recurrenceDuration: selectedRecurrenceIndex == 0
                              ? RecurrenceDuration.weekly
                              : selectedRecurrenceIndex == 1
                              ? RecurrenceDuration.monthly
                              : RecurrenceDuration.yearly,
                        ),
                      );
                } catch (e) {
                  print("Error: $e");
                }
              },
              showCustomKeypad: showCustomKeypad,
              keypadHeight: keypadHeight,
              buttonAreaHeight: buttonAreaHeight,
              safeAreaBottom: safeAreaBottom,
              isLoading: isLoading,
            ),
            AnimatedPositionedKeyboard(
              onKeyTap: _onKeyTap,
              showCustomKeypad: showCustomKeypad,
              hiddenOffset: hiddenOffset,
              keypadHeight: keypadHeight,
              safeAreaBottom: safeAreaBottom,
            ),
          ],
        ),
      ),
    );
  }
}

class ChooseCategoryHorizontalListView extends StatelessWidget {
  const ChooseCategoryHorizontalListView({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });
  final CategoryTypes selectedCategory;
  final ValueChanged<CategoryTypes> onCategorySelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: spendingCategoriesList.length,
        itemBuilder: (context, index) {
          final categoryType = spendingCategoriesList[index].categoryType;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: SelectCategoryListviewItem(
              categoryType: categoryType,
              isSelected: selectedCategory == categoryType,
              onTap: () => onCategorySelected(categoryType),
            ),
          );
        },
      ),
    );
  }
}

class SelectCategoryListviewItem extends StatelessWidget {
  const SelectCategoryListviewItem({
    super.key,
    required this.isSelected,
    required this.categoryType,
    required this.onTap,
  });
  final bool isSelected;
  final CategoryTypes categoryType;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final style = getCategoryStyle(categoryType);
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.kPrimaryColor : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(
                style.icon,
                color: isSelected ? Colors.black : null,
              ),
              gapW4,
              Text(
                categoryType.name,
                style: TextStyle(
                  color: isSelected ? Colors.black : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
