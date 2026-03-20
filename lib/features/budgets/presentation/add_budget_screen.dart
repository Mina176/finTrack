import 'package:fynt/core/constants/app_sizes.dart';
import 'package:fynt/core/constants/text_styles.dart';
import 'package:fynt/core/enums/category_type.dart';
import 'package:fynt/core/enums/recurrence_type.dart';
import 'package:fynt/features/transactions/presentation/display_amount.dart';
import 'package:fynt/features/settings/appearance/logic/theme_controller.dart';
import 'package:fynt/features/authentication/logic/auth_service.dart';
import 'package:fynt/features/authentication/presentation/auth_field.dart';
import 'package:fynt/features/budgets/data/budget_model.dart';
import 'package:fynt/features/budgets/logic/budget_controller.dart';
import 'package:fynt/features/budgets/presentation/recurrence_duration_selector.dart';
import 'package:fynt/core/theming/app_colors.dart';
import 'package:fynt/core/utils/category_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddBudgetScreen extends ConsumerStatefulWidget {
  const AddBudgetScreen({super.key});

  @override
  ConsumerState<AddBudgetScreen> createState() => _AddBudgetScreenState();
}

class _AddBudgetScreenState extends ConsumerState<AddBudgetScreen> {
  final TextEditingController amountController = TextEditingController();
  final nameController = TextEditingController();
  CategoryType selectedCategory = CategoryType.food;
  RecurrenceDuration selectedDuration = RecurrenceDuration.monthly;
  @override
  Widget build(BuildContext context) {
    final isLoading = ref
        .watch(budgetControllerProvider(selectedDuration))
        .isLoading;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('New Budget'),
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DisplayAmount(
                  controller: amountController,
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
                const Padding(
                  padding: EdgeInsets.symmetric(
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
                const Padding(
                  padding: EdgeInsets.symmetric(
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
                    selectedDuration: selectedDuration,
                    onChanged: (value) {
                      setState(() {
                        selectedDuration = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.kHorizontalPadding,
                  ),
                  child: Text(
                    selectedDuration.infoText,
                    style: TextStyles.subtitle.copyWith(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.kHorizontalPadding,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: Sizes.kVerticalPadding,
                  ),
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                            if (isLoading) return;
                            if (amountController.text == "0.00") return;
                            try {
                              final userId = ref
                                  .read(authServiceProvider)
                                  .currentUser!
                                  .userId;
                              await ref
                                  .read(
                                    budgetControllerProvider(
                                      selectedDuration,
                                    ).notifier,
                                  )
                                  .createBudget(
                                    BudgetModel(
                                      id: DateTime.now().millisecondsSinceEpoch,
                                      userId: userId,
                                      limit: amountController.text.isEmpty
                                          ? 0.0
                                          : double.parse(amountController.text),
                                      spent: 0.0,
                                      budgetName: nameController.text.isEmpty
                                          ? "Unnamed Budget"
                                          : nameController.text,
                                      category: selectedCategory,
                                      recurrenceDuration: selectedDuration,
                                    ),
                                  );
                              if (mounted) {
                                // ignore: use_build_context_synchronously
                                context.pop();
                              }
                            } catch (e) {
                              throw Exception("Failed to create budget: $e");
                            }
                          },
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle),
                              gapW4,
                              Text('Save Budget'),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
  final CategoryType selectedCategory;
  final ValueChanged<CategoryType> onCategorySelected;
  @override
  Widget build(BuildContext context) {
    final spendingCategories = CategoryType.values
        .where((c) => !c.isIncome)
        .toList();
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: spendingCategories.length,
        itemBuilder: (context, index) {
          final categoryType = spendingCategories[index];
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

class SelectCategoryListviewItem extends ConsumerWidget {
  const SelectCategoryListviewItem({
    super.key,
    required this.isSelected,
    required this.categoryType,
    required this.onTap,
  });
  final bool isSelected;
  final CategoryType categoryType;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = getCategoryStyle(
      categoryType,
      ref.watch(themeControllerProvider),
    );
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.kPrimaryColor
              : Theme.of(context).cardColor,
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
