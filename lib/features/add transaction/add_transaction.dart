import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/duration_constants.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/expense_or_income.dart';
import 'package:fintrack/features/add%20transaction/keyboard.dart';
import 'package:fintrack/features/authentication/presentation/profile_screen.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final _animationDuration = const Duration(milliseconds: 100);
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

  void _activateCustomKeypad() {
    FocusScope.of(context).unfocus();
    setState(() => _showCustomKeypad = true);
  }

  void _dismissKeypads() {
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
      onTap: _dismissKeypads,
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false, 
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.black,
          leading: const Icon(Icons.arrow_back, color: Colors.white),
          title: const Text(
            "Add Transaction",
            style: TextStyle(color: Colors.white),
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
                    GestureDetector(
                      onTap: _activateCustomKeypad,
                      behavior: HitTestBehavior.opaque,
                      child: SizedBox(
                        height: screenSize.height * 0.15,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            _amount,
                            style: TextStyles.amount.copyWith(
                              color: _showCustomKeypad
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.005),
                    SettingsSection(
                      backgroundColor: AppColors.kDefaultTileBackground,
                      widgets: [
                        CustomTile(
                          onTap: () {},
                          icon: Icons.category,
                          titleAndSubtitle: [
                            Text(
                              "Category",
                              style: TextStyles.addTransactionSettingstitle,
                            ),
                            Text(
                              'Select Category',
                              style: TextStyles.addTransactionSettingsSubtitle,
                            ),
                          ],
                        ),
                        CustomTile(
                          onTap: () {},
                          icon: Icons.category,
                          titleAndSubtitle: [
                            const Text(
                              "Category",
                              style: TextStyles.addTransactionSettingstitle,
                            ),
                            Text(
                              'Select Category',
                              style: TextStyles.addTransactionSettingsSubtitle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SettingsSection(
                      backgroundColor: AppColors.kDefaultTileBackground,
                      widgets: [
                        CustomTile(
                          onTap: () {},
                          icon: FontAwesomeIcons.noteSticky,
                          trailing: SizedBox(),
                          titleAndSubtitle: [
                            const Text(
                              "Note",
                              style: TextStyles.addTransactionSettingstitle,
                            ),
                            gapH8,
                            SizedBox(
                              width: screenSize.width * 0.6,
                              child: TextField(
                                focusNode: _noteFocusNode,
                                style:
                                    TextStyles.addTransactionSettingsSubtitle,
                                decoration: const InputDecoration(
                                  filled: false,
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  hintText: 'Add a note...',
                                  hintStyle:
                                      TextStyles.addTransactionSettingsSubtitle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: listBottomPadding),
                  ],
                ),
              ),
            ),// add Trasnaction
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              left: 0,
              right: 0,
              bottom: _showCustomKeypad ? keypadHeight : 0,
              height:
                  buttonAreaHeight + (_showCustomKeypad ? 0 : safeAreaBottom),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black54, Colors.black],
                    stops: [0.0, 0.4],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: Sizes.kHorizontalPadding,
                  ),
                  child: AnimatedButtonWithIcon(
                    onTap: () => {
                      _dismissKeypads(),
                    },
                    expenseOrIncome: expenseOrIncome,
                    color: expenseOrIncome == 0
                        ? Colors.red
                        : AppColors.kPrimaryColor,
                    label: "Save Transaction",
                    icon: Icons.check_circle_rounded,
                  ),
                ),
              ),
            ),
            // LAYER 3: RESPONSIVE KEYPAD
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              left: 0,
              right: 0,
              bottom: _showCustomKeypad ? 0 : hiddenOffset,
              height: keypadHeight + safeAreaBottom,
              child: GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: Keyboard(onBtnTap: _onKeyTap),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedButtonWithIcon extends StatefulWidget {
  const AnimatedButtonWithIcon({
    super.key,
    required this.onTap,
    required this.expenseOrIncome,
    required this.color,
    required this.label,
    required this.icon,
  });

  final VoidCallback onTap;
  final int expenseOrIncome;
  final Color color;
  final String label;
  final IconData icon;

  @override
  State<AnimatedButtonWithIcon> createState() => _AnimatedButtonWithIconState();
}

class _AnimatedButtonWithIconState extends State<AnimatedButtonWithIcon> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: Sizes.p48,
      duration: addTransactionAnimationDuration,
      decoration: BoxDecoration(
        color: widget.expenseOrIncome == 0
            ? Colors.red
            : AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: Colors.white),
              SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyles.buttonLabel.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
