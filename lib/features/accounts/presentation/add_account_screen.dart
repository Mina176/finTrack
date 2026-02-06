import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/accounts/data/account_model.dart';
import 'package:fintrack/features/accounts/logic/account_controller.dart';
import 'package:fintrack/features/add%20transaction/logic/transaction_controller.dart';
import 'package:fintrack/features/add%20transaction/presentation/animated_button_with_icon.dart';
import 'package:fintrack/features/authentication/presentation/auth_field.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AddAccountScreen extends ConsumerStatefulWidget {
  const AddAccountScreen({super.key});

  @override
  ConsumerState<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends ConsumerState<AddAccountScreen> {
  int selectedIndex = 0;
  bool includeInNetWorth = true;
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  final List<Map<String, dynamic>> accountOptions = [
    {'icon': Icons.credit_card, 'label': 'Debit Card'},
    {'icon': Icons.credit_card, 'label': 'Credit Card'},
    {'icon': Icons.wallet, 'label': 'Cash Wallet'},
    {'icon': FontAwesomeIcons.arrowTrendUp, 'label': 'Investment'},
  ];
  @override
  Widget build(BuildContext context) {
    ref.listen(accountControllerProvider, (previous, next) {
      if (!next.isLoading && !next.hasError) {
        context.pop();
      } else if (next.hasError) {
        return;
      }
    });
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        title: Text('Add Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.kHorizontalPadding,
          vertical: Sizes.kVerticalPadding,
        ),
        child: Column(
          spacing: 10,
          children: [
            GridView.builder(
              itemCount: accountOptions.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.7,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => selectedIndex = index),
                  child: CustomCard(
                    isSelected: isSelected,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(accountOptions[index]['icon'], size: 28),
                        gapH4,
                        Text(
                          accountOptions[index]['label'],
                          style: TextStyles.subtitle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            TextFieldWithLabel(
              label: 'ACCOUNT NAME',
              hintText: 'e.g. My Savings',
              controller: accountNameController,
            ),
            TextFieldWithLabel(
              label: 'ACCOUNT BALANCE',
              hintText: '0.0',
              controller: balanceController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Include in Net Worth',
                      style: TextStyles.title.copyWith(fontSize: 14),
                    ),
                    Text('Balance will affect total assets'),
                  ],
                ),
                Switch(
                  value: includeInNetWorth,
                  onChanged: (value) => setState(() {
                    includeInNetWorth = value;
                  }),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(accountControllerProvider.notifier)
                    .createAccount(
                      AccountModel(
                        accountType: selectedIndex,
                        accountName: accountNameController.text,
                        balance: double.tryParse(balanceController.text) ?? 0.0,
                        includeInNetWorth: includeInNetWorth,
                        currentBalance:
                            double.tryParse(balanceController.text) ?? 0.0,
                      ),
                    );
              },
              child: Text(
                'Add Account',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
