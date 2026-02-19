import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/controllers/keyboard_controller.dart';
import 'package:fintrack/features/accounts/data/account_model.dart';
import 'package:fintrack/features/accounts/logic/account_controller.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/features/add%20transaction/logic/transaction_controller.dart';
import 'package:fintrack/features/add%20transaction/presentation/add_note_section.dart';
import 'package:fintrack/features/add%20transaction/presentation/display_amount.dart';
import 'package:fintrack/features/add%20transaction/presentation/animated_position_color_button.dart';
import 'package:fintrack/features/add%20transaction/presentation/animated_positioned_keyboard.dart';
import 'package:fintrack/features/add%20transaction/presentation/expense_or_income.dart';
import 'package:fintrack/features/add%20transaction/utils/helpers.dart';
import 'package:fintrack/features/authentication/presentation/profile_screen.dart';
import 'package:fintrack/routing/app_route_enum.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/category_style.dart';
import 'package:fintrack/widgets/category_icon.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:fintrack/widgets/settings_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  ConsumerState<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  int expenseOrIncome = 0;
  String amount = "0.00";
  DateTime selectedDate = DateTime.now();
  final FocusNode _noteFocusNode = FocusNode();
  final TextEditingController noteController = TextEditingController();
  CategoryIcon selectedCategory = CategoryIcon(
    categoryType: CategoryTypes.food,
  );
  AccountModel selectedAccount = AccountModel(
    accountType: AccountTypes.debitCard,
    accountName: "Select Account",
    balance: 0.0,
    includeInNetWorth: true,
    currentBalance: 0.0,
  );

  @override
  void initState() {
    super.initState();
    _noteFocusNode.addListener(() {
      if (_noteFocusNode.hasFocus) {
        ref.read(keypadControllerProvider.notifier).hide();
      }
    });
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

  void dismissKeypads() {
    final isKeypadVisible = ref.read(keypadControllerProvider);
    if (isKeypadVisible || _noteFocusNode.hasFocus) {
      FocusScope.of(context).unfocus();
      ref.read(keypadControllerProvider.notifier).hide();
    }
  }

  @override
  void dispose() {
    _noteFocusNode.dispose();
    super.dispose();
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
        : (buttonAreaHeight + safeAreaBottom + screenSize.height * 0.09);
    final transactionState = ref.watch(transactionControllerProvider);
    final accountState = ref.watch(accountControllerProvider);
    final isLoading = transactionState.isLoading || accountState.isLoading;
    ref.listen(transactionControllerProvider, (previous, next) {
      if (previous?.isLoading == true && !next.isLoading && !next.hasError) {
        context.pop();
      } else if (next.hasError) {
        print("Error: ${next.error}");
      }
    });
    return GestureDetector(
      onTap: dismissKeypads,
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
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
                    DisplayAmount(
                      amount: amount,
                    ),
                    SizedBox(height: screenSize.height * 0.005),
                    SettingsSection(
                      backgroundColor: Theme.of(context).cardColor,
                      widgets: [
                        ListTile(
                          dense: true,
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
                          leading: selectedCategory,
                          title: Text(
                            "Category",
                            style: TextStyles.addTransactionSettingstitle,
                          ),
                          subtitle: Text(
                            selectedCategory.categoryType.name,
                            style: TextStyles.addTransactionSettingsSubtitle,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          onTap: () async {
                            dismissKeypads();
                            final result = await context.push<AccountModel>(
                              AppRoutes.selectAccount.path,
                            );
                            if (result != null) {
                              setState(() {
                                selectedAccount = result;
                              });
                            }
                          },
                          leading: getAccountIcon(
                            selectedAccount.accountType,
                          ),
                          title: Text(
                            getAccountName(selectedAccount.accountType),
                            style: TextStyles.addTransactionSettingstitle,
                          ),
                          subtitle: Text(
                            selectedAccount.accountName,
                            style: TextStyles.addTransactionSettingsSubtitle,
                          ),
                        ),
                        ListTile(
                          dense: true,
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
                          leading: OtherIcons(OtherIconTypes.date),
                          title: const Text(
                            "Date",
                            style: TextStyles.addTransactionSettingstitle,
                          ),
                          subtitle: Text(
                            DateFormat('EEE, MMM d').format(selectedDate),
                            style: TextStyles.addTransactionSettingsSubtitle,
                          ),
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
            AnimatedPositionColorButton(
              onTap: () async {
                if (isLoading) return;
                if (amount == "0.00") return;
                dismissKeypads();
                final transaction = TransactionModel(
                  isExpense: expenseOrIncome == 0,
                  amount: double.tryParse(amount) ?? 0.0,
                  category: selectedCategory.categoryType,
                  account: selectedAccount.accountType,
                  date: selectedDate,
                  note: noteController.text,
                );
                try {
                  await ref
                      .read(accountControllerProvider.notifier)
                      .updateAccountBalance(
                        account: selectedAccount,
                        amount: transaction.amount,
                        isExpense: expenseOrIncome == 0 ? true : false,
                      );
                  ref
                      .read(transactionControllerProvider.notifier)
                      .createTransaction(transaction);
                } catch (e) {
                  print("Error: $e");
                }
              },
              isLoading: isLoading,
              showCustomKeypad: showCustomKeypad,
              keypadHeight: keypadHeight,
              buttonAreaHeight: buttonAreaHeight,
              safeAreaBottom: safeAreaBottom,
              expenseOrIncome: expenseOrIncome,
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
