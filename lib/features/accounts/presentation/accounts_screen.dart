import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/accounts/data/account_model.dart';
import 'package:fintrack/features/accounts/logic/account_controller.dart';
import 'package:fintrack/features/accounts/logic/account_supabase_service.dart';
import 'package:fintrack/features/authentication/presentation/profile_screen.dart';
import 'package:fintrack/features/home%20screen/presentation/last_month_container.dart';
import 'package:fintrack/routing/app_route_enum.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:fintrack/widgets/category_icon.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AccountsScreen extends ConsumerStatefulWidget {
  const AccountsScreen({super.key});

  @override
  ConsumerState<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends ConsumerState<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    final accountsAsync = ref.watch(getAccountsProvider);
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        title: Text('Accounts'),
        actions: [
          IconButton(
            onPressed: () {
              AccountSupabaseService().deleteAllAccounts();
            },
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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
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
                ],
              ),
            ),
            accountsAsync.when(
              data: (accounts) {
                if (accounts.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("No accounts added yet."),
                      ),
                    ),
                  );
                }
                return SliverToBoxAdapter(
                  child: SettingsSection(
                    backgroundColor: AppColors.kCardColor,
                    widgets: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: accounts.length,
                        itemBuilder: (context, index) => CustomTile(
                          onTap: () {},
                          icon: accounts[index].accountTypeIcon,
                          titleAndSubtitle: [
                            Text(
                              accounts[index].accountName,
                              style: TextStyles.title.copyWith(fontSize: 16),
                            ),
                            gapH4,
                            Text(
                              '\$${accounts[index].balance.toStringAsFixed(2)}',
                              style: TextStyles.subtitle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                          trailing: Text(
                            '\$${accounts[index].balance.toStringAsFixed(2)}',
                            style: TextStyles.title.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              loading: () => SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stackTrace) => SliverToBoxAdapter(
                child: Center(
                  child: Text(error.toString()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension AccountModelX on AccountModel {
  IconData get accountTypeIcon {
    switch (accountType) {
      case 0:
        return Icons.account_balance;
      case 1:
        return Icons.credit_card;
      case 2:
        return Icons.wallet;
      case 3:
        return FontAwesomeIcons.arrowTrendUp;
      default:
        return Icons.attach_money;
    }
  }
}
