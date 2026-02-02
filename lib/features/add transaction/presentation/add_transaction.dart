import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/features/add%20transaction/logic/supabase.dart';
import 'package:fintrack/features/add%20transaction/presentation/add_note_section.dart';
import 'package:fintrack/features/add%20transaction/presentation/amount_of_money.dart';
import 'package:fintrack/features/add%20transaction/presentation/animated_positiomed_button.dart';
import 'package:fintrack/features/add%20transaction/presentation/animated_positioned_keyboard.dart';
import 'package:fintrack/features/add%20transaction/presentation/expense_or_income.dart';
import 'package:fintrack/features/authentication/presentation/profile_screen.dart';
import 'package:fintrack/routing/app_route_enum.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/widgets/category_icon.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  int expenseOrIncome = 0; // 0 for Expense
  String _amount = "0.00";
  bool _showCustomKeypad = false;
  DateTime selectedDate = DateTime.now();
  final FocusNode _noteFocusNode = FocusNode();
  final TextEditingController noteController = TextEditingController();

  CategoryIcon selectedCategory = CategoryIcon(
    iconData: Icons.fastfood_outlined,
    iconColor: const Color(0xFFFFA726),
    backgoroundColor: const Color(0xFFFFF3E0),
    categoryType: CategoryTypes.food,
    hasLabel: false,
  );
  @override
  void initState() {
    super.initState();
    _noteFocusNode.addListener(() {
      if (_noteFocusNode.hasFocus) {
        setState(() {
          _showCustomKeypad = false;
        });
      }
    });
  }

  void _onKeyTap(String value) {
    setState(() {
      if (value == '⌫') {
        if (_amount.length > 1) {
          _amount = _amount.substring(0, _amount.length - 1);
        } else {
          _amount = "0";
        }
      } else if (value == '.') {
        if (!_amount.contains('.')) _amount += value;
      } else {
        if (_amount == "0.00" || _amount == "0") {
          _amount = value;
        } else {
          _amount += value;
        }
      }
    });
  }

  void activateCustomKeypad() {
    FocusScope.of(context).unfocus();
    setState(() => _showCustomKeypad = true);
  }

  void dismissKeypads() {
    if (_showCustomKeypad || _noteFocusNode.hasFocus) {
      FocusScope.of(context).unfocus();
      setState(() => _showCustomKeypad = false);
    }
  }

  @override
  void dispose() {
    _noteFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    final double keypadHeight = screenSize.height * 0.35;

    final double buttonAreaHeight = (screenSize.height * 0.1).clamp(
      70.0,
      100.0,
    );

    final double safeAreaBottom = MediaQuery.of(context).padding.bottom;

    final double hiddenOffset = -(keypadHeight + safeAreaBottom);

    final double listBottomPadding = _showCustomKeypad
        ? (keypadHeight + buttonAreaHeight)
        : (buttonAreaHeight + safeAreaBottom + screenSize.height * 0.151);

    return GestureDetector(
      onTap: dismissKeypads,
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text(
            "Add Transaction",
            style: TextStyles.title.copyWith(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.kHorizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ExpenseOrIncome(
                      selectedIndex: expenseOrIncome,
                      onChanged: (index) {
                        setState(() {
                          expenseOrIncome = index;
                        });
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    const Text(
                      "Amount (USD)",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    AmountOfMoney(
                      activateCustomKeypad: activateCustomKeypad,
                      screenSize: screenSize,
                      amount: _amount,
                      showCustomKeypad: _showCustomKeypad,
                    ),
                    SizedBox(height: screenSize.height * 0.005),
                    SettingsSection(
                      backgroundColor: AppColors.kDefaultTileBackground,
                      widgets: [
                        CustomTile(
                          onTap: () async {
                            dismissKeypads();
                            final result = await context.push<CategoryIcon>(
                              AppRoutes.chooseCategory.path,
                            );
                            if (result != null) {
                              setState(() {
                                selectedCategory = result;
                              });
                            }
                          },
                          categoryIcon: selectedCategory,
                          titleAndSubtitle: [
                            Text(
                              "Category",
                              style: TextStyles.addTransactionSettingstitle,
                            ),
                            Text(
                              selectedCategory.categoryType.name,
                              style: TextStyles.addTransactionSettingsSubtitle,
                            ),
                          ],
                        ),
                        CustomTile(
                          onTap: () async {
                            dismissKeypads();
                            final pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              initialDate: DateTime.now(),
                              builder: (context, child) => Padding(
                                padding: EdgeInsetsGeometry.symmetric(
                                  vertical: 32,
                                  horizontal: 16,
                                ),
                                child: child,
                              ),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                selectedDate = pickedDate;
                              });
                            }
                          },
                          icon: Icons.date_range,
                          titleAndSubtitle: [
                            const Text(
                              "Date",
                              style: TextStyles.addTransactionSettingstitle,
                            ),
                            Text(
                              DateFormat('EEE, MMM d').format(selectedDate),
                              style: TextStyles.addTransactionSettingsSubtitle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    AddNoteSection(
                      controller: noteController,
                      screenSize: screenSize,
                      noteFocusNode: _noteFocusNode,
                    ),
                    SizedBox(height: listBottomPadding),
                  ],
                ),
              ),
            ),
            AnimatedPositiomedButton(
              onTap: () {
                if (_amount == "0.00") return;
                dismissKeypads();
                final transaction = TransactionModel(
                  isExpense: expenseOrIncome == 0,
                  amount: double.tryParse(_amount) ?? 0.0,
                  category: selectedCategory.categoryType,
                  date: selectedDate,
                  note: noteController.text,
                );
                SupabaseService().createTransaction(transaction);
                context.pop();
              },
              showCustomKeypad: _showCustomKeypad,
              keypadHeight: keypadHeight,
              buttonAreaHeight: buttonAreaHeight,
              safeAreaBottom: safeAreaBottom,
              expenseOrIncome: expenseOrIncome,
            ),
            // LAYER 3: RESPONSIVE KEYPAD
            AnimatedPositionedKeyboard(
              onKeyTap: _onKeyTap,
              showCustomKeypad: _showCustomKeypad,
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
