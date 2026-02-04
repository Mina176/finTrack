import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/add%20transaction/presentation/animated_button_with_icon.dart';
import 'package:fintrack/features/authentication/presentation/auth_field.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen({super.key});

  @override
  State<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  int selectedIndex = 0;
  bool includeInNetWorth = true;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> accountOptions = [
      {'icon': Icons.account_balance, 'label': 'Bank Account'},
      {'icon': Icons.credit_card, 'label': 'Credit Card'},
      {'icon': Icons.wallet, 'label': 'Cash Wallet'},
      {'icon': FontAwesomeIcons.arrowTrendUp, 'label': 'Investment'},
    ];
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
          spacing: 12,
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
            AuthField(label: 'ACCOUNT NAME', hintText: 'e.g. My Savings'),
            AuthField(label: 'CURRENT BALANCE', hintText: '0.0'),
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
              onPressed: () {},
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
