import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/logic/supabase.dart';
import 'package:fintrack/features/add%20transaction/presentation/add_note_section.dart';
import 'package:fintrack/features/add%20transaction/presentation/amount_of_money.dart';
import 'package:fintrack/features/add%20transaction/presentation/animated_positiomed_button.dart';
import 'package:fintrack/features/add%20transaction/presentation/animated_positioned_keyboard.dart';
import 'package:fintrack/features/add%20transaction/presentation/expense_or_income.dart';
import 'package:fintrack/routing/app_route_enum.dart';
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
  final FocusNode _noteFocusNode = FocusNode();
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
                    AddDetailsSection(
                      categoryOnTap: () {
                        context.push(AppRoutes.selectCategory.path);
                        dismissKeypads();
                      },
                    ),
                    AddNoteSection(
                      screenSize: screenSize,
                      noteFocusNode: _noteFocusNode,
                    ),
                    SizedBox(height: listBottomPadding),
                  ],
                ),
              ),
            ), // add Trasnaction
            AnimatedPositiomedButton(
              onTap: () {
                dismissKeypads();
                SupabaseService().createTask();
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
