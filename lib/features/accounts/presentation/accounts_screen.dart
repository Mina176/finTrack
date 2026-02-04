import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/authentication/presentation/profile_screen.dart';
import 'package:fintrack/features/home%20screen/presentation/last_month_container.dart';
import 'package:fintrack/routing/app_route_enum.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        title: Text('Accounts'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove_red_eye),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: GestureDetector(
                onTap: () => context.push(AppRoutes.addAccount.path),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          gapW20,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.kHorizontalPadding,
          vertical: Sizes.kVerticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'TOTAL NET WORTH',
              style: TextStyles.subtitle.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$12,450.00'.hardcoded,
                  style: TextStyles.title,
                  textAlign: TextAlign.center,
                ),
                gapW4,
                LastMonthContainer(
                  savingPercentage: 2,
                  isShrinked: true,
                ),
              ],
            ),
            gapH16,
            SettingsSection(
              backgroundColor: AppColors.kCustomContainerBackground,
              header: Text(
                'CASH & BANK',
                style: TextStyles.subtitle.copyWith(fontSize: 12),
                textAlign: TextAlign.start,
              ),
              widgets: [
                CustomTile(
                  onTap: () {},
                  icon: Icons.account_balance_wallet,
                  titleAndSubtitle: [
                    Text(
                      'Main Checking',
                      style: TextStyles.labelText,
                    ),
                    Text(
                      '\$5,200.00',
                      style: TextStyles.subtitle.copyWith(fontSize: 12),
                    ),
                  ],
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$2,300.00',
                        style: TextStyles.title.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                CustomTile(
                  onTap: () {},
                  icon: Icons.account_balance_wallet,
                  titleAndSubtitle: [
                    Text(
                      'Main Checking',
                      style: TextStyles.labelText,
                    ),
                    Text(
                      '\$5,200.00',
                      style: TextStyles.subtitle.copyWith(fontSize: 12),
                    ),
                  ],
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$2,300.00',
                        style: TextStyles.title.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
